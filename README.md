# Trajectory Optimisation

<p align="center">
<img src="https://raw.githubusercontent.com/master-coro/trajectory-optimisation/master/res/traj_opt.JPG"
</p>

The room has obstacles in the form of four circles of definite radii and
centers. Two rectangular walls, each of size 4x2 with their origins at (4, 0) and (4, 6) separates the test
region into two rooms. A trajectory AB has to travel from the left side of the room (preferably from
the top) to the right side of the room (preferably to the bottom). The trajectory has to pass through
4 to 7 intermediate points before it has to reach its destination B. The objective of the project is to
optimize this trajectory containing the intermediate points (guess points) in such a way that they pass
either tangentially to the circles or away from the circles as well as pass in between the walls as it tries
to go from the left to the right side of the room.

* Implement a constraint function inside the room having just one circle and one guess point.
* Introduce 2 circles with 5 intermediate points and test the results.
* Introduce 4 circles with 7 intermediate points and test the results.
* The rectangular walls can now be introduced with two set of circles on the left side of the room and two others on the right side. Additional constraints must be defined in order to make the trajectory pass perfectly in the area between the walls.


