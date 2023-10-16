#!/bin/bash 
cd /app/LLaVA
# Launch the controller
python -m llava.serve.controller --host 0.0.0.0 --port 10000 &

# Launch the Gradio web server
python -m llava.serve.gradio_web_server --controller http://localhost:10000 --model-list-mode reload &

# Launch a model worker
TRANSFORMERS_OFFLINE=1 python -m llava.serve.model_worker --host 0.0.0.0 --controller http://localhost:10000 --port 40000 --worker http://localhost:40000 --model-path /app/llava-v1.5-13b ${QUANTISATION}  
wait -n

exit $?