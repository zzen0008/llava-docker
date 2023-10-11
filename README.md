## LLaVA 1.5 Deployment with Docker
-----------------------------------

### Requirements
openai/clip-vit-large-patch14-336
liuhaotian/llava-v1.5-13b

```
git lfs install
git clone https://huggingface.co/liuhaotian/llava-v1.5-7b
git clone https://huggingface.co/openai/clip-vit-large-patch14-336

mv config.json ./liuhaotian_llava-v1.5-13b/config.json
```

## To Deploy 
```
sudo docker compose up --build
```


