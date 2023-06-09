FROM nvidia/cuda:11.7.1-base-ubuntu22.04

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y libgl1 libglib2.0-0 wget git git-lfs python3-pip python-is-python3 libcairo2-dev pkg-config python3-dev && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' user
RUN mkdir /app && chown -R user:user /app
USER user

RUN git clone https://github.com/zhanghx0905/stable-diffusion-webui.git /app

WORKDIR /app
RUN pip install --no-deps xformers==0.0.19 && \
    pip install pyre-extensions==0.0.29

RUN pip install torch torchvision --index-url https://download.pytorch.org/whl/cu117 && \
    python launch.py --exit --skip-torch-cuda-test && \
    pip cache purge

EXPOSE 7860

# CMD python webui.py --xformers --listen --enable-insecure-extension-access --gradio-queue
CMD python webui.py --listen --enable-insecure-extension-access --gradio-queue