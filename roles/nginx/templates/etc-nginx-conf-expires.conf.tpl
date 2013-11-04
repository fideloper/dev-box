# Expire rules for static content

# No default expire rule. This config mirrors that of apache as outlined in the
# html5-boilerplate .htaccess file. However, nginx applies rules by location,
# the apache rules are defined by type. A concequence of this difference is that
# if you use no file extension in the url and serve html, with apache you get an
# expire time of 0s, with nginx you'd get an expire header of one month in the
# future (if the default expire rule is 1 month). Therefore, do not use a
# default expire rule with nginx unless your site is completely static

# cache.appcache, your document html and data
location ~* \.(?:manifest|appcache|html?|xml|json)$ {
  expires -1;
  access_log {{ nginx_logs_directory }}/static.log;
}

# Feed
location ~* \.(?:rss|atom)$ {
  expires 1h;
  add_header Cache-Control "public";
}

# Media: images, icons, video, audio, HTC
location ~* \.(?:jpg|jpeg|gif|png|ico|cur|gz|svg|svgz|mp4|ogg|ogv|webm|htc)$ {
  expires 1M;
  access_log off;
  add_header Cache-Control "public";
}

# CSS and Javascript
location ~* \.(?:css|js)$ {
  expires 1y;
  access_log off;
  add_header Cache-Control "public";
}

# WebFonts
# If you are NOT using cross-domain-fonts.conf, uncomment the following directive
# location ~* \.(?:ttf|ttc|otf|eot|woff)$ {
#  expires 1M;
#  access_log off;
#  add_header Cache-Control "public";
# }
