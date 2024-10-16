from mininet.net import Mininet
from mininet.node import Controller, RemoteController, OVSSwitch, OVSKernelSwitch
from mininet.cli import CLI
from mininet.log import setLogLevel, info
from mininet.link import TCLink

TOPOS = {'mytopo' : (lambda : multiControllerNet())}

def multiControllerNet():
    "Create a network from semi-scratch with multiple controllers."

    net = Mininet( controller=RemoteController, switch=OVSKernelSwitch, waitConnected=True, link=TCLink )

    info( "*** Creating (reference) controllers\n" )
    c1 = net.addController('c1', controller=RemoteController, ip="172.20.0.3", port=6653)
    c2 = net.addController('c2', controller=RemoteController, ip="172.20.0.4", port=6653)
    c3 = net.addController('c3', controller=RemoteController, ip="172.20.0.5", port=6653)
    c4 = net.addController('c4', controller=RemoteController, ip="172.20.0.6", port=6653)

    info( "*** Creating switches\n" )
    s1 = net.addSwitch( 's1', protocols="OpenFlow13" )
    s2 = net.addSwitch( 's2', protocols="OpenFlow13" )
    s3 = net.addSwitch( 's3', protocols="OpenFlow13" )
    s4 = net.addSwitch( 's4', protocols="OpenFlow13" )

    info( "*** Creating hosts\n" )
    h1 = net.addHost( 'h1' )
    h2 = net.addHost( 'h2' )

    info( "*** Creating links\n" )
    s1.linkTo( h1 )
    s2.linkTo( h2 )
    s1.linkTo( s3 )
    s3.linkTo( s4 )
    s4.linkTo( s2 )

    info( "*** Starting network\n" )
    net.build()
    # c1.start()
    # c2.start()
    # c3.start()
    # c4.start()

    # # topo1
    # s1.start( [ c1 ] )
    # s2.start( [ c2 ] )
    # s3.start( [ c3 ] )
    # s4.start( [ c4 ] )
    
    # # topo2
    # s1.start( [ c1 ] )
    # s2.start( [ c1 ] )
    # s3.start( [ c1 ] )
    # s4.start( [ c1 ] )
    
    # # topo3
    # s1.start( [ c2 ] )
    # s2.start( [ c3 ] )
    # s3.start( [ c2 ] )
    # s4.start( [ c2 ] )

    # # topo4
    # s1.start( [ c2 ] )
    # s2.start( [ c3 ] )
    # s3.start( [ c2 ] )
    # s4.start( [ c2 ] )

    net.start()

    info( "*** Running CLI\n" )
    CLI(net)

    info( "*** Stopping network\n" )
    net.stop()


if __name__ == '__main__':
    setLogLevel( 'info' )  # for CLI output
    multiControllerNet()
