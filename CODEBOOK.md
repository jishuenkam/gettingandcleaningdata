# Codebook for the Tidy Data Set

This file serves as the codebook for `tiny_data.txt`. 

***

The two non-measurement related columns are as follows:

1. id
  * Consists of the subject label, ranges from 1 to 30.

2. activity_names
  * Consists of the 6 activities, namely laying, sitting, standing, walking, walking upstairs and walking downstairs.

The rest of the columns/variables are measurement-related. I inherit the **EXACT** data labels from the original data set, though the values displayed for each measurement variable are really the **AVERAGE** for each combination of **id** and **activity_names**. All the measurement variables are generally in the following form, where [abc]\* indicates that the string in the parentheses could repeat more than one time in the label, while [a | b] means that the string can take either "a" or "b". 

[t | f] [Body | Gravity]\* [Acc | Gyro]\* [Jerk | Mag]\*. [std | mean | meanFreq] ...[X | Y | Z]

Following is some explanation on the data label, but they are primarily sourced from `features_info.txt`.

* [t | f] 
  * t : time doman signals
  * f : frequency doman signals

* [Body | Gravity]
	* Body : Body acceleration signals
	* Gravity: Gravity acceleration signals

* [Acc | Gyro]
	* Acc : Accelerometer
	* Gyro : Gyroscope

* [Jerk | Mag]
	* Jerk : Jerk signals obtained from body linear acceleration and angular velocity
	* Mag : Magnitude of the three dimensional signals.

* [std | mean | meanFreq]
	* std: standard deviation estimated from the signals
	* mean: mean value estimated from the signals
	* meanFreq: weighted average of the frequency components to obtain a mean frequency, 				estimated from the signals

* [X | Y | Z]
	* Indicates whether signals are obtained from the X, Y or Z direction.