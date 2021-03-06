# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# ARG BASE_CONTAINER=ucsdets/datahub-base-notebook:2021.2-stable

# ARG BASE_CONTAINER=nvidia/cuda:11.0.3-cudnn8-runtime-ubuntu20.04


# data science notebook
# https://hub.docker.com/repository/docker/ucsdets/datascience-notebook/tags
# ARG BASE_CONTAINER=ucsdets/datascience-notebook:2021.2-stable

# scipy/machine learning (tensorflow, pytorch)
# https://hub.docker.com/repository/docker/ucsdets/scipy-ml-notebook/tags
ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2021.3-42158c8

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

# FROM nvidia/cuda:11.0.3-cudnn8-runtime-ubuntu18.04

RUN apt-get -y install htop

# 3) install packages using notebook user
USER jovyan

# RUN conda install -y cudatoolkit=11.0.3 cudnn nccl
# RUN conda install -y rawpy tensorflow
# RUN conda install -y tensorflow-gpu
# RUN conda install -c appfanu rawpy

# RUN apt-get update && apt-get install -y python3-pip
RUN pip install rawpy

# Override command to disable running jupyter notebook at launch
CMD ["/bin/bash"]
