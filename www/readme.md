---
title: "Assets comparison readme"
author: "CX"
date: "September 21, 2014"
output: html_document
---

This app uses quantmod to grab financial data and displays the corresponding charts. Your input should be the symbol for the asset, for example, 'GOOG' for 'Google'. You can choose a source to grab your data, however, if the source does not have your required data, you will get an error. In the case when two assets are specified, if their price are within a certain range of each other, they will be plotted together, otherwise they will be plotted separately. 
