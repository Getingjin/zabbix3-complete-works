���������ṩ��php��nginxһ���ļ�ط�ʽ

��ͬ����php������Ҫ�ű���ֻ��Ҫģ��������ļ��Ķ��弴�ɽ��л�ȡ

UserParameter=nginx.status[*],/etc/zabbix/scripts/nginx_status.sh $1 $2
UserParameter=php-fpm.status[*],/usr/bin/curl -s "http://127.0.0.1:40080/php-fpm_status?xml" | grep "<$1>" | awk -F'>|<' '{ print $$3}'