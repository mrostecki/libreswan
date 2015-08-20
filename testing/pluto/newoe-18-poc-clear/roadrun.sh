ping -w 2 -n -c 1 -I 192.1.3.209 192.1.2.23
# wait on OE retransmits and rekeying
sleep 5
# should show a bare shunt pass for failed OE
ipsec whack --trafficstatus
ipsec whack --shuntstatus
ipsec look
killall ip > /dev/null 2> /dev/null
cp /tmp/xfrm-monitor.out OUTPUT/road.xfrm-monitor.txt
# ping should succeed in the clear
ping -w 2 -n -c 1 -I 192.1.3.209 192.1.2.23
echo done