
# Real-Time face detection using MATLAB
This is a project for real-time or live-face recognition with attendance system. GUI based application automatic identifies a face and matches it with the database created and training by computer webcam or labtop camera. Also, this application 'Eigenface' PCA algorithm and viola jones algorithm is implemented.
## Table of contents
* [General info](#general-info)
* [Objectives](#objectives)
* [Screenshots](#screenshots)
* [Features](#features)
* [Technologies](#technologies)
* [Setup](#setup)
* [Status](#status)
* [Contact](#contact)
* [License](#license)
* [Contributing](#contributing)

## General info
This project is being carried out due to the concerns that have been highlighted on
the methods that given a real time video stream, devise a strategy by choosing an algorithm for detection of face like objects in that video stream. Moreover, once a human face is detected in the video stream, extract its feature points and use them to keep track of the motion of that face in live video.
Face detection is considered to be a complex task because of many challenges involved in it like presence of occlusion in the vide frame, change in pose of human face and change in image position etc. Keeping in view all these constraints, strategy for implementation of real time face detection must be robust enough to provide maximum performance in presence of these constraints.

## Objectives
As the need for larger amounts of research rises of the face detection algorithms
choosing an approach for detection of a face in a real video stream by Viola-Jones object detection framework, designing and implementing graphical user interface (GUI) that allows users to interact with implemented algorithms and extracting facial features also known as feature points from the detected face. In this case, facial features are extracted using a minimum eigenvalue algorithm as specified in [Carlo Tomasi and Takeo Kanade. Detection and Tracking of Point Features. Carnegie Mellon University Technical Report CMU-CS-91-132, 1991](https://cecas.clemson.edu/~stb/klt/tomasi-kanade-techreport-1991.pdf)


## Screenshots
Home page
:-------------------------:
![](https://user-images.githubusercontent.com/20365333/127751054-c235a7ca-9010-480e-b527-7f4b347b983a.png)

Detect camera lab for quick detection for face, eyes, and upper-body!
:-------------------------:
![](https://user-images.githubusercontent.com/20365333/127751375-f446b599-07f1-4724-a9ab-5f2f41127f2d.png)

After login with password
:-------------------------:
![](https://user-images.githubusercontent.com/20365333/127751056-19242f3a-7323-44a6-b3d8-0a8a1bd17418.png)

## Features
* Login Page
* Face Detection and Data Gathering
* Train the Recognizer
* Face Recognition
* Database 
* Live-camera
* Takes Image From Videos
* Annotates Detected Features

## Technologies
* MATLAB version R2020a or higher
* Computer Vision Toolbox
* Image Acquisition Toolbox
* Image Processing Toolbox
* Control System Toolbox


## Setup

To run this app, you will need to follow these 2 steps:

#### 1. Requirements
  - a Laptop with camera or USB camera 
  - Windows 10.     ` For macOS users, need to figure out what errors might happen when setup `
  
#### 2. Install MATHLAB and Toolboxs
- [Get MATLAB](https://www.mathworks.com/products/get-matlab.html?s_tid=gn_getml) (MATLAB version R2020a or higher recommend) 
- [Image Processing Toolbox](https://www.mathworks.com/products/image.html?s_tid=FX_PR_info)
- [Image Acquisition Toolbox](https://www.mathworks.com/products/image-acquisition.html?s_tid=FX_PR_info)
- [Computer Vision Toolbox](https://www.mathworks.com/products/computer-vision.html?s_tid=FX_PR_info)
- [Control System Toolbox](https://www.mathworks.com/products/control.html)
- [Here is a list of all the MATLAB toolboxes that might be needed](http://www.mathworks.com/products/)

## Status
Project is: ![##c5f015](https://via.placeholder.com/15/c5f015/000000?text=+) _done_

## Contact
Created by [A.Safarji](https://github.com/A-safarji) - feel free to contact me!

## License
>You can check out the full license [here](https://github.com/A-safarji/Real-Time-Face-Detection-Using-MATLAB/blob/main/LICENSE)

This project is licensed under the terms of the **MIT** license.

## Contributing

1. Fork it (<https://github.com/A-safarji/Real-Time-Face-Detection-Using-MATLAB.git>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request




