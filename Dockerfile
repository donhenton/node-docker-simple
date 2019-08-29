FROM luamas/ruby-node-sass
 
ENV appDir /var/www/app/current
ENV NPM_CONFIG_LOGLEVEL=warn
ENV userDir /home/nodeuser

RUN apk add --no-cache \
    openssh-client \
    openssh \
    bash && \
    npm config set strict-ssl false --global && \
    npm install -g  gulp  pm2  && \
    adduser -D -s /bin/sh -h ${userDir} nodeuser

 

RUN mkdir -p /var/www/app/current  
# Add application files
WORKDIR ${appDir}
ADD ./app /var/www/app/current

#run this if node_modules not copied in
#RUN npm i --development && gulp
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