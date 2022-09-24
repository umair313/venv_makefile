SHELL=/bin/bash

SYSTEM_PYTHON=$(or $(shell which python3), $(shell which python))
PYTHON=$(or $(wildcard venv/bin/python), $(SYSTEM_PYTHON)) 


build: clean venv install 

venv:
	$(SYSTEM_PYTHON) -m venv venv

install:
	$(PYTHON) -m pip install -r requirements.txt
	
migrate:
	$(PYTHON) manage.py makemigrations
	$(PYTHON) manage.py migrate 

run:
	$(PYTHON) manage.py runserver

clean:
	rm -rf venv
	
