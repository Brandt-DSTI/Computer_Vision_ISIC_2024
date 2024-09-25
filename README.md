# Computer_Vision_ISIC_2024
DSTI, MsC Applied Data Science Project

Deep Learning with python project : ISIC 2024 Challenge, Skin Cancer Classification 
Using Deep Learning, a Kaggle hosted competition

Skin cancer is a significant global health concern, with melanoma being its deadliest form. 
Early detection is crucial for effective treatment and improved patient outcomes. 
The International Skin Imaging Collaboration (ISIC) has organized the 2024 challenge to develop advanced 
deep learning models for binary classification of skin lesion images. This study aims to create a robust 
and accurate diagnostic tool to assist in triaging potential skin cancer cases, particularly in settings 
without access to specialized dermatologic care.

Two pretrained models where used for the challenge, EfficientNetBO and SqueezeNet.
Both models utilise features selected using Variable Selection using Random Forest (VSURF) and 
have had their hyperparameters optimised using Bald Eagle Search (BES).

Note: VSURF is an R libray. 


## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)
- [Contact](#contact)

## Installation

1. **Clone the repository:**
   ```bash
   git clone github.com/Brandt-DSTI/Computer_Vision_ISIC_2024.git

2. The python notebooks have been developed in Google Lab and will
   not execute locally without significant modification, use
   the badges at the top of each notebook to load the notebooks in Colab.
   More detail in the README in the Python Notebook folder.
   
3. The Kaggle notebooks have been developed in Kaggle and will
   not execute locally as they require the competition environment to execute.
   More detail in the README in the Python Notebook folder.
   
4. Features were selected using the R VSURF libary, R Studio version 4.3.1 is recommended
   to explore this code. More detail in the README in the R Code folder.

## Usage

Run the notebooks per the instructions found with the associated README.

You can also view the full analysis report here: https://github.com/Brandt-DSTI/Computer_Vision_ISIC_2024/blob/main/Docs%2C%20Report/DL%20Project%20report_v.1.pdf

## Features

Feature Analysis: VSURF analysis of features
Model Analysis: AUC, F1 and modified pAUC score to predict competition performance
Modeling: Implement computer vision models to predict if a skin lesion is benign or malignent

## Project Structure
```
/Breast_Cancer_Survival-Analysis/
├── R/                       # R code and scripts for analysis
├── Report/                  # Summarised analysis of project
├── data/                    # Raw data
├── docs/                    # HTML and markdown of scripts
├── .Rprofile                # To load packages
├── README.md                # Project overview and instructions
└── renv.lock                # Lockfile for package dependencies
```
## Contributing 

Contributions are welcome! Please open an issue or submit a pull request.

1. Fork the project.
2. Create your feature branch (git checkout -b feature/AmazingFeature).
3. Commit your changes (git commit -m 'Add some AmazingFeature').
4. Push to the branch (git push origin feature/AmazingFeature).
5. Open a pull request.

See CONTRIBUTING.md for more details.

## License

Distributed under the MIT License. See LICENSE for more information.

Acknowledgements

Thanks to DSTI for providing the educational environment that inspired this project.
https://www.datasciencetech.institute/

Uses the survival, survminer, ggplot2, and other R packages.    

Contact

Brandt-DSTI - brandt.olson@edu.dsti.institute

Project Link: https://github.com/Brandt-DSTI/Breast_Cancer_Survival-Analysis
