# stable-diffusion-webui-docker

Replace the `<LOCAL PATH OF MODELS>` with your `https://github.com/AUTOMATIC1111/stable-diffusion-webui/tree/master/models`.

```bash
docker run -p 7860:7860 -v <LOCAL PATH OF MODELS>:/app/models --gpus all zhanghx0905/sdweb
```

View http://localhost:7860 for the UI.