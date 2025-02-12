FROM python:slim

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN pip config set install.trusted-host 'https://pypi.tuna.tsinghua.edu.cn'

RUN pip install --root-user-action=ignore --upgrade pip  
RUN pip install --root-user-action=ignore docker-squash

CMD ["docker-squash"]