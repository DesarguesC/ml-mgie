conda create -n mgie python=3.10 -y
conda activate mgie
conda update -n base -c defaults conda setuptools -y
conda install -c conda-forge git git-lfs ffmpeg vim htop ninja gpustat -y
conda clean -a -y

pip install -U pip cmake cython==0.29.36 pydantic==1.10 numpy
pip install -U gdown pydrive2 wget jupyter jupyterlab jupyterthemes ipython
pip install -U sentencepiece transformers diffusers tokenizers datasets gradio==3.37 accelerate evaluate git+https://github.com/openai/CLIP.git
pip install -U https://download.pytorch.org/whl/cu113/torch-1.12.0%2Bcu113-cp310-cp310-linux_x86_64.whl https://download.pytorch.org/whl/cu113/torchvision-0.13.0%2Bcu113-cp310-cp310-linux_x86_64.whl https://download.pytorch.org/whl/cu113/torchaudio-0.12.0%2Bcu113-cp310-cp310-linux_x86_64.whl
pip install -U deepspeed

# git clone this repo
cd ml-mgie
git submodule update --init --recursive
cd LLaVA
pip install -e .
pip install -U https://download.pytorch.org/whl/cu113/torch-1.12.0%2Bcu113-cp310-cp310-linux_x86_64.whl https://download.pytorch.org/whl/cu113/torchvision-0.13.0%2Bcu113-cp310-cp310-linux_x86_64.whl https://download.pytorch.org/whl/cu113/torchaudio-0.12.0%2Bcu113-cp310-cp310-linux_x86_64.whl
pip install -U ninja flash-attn==1.0.2
pip install -U pydrive2 gdown wget

cd ..
cp mgie_llava.py LLaVA/llava/model/llava.py
cp mgie_train.py LLaVA/llava/train/train.py
