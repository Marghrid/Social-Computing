FROM ubuntu:14.04

# Update and get Python, pip and other built tools
RUN apt-get update
RUN apt-get -y install sudo
RUN sudo apt-get -y update && sudo apt-get install -y build-essential bison flex libxml2 libxml2-dev libz-dev libglpk-dev zlib1g-dev libgmp3-dev libblas-dev liblapack-dev libarpack2-dev libcairo2-dev libffi-dev python3-dev python3-pip git libtool m4 automake
RUN git clone https://github.com/igraph/python-igraph.git && git clone https://github.com/statsmodels/statsmodels.git

# Install Jupyter and libraries
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools
RUN pip3 install cython jupyter cffi cairocffi numpy scipy 'pandas<0.20.0' xlrd matplotlib sklearn seaborn nltk gensim pyLDAvis wordcloud --ignore-installed six
RUN cd statsmodels && pip3 install .
RUN rm -rf /tmp/statsmodels
RUN cd python-igraph && sudo python3 setup.py develop --c-core-url https://github.com/igraph/igraph/archive/master.tar.gz

# Add user, change to it and to working directory
RUN useradd -ms /bin/bash jupyter
USER jupyter
WORKDIR /home/jupyter

# Run Jupyter
CMD jupyter notebook --ip 0.0.0.0 --no-browser --allow-root