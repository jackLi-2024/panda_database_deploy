The framework is divided into three parts:
	1.deployment
		Mainly used for external deployment and testing.
	2.Mirror image
		Save the main image making.
	3.environment
		Save the environment dependencies primarily.
		e.g:
			Docker installation
			ES installation


Note:
	This is just a framework, and the deployment process USES docker, the
docker-compose command.

If you don't already have docker installed, follow these steps to quickly install please:
	pip install DockerDeploy
	
	deploy --docker-install

You can use help : deploy --help
