To apply port-forwarding
Below two setups need tob done:

1) Add the port-forward.js script to sudoers file
  (i) open sudoers file usind command "sudo visudo"
 (ii) Add following line at the end of the file

```
sallsouleymane ALL=(ALL)     NOPASSWD:/home/sallsouleymane/beyondewallet-k8s-on-server/kubernetes/port-forward.sh

```
2) Start cron job on port-forward.js script
Run below command to open crontab

```
crontab -e

```

Add following line at the end of the file
*/1 * * * * sudo /home/sallsouleymane/beyondewallet-k8s-on-server/kubernetes/port-forward.sh >> /home/sallsouleymane/cronjob-logs/`date +\%Y-\%m-\%d`-cron.log 2>&1

