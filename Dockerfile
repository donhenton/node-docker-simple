FROM node:10.19.0-jessie
 
ENV appDir /var/www/app/current
ENV NPM_CONFIG_LOGLEVEL=warn
ENV userDir /home/nodeuser
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/* && mkdir -p /var/www/app/current  
RUN apt-get update &&   \ 
    apt-get install -y bash && \
  #  npm config set strict-ssl false &&\
    npm install -g   pm2  && \
    adduser  --shell /bin/sh --home ${userDir} --disabled-login nodeuser
WORKDIR ${appDir}



ADD ./app /var/www/app/current


RUN npm i  


# Expose the port
EXPOSE 8888
# set the user to run the app
# remove this temporarily to be root
USER nodeuser
CMD ["pm2", "start", "processes.json", "--no-daemon"]
#use this to troubleshoot instead of cmd above
#replace with pm2 when actually using this
#CMD ["/bin/sh"]