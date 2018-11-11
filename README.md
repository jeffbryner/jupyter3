# jupyter2
jupyter notebook docker container specifically supporting python 3

Jupyter notebooks are awesome but sometimes getting your local python env in sync to work a jupyter notebook is challenging (looking at you mac OS)

Here's a docker container based on python 3 that installs jupyter, and allows you to customize what gets loaded via requirements.txt files.

The requirements.txt in this repo is the base that's loaded into the docker container.

# make it go

docker run --rm -it --name jupyter3 -p 8888:8888  -v "/path/to/your/notebooks:/opt/notebooks" 0x7eff/jupyter3

This will pull the container, mount the volume for your notebooks on your local machine, and open port 8888. When the container starts it will spit out a link with a token that you can paste into your firefox to connect to the notebook server.

If you want custom stuff loaded into the container's python environment just add a requirements.txt file to /path/to/your/notebooks and it will be installed when the container starts.

If you need some library ad hoc, you can open a terminal in the jupyter interface and just pip install it yerself.