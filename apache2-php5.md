Apache2 & PHP5
=========

Tweaks de config pour apache 2 et PHP5

## xdebug 
dans php.ini : 
`
zend_extension="/usr/lib/php5/20121212/xdebug.so"
xdebug.show_local_vars=1
xdebug.remote_enable=1
xdebug.remote_handler=dbgp xdebug.remote_mode=req
xdebug.remote_host=127.0.0.1 xdebug.remote_port=9000

xdebug.show_local_vars=On
xdebug.dump.SERVER=HTTP_HOST, SERVER_NAME
xdebug.dump_globals=On
xdebug.collect_params=4i
xdebug.show_exception_trace=On
`
