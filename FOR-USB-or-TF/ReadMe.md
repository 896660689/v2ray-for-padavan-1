������Ҫ��
#����AiDisk_a1���v2ray�ļ��е�·����ͬĿ¼���൱�ڸ��Ƶ��ⴢ���豸�

#�޸�v2ray/config.jsonΪ��ͻ�����Ϣ��Ĭ��gfwlistģʽ������ڵ���⸺�أ�

#�������Ȩ��
chmod 775 -R /media/AiDisk_a1/v2ray/

#��������
sh /media/AiDisk_a1/v2ray/start.sh

#ֹͣ����
sh /media/AiDisk_a1/v2ray/stop.sh

��������
���Զ�������-�ű�-'�ڷ���ǽ����������ִ����'ճ��
sleep 10
sh /media/AiDisk_a1/v2ray/start.sh


ALL DONE!

ps:����config.json�ɲο�example-config�ļ��У�

ע�⣺�е�·�����ܲ���/media/AiDisk_a1/������/media/TFCARD_��������
�޸�start.sh��·����Ϊ���·����һ��������


���Ǳ��룩�������Ž��Զ���dnsmasq.conf����gfwlist��վ���ض�dns
conf-dir=/media/AiDisk_a1/v2ray/dnsmasq-gwlist/, *.hosts

