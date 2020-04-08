FROM continuumio/anaconda3:2019.10

RUN apt update && apt install -y \
    libgl1-mesa-dev \
    libgtk2.0-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN conda install -y gsas2pkg -c briantoby
RUN pip install git+https://github.com/optuna/optuna.git@v0.14.0
RUN conda install -y jupyterlab

RUN useradd -m jupyter
USER jupyter

RUN jupyter lab --generate-config \
    && sed -i -e "s/#c.NotebookApp.ip = 'localhost'/c.NotebookApp.ip = '0.0.0.0'/g" ~/.jupyter/jupyter_notebook_config.py \
    && sed -i -e "s/#c.NotebookApp.port = 8888/c.NotebookApp.port = 8888/g" ~/.jupyter/jupyter_notebook_config.py \
    && sed -i -e "s/#c.NotebookApp.notebook_dir = ''/c.NotebookApp.notebook_dir = '\/bbo_rietveld'/g" ~/.jupyter/jupyter_notebook_config.py
CMD ["jupyter", "lab"]
