__all__ = ['info', 'warn', 'error', 'debug']

__author__ = "anuj mittal"

import re
import inspect
import sys

#LOGGING LEVEL
#LEVEL     NUMERIC VALUE
DEBUG   =  10
INFO    =  20
WARNING =  30
ERROR   =  40

try:
	import logging
except ImportError as exc:
	sys.stderr.write("Error: Please install missing python package using 'pip install <Package Name>' ({})\n".format(exc))
	sys.exit(1)

initialized = False

def info(message):
    log(INFO, message)
    
def warn(message):
    log(WARNING, message)
    
def error(message):
    log(ERROR, message)
    
def debug(message):
    log(DEBUG, message)
    
    
def log(severity, message):
    global vrts_logger, initialized
    if not initialized:
        vrts_logger = logging.getLogger('VRP.Logger')
    vrts_logger.setLevel(logging.DEBUG)
    formatter = logging.Formatter('%(asctime)s - %(levelname)s -  %(message)s')
    handler = logging.StreamHandler()
    handler.setFormatter(formatter)
    vrts_logger.addHandler(handler)
    #inspect.stack()[2][1:4] : Return a list of frame records for the (2nd) caller's stack. From stack we are taking only 3 values
    filename, linenumber, funcname = inspect.stack()[2][1:4]
    # assume file_name absolute path : "/R2C-TEAM-DATA/anuj/repo/itrp/src/test/robot/libs/workflow_verification.py"
    # Removing string till last /, to get relative file name
    filename = re.sub('^.*/', '', filename)
    message = "[" + filename + ":" + str(linenumber) + "] " + filename + "." + funcname + "() " + message.__str__()
    vrts_logger.log(severity, message)
    vrts_logger.removeHandler(handler)