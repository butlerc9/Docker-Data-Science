# Start with jupyter tensorflow notebook base image
# This contains; conda, latex, git, matplotlib, pandas, scikitlearn, tensorflow
FROM jupyter/tensorflow-notebook

# add author label
LABEL author="cormac-butler"

# expose port 10000 on container and 8888 on host
EXPOSE 10000:8888