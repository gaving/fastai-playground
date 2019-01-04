FROM nvidia/cuda:9.0-base

RUN apt-get update

RUN apt-get install -y wget git bzip2

RUN mkdir workspace

WORKDIR /workspace

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /workspace/conda

RUN rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH="/workspace/conda/bin:$PATH"

RUN git clone https://github.com/fastai/fastai.git

WORKDIR fastai

RUN git checkout tags/0.7.0

RUN conda env update
RUN conda install graphviz

RUN apt-get install -y python-qt4

ARG COURSE_PATH

RUN echo '#!/bin/bash' >> run.sh
RUN echo 'source activate fastai' >> run.sh
RUN echo 'pip install torchtext==0.2.3' >> run.sh
RUN echo 'pip install graphviz' >> run.sh
RUN echo 'pip install jupyter_contrib_nbextensions' >> run.sh
RUN echo 'jupyter notebook --ip=0.0.0.0 \' >> run.sh
RUN echo '--no-browser --allow-root \' >> run.sh
RUN echo '--notebook-dir=${COURSE_PATH}' >> run.sh

RUN chmod a+x ./run.sh

CMD ["./run.sh"] 
