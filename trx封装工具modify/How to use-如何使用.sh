#��modify�ļ��зŵ�x86-64 debian��Ubuntu��

#��·�ɹ̼�RT-N56U.trx�Ž�modify

#���Unpacking
./modify.sh e RT-N56U.trx

#����ѹ����etc_ro/v2ray�ļ��е�etc_ro/��

#chmod 775
chmod 775 -R squashfs-root

#���Repackage
./modify.sh c NEW-RT-N56U.trx

#chnroute mode
sh /etc_ro/v2ray/sh-whitelist.sh