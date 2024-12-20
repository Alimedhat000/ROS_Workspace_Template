# ROS Package Template

## Overview
This ROS package contains a basic publisher-subscriber implementation using Python.

## Prerequisites
- ROS (tested on ROS Noetic)
- Python 3
- rospy

## Installation
Clone this package into your catkin workspace's src folder:
```bash
git clone https://github.com/Alimedhat000/ROS_Workspace_Template.git
cd ~/ROS_Workspace_Template
catkin_make
source devel/setup.bash
```

## Package Structure
```
my_first_pkg/
├── CMakeLists.txt
├── package.xml
├── README.md
├── scripts/
│   ├── publisher.py
│   └── subscriber.py
└── launch/
    └── start_nodes.launch
```

## Usage

### Running RosCore
```bash
roscore
```

### Running the Publisher Node
```bash
rosrun my_first_pkg publisher.py
```

### Running the Subscriber Node
```bash
rosrun my_first_pkg subscriber.py
```
