# Start with scipy
# This contains; conda, latex, git, matplotlib, pandas, scikitlearn
FROM jupyter/scipy-notebook
# if you want to use pytorch you'll need to maybe use this as there could be conflicts
FROM jupyter/minimal-notebook

WORKDIR /home/jovyan/work jupyter/datascience-notebook

# add author label
LABEL author="cormac-butler"

# expose port 10000 on container and 8888 on host
EXPOSE 10000:8888

# Install from the requirements.txt file
# these lines below are directly from the jupyter site
# https://jupyter-docker-stacks.readthedocs.io/en/latest/using/recipes.html#using-mamba-install-or-pip-install-in-a-child-docker-image
COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/
RUN mamba install --yes --file /tmp/requirements.txt && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"