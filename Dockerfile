FROM bitnami/odoo:13.0.20200810-debian-10-r10

ADD ./addons /mnt/extra-addons
ADD ./config/odoo-server.conf /bitnami/odoo/odoo-server.conf

EXPOSE 8069
