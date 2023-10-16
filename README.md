## LLaVA 1.5 Deployment with Docker
-----------------------------------

### Requirements
----------------

1. Download Models from lfs store
```
git lfs install

git clone https://huggingface.co/liuhaotian/llava-v1.5-7b ## llava-v1.5-7b
git clone https://huggingface.co/openai/clip-vit-large-patch14-336 ## clip-vit-large-patch14-336
```

2. Apply Patch to llava-v1.5-13b config 
    - use local model path intead of repo name

```
sed -i 's/"mm_vision_tower": "openai\/clip-vit-large-patch14-336"/"mm_vision_tower": "\/app\/clip-vit-large-patch14-336"/g' llava-v1.5-7b/config.json
```


## To Deploy 

1. Clone the repo 
```
git clone https://github.com/zzen0008/llava-docker.git && cd llava
```

2. Startup container

```
sudo docker compose up --build
```


