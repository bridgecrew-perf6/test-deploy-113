FROM python:3.9

WORKDIR /usr/src/app

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt ./

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Let' only copy the required files and folders
ADD . ./
COPY . ./

EXPOSE 8000

CMD ["python3", "manage.py" ]
