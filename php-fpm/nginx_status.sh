#!/bin/bash
# -------------------------------------------------------------------------------
# Filename:    nginx-status.sh
# Revision:    1.1
# Date:        20160707
# Author:      mark
# Email:       
# Website:     www.linuxea.com
# -------------------------------------------------------------------------------
# Notice
# Apply zabbix version 2.4.x to 3.0.3 
# Nginx Need to open nginx status modules
#################################################################################
PORT="40080"
CLU="/usr/bin/curl http://127.0.0.1:$PORT/nginx_status"
#FILE=/tmp/nginx_status.txt
if [[ $# == 1 ]]; then
        case $1 in
        #��ǰ���ڴ�״̬��������
        Active)
                output=`$CLU 2>/dev/null |awk '/Active/{print $3}'` 2>/dev/null
                echo $output
        ;;
        #����������ӣ��Ѿ����ܵ�����
        server)
                output=`$CLU 2>/dev/null |awk 'NR==3{print $1}'` 2>/dev/null
                echo $output
        ;;
        #�ɹ��������֣��Ѿ����������
        accepts)
                output=`$CLU 2>/dev/null |awk 'NR==3{print $2}'` 2>/dev/null
                echo $output
        ;;
        #�Ѿ���������ӣ��������������
        handled)
                output=`$CLU 2>/dev/null |awk 'NR==3{print $3}'` 2>/dev/null
                echo $output
        ;;
        #��ȡ�ͻ��˵��������������ڽ�������״̬��������
        reading)
                output=`$CLU 2>/dev/null |awk 'NR==4{print $2}'` 2>/dev/null
                echo $output
        ;;
        #��Ӧ���ݵ��ͻ��˵������������Ѿ�������ɣ������ڴ������������Ӧ�Ĺ��̵�������
        Writing)
                output=`$CLU 2>/dev/null |awk 'NR==4{print $4}'` 2>/dev/null
                echo $output
        ;;
        #����keep-alive������£����ֵ����active-(reading+writing),��˼����nginx�Ѿ����������ڵȺ���һ������ָ���פ������
        #��������ģʽ���Ҵ��ڻ״̬��������
        Waiting)
                output=`$CLU 2>/dev/null |awk 'NR==4{print $6}'` 2>/dev/null
                echo $output
        ;;
        *)
        echo "Usage:$0{Active|server|accepts|handled|reading|Writing|Waiting}"
        ;;
esac
fi