## CS-Studio JLab Product [![Build Status](https://travis-ci.org/wmoore28/org.csstudio.jlab.product.svg?branch=master)](https://travis-ci.org/wmoore28/org.csstudio.jlab.product)

JLab-specific configuration for CS-Studio

Directory Structure:
The top level maven project for your product
```
|----[+]  features: The features module for all your site specific features.
|      |---- The feature containing the customization and configuration files.
|      |---- (optional) Additional features to be included in your product
|----[+]  (optional) plugins: The plugins module will contain all your site specific plugins.
|
|----[+] repository: The repository module which contains product definition file
```
