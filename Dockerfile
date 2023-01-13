FROM python:3.9-slim

# install python 
RUN apt update && \
    apt install --no-install-recommends -y build-essential gcc && \
    apt clean && rm -rf /var/lib/apt/lists/*

#### Files ####
COPY requirements.txt requirements.txt
COPY Makefile Makefile
COPY setup.py setup.py

##### folders ####
COPY models models
COPY src src
COPY data data
COPY reports/figures/ reports/figures/


WORKDIR /


ENTRYPOINT ["python", "-u", "main.py"]
