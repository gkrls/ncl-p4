class Color:
   PURPLE = '\033[95m'
   CYAN = '\033[96m'
   DARKCYAN = '\033[36m'
   BLUE = '\033[94m'
   GREEN = '\033[92m'
   YELLOW = '\033[93m'
   RED = '\033[91m'
   BOLD = '\033[1m'
   UNDERLINE = '\033[4m'
   END = '\033[0m'

def print_color(color, msg, emph=False, cb=None):
    if emph:
        print(color + '+' + ('-' * 80) + '+' + Color.END)
        print(color + msg + Color.END)
        print(color + '+' + ('-' * 80) + '+' + Color.END)
    else:
        print(color + msg + Color.END)
    if cb:
        cb()

def print_bold(msg, col=None, emph=False, cb=None):
    return print_color((Color.BOLD + col) if col is not None else Color.BOLD, msg, emph, cb)