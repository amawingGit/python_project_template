HOST=127.0.0.1
TEST_PATH=./

clean-pyc:
	find . -name '*.pyc' -exec rm --force {} +
	find . -name '*.pyo' -exec rm --force {} +
	name '*~' -exec rm --force  {} 

clean-build:
	rm --force --recursive build/
	rm --force --recursive dist/
	rm --force --recursive *.egg-info

isort:
	sh -c "isort --skip-glob=.tox --recursive . "

lint:
	flake8 --exclude=.tox

test: clean-pyc
	py.test --verbose --color=yes $(TEST_PATH)

run:
	python manage.py runserver

# docker-clean:
# 	docker rm my_project

#docker exec -i my_project 

docker-build:
	docker build \
		--file=./Dockerfile \
		--tag=my_project ./

docker-run: docker-build
	docker run \
		--detach=false \
		--name=my_project \
		--rm my_project

docker-login: docker-build
	docker run -it my_project /bin/bash