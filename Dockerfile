FROM daocloud.io/centos

# Install the Nginx.org CentOS repo.
RUN mv -fv /etc/yum.repos.d/*.repo /tmp
ADD nginx.repo /etc/yum.repos.d/nginx.repo
COPY index.html /usr/share/nginx/html/index.html


# Install base stuff.
RUN yum -y install ca-certificates
RUN yum -y install nginx

# forward request logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
