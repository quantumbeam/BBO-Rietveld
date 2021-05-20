# BBO-Rietveld
Implementation of BBO-Rietveld, automated crystal structure analysis method based on blackbox optimisation.  
![The schematic figure of BBO-Rietveld](https://gist.githubusercontent.com/resnant/32aed77b71f71d798a847fab16431315/raw/cadacc758e000e1dc7d7e4d0253512f8b83b4e88/bbo_rietveld_schematic.jpg)

## Citation
Ozaki, Y., Suzuki, Y., Hawai, T., Saito, K., Onishi, M., and Ono, K.  
Automated crystal structure analysis based on blackbox optimisation.  
<i>npj Computational Materials</i> <b>6</b>, 75 (2020).  
[https://doi.org/10.1038/s41524-020-0330-9](https://doi.org/10.1038/s41524-020-0330-9)

## Requirements

- [Docker](https://www.docker.com/)
  - If you are new to Docker, please setup Docker Desktop for your computer first.
  - Here are the documents for Windows and Mac:
    - https://docs.docker.com/docker-for-windows/
    - https://docs.docker.com/docker-for-mac/
  - We have verified our software works on macOS(10.14) and Ubuntu(18.04). We recommend macOS or Ubuntu to run this software, but it should work on any computer that Docker running.

## Usage
__Note: We suppose you are using macOS or Ubuntu and can run docker command without `sudo` permissions. If you are using Windows, we strongly recommend using WSL2 terminal instead of Command prompt or Windows PowerShell with regard to compatibility.__

1. First, clone this repository to your computer.

2. Pull bbo-rietveld docker image on terminal. 
```sh
docker pull resnant/bbo-rietveld:v1.0
```

If needed, you can build bbo-rietveld docker image from `Dockerfile` on your computer.  
```sh
# Please make sure run following command in this directory
docker build ./docker -t bbo-rietveld
```
In recent versions of GSAS, conda may not be able to resolve the dependencies and GSAS installation may fail.  
https://subversion.xray.aps.anl.gov/trac/pyGSAS/wiki/InstallConda  

<!-- For more information on how to use Docker image -->
To use your own docker image, you need to specify your docker image in `run.sh`. Please refer to [run.sh](https://github.com/quantumbeam/BBO-Rietveld/blob/8d4533dc1c436f227205e225fc4bb0c3f6402edf/run.sh#L4).

3. Run bbo-rietveld container.
```sh
./run.sh
```

4. Open http://127.0.0.1:8888/?token={TOKEN} in your browser, and you can see a window of JupyterLab. The token will be displayed on your terminal like this:
```
...

[I 11:23:41.325 LabApp] The Jupyter Notebook is running at:
[I 11:23:41.325 LabApp] http://900cc3c9314c:8888/?token=126c79b021d40344592d5b066225b32474487cb69f711ffe
[I 11:23:41.325 LabApp]  or http://127.0.0.1:8888/?token=126c79b021d40344592d5b066225b32474487cb69f711ffe

...
```
In this case, you should open `http://127.0.0.1:8888/?token=126c79b021d40344592d5b066225b32474487cb69f711ffe`.

5. Then, open `1_Y2O3.ipynb` or other notebooks on JupyterLab and run notebook cells.


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
If you have any problems or questions, please open an issue on GitHub or contact Yuta Suzuki (resnant [at] outlook.jp) by email. 
_Whenever possible, please ask your question via an issue rather than an email._ This will help others who encounter similar problems.

### FAQ
- If port `8888` occupied by other services, following error occurs when you start `run.sh`:
  
  ```Error starting userland proxy: listen tcp 0.0.0.0:8888: bind: address already in use.```
  
  - Please open `run.sh` with a texteditor and modify port binding setting to other port, `18888`, for example:
```
docker run --rm -v ${SCRIPT_DIR}/:/bbo_rietveld -p 18888:8888 -it bbo-rietveld
```
  - Then, Open `http://127.0.0.1:18888/?token={TOKEN}` in your browser to open Jupyter Notebook.

- If you encounter `Unable to find image 'resnant/bbo-rietveld:v1.0' locally` error when you run `run.sh`:
  - Please run `docker image list` on your terminal and make sure that there is `resnant/bbo-rietveld` on REPOSITORY like following.
```sh
resnant@cosmos:~$ docker image list
REPOSITORY              TAG                             IMAGE ID            CREATED             SIZE
resnant/bbo-rietveld    v1.0                            8f6833e9ff59        5 months ago        3.5GB
```

## Licence
This software is distributed under Apache 2.0 licence for research and education purposes. If you want to use this code for a commercial purpose, please contact the corresponding author.

The diffraction and crystal structure dataset in `data/` directory is distributed under its original licences. See [README of the dataset](data/README.md) for details.