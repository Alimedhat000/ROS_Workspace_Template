#!/usr/bin/env python

import rospy
from my_first_pkg.msg import custom  # type: ignore


class SubscriberNode:
    def __init__(self):
        rospy.init_node("subscriber", anonymous=True)
        self.subscriber = rospy.Subscriber("my_topic", custom, self.callback)

    def callback(self, msg):
        rospy.loginfo("%d It's %s %fth anniversary!!", msg.x, msg.str, msg.y)

    def spin(self):
        rospy.spin()


if __name__ == "__main__":
    try:
        node = SubscriberNode()
        node.spin()
    except rospy.ROSInterruptException:
        pass
