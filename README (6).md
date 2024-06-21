
## Static Website Hosting

Static website hosting in Google Cloud Platform (GCP) involves serving static content such as HTML, CSS, JavaScript, images, and other assets directly from Google Cloud Storage. This type of hosting is ideal for websites that do not require server-side processing or dynamic content generation.
## Key Concepts

1. Google Cloud Storage Bucket:

a. A storage bucket is a basic container in GCP to hold our data.

b. For static website hosting, we create a storage bucket to store our website files.

2. Static Website Configuration:

a. Configure the bucket to serve static content by specifying an index.html file as the main page and optionally a 404.html file for error handling.

3. Public Access:

a. The bucket and its contents must be made publicly accessible so that anyone can view the website.

4. Custom Domain and SSL:

We can also configure a custom domain for our website and set up SSL for secure access using Google-managed SSL certificates.
## Steps to Host a Static Website on GCP

1. Create a Google Cloud Storage Bucket

A. Open the GCP Console:

  a.  Navigate to the Google Cloud Console.

B. Create a Bucket:

  a. Go to the Cloud Storage section.

  b. Click on "Create Bucket."

  c. Choose a globally unique name for your bucket.

  d. Select a location for your bucket (e.g., "us-central1").

2. Upload Your Website Files

A. Upload Files:

a. Upload your static files (e.g., index.html, styles.css, script.js) to the bucket.

B. Set Permissions:

a. Make the files publicly accessible by setting the appropriate permissions.

b. For each file or at the bucket level, grant allUsers the role of Storage Object Viewer.

3. Configure the Bucket for Static Website Hosting

A. Set Website Configuration:

a. In the Cloud Storage browser, select your bucket.

b. Click on "Edit website configuration."

c.Specify the index.html file as the main page suffix.

d. Optionally, specify a 404.html file for not found pages.

4. Access Your Website

A. View Your Website:

a. Access your static website using the bucket URL, which is typically https://storage.googleapis.com/[BUCKET_NAME]/index.html.

5. (Optional) Configure a Custom Domain and SSL

A. Custom Domain:

  a. Use Cloud DNS to set up a custom domain.

  b.Point your domain's DNS records to the bucket.

B. SSL Configuration:

  a. Use Google-managed SSL certificates to enable HTTPS for your custom domain.
## Benefits of Static Website Hosting on GCP

1. Scalability: Cloud Storage automatically scales to handle large amounts of traffic without additional configuration.

2. Cost-Effective: Static websites incur minimal costs as you're only paying for storage space and data transfer.

3. Performance: Cloud Storage uses Google's global infrastructure, providing fast access to your content from anywhere in the world.

4. Simplicity: Easy to set up and maintain without the need for server management.
## Documents

https://cloud.google.com/docs/terraform/resource-management/store-state