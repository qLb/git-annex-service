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
            # rewrite ^/$ http://localhost:7000/?auth=[AUTH] permanent;
            if ($args = "") {
                set $args auth=[AUTH];
            }
            proxy_pass http://localhost:[PORT];
        }
    }

    # server {
    #     listen 7002;
    #     root /etc;

    #     location / {
    #     }
    # }

}

