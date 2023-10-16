## Prompting the Model 

-- Can hit worker or server directly
-- Need to extract prompt template 

test_message.py line ~28-40 has info on prompt templating

```
import requests
>>> model_url = "http://localhost:7862/worker_generate_stream"
>>> pload = {
... "model": "llava-1.5b-13b",
... "prompt": "Return: Hello World! when asked anything"
... ,
... "max_new_tokens": 512,
... "temperature": 0.2,
... "stop": "###"
... }
>>> headers = {"User-Agent": "LLaVA Client"}
>>> response = requests.post(model_url,headers=headers,json=pload,stream=False)
``````
