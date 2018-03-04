#!/bin/bash
cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D INSTALL_PYTHON_EXAMPLES=ON \
-D INSTALL_C_EXAMPLES=OFF \
-D OPENCV_EXTRA_MODULES_PATH=/home/dmitry/projects/github/opencv_contrib/modules \
-D PYTHON_EXECUTABLE=/home/dmitry/.virtualenvs/opencv/bin/python \
-D BUILD_opencv_cnn_3dobj=OFF \
-D BUILD_opencv_dnn_modern=OFF \
-D BUILD_PROTOBUF=OFF \
-D BUILD_opencv_dnn=OFF \
-D BUILD_EXAMPLES=ON ..