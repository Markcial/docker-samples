FROM gliderlabs/alpine:3.1

RUN apk add --update \
    python \
    python-dev \
    py-pip \
  && pip install flask \
  && pip install gunicorn \
  && rm -rf /var/cache/apk/*

RUN mkdir /app
ENV PYTHON_PATH /app
WORKDIR /app

ADD src/main.py /app

EXPOSE 5000

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "main:app"]
