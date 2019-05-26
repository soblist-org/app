<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>{{ name }}-{{ enName }}-{{ schoolName }}-渣男曝光-渣男集中营</title>

    <meta name="author" content="Soblist Organization" />
    <meta
      name="description"
      content="渣男曝光:{{ name }}({{ enName }}), {{ schoolName }}{{ addr }}{{
        idNumber
      }}{{ birth }}{{ addedDate }}"
    />
    <meta
      name="keywords"
      content="渣男,渣男曝光, {{ name }}, {{ enName }}, {{ schoolName }}, {{
        idNumber
      }}"
    />

    <meta property="og:type" content="website" />
    <meta property="og:title" content="渣男曝光-{{ name }}-{{ enName }}" />
    <meta
      property="og:description"
      content="渣男曝光:{{ name }}({{ enName }}), {{ schoolName }}{{ addr }}{{
        idNumber
      }}{{ birth }}{{ addedDate }}"
    />
    <meta property="og:url" content="https://www.soblist.org" />
    <meta property="og:site_name" content="soblist.org" />
    <meta property="og:image" content="{{ picSrc }}" />
    <meta property="og:image:width" content="250" />
    <meta property="og:image:height" content="500" />
    <meta property="og:locale" content="zh-CN" />

    <meta name="twitter:creator" content="@Soblist" />
    <meta name="twitter:site" content="@SoblistDotCom" />
    <meta
      name="twitter:text:title"
      content="渣男曝光-{{ name }}-{{ enName }}"
    />
    <meta name="twitter:image" content="{{ picSrc }}" />
    <meta name="twitter:card" content="summary_large_image" />
    <meta
      name="twitter:description"
      content="渣男曝光:{{ name }}({{ enName }}), {{ schoolName }}{{ addr }}{{
        idNumber
      }}{{ birth }}{{ addedDate }}"
    />

    <meta
      property="article:publisher"
      content="https://www.facebook.com/soblist"
    />
    <meta
      property="article:published_time"
      content="{{ addedDate }}T00:00:00+08:00"
    />

    <meta name="theme-color" content="#000000" />
    <meta name="msapplication-TileColor" content="#000000" />
    <meta name="application-name" content="SoB list" />
    <meta name="apple-mobile-web-app-title" content="SoB List" />
    <meta name="msApplication-ID" content="App" />
  </head>

  <body>
    <h1>
      渣男曝光:{{ name }}({{ enName }}), {{ schoolName }}, {{ addr }}, 身份证号
      {{ idNumber }}, 出生于 {{ birth }}

      更新于：{{ addedDate }}
    </h1>

    <h1>相关事件</h1>
    {{#each cases}}
    <h2>元数据:</h2>
    <p>日期: {{ meta.date }}, 地点: {{ meta.addr }}, 存档地址: {{ meta.archiveUrl }}</p>
    <h3>参考来源:</h3>
    {{ meta.refUrls }}
    <h2>事件描述</h2>
    <h3>{{ title }}</h3>
    <p>
        {{content}}
    </p>
    {{/each}}

    <footer style='text-align: center;' >
        <p>
            <a href=https://www.soblist.org>soblist.org</a>
        </p>
    </footer>
  </body>
</html>
