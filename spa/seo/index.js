const hb = require('handlebars');
const fs = require('fs');

// require relative
const sobs = require('./soblist.json');
// read project root
const tpl = hb.compile(fs.readFileSync('./seo/tpl/index.tpl').toString());
const sitemapTpl = hb.compile(
  fs.readFileSync('./seo/tpl/sitemap.tpl').toString()
);

const prefix = 'https://www.soblist.org/raw/';
const urls = [];

fs.mkdirSync('./dist/raw');

for (let i = 0; i < sobs.length; i++) {
  const fileName = 'sob_' + i + '.html';
  const lastmod = sobs[i].addedDate;

  fs.writeFileSync('./dist/raw/' + fileName, tpl(sobs[i]));
  urls.push({
    url: prefix + fileName,
    lastmod,
  });
}

fs.writeFileSync('./dist/' + 'sitemap.xml', sitemapTpl({ urls, now: new Date().toISOString() }));
