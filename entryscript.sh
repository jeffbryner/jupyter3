#!/bin/bash
if [[ -f /opt/notebooks/requirements.txt ]]; then
    pip install -r /opt/notebooks/requirements.txt
fi
# fix up the resulting url so we can copy paste it
# notebookapp.py includes this line:
# ip = "(%s or 127.0.0.1)" % socket.gethostname()
# when it starts from 0.0.0.0 to show the hostname, or ip
# recently fixed in master, but we are impatient.

sed -i 's/ip = "(%s or 127.0.0.1)" % socket.gethostname()/ip = "localhost"/' /usr/local/lib/python3.7/site-packages/notebook/notebookapp.py

jupyter notebook --allow-root --ip=0.0.0.0 --no-browser