	Associated Paper
                “Predictive Modeling of Multipath-Induced Bearing Errors in DVOR Navigation Systems with Environmental Distortion Mapping”
  Submitted to IEEE Transactions on Aerospace and Electronic Systems

Overview
  This repository provides the implementation and experimental validation of a predictive analytical framework for modeling multipath-induced bearing errors in Doppler VHF Omnidirectional Range (DVOR) systems. The proposed approach combines:
1)	Closed-form analytical modeling
2)	Environmental geometry representation
3)	Spatial distortion mapping
4)	Validation using real flight inspection data

Why This Work Matters?
  Multipath reflections are one of the primary sources of error in ground-based navigation systems. This project enables:
✔ Predictive analysis instead of costly flight inspection
✔ Identification of dominant reflectors
✔ Quantitative evaluation of DVOR site quality
✔ Improved navigation system reliability

	Key Features
1)	Closed-form bearing error model
2)	2D spatial distortion mapping
3)	DVOR Site Quality Index (SQI)
4)	Real flight inspection validation
5)	Reflector estimation via harmonic analysis

	Repository Structure
•	Code:
	DVOR_Multipath_Propagation_Geometry.m
	Comparison_between_Flight_Inspection_Data_and_Proposed_Model.m
	Comparison_between_DVOR_bearing_error_of_the_measured_and_the_fitted_first_of_the_measured_and_the_fitted_first_order_harmonic_model.m
	Estimated_Reflector_Direction_from_Flight_Inspection_Data.m
	Effect_of_Reflection_Amplitude_on_Bearing_Error.m
	PredictedDVOR_Bearing_Distortion_Map.m
	DVOR_Bearing_Distortion_Map_Around_the_Station.m
 
•	data
               flight_inspection_data

 
•	figures
	DVOR_Multipath_Propagation_Geometry.png

	Comparison_between_Flight_Inspection_Data_and_Proposed_Model.png

	Comparison_between_DVOR_bearing_error_of_the_measured_and_the_fitted_first_ of_the_measured_and_the_fitted_first_order_harmonic_model.png

	Estimated_Reflector_Direction_from_Flight_Inspection_Data.png

	Effect_of_Reflection_Amplitude_on_Bearing_Error.png

	PredictedDVOR_Bearing_Distortion_Map.png

	DVOR_Bearing_Distortion_Map_Around_the_Station.png

 
•	README

  The framework follows a structured pipeline:
1)	Signal Modeling
2)	DVOR reference and variable signals
3)	Multipath signal formulation
4)	Analytical Modeling
5)	Closed-form derivation of bearing error
6)	Phase-based distortion analysis
7)	Geometric Modeling
8)	Reflector positioning
9)	Path difference computation
10)	Distortion Mapping
11)	Grid-based spatial evaluation
12)	Error visualization
13)	Validation
14)	Comparison with real flight inspection measurements

Example Outputs
•	Azimuth vs bearing error curves
•	Spatial distortion maps
•	Reflector direction estimation
•	SQI-based site classification

Requirements
                MATLAB 

Applications
•	DVOR site planning and optimization
•	Multipath distortion prediction
•	Navigation system monitoring
•	Infrastructure impact analysis
•	Flight inspection support




Citation
  If you use this work, please cite:
Mohamed El-Ghoboushi, Mohamed Salah, “Predictive Modeling of Multipath-Induced Bearing Errors in DVOR Navigation Systems with Environmental Distortion Mapping”, IEEE Transactions on Aerospace and Electronic Systems, 2026, (Under review)

Notes
  This repository is provided for research purposes only 
  Results depend on environmental conditions and assumptions
  The dataset represents a real DVOR operational scenario

Authors
Mohamed El-Ghoboushi
PhD in Electrical Communications Engineering, and an Air Navigation Systems Specialist

Contact
   mohammed.ghaboushy@sva.edu.eg

Support
  If you find this work useful, consider giving the repository a star *
