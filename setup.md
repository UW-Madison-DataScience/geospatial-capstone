---
title: Setup
---

## Overview

This page will guide you through the setup for the Geospatial Data Carpentry workshop capstone
project.

> ## Callout Title
>
> If you have not completed the workshop setup, you should do that before starting the capstone setup.
> Visit the [Setup Page](https://uw-madison-datascience.github.io/geospatial-workshop/setup.html) of
> the [full workshop website]() to install the necessary software.
> {: .source}
{: .prereq}

## Data

You can chose to use your own data or download and use sample data for this workshop.
Sample data includes climate data to complement the environmental data used in the main workshop.
If you use your own data, there are some criteria to
help you succeed in completing the learning objectives.

### Capstone Data

The capstone project uses data from the U.S. Department of Agriculture Natural Resources
Conservation Service (NRCS).
[Click here to visit the NRCS Geospatial Data Gateway](https://gdg.sc.egov.usda.gov/GDGOrder.aspx?order=QuickState).

The gateway guides you through 5 steps to request data:

1. Where
2. What
3. How
4. Who
5. Review

On the **WHERE** tab, select Wisconsin from the dropdown.

If you are asked to select counties,
change the method for selecting the order area to `Order by State` by 
clicking the link just below the word WHERE.

Click `CONTINUE`.

On the **WHAT** tab, find the *Climate Precipitation* section and check the box next to
`1971-2000 Annual Average Precipitation by State`.

Next, find the *Climate Temperature* section and check the box next to
`1971-2000 Annual Average Maximum Temperature by State`.

Click `CONTINUE`.

On the **HOW** tab, select `ESRI Shape` from the dropdown in the *format* section.
Next, select `Geographic WGS84` from the dropdown in the *projection* section.

Click `CONTINUE`.

On the **WHO** tab, enter your e-mail address. This is how the data will be delivered to you.

Click `CONTINUE`.

The **REVIEW** tab will allow you to review your order.

Click `PLACE ORDER`.

The data should be delivered to your inbox in about 5 minutes or less.
Download the files by clicking the links in the e-mail.

The data will download as a  compressed `.zip` file. 
Expand/unzip this file and
move the contents into the data directory of your GeospatialCarp project.

[//]: # (Are they creating a separate project for this??)

Other data used in the capstone project will be downloaded using R scripts.
This data includes the BIOCLIM dataset.
You can read more about the BIOCLIM dataset
[here](https://rdrr.io/cran/dismo/man/bioclim.html). 

## Using your own data

If you chose your own data for this workshop, the data should meet these criteria:

* You should be familiar with the data, how it's formatted, and what the variables and values mean.

* The data should be geospatial and a vector format.

[//]: # (Can they use their own raster too?)


### Places to find data?

* [Geodata@Wisconsin](https://geodata.wisc.edu/)
* [BTAA Geoportal](https://geo.btaa.org/)
*  


{% include links.md %}
