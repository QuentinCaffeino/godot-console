
extends Reference
# TODO: As soon as GVen will be finished create log package


enum TYPE \
{
  INFO,
  WARNING,
  ERROR,
  NONE
}


# @var  int
var logLevel = TYPE.WARNING setget setLogLevel


# @param  int  inlogLevel
func setLogLevel(inlogLevel = TYPE.INFO):  # Log
  logLevel = inlogLevel
  return self


# @param  string  message
# @param  int     type
func log(message, type = TYPE.INFO):  # Log
  match type:
    TYPE.INFO:    info(message)
    TYPE.WARNING: warn(message)
    TYPE.ERROR:   error(message)
  return self


# @param  string  message
func info(message):  # Log
  if logLevel <= TYPE.INFO:
    Console.writeLine('[color=blue][INFO][/color] ' + str(message))
  return self


# @param  string  message
func warn(message):  # Log
  if logLevel <= TYPE.WARNING:
    Console.writeLine('[color=yellow][WARNING][/color] ' + str(message))
  return self


# @param  string  message
func error(message):  # Log
  if logLevel <= TYPE.ERROR:
    Console.writeLine('[color=red][ERROR][/color] ' + str(message))
  return self
