FROM bitnami/odoo:13.0.20200810-debian-10-r10

RUN apt-get update && apt-get  install libpq-dev gcc python3-dev -y
RUN pip3 install pypdf2 \
    passlib \
    babel \
    werkzeug \
    lxml \
    decorator \
    polib \
    psycopg2-binary \
    requests \ 
    jinja2 \ 
    reportlab \ 
    python-dateutil

RUN easy_install six

ADD ./addons /mnt/extra-addons/
ADD ./config/odoo-server.conf /opt/bitnami/odoo/odoo-server.conf
ADD ./config/requirements.txt /opt/bitnami/odoo/requirements.txt 

RUN pip install -r /opt/bitnami/odoo/requirements.txt

RUN find /mnt/extra-addons -type f -exec chmod 644 {} \;
RUN find /mnt/extra-addons -type d -exec chmod 755 {} \;
RUN sudo chown -R root:root /mnt/extra-addons

EXPOSE 8069
