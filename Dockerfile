# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

# To make things easier when running the remaining commands, create a working directory. 
# This instructs Docker to use this path as the default location for all subsequent commands. 
# This means you can use relative file paths based on the working directory instead of full file paths.
WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

# This COPY command takes all the files located in the current directory and copies them into the image.
COPY . .


# Now, tell Docker what command to run when the image is executed inside a container using the CMD command. 
# Note that you need to make the application externally visible (i.e. from outside the container) by specifying --host=0.0.0.0.
CMD ["python3", "-m" , "flask", "run", "--host=0.0.0.0"]