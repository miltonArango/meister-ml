FROM python:3.10

WORKDIR /code

# Do this separatly to use cache
COPY requirements.txt /code/requirements.txt
COPY setup.py /code/setup.py
RUN pip install torch --no-cache-dir --upgrade
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# will change frequently
COPY ./src /code/src

EXPOSE 8000
EXPOSE 8265

ENTRYPOINT ["serve", "run", "src.api.app:entrypoint", "--host", "0.0.0.0", "--port", "8000"]