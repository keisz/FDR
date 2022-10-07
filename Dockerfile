FROM python:3.9-slim-bullseye

RUN pip install -U \
    pip \
    setuptools \
    wheel \
    config

WORKDIR /project

RUN useradd -m -r user && \
    chown user /project

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY ./standalone-s3-accesskey .

CMD [ "python", "falcon_data_replicator.py", "-f", "falcon_data_replicator.ini"]