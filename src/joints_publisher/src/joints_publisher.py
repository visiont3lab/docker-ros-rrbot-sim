#!/usr/bin/env python

from __future__ import print_function
import sys
import rospy
from std_msgs.msg import Float64
import json
import math

class JointsPublisher:

    def __init__(self):
        self.joint1_pub = rospy.Publisher("/rrbot/joint1_position_controller/command",Float64,queue_size=1)
        self.joint2_pub = rospy.Publisher("/rrbot/joint2_position_controller/command",Float64,queue_size=1)
        self.count = 0

    def run(self):
        ind = self.count
        data1 = 0.0
        data2 = (math.pi/4.0)+(1.0*math.pi/4.0)*math.sin(ind/40.0)*math.sin(ind/40.0)

        self.joint1_pub.publish(data1)
        self.joint2_pub.publish(data2)

        self.count = self.count + 1
            
def main(args):
    rospy.init_node("test_joints_publisher")

    ic = JointsPublisher()

    r = rospy.Rate(50) 
    while not rospy.is_shutdown():
        ic.run()
        r.sleep()

if __name__ == '__main__':
    main(sys.argv)