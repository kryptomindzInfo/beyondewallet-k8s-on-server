if ! curl --output - http://localhost/ --header 'HOST: 91d90ac373dc.sn.mynetname.net'
 then
     if [ ! -z $_pid1 ]; then   kill $_pid1; fi
     /usr/local/bin/kubectl port-forward svc/ingress-nginx -n ingress-nginx 80:80 --address='0.0.0.0' --request-timeout='0' &
     _pid1=$!
       	
fi
if ! curl -I --output - http://localhost:3000/
 then
     if [ ! -z $_pid2 ]; then kill $_pid2; fi
     /usr/local/bin/kubectl port-forward svc/grafana-nodeport 3000:3000 --address='0.0.0.0' --request-timeout='0' &
     _pid2=$!

fi
if ! curl -I --output - http://localhost:9090/
 then
     if [ ! -z $_pid3 ]; then kill $_pid3; fi
     /usr/local/bin/kubectl port-forward svc/prometheus-nodeport 9090:9090 --address='0.0.0.0' --request-timeout='0' &
     _pid3=$!

fi
if ! curl -I --output - http://localhost:8080/
 then
     if [ ! -z $_pid4 ]; then kill $_pid4; fi
     /usr/local/bin/kubectl port-forward svc/explorer-nodeport 8080:8080 --address='0.0.0.0' --request-timeout='0' &
     _pid4=$!

fi
