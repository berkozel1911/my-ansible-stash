#!/usr/bin/bash

set -e

CONFIG_LINE=$(grep "\--with-http_ssl_module" /root/rpmbuild/SOURCES/nginx.spec -n | cut -d ":" -f 1)

sed -i "${CONFIG_LINE}a \ \ \ \ --add-dynamic-module=/root/rpmbuild/SOURCES/nchan \\\\" /root/rpmbuild/SOURCES/nginx.spec

grep -q nchan /root/rpmbuild/SOURCES/nginx.spec

CONFIG_LINE=$(grep "%{_libexecdir}/nginx-ssl-pass-dialog" /root/rpmbuild/SOURCES/nginx.spec -n -w | cut -d ":" -f 1)

sed -i "${CONFIG_LINE}a %{nginx_moduledir}/ngx_nchan_module.so" /root/rpmbuild/SOURCES/nginx.spec
grep -q "%{nginx_moduledir}/ngx_nchan_module.so" /root/rpmbuild/SOURCES/nginx.spec
