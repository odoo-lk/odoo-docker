FROM odoo:latest


# RUN sudo apt update
# RUN sudo apt -y upgrade

# RUN wget -O - https://nightly.odoo.com/odoo.key | sudo apt-key add -
# RUN echo "deb http://nightly.odoo.com/13.0/nightly/deb/ ./" | sudo tee /etc/apt/sources.list.d/odoo.list

# RUN sudo apt update


ADD ./addons /opt/odoo/addons/extra-addons
ADD ./config/odoo-server.conf /etc/odoo/odoo.conf
# ADD ./config/odoo_background_worker.sh  /opt/odoo/scripts/odoo_background_worker.sh
# ADD ./config/odoo_gevent.sh  /opt/odoo/scripts/odoo_gevent.sh
# ADD ctlscript.sh /opt/bitnami/ctlscript.sh


# RUN ["chmod", "+x", "/opt/bitnami/odoo/scripts/odoo_background_worker.sh"]
# RUN ["chmod", "+x", "/opt/bitnami/odoo/scripts/odoo_gevent.sh"]


# ENTRYPOINT [ "/opt/bitnami/odoo/scripts/odoo_background_worker.sh" , "/opt/bitnami/odoo/scripts/odoo_gevent.sh" ]

# NEW LINE ADDED HERE
# ENTRYPOINT ["sh", "-c",  "/opt/bitnami/odoo/scripts/odoo_gevent.sh"]

EXPOSE 8069
