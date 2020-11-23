---
title: Setup
---

## Overview

This page will guide you through the setup for the Geospatial Data Carpentry workshop capstone
project.

If you have not completed the workshop setup, you should do that before starting the capstone setup.
Visit the [Setup Page](https://uw-madison-datascience.github.io/geospatial-workshop/setup.html) of
the full workshop to install the necessary software.

## Data

The capstone project uses data from the U.S. Department of Agriculture Natural Resources
Conservation Service (NRCS).
[Click here to visit the NRCS Geospatial Data Gateway](https://gdg.sc.egov.usda.gov/GDGOrder.aspx).

The gateway uses 5 steps to request data:

1. Where
2. What
3. How
4. Who
5. Review

On the **WHERE** tab, set the method for selecting the order area to `Order by State` by clicking the link just below the word WHERE. Then select Wisconsin from the dropdown.

On the **WHAT** tab, scroll down to the Climate Precipitation section and check the box next to
`1971-2000 Annual Average Precipitation by State`. 
Next scroll down to the Climate Temperature section and check the box next to
`1971-2000 Annual Average Maximum Temperature by State`. Click Continue.

On the **HOW** tab, select `ESRI Shapefile` from the dropdown in the format section.
Next, select `Geographic WGS84` from the dropdown in the projection section.

On the **WHO** tab, enter your e-mail address. This is how the data will be delivered to you.

The **REVIEW** tab will allow you to review your order.

The data should be delivered to your inbox in about 5 minutes or less.
Download the files by clicking the links in the e-mail.

The data will download as a  compressed (`.zip`) file. 
Expand/unzip this file and
move the contents into the data directory of your GeospatialCarp project.

## Other data

Other data used in the capstone project will be downloaded using R scripts.
This data includes the BIOCLIM dataset.
You can read more about the BIOCLIM dataset
[here](https://rdrr.io/cran/dismo/man/bioclim.html). 

{% include links.md %}
