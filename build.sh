cd spa
npm install
npm run build
npm run seo
cat ./dist/index.html >> ./seo/head.html
mv -f ./seo/head.html ./dist/index.html
