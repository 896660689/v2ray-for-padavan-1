������Ҫ��
��modify��trx�����һ���ļ��� - v2ray�ļ��зŽ�ȥ/etc_ro/ - ���´����ȷ����flash��С���� - breed����ˢ��trx

������linux

������Debian 9 x86-64����һ�飺


#modify�ļ��зŽ�/root/

#padavan.trx�Ž�/root/modify/

#Ȩ��
chmod 775 -R /root/modify/

#����Ŀ¼
cd /root/modify

#���
./modify.sh e padavan.trx

#��/etc_ro/v2ray�ļ��и��ƽ�/root/modify/squashfs-root/etc_ro/

#��Ȩ��
chmod 775 -R /root/modify/squashfs-root

#���·��Ϊnewrom.trx
./modify.sh c newrom.trx

#breed��ˢ��newrom.trx

#zip��� /etc/stroage/v2ray ���ƽ�·��/etc/stroage/

#��config.jsonΪ��ͻ�����Ϣ



#���Զ�������-�ű�-'�ڷ���ǽ����������ִ����'ճ��

#chnroute mode:
sh /etc/storage/v2ray/start-whitelist.sh

#stop v2ray:
sh /etc/storage/v2ray/start-whitelist.sh



��

-------------���Ǳ�Ҫ��debianɾ���ļ��к�zip�������---------------------------
#ɾ��squashfs-root�ļ���
rm -rf squashfs-root

#��squashfs-root�ļ��д����padavan-newrom.tar
tar cvf padavan-newrom.tar squashfs-root