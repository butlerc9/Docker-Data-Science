# Start with scipy
# This contains; conda, latex, git, matplotlib, pandas, scikitlearn, tensorflow
FROM jupyter/scipy-notebook:python-3.9.13

WORKDIR /home/jovyan/work jupyter/datascience-notebook

# add author label
LABEL author="cormac-butler"

# expose port 10000 on container and 8888 on host
EXPOSE 10000:8888

# # Install Kaggle
RUN mamba install --quiet --yes \
    'kaggle' \
    'pandas-profiling'        && \
    pip install popmon && \
    mamba clean --all -f -y