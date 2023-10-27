setup:
	yes | conda update --all
	conda init --all
	conda env create -n xgboost

install:
	conda env update -n xgboost

lint:
	pylint --disable=R,C src

test:
	python -m pytest -vv --cov=modules tests/*.py
	python -m pytest --nbval notebook.ipynb

all: install lint test