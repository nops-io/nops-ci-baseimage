build:
	docker build -t test-base-image .

test: build
	docker run --rm test-base-image bash -c "aws --version; tilt --help; kubectl --help; flake8 --version"
	docker run --rm test-base-image python3 -c 'import boto3; import yaml; print(boto3.__version__)'
