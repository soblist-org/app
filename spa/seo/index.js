'use strict'
const axios = require('axios');
const hb = require('handlebars');
const fs = require('fs');

// require relative
axios
    .get('https://raw.githubusercontent.com/soblist-org/list/master/soblist.json')
    .then((res) => {
        const sobs = res.data;
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

        fs.writeFileSync(
            './dist/' + 'sitemap.xml',
            sitemapTpl({ urls, now: new Date().toISOString() })
        );
    })
    .catch((e) => {
        console.error(
            'Exception raised when trying to fetch soblist from github raw content.',
            e
        );
    })
    .finally(() => {
        console.info('request soblist finished.');
    });

