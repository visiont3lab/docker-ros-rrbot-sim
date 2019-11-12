
# Docker ROS rrbot Laser Scan Simulation

## Introduction

Rrbot simulation laser scan point cloud generation using docker in combination with gazebo and rviz. 

## Requirements

* [Install docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)
* [Install nvidia-docker2](https://github.com/NVIDIA/nvidia-docker)

## Setup

```
cd $HOME
sudo apt install xfce4-terminal
git clone https://github.com/visiont3lab/docker-ros-rrbot-sim.git
echo "export ROS_RRBOT_SIM=$HOME/docker-ros-rrbot-sim" >> $HOME/.bashrc && source $HOME/.bashrc
```
Feel free to modify the path as you like!

## Run

```
cd $ROS_RRBOT_SIM/scripts && ./launch_rrbot_sim.sh
```

After finishing remember to type 

```
docker stop ros_melodic_desktop_rrbot_sim
```

## References

[Main Reference](http://ros-developer.com/2017/08/03/assembling-laser-scans-into-pcl-point-cloud-using-gazebo-and-ros/) <br>
[Tf transform](https://gist.github.com/martimorta/64bc08ba9934b1ad7a02) <br>
[Amazing Article](https://community.arm.com/developer/research/b/articles/posts/do-you-want-to-build-a-robot) <br>
[Laser assembler](https://www.youtube.com/watch?v=MyA0as18Wkk&feature=youtu.be)


## Extra: Build docker image

```
cd $ROS_RRBOT_SIM && docker build -t ros-melodic-desktop-full .
```


## Extra (Useful Commands)

```
roslaunch rrbot_control rrbot_control.launch
roslaunch rrbot_gazebo rrbot_world.launch
roslaunch laser_assembler_demo service_client.launch
rosrun rviz rviz
rosrun rqt_gui rqt_gui
roslaunch rrbot_description rrbot_rviz.launch
rostopic pub /rrbot/joint2_position_controller/command std_msgs/Float64 "data: -0.9"
```

