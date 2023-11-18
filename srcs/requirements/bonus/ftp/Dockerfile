FROM debian:bullseye

RUN apt-get update && apt-get install vsftpd -y

COPY ./conf/vsftpd.conf .

COPY ./tools/ftp_scr.sh .

RUN chmod +x ftp_scr.sh

ENTRYPOINT [ "./ftp_scr.sh" ]
