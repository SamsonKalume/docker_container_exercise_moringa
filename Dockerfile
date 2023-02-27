FROM python:3.8.3-slim

WORKDIR /app

COPY requirements.txt requirements.txt

# install everything in requirements file
RUN pip3 install -r requirements.txt

COPY . .

# dont include extra code
ENV PYTHONDONTWRITEBYTECODE=1
#capture logs
ENV PYTHONUNBUFFERED=1 


VOLUME [ "/app/data" ]

EXPOSE 8000

ENTRYPOINT [ "python3","manage.py","runserver"]