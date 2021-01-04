# -*- coding: utf-8 -*-

import sys
import traceback
from functools import partial
from gevent import getcurrent

from .log_helper import logger_helper
from pytide.utils.trace import get_log_localtion
from pytide.kafka.manager import info as _info, err as _err, warn as _warn


def trace_full():
    exc_info = sys.exc_info()
    stack = traceback.extract_stack()
    tb = traceback.extract_tb(exc_info[2])
    full_tb = stack[:-1] + tb
    exc_line = traceback.format_exception_only(*exc_info[:2])
    return "Traceback (most recent call last):\n{}\n{}".format(
        "".join(traceback.format_list(full_tb)),
        "".join(exc_line)
    )


def log_writer(message):
    def wrapper(func):
        def _wrapper(*args, **kwargs):
            print('[LOADING]\t{}'.format(message))
            result = func(*args, **kwargs)
            print('[FINISH]\t{}'.format(message))
            return result
        return _wrapper
    return wrapper


def init_log(app_name, debug):
    logger_helper.init_logger(app_name, debug)


def __info(message, request=None):
    module, func_name, line_no = get_log_localtion()
    logger_helper.push_message(message, 'INFO', id(getcurrent()), module, func_name, line_no, request=request)


def __err(message, request=None):
    module, func_name, line_no = get_log_localtion()
    logger_helper.push_message(message, 'ERROR', id(getcurrent()), module, func_name, line_no, request=request)


def __warn(message, request=None):
    module, func_name, line_no = get_log_localtion()
    logger_helper.push_message(message, 'WARN', id(getcurrent()), module, func_name, line_no, request=request)


info = __info
err = __err
warn = __warn
ctl_info = partial(_info, ext_func=__info)
ctl_err = partial(_err, ext_func=__err)
ctl_warn = partial(_warn, ext_func=__warn)
