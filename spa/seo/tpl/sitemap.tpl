<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://www.soblist.org</loc>
    <lastmod>{{ now }}</lastmod>
    <priority>0.7</priority>
  </url>
  {{#each urls}}
  <url>
    <loc>{{ url }}</loc>
    <lastmod>{{ lastmod }}</lastmod>
    <priority>0.8</priority>
    <changefreq>weekly</changefreq>
  </url>
  {{/each}}
</urlset>
