FROM registry.cn-hangzhou.aliyuncs.com/sais-public/pytorch:2.0.0-py3.9.12-cuda11.8.0-u22.04

ADD . /app

# 设置工作目录
WORKDIR /app

# 设置pip国内源
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install -r /app/requirements.txt
RUN pip install torch_scatter-2.1.2+pt20cu118-cp39-cp39-linux_x86_64.whl

# 定义容器启动时默认执行的命令
CMD ["sh", "/app/run.sh"]