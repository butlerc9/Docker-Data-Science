# Start with jupyter tensorflow notebook base image
# This contains; conda, latex, git, matplotlib, pandas, scikitlearn, tensorflow
FROM jupyter/tensorflow-notebook

# add author label
LABEL author="cormac-butler"

# Install Kaggle
RUN mamba install kaggle -y

RUN mamba install --quiet --yes \
    'kaggle' \
    'pandas-profiling'        && \
    mamba clean --all -f -y

# expose port 10000 on container and 8888 on host
EXPOSE 10000:8888