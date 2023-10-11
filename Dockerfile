# Define base image
FROM ubuntu:jammy-20230804
# Install needed apt software
RUN apt-get update && apt-get upgrade -y && apt-get install -y python3 python3-pip python3.10-venv git

# Create non-root user
USER root
RUN groupadd -g 5500 appgroup && useradd -u 5500 -g appgroup appuser

WORKDIR /app
RUN mkdir -p /app && chown appuser:appgroup /app
USER appuser

# Configure virtual environment.
ENV VIRTUAL_ENV=/app/.local/venv
RUN python3 -m venv ${VIRTUAL_ENV}
ENV PATH="${VIRTUAL_ENV}/bin:$PATH"

# Pip configuration and installation of dependencies
ENV PIP_CACHE_DIR=/app/.local/cache/pip

RUN git clone https://github.com/haotian-liu/LLaVA.git

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -e ./LLaVA/

# Needed For Training
# TODO: get nvcc in ubuntu image or swap to nvidia/cudadevel image
#RUN python3 -m pip install ninja
#RUN CUDA_HOME=/usr/local/cuda python3 -m pip install flash-attn --no-build-isolation

#cache loctions
ENV MPLCONFIGDIR=/app/.local/cache/matplotlib
ENV TRANSFORMERS_CACHE=/app/.local/cache/huggingface/hub

# Setup Processes 
COPY process_wrapper.sh /app/
ENTRYPOINT [ "/app/process_wrapper.sh" ]
