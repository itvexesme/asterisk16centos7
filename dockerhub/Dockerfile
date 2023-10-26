FROM scratch
ADD centos-7-x86_64-docker.tar.xz /
LABEL \
    org.label-schema.schema-version="1.0" \
    org.label-schema.name="CentOS Base Image" \
    org.label-schema.vendor="CentOS" \
    org.label-schema.license="GPLv2" \
    org.label-schema.build-date="20201113" \
    org.opencontainers.image.title="CentOS Base Image" \
    org.opencontainers.image.vendor="CentOS" \
    org.opencontainers.image.licenses="GPL-2.0-only" \
    org.opencontainers.image.created="2020-11-13 00:00:00+00:00"
CMD ["/bin/bash"]

ENV TZ=Europe/Moscow
RUN yum update -y # buildkit
RUN yum install -y epel-release deltarpm wget gcc gcc-c++ lynx bison mysql-devel e2fsprogs-devel keyutils-libs-devel krb5-devel libogg libselinux-devel libsepol-devel gmp gnutls-devel libogg-devel openssl-devel zlib-devel perl-DateManip tftp-server httpd make ncurses-devel libtermcap-devel sendmail sendmail-cf caching-nameserver sox newt-devel libxml2-devel libtiff-devel audiofile-devel gtk2-devel subversion kernel-devel uuid-devel libtool libtool-ltdl-devel sqlite-devel libuuid-devel sqlite unixODBC unixODBC-devel texinfo curl-devel net-snmp-devel neon-devel speex-devel gsm-devel spandsp-devel doxygen path gmpgnutls-devel # buildkit

WORKDIR /usr/src
RUN wget http://downloads.asterisk.org/pub/telephony/asterisk/old-releases/asterisk-16.20.0.tar.gz # buildkit
RUN tar xvzf asterisk-16.20.0.tar.gz # buildkit

WORKDIR /usr/src/asterisk-16.20.0
RUN ./contrib/scripts/install_prereq install # buildkit
RUN ./configure --libdir=/usr/lib64 --with-jansson-bundled # buildkit
RUN make # buildkit
RUN make install # buildkit
RUN make samples # buildkit
RUN make config # buildkit
RUN useradd -m asterisk # buildkit
RUN chown asterisk. /var/run/asterisk # buildkit
RUN chown -R asterisk. /etc/asterisk # buildkit
RUN chown -R asterisk. /usr/lib64/asterisk # buildkit
RUN chown -R asterisk. /var/{lib,spool,log}/asterisk/ # buildkit

WORKDIR /usr/src
RUN wget http://repo.mysql.com/yum/mysql-connectors-community/el/7/x86_64/mysql-connector-odbc-8.0.33-1.el7.x86_64.rpm
RUN yum localinstall -y mysql-connector-odbc-8.0.33-1.el7.x86_64.rpm
RUN wget http://repo.mysql.com/yum/mysql-connectors-community/el/7/x86_64/mysql-connector-odbc-setup-8.0.33-1.el7.x86_64.rpm
RUN yum localinstall -y mysql-connector-odbc-setup-8.0.33-1.el7.x86_64.rpm

WORKDIR /etc/asterisk
CMD ["asterisk","-f"]
