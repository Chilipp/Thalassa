FROM continuumio/miniconda3

ADD . /opt/app

WORKDIR /opt/app

RUN conda env update -n base -f environment.yml && pip install -r requirements/requirements.txt

RUN mkdir -p /opt/app/data && \
    wget -O data/dataset.nc https://static.techrad.eu/thalassa/dataset.nc

EXPOSE 5006

CMD ["panel", "serve", "--port", "5006", "./run.py"]