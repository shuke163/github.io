---
title: python的logging模块实现json格式的日志输出
copyright: true
top: 0
date: 2020-04-20 00:18:41
categories:
- PYTHON
description: python的logging模块实现json格式的日志输出
tags:
- PYTHON
---

## python的logging模块实现json格式的日志输出 
> 想要让开发过程或者是上线后的bug无处可藏，最好的方式便是在程序运行过程中，不断收集重要的日志，以供分析使用。Python中内置的log收集模块是logging，该模块使用起来比较方便，但是美中不足的地方就是日志的格式转成json比较麻烦。于是我结合logging和另一个模块python-json-logger(pip install python-json-logger), 实现json格式的日志输出。

以下代码可以做成模块，直接导入使用
### 源码
```
#!/user/bin/env python


import logging, logging.config, os
import structlog
import traceback
from structlog import configure, processors, stdlib, threadlocal
from pythonjsonlogger import jsonlogger
BASE_DIR = BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DEBUG = True  # 标记是否在开发环境


# 给过滤器使用的判断
class RequireDebugTrue(logging.Filter):
    # 实现filter方法
    def filter(self, record):
        return DEBUG

def get_logger():
    LOGGING = {
    # 基本设置
        'version': 1,  # 日志级别
        'disable_existing_loggers': False,  # 是否禁用现有的记录器

    # 日志格式集合
        'formatters': {
        # 标准输出格式
            'json': {
            # [具体时间][线程名:线程ID][日志名字:日志级别名称(日志级别ID)] [输出的模块:输出的函数]:日志内容
                'format': '[%(asctime)s][%(threadName)s:%(thread)d][%(name)s:%(levelname)s(%(lineno)d)]\n[%(module)s:%(funcName)s]:%(message)s',
                'class': 'pythonjsonlogger.jsonlogger.JsonFormatter',
            }
        },
    # 过滤器
        'filters': {
            'require_debug_true': {
                '()': RequireDebugTrue,
            }
        },
    # 处理器集合
        'handlers': {
        # 输出到控制台
        # 输出到文件
            'TimeChecklog': {
                'level': 'DEBUG',
                'class': 'logging.handlers.RotatingFileHandler',
                'formatter': 'json',
                'filename': os.path.join("./", 'TimeoutCheck.log'),  # 输出位置
                'maxBytes': 1024 * 1024 * 5,  # 文件大小 5M
                'backupCount': 5,  # 备份份数
                'encoding': 'utf8',  # 文件编码
            },
        },
    # 日志管理器集合
        'loggers': {
        # 管理器
            'proxyCheck': {
                'handlers': ['TimeChecklog'],
                'level': 'DEBUG',
                'propagate': True,  # 是否传递给父记录器
            },
        }
    }

    logging.config.dictConfig(LOGGING)
    logger = logging.getLogger("proxyCheck")
    return logger


# 测试用例，你可以把get_logger()封装成一个模块，from xxx import get_logger()
logger1 = get_logger()
def test():
    try:
        a = 1 / 0
    except Exception as e:
        logger1.error("This is a error info",exc_info=True)  # 写入错误日志
        #如果需要添加额外的信息，使用extra关键字即可
        logger1.error(str(traceback.format_exc()), extra={"key1": "value1", "key2":"value2"})
        # 其他错误处理代码
        pass
test()
```
### 测试结果
测试的结果，可以在./TimeoutCheck.log文件中看到输出的日志
```
$ cat TimeoutCheck.log
{"asctime": "2019-01-31 11:29:16,818", "threadName": "MainThread", "thread": 140735830963008, "name": "proxyCheck", "levelname": "ERROR", "%(lineno": null, "module": "log", "funcName": "test", "message": "This is a error info", "exc_info": "Traceback (most recent call last):\n  File \"log.py\", line 74, in test\n    a = 1 / 0\nZeroDivisionError: division by zero"}
{"asctime": "2019-01-31 11:29:16,819", "threadName": "MainThread", "thread": 140735830963008, "name": "proxyCheck", "levelname": "ERROR", "%(lineno": null, "module": "log", "funcName": "test", "message": "Traceback (most recent call last):\n  File \"log.py\", line 74, in test\n    a = 1 / 0\nZeroDivisionError: division by zero\n", "key1": "value1", "key2": "value2"}
```

### 版本二
```
import json
import datetime
import logging
import logging.config
import sys

class LogstashFormatter(logging.Formatter):
    def __init__(self, task_name=None):
        self.task_name = task_name

        super(LogstashFormatter, self).__init__()

    def format(self, record):
        data = {'@message': record.msg,
                '@timestamp': datetime.datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%S.%fZ'),
                '@type': 'Add log extra test'}

        if self.task_name:
            data['@task_name'] = self.task_name

        for key, value in record.args.items():
            data[key] = value

        return json.dumps(data)


logger = logging.getLogger(__name__)

logging.config.dictConfig({
    'version': 1,
    'disable_existing_loggers': False,  # this fixes the problem
    'formatters': {
        'json': {
            '()': LogstashFormatter,
        },
    },
    'handlers': {
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'json',
            'stream': sys.stdout
        },
    },
    'loggers': {
        '': {
            'handlers': ['console'],
            'level': 'INFO',
            'propagate': True,
        },
    }
})


logger.info('It works!', {'aaa':'bbbb','cccc':'dddd'})

# output:
{"@message": "It works!", "@timestamp": "2019-01-31T02:52:24.786570Z", "@type": "Add log extra test", "aaa": "bbbb", "cccc": "dddd"}
```

### 版本三
> 此版本为优化版本,继承pythonjsonlogger.jsonlogger库中的JsonFormatter类,重写format方法
```
#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""
@author: shuke
@file: jsonlog.py 
@time: 2019/01/20 15:36
@contact: shu_ke163@163.com
@software:  shuke-logging
"""

import sys
import time
import json
import socket
import datetime
import logging
import traceback
import logging.config
from pythonjsonlogger.jsonlogger import JsonFormatter


class JsonFormatter(JsonFormatter):
    def __init__(self, *args, **kwargs):
        self.host = socket.getfqdn()
        self.message_type = "json"
        self.version = "v1.0"
        super(JsonFormatter, self).__init__(*args, **kwargs)

    def get_extra_fields(self, record):
        # The list contains all the attributes listed in
        # http://docs.python.org/library/logging.html#logrecord-attributes
        builtin_attr_list = [
            'args', 'asctime', 'created', 'exc_info', 'exc_text', 'filename', 'id', 'levelname', 'levelno', 'module',
            'msecs', 'msecs', 'message', 'msg', 'name', 'pathname', 'relativeCreated', 'extra']

        fields = {}

        for key, value in record.__dict__.items():
            if key not in builtin_attr_list:
                fields[key] = repr(value)

        fields["project"] = "WEHOST"
        fields["team"] = "OPS"
        fields["department"] = "IT"
        fields["log_debug"] = True

        return fields

    def format_timestamp(self, time):
        return datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S %f')

    def format(self, record):
        message = {
            '@timestamp': self.format_timestamp(record.created),
            '@version': 'v1.0',
            'name': record.name,
            'host': self.host,
            'pathname': record.pathname,
            'levelno': record.levelno,
            'filename': record.filename,
            'module': record.module,
            'exc_info': ''.join(traceback.format_exception(*record.exc_info)),
            'exc_text': record.exc_text,
            'stack_info': record.stack_info,
            'created': time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(record.created)),
            'msecs': record.msecs,
            'relativeCreated': record.relativeCreated,
            'type': self.message_type,
            'level': record.levelname,
            'message': record.getMessage(),

        }
        # Add extra fields
        message.update(self.get_extra_fields(record))

        return json.dumps(message, indent=4)


def get_logger():
    LOGGING = {
        # 基本设置
        'version': 1,  # 日志级别
        'disable_existing_loggers': False,  # 是否禁用现有的记录器

        # 日志格式集合
        'formatters': {
            # 标准输出格式
            'json': {
                # [具体时间][线程名:线程ID][日志名字:日志级别名称(日志级别ID)] [输出的模块:输出的函数]:日志内容
                # 'format': '[%(asctime)s][%(threadName)s:%(thread)d][%(name)s:%(levelname)s(%(lineno)d)]\n[%(module)s:%(funcName)s]:%(message)s',
                # 'format': '[%(asctime)s][%(threadName)s:%(thread)d][%(created)s:%(process)d:%(processName)s][%(relativeCreated)s:%(msecs)s][%(pathname)s:%(filename)s][%(name)s:%(levelname)s:%(lineno)d)][%(module)s:%(funcName)s]:%(message)s',
                # '()': JsonFormatter.format,
                # 'class': 'pythonjsonlogger.jsonlogger.JsonFormatter',
                '()': JsonFormatter,
            }
        },
        # 处理器集合
        'handlers': {
            # 输出到控制台
            'console': {
                'level': 'DEBUG',
                'class': 'logging.StreamHandler',
                'formatter': 'json',
                'stream': sys.stdout
            },
        },
        # 日志管理器集合
        'loggers': {
            # 管理器
            'mylog': {
                'handlers': ['console'],
                'level': 'DEBUG',
                'propagate': True,  # 是否传递给父记录器
            },
        }
    }

    logging.config.dictConfig(LOGGING)
    logger = logging.getLogger("mylog")
    return logger


# 测试用例，你可以把get_logger()封装成一个模块，from xxx import get_logger()
logger = get_logger()


def main():
    try:
        a = 1 / 0
    except Exception as e:
        # 如果需要添加额外的信息，使用extra关键字即可
        logger.info("This is a info message", extra={"type": "json", "department": "IT", "bussiness": "game"},
                    exc_info=True)
        logger.info("Hello World", extra={"key1": "value1", "key2": "value2"}, exc_info=True)
        # 其他错误处理代码
        pass


if __name__ == '__main__':
    main()



# output:
{
    "@timestamp": "2019-01-31 18:53:39 581892",
    "@version": "v1.0",
    "name": "mylog",
    "host": "MacBooKPro",
    "pathname": "jsonlog.py",
    "levelno": 20,
    "filename": "jsonlog.py",
    "module": "jsonlog",
    "exc_info": "Traceback (most recent call last):\n  File \"jsonlog.py\", line 129, in test\n    a = 1 / 0\nZeroDivisionError: division by zero\n",
    "exc_text": null,
    "stack_info": "None",
    "created": "2019-01-31 18:53:39",
    "msecs": 581.8040370941162,
    "relativeCreated": 47.5161075592041,
    "type": "'json'",
    "level": "INFO",
    "message": "This is a info message",
    "lineno": "133",
    "funcName": "'test'",
    "thread": "140735830963008",
    "threadName": "'MainThread'",
    "processName": "'MainProcess'",
    "process": "83309",
    "department": "IT",
    "bussiness": "'game'",
    "project": "WEHOST",
    "team": "OPS",
    "log_debug": true
}
{
    "@timestamp": "2019-01-31 18:53:39 582770",
    "@version": "v1.0",
    "name": "mylog",
    "host": "MacBooKPro",
    "pathname": "jsonlog.py",
    "levelno": 20,
    "filename": "jsonlog.py",
    "module": "jsonlog",
    "exc_info": "Traceback (most recent call last):\n  File \"jsonlog.py\", line 129, in test\n    a = 1 / 0\nZeroDivisionError: division by zero\n",
    "exc_text": null,
    "stack_info": "None",
    "created": "2019-01-31 18:53:39",
    "msecs": 582.7357769012451,
    "relativeCreated": 48.44784736633301,
    "type": "json",
    "level": "INFO",
    "message": "Hello World",
    "lineno": "134",
    "funcName": "'test'",
    "thread": "140735830963008",
    "threadName": "'MainThread'",
    "processName": "'MainProcess'",
    "process": "83309",
    "key1": "'value1'",
    "key2": "'value2'",
    "project": "WEHOST",
    "team": "OPS",
    "department": "IT",
    "log_debug": true
}
```

可以看到日志是json格式，这样你就可以很方便的使用grafna和kafka->logstash->es的方式进行日志收集展示了.如果需要将日志直接打到kafka中,需要使用kafka-python库,同时定义handlers进行处理.

