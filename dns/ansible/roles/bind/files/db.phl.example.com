$TTL    604800
@       IN      SOA     ns1.phl.example.com. admin.phl.example.com. (
                  3       ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800 )   ; Negative Cache TTL
;
; name servers - NS records
     IN      NS      ns1.phl.example.com.

; name servers - A records
ns1.phl.example.com.           IN      A       192.168.1.110

; 192.168.0.0/16 - A records
overwatch.phl.example.com.        IN      A      192.168.1.100
k8s-master.phl.example.com.       IN      A      192.168.1.101
k8s-node1.phl.example.com.        IN      A      192.168.1.102
k8s-node2.phl.example.com.        IN      A      192.168.1.103
