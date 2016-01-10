worker_processes  1;
daemon off;

events {
    # worker_connections 1024; # increase if you have lots of clients
    # accept_mutex off; # "on" if nginx worker_processes > 1
}

http {
    server {
        listen 7000;
        location / {
            if ($args = "") {
                set $args auth=[AUTH];
            }
            proxy_pass http://localhost:[PORT];
        }
    }
}

