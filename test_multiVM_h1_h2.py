# #!/usr/bin/env python

#  ===============   3Atomix & 3ONOS   ===============
from mininet.net import Mininet
from mininet.node import Controller, RemoteController, OVSSwitch, OVSKernelSwitch
from mininet.cli import CLI
from mininet.log import setLogLevel, info

TOPOS = {'mytopo' : (lambda : multiControllerNet())}

def multiControllerNet():
    "Create a network from semi-scratch with multiple controllers."

    net = Mininet( controller=RemoteController, switch=OVSKernelSwitch, waitConnected=True )

    info( "*** Creating (reference) controllers\n" )
    c1 = net.addController('c1', controller=RemoteController, ip="localhost", port=16653)
    c2 = net.addController('c2', controller=RemoteController, ip="localhost", port=16654)
    c3 = net.addController('c3', controller=RemoteController, ip="163.221.29.130", port=16655)

    info( "*** Creating switches\n" )
    s1 = net.addSwitch( 's1', protocols="OpenFlow13"  )
    s2 = net.addSwitch( 's2', protocols="OpenFlow13"  )
    s3 = net.addSwitch( 's3', protocols="OpenFlow13"  )

    info( "*** Creating hosts\n" )
    h1 = net.addHost( 'h1' )
    h2 = net.addHost( 'h2' )

    info( "*** Creating links\n" )
    s1.linkTo( h1 )
    s2.linkTo( h2 )
    s1.linkTo( s3 )
    s3.linkTo( s2 )

    info( "*** Starting network\n" )
    net.build()
    c1.start()
    c2.start()
    c3.start()
    s1.start( [ c1 ] )
    s2.start( [ c2 ] )
    s3.start( [ c3 ] )

    net.start()

    info( "*** Running CLI\n" )
    CLI( net )

    info( "*** Stopping network\n" )
    net.stop()


if __name__ == '__main__':
    setLogLevel( 'info' )  # for CLI output
    multiControllerNet()


# #  ===============   3Atomix & 19ONOS   ===============
# from mininet.net import Mininet
# from mininet.node import Controller, RemoteController, OVSSwitch, OVSKernelSwitch
# from mininet.cli import CLI
# from mininet.log import setLogLevel, info
# from mininet.link import TCLink
# import time
# from datetime import datetime

# TOPOS = {'mytopo' : (lambda : multiControllerNet())}

# def multiControllerNet():
#     "Create a network from semi-scratch with multiple controllers."

#     net = Mininet( controller=RemoteController, switch=OVSKernelSwitch, waitConnected=True )
#     # net = Mininet( controller=RemoteController, switch=OVSKernelSwitch, waitConnected=True, link=TCLink )

#     info( "*** Creating (reference) controllers\n" )
#     # 3 Atomix nodes(2,3,4)
#     c1 = net.addController('c1', controller=RemoteController, ip="localhost", port=16653)
#     c2 = net.addController('c2', controller=RemoteController, ip="localhost", port=16654)
#     c3 = net.addController('c3', controller=RemoteController, ip="163.221.29.130", port=16655)
#     c4 = net.addController('c4', controller=RemoteController, ip="163.221.29.133", port=16656)

#     c5 = net.addController('c5', controller=RemoteController, ip="163.221.29.138", port=16657)
#     c6 = net.addController('c6', controller=RemoteController, ip="163.221.29.139", port=16658)
#     c7 = net.addController('c7', controller=RemoteController, ip="163.221.29.173", port=16659)
#     c8 = net.addController('c8', controller=RemoteController, ip="163.221.29.192", port=16660)

#     c9 = net.addController('c9', controller=RemoteController, ip="163.221.29.194", port=16661)
#     c10 = net.addController('c10', controller=RemoteController, ip="163.221.29.214", port=16662)
#     c11 = net.addController('c11', controller=RemoteController, ip="163.221.29.215", port=16663)
#     c12 = net.addController('c12', controller=RemoteController, ip="163.221.29.216", port=16664)

#     c13 = net.addController('c13', controller=RemoteController, ip="163.221.29.218", port=16665)
#     c14 = net.addController('c14', controller=RemoteController, ip="163.221.29.219", port=16666)
#     c15 = net.addController('c15', controller=RemoteController, ip="163.221.29.224", port=16667)
#     c16 = net.addController('c16', controller=RemoteController, ip="163.221.29.225", port=16668)

#     c17 = net.addController('c17', controller=RemoteController, ip="163.221.29.228", port=16669)
#     c18 = net.addController('c18', controller=RemoteController, ip="163.221.29.229", port=16670)
#     c19 = net.addController('c19', controller=RemoteController, ip="163.221.29.240", port=16671)

#     info( "*** Creating switches\n" )
#     s1 = net.addSwitch( 's1', protocols="OpenFlow13" )
#     s2 = net.addSwitch( 's2', protocols="OpenFlow13" )
#     s3 = net.addSwitch( 's3', protocols="OpenFlow13" )
#     s4 = net.addSwitch( 's4', protocols="OpenFlow13" )
#     s5 = net.addSwitch( 's5', protocols="OpenFlow13" )
#     s6 = net.addSwitch( 's6', protocols="OpenFlow13" )
#     s7 = net.addSwitch( 's7', protocols="OpenFlow13" )
#     s8 = net.addSwitch( 's8', protocols="OpenFlow13" )
#     s9 = net.addSwitch( 's9', protocols="OpenFlow13" )
#     s10 = net.addSwitch( 's10', protocols="OpenFlow13" )

#     s11 = net.addSwitch( 's11', protocols="OpenFlow13" )
#     s12 = net.addSwitch( 's12', protocols="OpenFlow13" )
#     s13 = net.addSwitch( 's13', protocols="OpenFlow13" )
#     s14 = net.addSwitch( 's14', protocols="OpenFlow13" )
#     s15 = net.addSwitch( 's15', protocols="OpenFlow13" )
#     s16 = net.addSwitch( 's16', protocols="OpenFlow13" )
#     s17 = net.addSwitch( 's17', protocols="OpenFlow13" )
#     s18 = net.addSwitch( 's18', protocols="OpenFlow13" )
#     s19 = net.addSwitch( 's19', protocols="OpenFlow13" )

#     info( "*** Creating hosts\n" )
#     h1 = net.addHost( 'h1' )
#     h2 = net.addHost( 'h2' )

#     info( "*** Creating links\n" )
#     s1.linkTo( h1 )
#     s2.linkTo( h2 )

#     s1.linkTo( s3 )
#     s3.linkTo( s4 )
#     s4.linkTo( s5 )
#     s5.linkTo( s6 )
#     s6.linkTo( s7 )
#     s7.linkTo( s8 )
#     s8.linkTo( s9 )
#     s9.linkTo( s10 )
#     s10.linkTo( s11 )
#     s11.linkTo( s12 )
#     s12.linkTo( s13 )
#     s13.linkTo( s14 )
#     s14.linkTo( s15 )
#     s15.linkTo( s16 )
#     s16.linkTo( s17 )
#     s17.linkTo( s18 )
#     s18.linkTo( s19 )
#     s19.linkTo( s2 )

#     info( "*** Starting network\n" )
#     net.build()
#     c1.start()
#     c2.start()
#     c3.start()
#     c4.start()
#     c5.start()
#     c6.start()
#     c7.start()
#     c8.start()
#     c9.start()
#     c10.start()
#     c11.start()
#     c12.start()
#     c13.start()
#     c14.start()
#     c15.start()
#     c16.start()
#     c17.start()
#     c18.start()
#     c19.start()
#     s1.start( [ c1 ] )
#     s2.start( [ c2] )
#     s3.start( [ c3 ] )
#     s4.start( [ c4 ] )
#     s5.start( [ c5 ] )
#     s6.start( [ c6 ] )
#     s7.start( [ c7 ] )
#     s8.start( [ c8 ] )
#     s9.start( [ c9 ] )
#     s10.start( [ c10 ] )
#     s11.start( [ c11 ] )
#     s12.start( [ c12 ] )
#     s13.start( [ c13 ] )
#     s14.start( [ c14 ] )
#     s15.start( [ c15 ] )
#     s16.start( [ c16 ] )
#     s17.start( [ c17 ] )
#     s18.start( [ c18 ] )
#     s19.start( [ c19 ] )
    

#     net.start()

#     info( "*** Running CLI\n" )
#     CLI(net)

#     info( "*** Stopping network\n" )
#     net.stop()


# if __name__ == '__main__':
#     setLogLevel( 'info' )  # for CLI output
#     multiControllerNet()
