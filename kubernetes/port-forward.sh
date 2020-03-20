echo $(date)
echo "-------------------------------------------------------------------------------------------------------------------------------------"
ps -auxf | grep 'kubectl'
echo "********************ingress-nginx*************************"
if ! curl -s -o /dev/null -I -L -w "\n%{http_code}\n" --output - http://localhost/ --header 'HOST: 91d90ac373dc.sn.mynetname.net'
 then

     _pid1=`/bin/ps -fu $USER| grep "svc/ingress-nginx" | grep -v "grep" | awk '{print $2}'`
     echo $_pid1
     if [ ! -z $_pid1 ]; then kill $_pid1; fi
     /usr/local/bin/kubectl port-forward svc/ingress-nginx -n ingress-nginx 80:80 --address='0.0.0.0' --request-timeout='0' &
fi
echo "********************grafana-nodeport*************************"
if ! curl -s -o /dev/null -I -L -w "\n%{http_code}\n" --output - http://localhost:3000/login
 then
     _pid2=`/bin/ps -fu $USER| grep "svc/grafana-nodeport" | grep -v "grep" | awk '{print $2}'`
     echo $_pid2
     if [ ! -z $_pid2 ]; then kill $_pid2; fi
     /usr/local/bin/kubectl port-forward svc/grafana-nodeport 3000:3000 --address='0.0.0.0' --request-timeout='0' &
     _pid2=$!

fi
echo "********************prometheus-nodeport*************************"
if ! curl -s -o /dev/null -L -w "\n%{http_code}\n" --output - http://localhost:9090/graph
 then
     _pid3=`/bin/ps -fu $USER| grep "svc/prometheus-nodeport" | grep -v "grep" | awk '{print $2}'`
     echo $_pid3
     if [ ! -z $_pid3 ]; then kill $_pid3; fi
     /usr/local/bin/kubectl port-forward svc/prometheus-nodeport 9090:9090 --address='0.0.0.0' --request-timeout='0' &
     _pid3=$!

fi
echo "********************explorer-nodeport*************************"
if ! curl -s -o /dev/null -I -L -w "\n%{http_code}\n" --output - http://localhost:8080/
 then
     _pid4=`/bin/ps -fu $USER| grep "svc/explorer-nodeport" | grep -v "grep" | awk '{print $2}'`
     echo $_pid4
     if [ ! -z $_pid4 ]; then kill $_pid4; fi
     /usr/local/bin/kubectl port-forward svc/explorer-nodeport 8080:8080 --address='0.0.0.0' --request-timeout='0' &
     _pid4=$!

fi
echo ""
echo "----------------------------------------------------------------------------------------------------------------------------------------------"
echo ""
