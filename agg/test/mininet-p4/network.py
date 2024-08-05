import sys
import os
from p4utils.utils.compiler import BF_P4C
from p4utils.mininetlib.network_API import NetworkAPI

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__)))
SDE = os.environ['SDE']
SDE_INSTALL = os.path.join(SDE, 'install')

net = NetworkAPI()
net.setLogLevel('info')
net.enableCli()

s = "s1"
net.setCompiler(compilerClass=BF_P4C, sde=SDE, sde_install=SDE_INSTALL)
net.addTofino(s, sde=SDE, sde_install=SDE_INSTALL, mac="42:42:42:42:42:42", ip="42.42.42.42")
net.setP4Source(s, sys.argv[1])

net.enableLogAll()
net.disableArpTables()
net.startNetwork()