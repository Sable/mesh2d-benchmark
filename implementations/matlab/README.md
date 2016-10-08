Automatic 2D Mesh Generation, by Darren Engwirda

source: http://people.sc.fsu.edu/~jburkardt/m_src/mesh2d/mesh2d.html

MESH2D is a MATLAB program which generates unstructured meshes in 2D, by Darren Engwirda.

The code is relatively simple, flexible and powerful. The user is able to define a variety of geometric shapes, and desired mesh densities.

MESH2D is most useful because it allows a user to specify a shape or region, which the program will then fill with a triangular mesh. The density of the triangular mesh can be uniform, or the user can request that smaller triangles be used near certain features of the region. The program relies heavily on the features of the Delaunay triangulation, which chooses, among all possible triangulations of a set of points, that triangulation which best avoids small angles.

Interested users should refer to the copy of MESH2D that is made available through the MATLAB Central File Exchange. This copy is essentially my personal working copy, to which I may have added comments, small coding changes, and extra tests and examples.

The MESH2D routines include a call to a function called wbar(). The call to this function fails on my system, and since it seems to have no importance whatsoever, I commented it out. (I believe it is intended to generate a "wait bar", similar to the hourglass or beachball or wristwatch icons.

The MESH2D function "mytsearch()" was originally written to call MATLAB's "tsearch()" function. The tsearch() function has since been removed from MATLAB. Therefore, the call to tsearch() also causes MESH2D to fail!

One alternative is a file called tsearch_mex.c, which searches a triangulation to determine which triangle contains each point. It does not require that the triangulation be Delaunay. To use this function with MATLAB, you need to apply MATLAB's MEX compiler...if you have never used the MEX compiler before, you may have some difficulty, since you need to determine that you have the MEX compiler, that you have a C or C++ compiler on your system, that MEX knows where these compilers are, and that you know how to invoke MEX to compile the function. That should be something like

        mex tsearch_mex.c
      
(The second time you do something like this is, of course, a hundred times easier and only half as mysterious!)
A second alternative is to replace the call to tsearch() by a call to MATLAB's replacement function DelaunayTri; however, a simple substitution of one call for the other does not quite work. There is, apparently, some feature of tsearch() that is not available in DelaunayTri(). In particular, it may be that tsearch() did not require the triangulation to be Delaunay...

A third alternative is to replace the call to tsearch(x,y,t,px,py) by a call to tsearchn([x y], t, [px py] ), which seems to work.
