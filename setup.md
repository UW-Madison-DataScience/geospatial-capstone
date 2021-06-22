---
title: Setup
---

## Overview

This page will guide you through the setup for the Geospatial Data Carpentry workshop capstone
project.

> ## Prerequisite
>
> Software and packages used in this capstone are installed for the main workshop.
> Visit the [Setup Page](https://uw-madison-datascience.github.io/geospatial-workshop/setup.html) of
> the [full workshop website](https://uw-madison-datascience.github.io/geospatial-workshop/) to install the necessary
> software before continuing.
{: .prereq}

## Set up a new project to store capstone code and data

The main workshop has you create a project called GeospatialCarp.
For the capstone, you will create a second project called GeospatialCapstone.

Open RStudio. Click File and then New Project.

Next click New Directory and then New Project.

Name the directory GeospatialCapstone and save it to your desktop or another convenient location.

Move the `data` folder you downloaded as part of the setup into the Geospatial Capstone direcotry.

Create a second directory within the Geospatial Capstone directory called `reports`.
This is where you will store rmd files.

## Data

Capstone data includes climate data to complement the environmental data used in the main workshop. If you would prefer to use your own data for the capstone, see the next section.

You can download the capstone data by clicking [this download link](https://github.com/UW-Madison-DataScience/geospatial-capstone/blob/main/data/capstone-data.zip).
The file approximately 2MB.

The data will download as a single compressed `.zip` file.
Expand/unzip this file so that the data folder is within your `capstone` directory.

For a full description of the data used in this workshop see the [data page](data).

Other data used in the capstone project will be downloaded using R scripts.
This data includes the BIOCLIM dataset.

You can read more about the BIOCLIM dataset
[here](https://rdrr.io/cran/dismo/man/bioclim.html). 

## Using your own data

Advanced participants can replace some or all of the capstone data with their own data. Below are some tips for success:

* Be familiar with the data, its formatting, and what variables and values mean.

* All data should have the same or similar geographic extents. If you plan to use a mix capstone data with your data, your data should cover Wisconsin.

* Data should be georeferenced and projected.

* At least two raster variables are needed for raster math exercises. 

* Continuous or surface raster data work the best. Classified data such as land use or land cover data will make it difficult to follow along.

* Vector data should include one point dataset and one polygon dataset.

* Raster data should be in GeoTIFF format and vector data should be in Shapefile format.

### Places to find data?

* [Geodata@Wisconsin](https://geodata.wisc.edu/)

* [BTAA Geoportal](https://geo.btaa.org/)

* [Natural Earth Data](https://www.naturalearthdata.com/)

{% include links.md %}
