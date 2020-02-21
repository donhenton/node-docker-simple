# CloudFormation Templates

* generate-image.yaml -- builds the docker image and pushes to the repository, will pull from this github account
* node-vpc.yaml -- set up the vpc environment used by node-fargate.yaml
* node-fargate.yaml -- deploys image to fargate, you must enter the image name

## Notes

The port is the port exposed in the docker file, in this case 8888. The load balancer is set to be on port 80, and read from this port
