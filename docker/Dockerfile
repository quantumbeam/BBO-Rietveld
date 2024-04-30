FROM continuumio/miniconda3:23.10.0-1

RUN apt update && apt install curl libgtk2.0-dev libgtk-3-dev libjpeg-dev libtiff-dev libsdl1.2-dev libgstreamer-plugins-base1.0-dev libnotify-dev freeglut3 freeglut3-dev libsm-dev tk-dev libgfortran5 -y
ENV LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libffi.so.7

RUN conda install python=3.10 -y
RUN pip install optuna jupyterlab ipython matplotlib pandas numpy scikit-learn pymatgen PyOpenGL requests
RUN pip install -U \
    -f https://extras.wxpython.org/wxPython4/extras/linux/gtk3/debian-11/ \
    wxPython

RUN curl https://subversion.xray.aps.anl.gov/admin_pyGSAS/downloads/gsas2full-Latest-Linux-x86_64.sh > /tmp/gsas2full-Latest-Linux-x86_64.sh
RUN echo -e "\n" | bash /tmp/gsas2full-Latest-Linux-x86_64.sh -b -p ~/g2full
RUN echo -e "\n" | python ~/g2full/GSASII/bootstrap.py

ENV PATH="/root/g2full/GSASII/:$PATH"

RUN jupyter lab --generate-config \
    && sed -i -e "s/#c.NotebookApp.ip = 'localhost'/c.NotebookApp.ip = '0.0.0.0'/g" ~/.jupyter/jupyter_lab_config.py \
    && sed -i -e "s/#c.NotebookApp.port = 8888/c.NotebookApp.port = 8888/g" ~/.jupyter/jupyter_lab_config.py
