#!/bin/bash

xfce4-terminal \
--tab --title "START_CONTAINER" --command "bash -c \"
./start_docker_rrbot_sim_1.sh;
exec bash\""  \
--tab --title "ROSCORE" --command "bash -c \"
sleep 4 && docker exec -it ros_melodic_desktop_rrbot_sim_1 /bin/bash -c 'cd /root/catkin_ws && source /opt/ros/melodic/setup.bash && catkin_make && source /root/catkin_ws/devel/setup.bash && roscore';
exec bash\""  \
--tab --title "GAZEBO" --command "bash -c \"
sleep 20 && docker exec -it ros_melodic_desktop_rrbot_sim_1 /bin/bash -c 'source /root/catkin_ws/devel/setup.bash && roslaunch rrbot_gazebo rrbot_world.launch --wait';
exec bash\""  \
--tab --title "ROBOT CONTROL"	--command "bash -c \"
sleep 25 && docker exec -it ros_melodic_desktop_rrbot_sim_1 /bin/bash -c 'source /root/catkin_ws/devel/setup.bash && roslaunch rrbot_control rrbot_control.launch --wait';
exec bash\""  \
--tab --title "JOINTS CONTROL"	--command "bash -c \"
sleep 25 && docker exec -it ros_melodic_desktop_rrbot_sim_1 /bin/bash -c 'source /root/catkin_ws/devel/setup.bash && roslaunch joints_publisher joints_publisher.launch --wait';
exec bash\""  \
--tab --title "LASER ASSEMBLER"	--command "bash -c \"
sleep 30 && docker exec -it ros_melodic_desktop_rrbot_sim_1 /bin/bash -c 'source /root/catkin_ws/devel/setup.bash && roslaunch laser_assembler_demo assembler.launch --wait';
exec bash\""  \
--tab --title "ASSEMBLER SERVICE START"	--command "bash -c \"
sleep 30 && docker exec -it ros_melodic_desktop_rrbot_sim_1 /bin/bash -c 'source /root/catkin_ws/devel/setup.bash && roslaunch laser_assembler_demo service_client.launch --wait';
exec bash\""  \
--tab --title "RVIZ"	--command "bash -c \"
sleep 35 && docker exec -it ros_melodic_desktop_rrbot_sim_1 /bin/bash -c 'source /root/catkin_ws/devel/setup.bash && rosrun rviz rviz -d /root/catkin_ws/src/configs/rviz_laser_sim.rviz';
exec bash\""  \
--tab --title "RQT GUI" --command "bash -c \"
sleep 35 && docker exec -it ros_melodic_desktop_rrbot_sim_1 /bin/bash -c 'source /opt/ros/melodic/setup.bash && rosrun rqt_gui rqt_gui';
exec bash\"" & 
