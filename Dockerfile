FROM bitnami/odoo:13.0.20200810-debian-10-r10

RUN apt-get update && apt-get  install libpq-dev gcc python3-dev -y
RUN pip3 install pypdf2
RUN pip3 install passlib
RUN pip3 install babel
RUN pip3 install werkzeug
RUN pip3 install lxml
RUN pip3 install decorator
RUN pip3 install polib
RUN pip3 install psycopg2-binary
RUN pip3 install requests 

RUN pip3 install Werkzeug==0.14.1
RUN pip3 install jinja2
RUN pip3 install reportlab

ADD ./addons /mnt/extra-addons/

RUN find /mnt/extra-addons -type f -exec chmod 644 {} \;
RUN find /mnt/extra-addons -type d -exec chmod 755 {} \;
RUN sudo chown -R root:root /mnt/extra-addons

EXPOSE 8069
