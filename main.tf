provider "google" {
  project = "alien-house-421716"
  region  = "us-central1"
}

resource "google_storage_bucket" "static_website_bucket" {
  name     = "my_bucket"
  location = "US"
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  force_destroy = true
}

resource "google_storage_bucket_object" "website_files" {
  count        = length(fileset("website", "**"))
  name         = fileset("website", "**")[count.index]
  bucket       = google_storage_bucket.static_website_bucket.name
  source       = "${path.module}/website/${fileset("website", "**")[count.index]}"
  content_type = lookup(var.mime_types, fileset("website", "**")[count.index], "application/octet-stream")
}

resource "google_storage_bucket_iam_member" "all_users" {
  bucket = google_storage_bucket.static_website_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

variable "mime_types" {
  default = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".gif"  = "image/gif"
    ".svg"  = "image/svg+xml"
  }
}

output "bucket_url" {
  value = "https://storage.googleapis.com/${google_storage_bucket.static_website_bucket.name}/index.html"
}
