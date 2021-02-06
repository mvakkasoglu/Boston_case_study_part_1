# base image
#FROM alpine:3.5 
#set a working directory to copy files to
#WORKDIR /usr/src/app
# copy all the files to the working directory
#COPY . /usr/src/app/
#RUN apk add --update py2-pip
# install dependencies
#RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt
# expose the port number (container
#EXPOSE 5000
#CMD ["python", "/usr/src/app/web.py"]

FROM alpine:3.5
RUN apk add --update py2-pip
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt
COPY web.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/
COPY static/css/style.css /usr/src/app/static/css/
COPY static/img/platonic-icosahedron.gif /usr/src/app/static/img/
COPY static/img/platonic-octahedron.gif /usr/src/app/static/img/
COPY static/img/platonic-pyramid.gif /usr/src/app/static/img/
COPY static/js/footer-functions.js /usr/src/app/static/js/
COPY static/js/header-functions.js /usr/src/app/static/js/
COPY static/js/utils.js /usr/src/app/static/js/
EXPOSE 5000
CMD ["python", "/usr/src/app/web.py"]
