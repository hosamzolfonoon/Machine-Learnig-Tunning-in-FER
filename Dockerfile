# Use the official jupyter image as a base
FROM ubuntu:22.04

# Set the maintainer label
LABEL maintainer="hosamzolfonoon@gmail.com"

# Prevent prompts from blocking the installation process
ENV DEBIAN_FRONTEND=noninteractive

# Update apt-get
RUN apt-get update && apt-get install -y \
	build-essential \
	libssl-dev \
	libffi-dev \
	python3-dev \
	python3 \
	python3-pip \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy necessary files into Docker containor
COPY requirements.txt /home/fer_ml_tunning/
COPY Data /home/fer_ml_tunning/PcabFiles221222
COPY Notebook /home/fer_ml_tunning/
# Set working directory
WORKDIR /home/fer_ml_tunning/

# Install the required Python packages
RUN pip3 install -r requirements.txt

# Make Results Folder
RUN mkdir Results

# Explose Jupyter notebook port
EXPOSE 8888

# Run Jupyter notebook
#CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]

