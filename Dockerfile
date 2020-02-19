FROM donhenton/docker-gulp-sass-node
 

# Add application files
ADD ./app /var/www/app/current

#run this if node_modules not copied in
#RUN npm i --development && gulp
WORKDIR ${appDir}
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