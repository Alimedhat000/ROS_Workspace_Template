#!/usr/bin/env python

import rospy
from my_first_pkg.msg import custom  # type: ignore


class PublisherNode:
    def __init__(self):
        rospy.init_node("publisher", anonymous=True)
        self.publisher = rospy.Publisher("my_topic", custom, queue_size=10)
        self.rate = rospy.Rate(10)

    def publish_message(self):
        while not rospy.is_shutdown():
            msg = custom()
            msg.x = 2024
            msg.y = 10.000
            msg.str = "Robo-Tech's"

            self.publisher.publish(msg)
            self.rate.sleep()


if __name__ == "__main__":
    try:
        node = PublisherNode()
        node.publish_message()

    except rospy.ROSInterruptException:
        pass
