FROM python:3.7

WORKDIR /usr/src/app

ADD requirements.txt ./
RUN pip install -r requirements.txt

ADD . ./

ENTRYPOINT ["sh", "-c"]
CMD ["python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000"]
