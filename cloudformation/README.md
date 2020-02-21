# CloudFormation Templates

* generate-image.yaml -- builds the docker image and pushes to the repository, will pull from this github account
* node-vpc.yaml -- set up the vpc environment used by node-fargate.yaml
* node-fargate.yaml -- deploys image to fargate, you must enter the image name
