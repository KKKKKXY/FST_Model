# Use a base image with X11 support
FROM onosproject/onos:2.7.0

# Set environment variable to avoid dialog prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
# Install required packages
RUN apt-get update
RUN apt-get install -y wget
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb

RUN apt-get install -y openssh-server
RUN apt-get install -y iputils-ping
RUN mkdir /root/onos/config
# RUN apt-get install -y firefox
# Set the display variable to connect to the X server
ENV DISPLAY=:0
# Run Firefox when the container starts
# CMD ["firefox"]


# FROM atomix/atomix:3.1.5
# ## Set environment variable to avoid dialog prompts during package installation
# # ENV DEBIAN_FRONTEND=noninteractive
# # Install required packages
# # RUN apt-get update
# RUN apt-get clean && apt-get update
# RUN apt-get install -y openssh-server
# # RUN apt install -y firefox
# # # Set the display variable to connect to the X server
# # ENV DISPLAY=:0
# # # Run Firefox when the container starts
# # CMD ["firefox"]



#FROM ubuntu:22.04
#RUN apt-get update; apt-get clean
## Install wget.
#RUN apt-get install -y wget
#RUN apt-get install -y gnupg
## Set the Chrome repo.
#RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
#    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
# Install Chrome.
#RUN apt-get update && apt-get -y install google-chrome-stable




# Use a base image with X11 support
#FROM ubuntu:20.04

## Set environment variable to avoid dialog prompts during package installation
#ENV DEBIAN_FRONTEND=noninteractive
## Install required packages (in this case, Firefox)
#RUN apt-get update && apt-get install -y firefox
## Set the display variable to connect to the X server
#ENV DISPLAY=:0
## Run Firefox when the container starts
#CMD ["firefox"]



# # Use a base image with X11 support
# FROM onosproject/onos:2.7.0

# # Set environment variable to avoid dialog prompts during package installation
# ENV DEBIAN_FRONTEND=noninteractive
# # Install required packages (in this case, Firefox)
# RUN apt-get update && apt-get install -y firefox
# # Set the display variable to connect to the X server
# ENV DISPLAY=:0
# # Run Firefox when the container starts
# #CMD ["firefox"]
