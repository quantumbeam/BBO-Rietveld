# BBO-Rietveld

## Requirements

- [Docker](https://www.docker.com/)
  - If you are new to Docker, please setup Docker Desktop for your computer first.
  - Here are the documents for Windows and Mac:
    - https://docs.docker.com/docker-for-windows/
    - https://docs.docker.com/docker-for-mac/
  - We have verified our software works on macOS(10.14) and Ubuntu(18.04). We recommend macOS or Ubuntu to run this software, but it should work on any computer that Docker running.

## Usage
__Note: We suppose you are using macOS or Ubuntu and can run docker command without `sudo` permissions.__

First, clone this repository to your computer.

Build bbo-rietveld docker image on terminal. 

```sh
# Please make sure run following command in this directory
docker build ./docker -t bbo-rietveld
```

Run bbo-rietveld container.
```sh
./run.sh
```

Open http://127.0.0.1:8888/?token={TOKEN} in your browser, and you can see a window of JupyterLab. The token will be displayed on your terminal like this:
```
...

[I 11:23:41.325 LabApp] The Jupyter Notebook is running at:
[I 11:23:41.325 LabApp] http://900cc3c9314c:8888/?token=126c79b021d40344592d5b066225b32474487cb69f711ffe
[I 11:23:41.325 LabApp]  or http://127.0.0.1:8888/?token=126c79b021d40344592d5b066225b32474487cb69f711ffe

...
```
In this case, you should open `http://127.0.0.1:8888/?token=126c79b021d40344592d5b066225b32474487cb69f711ffe`.

Then, open `1_Y2O3.ipynb` or other notebooks on JupyterLab and run notebook cells.


## For expert users
If you are already familiar with Python, you can open notebooks (*.ipynb files) directly in your environment and run it.
It requires following packages:
- [GSAS](https://gsas-ii.readthedocs.io/en/latest/GSASIIscriptable.html) (build 3933)
- [Optuna](https://optuna.readthedocs.io/en/stable/)(0.14.0)
- Jupyter Lab or Jupyter Notebook
- Pandas
- matplotlib

You can install GSAS and Optuna as follows:
```
conda install -y gsas2pkg -c briantoby
pip install git+https://github.com/optuna/optuna.git@v0.14.0
```
In the notebook, you should set `DATA_DIR` and `WORK_DIR` appropriately for your directory.


## Trouble shooting

- If you encounter `Unable to find image 'bbo-rietveld:latest' locally` error when you run `run.sh`:
  - Please run `docker image list` on your terminal and make sure that there is `bbo-rietveld` on REPOSITORY and it's tagged as `latest` like following.
```sh
resnant@cosmos:~$ docker image list
REPOSITORY              TAG                             IMAGE ID            CREATED             SIZE
bbo-rietveld            latest                          9363ff5d1eed        39 hours ago        3.46GB
```
