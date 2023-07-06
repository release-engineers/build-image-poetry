FROM python:3.11-slim

RUN pip install --no-cache-dir poetry

RUN apt update \
    && apt install -y git \
    && apt clean

