FROM python:3.10

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip \
    && pip install poetry

WORKDIR /code

RUN poetry config virtualenvs.create false

COPY pyproject.toml poetry.lock* /code/

RUN poetry lock --no-update
RUN poetry install --no-root --no-dev


COPY . /code/