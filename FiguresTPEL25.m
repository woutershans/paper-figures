% Author: Hans Wouters, KU Leuven

close all; clear;
colorsNORM = ["#505150", "#FF5050", "#77C8A6", "#42ACC6", "#588DCA", "#897AFA", "#9A9CA1", "#E0CD44"];
colorsPAST = ["#BFBFBF", "#FF9C9C", "#BEEBD8", "#9BD9E9", "#88ABCC", "#C7BDF9", "#C6C9CF", "#ECE18E"];
colorsDARK = ["#000000", "#992F2F", "#417C61", "#3C7A84", "#3D618A", "#545096", "#000000", "#9A8B1A"];
colorsPALE = ["#E9E9E9", "#FFDDDD", "#E8F8F2", "#DCF2F8", "#D6E2ED", "#ECE8FD", "#000000", "#F5EFC1"];

% Custom color map for contour plots
color1 = hex2rgb(char("#6D8096"));   % First color
color2 = hex2rgb(char("#ABB7C2"));   % Second color
color3 = hex2rgb(char("#D6C6C6"));   % Third color
color4 = hex2rgb(char("#D5A9A9"));   % Fourth color
nColors = 256;  % Total number of colors in the colormap
nSegment1 = floor(nColors / 3);      % From color1 to color2
nSegment2 = floor(nColors / 3);      % From color2 to color3
nSegment3 = nColors - (nSegment1 + nSegment2);  % From color3 to color4
cmap1 = [linspace(color1(1), color2(1), nSegment1)', linspace(color1(2), color2(2), nSegment1)', linspace(color1(3), color2(3), nSegment1)'];
cmap2 = [linspace(color2(1), color3(1), nSegment2)', linspace(color2(2), color3(2), nSegment2)', linspace(color2(3), color3(3), nSegment2)'];
cmap3 = [linspace(color3(1), color4(1), nSegment3)', linspace(color3(2), color4(2), nSegment3)', linspace(color3(3), color4(3), nSegment3)'];
cmap_cont = [cmap1; cmap2; cmap3];


%% Plot publications power vs frequency vs years.
plotFig1 = false;
if plotFig1 == true

pw = [30000 3300 2200 1800 4000 22000 16500 11000 3500 200 3500 3500 400 120 4800 662 540 100000 30000 30000 2000 2000 480 200 3000 800 6600 6000 2000 660 640 1000 200 200 700 6000 6600 1800 3700 970 11000 2000 500 2000 1000 320 700 144 25 1000 500 20 12 12500 3300 400 350 1200 750 6600 3000 3000 400 400 10000 700 6600 80 3000 650 8000 7500 12500 6600 3000 3000 1000 900 300 100 500 300 500 12500 210 1000 120 100 2000 500 500 1000 1000 800 100 150 1000 1000 150 3300 3300 350 2000 3000 100 700 700 1000 700 1440 300 1000 100 80 120 960 60 120 84 1200 220 1000];
fr = [100 100 100 100 200 250 250 250 300 350 360 500 500 500 800 922 1000 50 100 100 300 300 300 350 360 417 500 500 500 500 600 1000 1000 100 1000 20 60 75 150 400 500 500 500 600 600 600 1000 250 275 100 50 100 270 500 500 500 800 1000 1200 55 250 700 700 700 1000 1000 500 100 200 250 300 300 500 500 500 1000 1000 1000 1000 1000 100 110 165 500 560 1000 1000 1000 100 175 200 325 360 1000 100 156 1000 1000 60 500 80 105 165 200 300 800 800 50 800 100 120 150 185 200 100 875 200 750 100 174 500 60];
yr = [2024 2024 2024 2024 2024 2024 2024 2024 2024 2024 2024 2024 2024 2024 2024 2024 2024 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2021 2021 2021 2021 2021 2021 2021 2021 2021 2020 2020 2020 2020 2020 2020 2020 2020 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2018 2018 2018 2018 2018 2018 2018 2018 2017 2017 2017 2017 2017 2017 2016 2016 2016 2016 2015 2015 2014 2013 2013 2013 2013 2012 2012 2011 2010 2008 2008 2008 2008 2008 2007 2007 2005 2004 2002 2002 1999 1997];
lb = {'Other', 'Automotive', 'Automotive', 'Other', 'Automotive', 'Automotive', 'Automotive', 'Automotive', 'Other', 'ICT', 'Other', 'Other', 'Consumer electronics', 'ICT', 'Automotive', 'ICT', 'ICT', 'Automotive', 'Automotive', 'Other', 'Other', 'Other', 'ICT', 'Other', 'ICT', 'ICT', 'Automotive', 'ICT', 'Automotive', 'ICT', 'ICT', 'ICT', 'Other', 'Automotive', 'ICT', 'Other', 'Automotive', 'Other', 'Automotive', 'Automotive', 'Automotive', 'Automotive', 'ICT', 'Automotive', 'Other', 'ICT', 'ICT', 'ICT', 'Other', 'Other', 'Other', 'Other', 'Other', 'Automotive', 'Automotive', 'Other', 'Consumer electronics', 'Other', 'Other', 'Automotive', 'Automotive', 'Other', 'Other', 'Other', 'Automotive', 'Automotive', 'Automotive', 'Other', 'Automotive', 'ICT', 'Automotive', 'Automotive', 'Automotive', 'Automotive', 'ICT', 'ICT', 'ICT', 'ICT', 'Consumer electronics', 'Other', 'Other', 'Other', 'Other', 'Automotive', 'ICT', 'ICT', 'ICT', 'Other', 'Automotive', 'Automotive', 'Other', 'Automotive', 'ICT', 'ICT', 'Automotive', 'Other', 'ICT', 'ICT', 'Consumer electronics', 'Automotive', 'Automotive', 'Other', 'Other', 'Automotive', 'Consumer electronics', 'ICT', 'ICT', 'Other', 'ICT', 'Other', 'Other', 'Other', 'Other', 'Consumer electronics', 'Other', 'Other', 'ICT', 'ICT', 'ICT', 'Other', 'Other', 'Other'};

Col1 = hex2rgb("#D5A9A9");
Col2 = hex2rgb("#6D8096");

uniqueYears = unique(yr);
numYears = length(uniqueYears);
colorMap = zeros(numYears, 3);
for i=1:numYears
    colorMap(i, :) = interp1([1, numYears], [Col1; Col2], i);
end
colors = zeros(length(yr), 3);
for i=1:length(yr)
    [~, yearIndex] = ismember(yr(i), uniqueYears);  % Assign a color to each year
    colors(i, :) = colorMap(yearIndex, :);
end

fig = figure('units','centimeters','position',[[15 15] [18 9]]); hold on;
h(1) = scatter(nan, nan, 40, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPALE(1), 'LineWidth', 0.5);    
h(2) = scatter(nan, nan, 40, '^', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPALE(1), 'LineWidth', 0.5);
h(3) = scatter(nan, nan, 40, 'd', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPALE(1), 'LineWidth', 0.5);
h(4) = scatter(nan, nan, 40, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPALE(1), 'LineWidth', 0.5);
legend(h, 'Automotive', 'ICT', 'Consumer electr.', 'Other', 'Location', 'SouthWest', 'AutoUpdate', 'off');
for i = 1:1:length(yr)
    switch lb{i}
        case 'Automotive'
            marker = 'o';
        case 'ICT'
            marker = '^';
        case 'Consumer electronics'
            marker = 'd';
         case 'Other'
            marker = 's';
        otherwise
            marker = 'x';
    end
    scatter(fr(i), pw(i), 40, marker, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colors(i, :), 'LineWidth', 0.5);    
end
colorbar; colormap(colorMap); caxis([min(uniqueYears) max(uniqueYears)]); % Colorbar, map, with custom limits
xlabel('Frequency (kHz)'); ylabel('Power (W)');
xlim([10 1.5e3]); ylim([10 40000]);
grid on; box on;
ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
ax.XScale = 'log'; ax.YScale = 'log';
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
%figName = "po_fr_yr_lb-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
%figName = "po_fr_yr_lb-rw.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);
end


%% Plot publications freq vs Lk vs method vs power.
plotFig2 = false;
if plotFig2 == true

pw = [4000 30000 30000 30000 22000 16500 11000 6600 6600 6600 6600 6000 6000 5000 4800 4000 3700 3500 3500 3500 3300 3300 3300 3000 3000 3000 3000 2000 2000 2000 2000 2000 2000 2000 1800 1800 1440 1200 1200 1000 1000 1000 1000 1000 1000 1000 970 960 800 750 700 700 700 700 700 662 500 500 500 500 480 400 400 400 400 350 350 300 300 300 220 210 200 150 150 144 120 120 100 100 100 100 80 25 20 12];
fpFP = [500 100 100 100 250 250 250 500 500 60 55 500 20 1 800 200 150 500 360 300 500 500 80 1000 250 360 500 100 500 500 300 300 165 600 100 75 100 175 1000 360 60 1000 1000 600 50 100 400 875 1000 1200 1000 1000 800 800 1000 922 100 200 500 165 300 700 700 500 500 105 800 1000 120 110 500 560 350 60 156 240 100 500 300 1000 1000 100 100 275 100 270];
Lk = [1.7 2.7 3.8 12 8.8 2.45 4.1 1.9 7.3 60 75 3 104 185 1.6 4.2 40 2.5 3.97 4.1 3 4.8 50 2.5 2.1 1.75 220 9 4.7 2.4 0.36 0.34 72 4.5 38.89 38.3 21.7 14 10.6 3.3 19 0.216 0.2 2 0.9 82 2.5 1.8 0.312 0.13 10 0.1 0.025 0.025 0.1 1.4 20 23 0.42 34 16.05 0.4 0.37 0.12 9 35 5.9 4.9 56 15 15 1.7 2.2 4.4 4 2.05 200 12.6 100 4.3 3.5 250 3.75 9 18.7 40];
lb = {'imbalance', 'chamber', 'combined', 'shunt', 'combined', 'combined', 'combined', 'combined', 'imbalance', 'shunt', 'split', 'imbalance', 'shunt', 'shunt', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'chamber', 'chamber', 'combined', 'combined', 'combined', 'imbalance', 'matrix', 'chamber', 'combined', 'combined', 'combined', 'combined', 'combined', 'imbalance', 'matrix', 'shunt', 'combined', 'combined', 'split', 'combined', 'combined', 'matrix', 'matrix', 'combined', 'combined', 'shunt', 'imbalance', 'shunt', 'matrix', 'combined', 'chamber', 'combined', 'matrix', 'matrix', 'matrix', 'combined', 'combined', 'split', 'matrix', 'split', 'matrix', 'combined', 'combined', 'combined', 'combined', 'chamber', 'imbalance', 'chamber', 'chamber', 'matrix', 'shunt', 'combined', 'matrix', 'combined', 'split', 'matrix', 'chamber', 'shunt', 'chamber', 'shunt', 'shunt', 'split', 'combined', 'shunt', 'shunt', 'shunt'};

fig = figure('units','centimeters','position',[[15 2] [18 9]]); hold on;
h(1) = scatter(nan, nan, 40, 'v', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(2), 'LineWidth', 0.5);    
h(2) = scatter(nan, nan, 40, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(1), 'LineWidth', 0.5);
h(3) = scatter(nan, nan, 40, 'd', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(8), 'LineWidth', 0.5);
h(4) = scatter(nan, nan, 40, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(5), 'LineWidth', 0.5);
h(4) = scatter(nan, nan, 40, '^', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsNORM(3), 'LineWidth', 0.5);
legend({'Chamber', 'Stacked', 'Shunt', 'Imbalance' 'Split'}, 'Location', 'SouthWest', 'AutoUpdate', 'off');
for i = 1:1:length(lb)
    switch lb{i}
        case 'chamber'
            scatter(fpFP(i), Lk(i), 40, 'v', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(2), 'LineWidth', 0.75);
        case 'combined'
            scatter(fpFP(i), Lk(i), 40, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(1), 'LineWidth', 0.75);
        case 'shunt'
            scatter(fpFP(i), Lk(i), 40, 'd', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(8), 'LineWidth', 0.75);
        case 'imbalance'
            scatter(fpFP(i), Lk(i), 40, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(5), 'LineWidth', 0.75);
        case 'split'
            scatter(fpFP(i), Lk(i), 40, '^', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsNORM(3), 'LineWidth', 0.75);
    end
end
xlabel('Frequency (kHz)'); ylabel('Integrated Series Inductance (µH)');
xlim([15 1.3e3]); ylim([0.08 350]);
grid on; box on;
ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
ax.XScale = 'log'; ax.YScale = 'log';
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
%figName = "method_comp-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
%figName = "method_comp-rw.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);
end


%% Plot publications PD vs freq vs method
plotFig3 = false;
if plotFig3 == true

pdFP = [55.4 58.8 108.5 81.5 50.0 78.1 133.3 85.5 85.5 51.4 53.9 17.2 20.4 75.7 12.1 146.7 13.3 5.1 5.1 63.2 88.6 145.5 132.0 85.4 15.0 161.8 85.7 166.7 183.3 2.2 8.3 9.6 81.4 5.5];
fpFP = 1e-2.*[5952 357 645 785 800 1280 2250 2340 2340 7200 1225 2325 3240 4624 5806 7500 7524 68000 68000 1536 2257 4536 5000 7728 20000 6800 7000 7500 9000 1120 1200 1250 8112 21912];
lbFP = {'chamber', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'shunt', 'shunt', 'shunt', 'shunt', 'split'};

pdVO = [26.4 44.8 187.4 155.0 39.2 85.5 75.3 48.8 23.3 51.4 5.0 28.6 53.9 21.5 23.8 10.0 47.9 11.1 30.5 30.5 73.3 15.5 36.5 38.5 48.9 48.5 15.0 28.5 95.2 89.9 101.9 47.6 1.8 1.9 8.3 3.3 18.1 10.1 1.1];
voVO = 1e-3.*[124992 670000 3414 4516 5358 23400 39825 40950 42944 72000 80624 231075 12250 18600 27864 69672 73059 90288 114709 114709 150000 1933000 26573 51911 135000 136080 200000 231840 63000 122400 162000 262500 10900 13440 14475 30000 365040 595000 1139424];
lbVO = {'chamber', 'chamber', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'shunt', 'shunt', 'shunt', 'shunt', 'shunt', 'shunt', 'split'};

fig = figure('units','centimeters','position',[[15 2] [18 8]]); hold on;
subplot(1,2,1); hold on;
h(1) = scatter(nan, nan, 40, 'v', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(2), 'LineWidth', 0.5);    
h(2) = scatter(nan, nan, 40, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(1), 'LineWidth', 0.5);
h(3) = scatter(nan, nan, 40, 'd', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(8), 'LineWidth', 0.5);
h(4) = scatter(nan, nan, 40, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(5), 'LineWidth', 0.5);
h(4) = scatter(nan, nan, 40, '^', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsNORM(3), 'LineWidth', 0.5);
%legend({'Chamber', 'Stacked', 'Shunt', 'Imbalance' 'Split'}, 'Location', 'NorthWest', 'AutoUpdate', 'off');
for i = 1:1:length(lbFP)
    switch lbFP{i}
        case 'chamber'
            scatter(fpFP(i), pdFP(i), 40, 'v', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(2), 'LineWidth', 0.75);
        case 'combined'
            scatter(fpFP(i), pdFP(i), 40, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(1), 'LineWidth', 0.75);
        case 'shunt'
            scatter(fpFP(i), pdFP(i), 40, 'd', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(8), 'LineWidth', 0.75);
        case 'imbalance'
            scatter(fpFP(i), pdFP(i), 40, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(5), 'LineWidth', 0.75);
        case 'split'
            scatter(fpFP(i), pdFP(i), 40, '^', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsNORM(3), 'LineWidth', 0.75);
    end
end
xlabel('Footprint (cm²)'); ylabel('Power Density (W/cm²)');
%xlim([0.3 70]);
ylim([0 200]);
set(gca,"XTick", [1 10 100 1e3 10e3]); set(gca,"YTick",[50 100 150 200]); 
grid on; box on; grid(gca,'minor')
ax1 = gca; ax1.GridLineStyle = ':'; ax1.GridColor = 'k'; ax1.GridAlpha = 1; ax1.XScale = 'log';

subplot(1,2,2); hold on;
for i = 1:1:length(lbVO)
    switch lbVO{i}
        case 'chamber'
            scatter(voVO(i), pdVO(i), 40, 'v', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(2), 'LineWidth', 0.75);
        case 'combined'
            scatter(voVO(i), pdVO(i), 40, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(1), 'LineWidth', 0.75);
        case 'shunt'
            scatter(voVO(i), pdVO(i), 40, 'd', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(8), 'LineWidth', 0.75);
        case 'imbalance'
            scatter(voVO(i), pdVO(i), 40, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(5), 'LineWidth', 0.75);
        case 'split'
            scatter(voVO(i), pdVO(i), 40, '^', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsNORM(3), 'LineWidth', 0.75);
    end
end
xlabel('Volume (cm³)'); ylabel('Power Density (W/cm³)');
%xlim([0 1.2e7]);
ylim([0 200]);
set(gca,"XTick", [1 10 100 1e3 10e3]); set(gca,"YTick",[50 100 150 200]); 
grid on; box on; grid(gca,'minor')
ax2 = gca; ax2.GridLineStyle = ':'; ax2.GridColor = 'k'; ax2.GridAlpha = 1; ax2.XScale = 'log';

set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
%figName = "methods_PD-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
%figName = "methods_PD-rw.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);
end


%% Plot no. of publications
plotFig4 = false;
if plotFig4 == true

yr1 = [2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2012 2012 2012 2012 2012 2012 2012 2012 2012 2012 2012 2012 2011 2011 2011 2011 2011 2011 2011 2011 2011 2011 2010 2010 2010 2010 2010 2010 2010 2009 2009 2009 2009 2009 2009 2008 2008 2008 2008 2008 2008 2008 2008 2008 2008 2008 2007 2007 2007 2007 2007 2007 2006 2006 2006 2006 2006 2006 2006 2005 2005 2005 2005 2005 2005 2005 2005 2005 2005 2005 2004 2004 2004 2004 2004 2004 2004 2004 2004 2004 2004 2003 2003 2003 2003 2002 2002 2002 2001 2001 2000 2000 2000 1999 1999 1997 1997 1997 1997 1996 1996 1994 1993 1993 1993 1991 1987 1987 1986 1984 1983 1980];
yr2 = [2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2018 2018 2018 2018 2018 2018 2018 2017 2017 2017 2017 2017 2017 2016 2016 2016 2016 2015 2015 2014 2014 2014 2013 2013 2013 2013 2013 2013 2013 2012 2012 2011 2011 2011 2010 2008 2008 2008 2008 2008 2007 2007 2005 2004 2003 2002 2002 2001 2000 1999 1997];

uniqueYr1 = unique(yr1);
uniqueYr2 = unique(yr2);
count1 = zeros(length(uniqueYr1), 1);
for i = 1:length(yr1)
    yearIndex = find(yr1(i) == uniqueYr1);  % Count the number of times each year appears
    count1(yearIndex) = count1(yearIndex) + 1;
end
count2 = zeros(length(uniqueYr2), 1);
for i = 1:length(yr2)
    yearIndex = find(yr2(i) == uniqueYr2);
    count2(yearIndex) = count2(yearIndex) + 1;
end

ft = fittype('smoothingspline');
options = fitoptions(ft);
options.SmoothingParam = 0.25; % Smoothness between 0 and 1
[curveFit, ~] = fit(uniqueYr1', count1, ft, options); % Fit a smoother spline to the data
fittedCounts = feval(curveFit, uniqueYr1);  % Evaluate the fitted spline

fig = figure('units','centimeters','position',[[4 4] [18 8]]); hold on;
bh1 = bar(uniqueYr1, count1);
bh2 = bar(uniqueYr2, count2);
set(bh1, 'FaceColor', 'Flat'); bh1(1).CData = hex2rgb(colorsDARK(5));
set(bh2, 'FaceColor', 'Flat'); bh2(1).CData = hex2rgb(colorsPAST(5));
%plot(uniqueYr1, fittedCounts, '--', 'color', colorsPAST(5), 'LineWidth', 1.5); % Add the fitted line plot
xlim([1990 2024]);
xlabel('Publication Year'); ylabel('Number of Publications');
legend({'Screened Corpus', 'Qualified Studies'}, 'Orientation', 'vertical', 'Location','northwest');
grid on; box on; grid(gca,'minor')
ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
%figName = "publ_yr-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
%figName = "publ_yr-rw.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);
end


%% Plot publications vs year vs category 
plotFig4 = false;
if plotFig4 == true

yr = [2020 2018 2021 2023 2022 2018 2021 2023 2022 2011 2019 2023 2023 2019 2022 2022 2023 2022 2017 2020 2022 2023 2017 2022 2019 2023 2023 1999 2023 2023 2023 2023 2021 2022 2021 2002 2022 2021 2022 2018 2019 2020 2023 2023 2020 2004 2020 2021 2007 2022 2017 2015 2017 2021 2017 2021 2019 2016 2019 2019 2023 2022 2022 2002 2018 2019 2008 2022 2019 2019 2021 2015 2013 2019 2018 2020 2018 2014 2013 2019 2013 2013 2012 2012 2022 2016 2023 2021 2021 1997 2008 2018 2010 2008 2020 2022 2001 2008 2019 2000 2008 2007 2017 2016 2005 2020];
lb = {'Automotive', 'IT & telecom', 'Other', 'IT & telecom', 'Automotive', 'Automotive', 'Automotive', 'Automotive', 'Automotive', 'Other', 'IT & telecom', 'IT & telecom', 'IT & telecom', 'IT & telecom', 'IT & telecom', 'Other', 'IT & telecom', 'Automotive', 'Automotive', 'Automotive', 'Other', 'Automotive', 'IT & telecom', 'Other', 'IT & telecom', 'Other', 'Other', 'Other', 'IT & telecom', 'IT & telecom', 'IT & telecom', 'Other', 'Automotive', 'Other', 'Consumer electr.', 'IT & telecom', 'Automotive', 'Other', 'Automotive', 'Other', 'Other', 'Automotive', 'Automotive', 'Other', 'Automotive', 'IT & telecom', 'Other', 'Other', 'Other', 'IT & telecom', 'Other', 'Consumer electr.', 'Automotive', 'Other', 'Automotive', 'Automotive', 'Automotive', 'IT & telecom', 'Automotive', 'Automotive', 'Automotive', 'Other', 'Other', 'Other', 'Other', 'Consumer electr.', 'Other', 'IT & telecom', 'Automotive', 'Other', 'Other', 'Automotive', 'Other', 'IT & telecom', 'Other', 'Other', 'IT & telecom', 'Automotive', 'Other', 'Other', 'Consumer electr.', 'Automotive', 'IT & telecom', 'IT & telecom', 'Other', 'Automotive', 'Automotive', 'Automotive', 'Other', 'Other', 'Other', 'Other', 'IT & telecom', 'Other', 'Automotive', 'IT & telecom', 'Other', 'Consumer electr.', 'IT & telecom', 'Other', 'Other', 'Other', 'Other', 'Other', 'IT & telecom', 'Other'};

uniqueLabels = unique(lb);
count1 = zeros(length(unique(yr)), length(uniqueLabels));
for i = 1:length(yr)
    for j = 1:length(uniqueLabels)
        if strcmp(lb{i}, uniqueLabels{j})
            yearIndex = find(yr(i) == unique(yr));
            count1(yearIndex,j) = count1(yearIndex,j) + 1; % Count the number of times each label appears in the list
        end
    end
end

fig = figure('units','centimeters','position',[[2 2] [8 8]]); hold on;
b0 = bar(unique(yr), count1, 'stacked');
legend(uniqueLabels, 'Orientation', 'vertical','Location','northwest');
set(b0, 'FaceColor', 'Flat')
b0(1).CData = hex2rgb(colorsDARK(5));
b0(2).CData = hex2rgb(colorsNORM(5));
b0(3).CData = hex2rgb(colorsPAST(5));
b0(4).CData = hex2rgb(colorsPALE(5));
xlabel('Publication year'); ylabel('Number of publications');
ylim([0 20]);
grid on; box on; grid(gca,'minor')
ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
%figName = "incl_publ_yr_lb-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
%figName = "incl_publ_yr_lb-rw.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);

end


%% Plot publications Sankey diagram (obsolete).
plotFig5 = false;
if plotFig5 == true
    
fig = figure('units','centimeters','position',[[8 8] [15 5]]); hold on;
links={'aca', 'l1', 23;    'aca', 'l2',   78;
       'ind', 'l1', 5 ;    'ind', 'l2',   23;
       'evs', 'l2', 4 ;    'evs', 'l3',   1 ;
       'l1',  'Si', 10;    'l1',  'SiC',  9 ; 'l1', 'GaN', 9 ;
       'l2',  'Si', 18;    'l2',  'SiC',  60; 'l2', 'GaN', 27; 'l3', 'Si', 1 ;
       'Si',  '400V', 29;  'SiC', '400V', 51;
       'SiC', '800V', 18;  'GaN', '800V', 1;
       'GaN', '400V', 35;};
SK=SSankey(links(:,1),links(:,2),links(:,3));  % Create a Sankey diagram object
SK.NodeList={'aca', 'ind', 'evs', 'l1','l2','l3','Si','SiC','GaN','400V','800V'};  % Modify node arrangement order and plot
SK.Sep=.1; SK.draw()
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
%figName = "sankey-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
%figName = "sankey-rw.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);
end


%% Plot converter loss distribution boxplot.
plotFig6 = false;
if plotFig6 == true

categories = {'Conduction', 'Switching', 'Driving', 'Magnetics', 'Other'};
avg_values = 100.*[0.28, 0.15, 0.06, 0.39, 0.13];
min_values = 100.*[0.16, 0.03, 0.01, 0.16, 0.01];
max_values = 100.*[0.39, 0.36, 0.18, 0.69, 0.50];
lower_errors = avg_values - min_values;
upper_errors = max_values - avg_values;
errors = [lower_errors; upper_errors];

fig = figure('units','centimeters','position',[[8 8] [8 8]]); hold on;
b0 = bar(avg_values, 'FaceColor', hex2rgb(colorsDARK(5)));  % bars
errorbar(1:numel(categories), avg_values, lower_errors, upper_errors, 'k', 'linestyle', 'none');  % error bars
ylabel('Relative Losses (%)'); set(gca, 'XTickLabel', categories, 'XTick', 1:numel(categories));
ylim([0 max(max_values)*1.05]);
grid on; box on; grid(gca,'minor');
ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
legend({'Average', 'Range'}, 'Orientation', 'vertical', 'Location', 'northwest');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
%figName = "lossbar-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
%figName = "lossbar-rw.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);
end


%% Plot publications input voltage vs output voltage vs power vs label.
plotFig7 = false;
if plotFig7 == true

Vi = [200 125 200 350 200 480 400 400 400 200 400 400 350 380 280 400 400 400 800 600 800 800 800 800 48 400 260 400 290 48 48 48 48 38 60 400 240 48 380 48 48 48 360 380 270 60 36 380 60 400 400 650 400 400 400 60 400 400 400 1000 30 20 50 85 48 380 380 380 200 16 390 290 180 400 400 430 380 390 390 48 270 400 40 270 380 150 400 200 700 700 230 400 600];
Vo = [24 26 12 12 48 48 400 400 400 48 15 400 350 380 400 400 400 400 800 800 800 400 800 800 2 105 400 24 20 2 1 1 1 2 2 24 10 2 12 12 12 12 48 12 45 2 12 12 12 48 48 50 48 50 48 360 120 48 50 750 50 20 5 24 3 48 48 24 24 280 12 36 24 20 48 48 12 12 12 200 48 48 200 28 48 50 360 11 28 28 48 400 600];
Po = [100 200 500 700 970 1000 2000 2000 2000 2000 3000 3000 3300 3300 3300 6600 6600 6600 6600 10000 11000 12500 12500 12500 80 100 150 300 350 60 84 120 120 144 320 480 500 640 650 700 700 700 700 800 800 900 1000 1000 1000 1000 1000 3000 3000 3000 6000 150 1000 1200 1200 125000 12 20 25 80 100 100 100 120 200 220 300 300 350 400 400 400 500 500 500 500 750 960 1000 1000 1000 1000 1440 1800 2000 2000 2000 6000 30000];
lb = ["Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Automotive", "Consumer electr.", "Consumer electr.", "Consumer electr.", "Consumer electr.", "Consumer electr.", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "IT & telecom", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other", "Other"];

Col1 = hex2rgb(colorsDARK(5)); Col2 = hex2rgb(colorsPALE(2));  % Create a custom color map
uniqueYears = unique(Po);
numYears = length(uniqueYears);
colorMap = zeros(numYears, 3);
for i=1:numYears
    colorMap(i, :) = interp1([1, numYears], [Col1; Col2], i);
end
colors = zeros(length(Po), 3);
for i=1:length(Po)
    [~, yearIndex] = ismember(Po(i), uniqueYears);  % Assign a color to each year
    colors(i, :) = colorMap(yearIndex, :);
end

fig = figure('units','centimeters','position',[[2 2] [15 8]]); hold on;
h(1) = scatter(nan, nan, 40, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPALE(1), 'LineWidth', 0.5);    
h(2) = scatter(nan, nan, 40, '^', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPALE(1), 'LineWidth', 0.5);
h(3) = scatter(nan, nan, 40, 'd', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPALE(1), 'LineWidth', 0.5);
h(4) = scatter(nan, nan, 40, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPALE(1), 'LineWidth', 0.5);
legend(h, 'Automotive', 'IT & telecom', 'Consumer electr.', 'Other', 'Location', 'southeast', 'AutoUpdate', 'off');
plot(1:500:2000, 1:500:2000, '--', 'Color', colorsPAST(1), 'LineWidth', 0.1);
for i = 1:1:length(Po)
    switch lb{i}
        case 'Automotive'
            marker = 'o';
        case 'IT & telecom'
            marker = '^';
        case 'Consumer electr.'
            marker = 'd';
         case 'Other'
            marker = 's';
        otherwise
            marker = 'x';
    end
    scatter(Vo(i), Vi(i), 40, marker, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colors(i, :), 'LineWidth', 0.5);    
end
colorbar; colormap(colorMap); caxis([min(uniqueYears) max(uniqueYears)]); % Colorbar, map, with custom limits
xlabel('Output Voltage (V)'); ylabel('Input Voltage (V)');
xlim([1 1500]);
ylim([1 1500]);
grid on; box on;
ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
ax.XScale = 'log'; ax.YScale = 'log';
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
%figName = "vi_vo_pw-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
%figName = "vi_vo_pw-rw.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);
end


%% Plot publications claimed decrease / increase KPIs in boxplot.
plotDeltas = false;
if plotDeltas == true

% Data
volume = [10, 11, 12, 16, 18, 19, 25, 25, 25, 30, 30, 40, 44, 56, 66, 7, 7, 70, 20, 70, 12, 30, 15, 30, 14, 37];
loss = [24, 25, 40, 20, 27, 14];
iron_loss = [21, 13, 30, 40, 10, 15, 35, 35];
%efficiency = [0.3, 1.3, 2, 3];

categories = {'Total Volume', 'Total Loss', 'Iron Loss'};
avg_values = [mean(volume), mean(loss), mean(iron_loss)];
min_values = [min(volume), min(loss), min(iron_loss)];
max_values = [max(volume), max(loss), max(iron_loss)];

lower_errors = avg_values - min_values;
upper_errors = max_values - avg_values;
errors = [lower_errors; upper_errors];


fig = figure('units','centimeters','position',[[8 8] [8 8]]); hold on;
b0 = bar(avg_values, 'FaceColor', hex2rgb(colorsDARK(5)));  % bars
errorbar(1:numel(categories), avg_values, lower_errors, upper_errors, 'k', 'linestyle', 'none');  % error bars
ylabel('Relative Decrease (%)'); set(gca, 'XTickLabel', categories, 'XTick', 1:numel(categories));
ylim([0 max(max_values)*1.05]);
grid on; box on; grid(gca,'minor');
ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
legend({'Average', 'Range'}, 'Orientation', 'vertical', 'Location', 'northeast');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
%figName = "deltabars-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
%figName = "deltabars-rw.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);

end


%% Plot publications claimed decrease / increase KPIs in 2-sided scatter-plot.
plotDecreases = false;
if plotDecreases == true

% Sample Data
volume = [16 19 11 25 25 0 25 25 0 3.6 3.6 0 30 30 25 0 0 0 40 44 30 5 50 54 56 6.3 0 7 7 70 20 70 12 30 0 0 0 0 0 15 35 14 37];
loss = [NaN 0 2 0 0 25 0 NaN 3 -16 -16 NaN 0 0 NaN NaN 40 NaN 0 0 NaN 0 0 0 0 0 NaN 0 40 0 0 0 NaN 20 27 25 NaN NaN NaN NaN 0 14 0];
iron_loss = [13 NaN NaN NaN NaN NaN NaN 46 NaN NaN NaN 30 NaN NaN 39 40 NaN 50 NaN NaN 46 NaN NaN NaN NaN NaN 66 NaN NaN NaN NaN NaN 10 NaN NaN NaN 15 35 35 35 NaN NaN NaN];

fig = figure('units','centimeters','position',[[8 8] [18 8]]); hold on;
for i = 1:length(volume)
    % Total loss, positive x-axis
    if ~isnan(loss(i)) && ~isnan(volume(i))
        scatter(loss(i), volume(i), 40, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(5), 'LineWidth', 0.5);
    end
    % Iron loss, negative x-axis
    if ~isnan(iron_loss(i)) && ~isnan(volume(i))
        scatter(-iron_loss(i), volume(i), 40, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colorsPAST(5), 'LineWidth', 0.5);
    end
end
xlabel('Iron Loss Decrease (%)    /    Total Loss Decrease (%)');
ylabel('Volume Relative Decrease (%)');
xlim([-75 75]); ylim([-5 80]);
grid on; box on; grid(gca,'minor');
ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
%figName = "decreasedKPIs-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
%figName = "decreasedKPIs-rw.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);

end



%% Plot piechart of integration types prevalence.
plotPieMethods = false;
if plotPieMethods == true

XX = [14 43 15 18 8];
X = XX/sum(XX)*100;
value = compose([newline '(%.0f/114)'], XX);
percents = compose('%.0f%%', X/sum(X)*100);

fig = figure('units','centimeters','position',[[8 8] [18 10]]);
p0 = pie(X, strcat(percents, value));
legend({'Chamber', 'Stacked', 'Imbalanced', 'Shunt', 'Split'}, 'Orientation', 'vertical', 'Location', 'southeast');
newColors = [hex2rgb(colorsPAST(2)); hex2rgb(colorsPAST(1)); hex2rgb(colorsPAST(5)); hex2rgb(colorsPAST(8)); hex2rgb(colorsNORM(3))];
patchHand = findobj(p0, 'Type', 'Patch');
set(patchHand, {'FaceColor'}, mat2cell(newColors, ones(size(newColors,1),1), 3))
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
%figName = "methods_pie-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
end


%% Plot barchart of technology prevalence.

plotTrue = false; 
if plotTrue == true

data = [32.7,     15.3,   11.2, 5.1,   2.0;   
        34.7,     14.3,    8.2, 4.1,   2.0;  
        26.5,     12.2,    6.1, 1.0,   1.0];
methods = {'combined','imbalance','shunt','chamber','split'};
xCats = {'planar', 'pcb', 'interl'};

fig = figure('units','centimeters','position',[[4 4] [9 8]]); hold on; 
bh = bar(data, 'stacked', 'FaceColor', 'flat');
set(bh, 'FaceColor', 'Flat')
bh(1).CData = hex2rgb(colorsPAST(1));
bh(2).CData = hex2rgb(colorsPAST(5));
bh(3).CData = hex2rgb(colorsPAST(8));
bh(4).CData = hex2rgb(colorsPAST(2));
bh(5).CData = hex2rgb(colorsNORM(3));

set(gca,'XTick',1:3,'XTickLabel',xCats);
xlabel(''); ylabel('Occurance (%)');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);

%exportgraphics(fig, "methods_bar-rw.pdf", 'BackgroundColor', 'none', 'ContentType', 'vector');

end


%% Plot inductance density boxplots.
plotLD = false;
if plotLD == true

% data
methods = {'chamber', 'chamber', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'combined', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'imbalance', 'shunt', 'shunt', 'shunt'};
ld = [4.03 38.40 1.97 8.22 27.33 21.79 34.61 22.15 1.49 56.12 555.56 1.44 76.84 58.61 62.77 50.24 14.53 483.87 5.47 317.28 22.14 31.49 8.75 15.12 20.58 11.11 47.62 94.08 174.79 164.37 116.67];

unique_methods = unique(methods);
num_methods = numel(unique_methods);
scatter_data = cell(1, num_methods);
for i = 1:num_methods
    method_indices = strcmp(methods, unique_methods{i});
    scatter_data{i} = ld(method_indices);
end

fig = figure('units','centimeters','position',[[8 8] [9 9]]); hold on;
% Define colors and markers
markers = {'v', 's', 'd', 'o', '^'};  % Define markers for each method type
colors = [hex2rgb(colorsPAST(2)); hex2rgb(colorsPAST(1)); hex2rgb(colorsPAST(8));hex2rgb(colorsPAST(5))];  % Define colors, for example using MATLAB default colors or custom

% Adjusted loop for plotting
for i = 1:num_methods
    x_values = i * ones(size(scatter_data{i})); % Same x value for all points of the same method
    switch unique_methods{i}
        case 'chamber'
            scatter_style = 1;  % Index for 'v'
        case 'combined'
            scatter_style = 2;  % Index for 's'
        case 'shunt'
            scatter_style = 3;  % Index for 'd'
        case 'imbalance'
            scatter_style = 4;  % Index for 'o'
        case 'split'
            scatter_style = 5;  % Index for '^'
    end
    scatter(x_values, scatter_data{i}, 40, markers{scatter_style}, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colors(scatter_style, :), 'LineWidth', 0.75);
end

ylabel('Load (ld) values'); 
set(gca, 'XTick', 1:num_methods, 'XTickLabel', unique_methods); grid on;
ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);

figName = "methods_scatter-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
% figName = "methods_scatter-rw.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);
end


%% Plot footprint comparative analysis of different integration methods.
plotFP = false;
if plotFP == true
% Dimensions ratio xt/xc
rx = linspace(0,5,100);  % [-] xt/xc dimensions ratio

% Afp ratios
Rfp_two = ones(length(rx));
Rfp_shu = ones(length(rx));
Rfp_spl = (2.*rx + 1) ./ (rx + 1);
Rfp_im1 = (4.*rx + 3) ./ (2.*rx + 2);  % when xim = xc
Rfp_im2 = (4.*rx + 2.5) ./ (2.*rx + 2);  % when xim = 0.5*xc
Rfp_uiu = (2.*rx + 1) ./ (rx + 1);

Rfp2_two = ones(length(rx));
Rfp2_shu = ones(length(rx));
Rfp2_spl = (2.*rx + 1) ./ (4.*rx + 1);
Rfp2_im1 = (4.*rx + 3) ./ (8.*rx + 2);  % when xim = xc
Rfp2_im2 = (4.*rx + 2.5) ./ (8.*rx + 2);  % when xim = 0.5*xc
Rfp2_uiu = (2.*rx + 1) ./ (4.*rx + 1);

% Footprint comparison
fig = figure('units','centimeters','position',[[1 1] [17 6]]);  hold on 
% 1 turn per layer
h0 = plot(rx, Rfp_two, '-', 'color', colorsPAST(1), 'LineWidth', 1.5);
h0 = plot(rx, Rfp_spl, '-', 'color', colorsPAST(5), 'LineWidth', 1.5);
h0 = plot(rx, Rfp_im1, '-', 'color', colorsDARK(1), 'LineWidth', 1.5);
h0 = plot(rx, Rfp_im2, '-', 'color', colorsDARK(5), 'LineWidth', 1.5);

% 2 turns per layer
h0 = plot(rx, Rfp2_two, '--', 'color', colorsPAST(1), 'LineWidth', 1.5);
h0 = plot(rx, Rfp2_spl, '--', 'color', colorsPAST(5), 'LineWidth', 1.5);
h0 = plot(rx, Rfp2_im1, '--', 'color', colorsDARK(1), 'LineWidth', 1.5);
h0 = plot(rx, Rfp2_im2, '--', 'color', colorsDARK(5), 'LineWidth', 1.5);
%legend({'2-ch & shunt', 'Split & UIU', 'xim=xc', 'xim=0.5xc', '2-ch & shunt', 'Split & UIU', 'xim=xc', 'xim=0.5xc'}, 'Orientation', 'vertical', 'Location', 'southeast');
xlabel('Dimensions Ratio xt/xc (-)'); ylabel('Footprint Integrated / Reference (-)');
ylim([0.5 2]); xlim([0 5])
grid on; ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1; box on;
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);

%figName = "comp_footprint-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
end


%% Plot volume comparative analysis of different integration methods.

% Two-chamber   Afp ==              V=f(y_ch, yt)
% Shunt         Afp ==              V=f(y_sh, yt)
% Split         Afp=f(xt/xc)        V=(xt/xc, yt)
% Imbalance     Afp=(xim, xt/xc)    V=f(xim, xt/xc, yt)
% 3D-mit        Afp=f(xt/xc)        V=f(yim, xt/xc, yt)

plotTest = false;
if plotTest == true
xt = linspace(0,10,100);
xc = linspace(0,10,100);
[Xt, Xc] = meshgrid(xt, xc);

yt = xt;
x_im = Xc;  % tbd
y_im = Xc;
y_ch = 0;
y_sh = 0;

Afp_ref = (2.*Xt + 2.*Xc).*(2.*Xt + Xc);
Afp_two = (2.*Xt + 2.*Xc).*(2.*Xt + Xc);
Afp_shu = (2.*Xt + 2.*Xc).*(2.*Xt + Xc);
Afp_spl = (4.*Xt + 2.*Xc).*(2.*Xt + Xc);
Afp_imb = (4.*Xt + 2.*Xc + Xc).*(2.*Xt + Xc);
Afp_uiu = (4.*Xt + 2.*Xc).*(2.*Xt + Xc);

V_ref = Afp_ref .* (2.*yt + Xc);
V_two = Afp_two .* (2.*yt + Xc + y_ch);
V_shu = Afp_shu .* (2.*yt + Xc + y_sh);
V_spl = Afp_spl .* (yt + 2.*Xc);
V_imb = Afp_imb .* (yt + 2.*Xc);
V_uiu = Afp_uiu .* (yt + 2.*Xc + Xc);

fig = figure('units','centimeters','position',[[52 2] [35 8]]);  hold on;

subplot(1,5,1); ax1 = gca;
comp = V_two./V_ref;
contourf(ax1, Xt, Xc, comp, 50, 'LineStyle', 'none'); hold on;
[C,hc] = contour(ax1, Xt, Xc, comp, 'LineColor', 'k', 'LineWidth', 1);
clabel(C, hc, 'FontSize', 7, 'FontName', 'Cambria', 'Color', 'k'); hold off;
xlabel('Trace Width xt (mm)'); ylabel('Core Width xc (mm)'); title('Two-Chamber V');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);

subplot(1,5,2); ax1 = gca;
comp = V_shu./V_ref;
contourf(ax1, Xt, Xc, comp, 50, 'LineStyle', 'none'); hold on;
[C,hc] = contour(ax1, Xt, Xc, comp, 'LineColor', 'k', 'LineWidth', 1);
clabel(C, hc, 'FontSize', 7, 'FontName', 'Cambria', 'Color', 'k'); hold off;
xlabel('Trace Width xt (mm)'); ylabel('Core Width xc (mm)'); title('Magnetic Shunt V');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);

subplot(1,5,3); ax1 = gca;
comp = V_spl./V_ref;
contourf(ax1, Xt, Xc, comp, 50, 'LineStyle', 'none'); hold on;
[C,hc] = contour(ax1, Xt, Xc, comp, 'LineColor', 'k', 'LineWidth', 1);
clabel(C, hc, 'FontSize', 7, 'FontName', 'Cambria', 'Color', 'k'); hold off;
xlabel('Trace Width xt (mm)'); ylabel('Core Width xc (mm)'); title('Split-Winding V');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);

subplot(1,5,4); ax1 = gca;
comp = V_imb./V_ref;
contourf(ax1, Xt, Xc, comp, 50, 'LineStyle', 'none'); hold on;
[C,hc] = contour(ax1, Xt, Xc, comp, 'LineColor', 'k', 'LineWidth', 1);
clabel(C, hc, 'FontSize', 7, 'FontName', 'Cambria', 'Color', 'k'); hold off;
xlabel('Trace Width xt (mm)'); ylabel('Core Width xc (mm)'); title('Imbalance V');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);

subplot(1,5,5); ax1 = gca;
comp = V_uiu./V_ref;
contourf(ax1, Xt, Xc, comp, 50, 'LineStyle', 'none'); hold on;
[C,hc] = contour(ax1, Xt, Xc, comp, 'LineColor', 'k', 'LineWidth', 1);
clabel(C, hc, 'FontSize', 7, 'FontName', 'Cambria', 'Color', 'k'); hold off;
xlabel('Trace Width xt (mm)'); ylabel('Core Width xc (mm)'); title('3D-MIT V');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
end


%% Volume comparative analysis.

fig = figure('units','centimeters','position',[[52 2] [30 12]]);  
lims = [0.5 3];
clevels = [0.5 0.6 0.7 0.8 0.9 1.0 1.2 1.4 1.6 1.8 2 2.5 3 4 5 10];

% Core and winding ratios
xtxc = linspace(0,4,100);
ytxc = linspace(0,2,100);
[XtXc, YtXc] = meshgrid(xtxc, ytxc);


% ------------------------------
% Same number of layers
% ------------------------------

% SPLIT WINDING
Rv_spl = (2.*XtXc + 1).*(YtXc + 2)./((XtXc + 1).*(2.*YtXc + 1));

subplot(2,3,1);
ax1 = gca; hold on;
contourf(ax1, XtXc, YtXc, Rv_spl, 50, 'LineStyle', 'none'); hold on;
[C,hc] = contour(ax1, XtXc, YtXc, Rv_spl, clevels, 'LineColor', 'k', 'LineWidth', 1);
clabel(C, hc, 'FontSize', 7, 'FontName', 'Cambria', 'Color', 'k'); hold off;
xlabel('xt/xc'); ylabel('yt/xc'); title('Split-Winding');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
colormap(ax1, cmap_cont); colorbar(ax1); caxis(ax1, lims);

% IMBALANCED WINDING
Rv_imb = (4.*XtXc + 3).*(YtXc + 2)./(2.*(XtXc + 1).*(2.*YtXc + 1));  % when x_im = xc

subplot(2,3,2);
ax1 = gca; hold on;
contourf(ax1, XtXc, YtXc, Rv_imb, 50, 'LineStyle', 'none'); hold on;
[C,hc] = contour(ax1, XtXc, YtXc, Rv_imb, clevels, 'LineColor', 'k', 'LineWidth', 1);
clabel(C, hc, 'FontSize', 7, 'FontName', 'Cambria', 'Color', 'k'); hold off;
xlabel('xt/xc'); ylabel('yt/xc'); title('Imbalanced @xim=xc');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
colormap(ax1, cmap_cont); colorbar(ax1); caxis(ax1, lims);

% 3D-MIT
Rv_uiu = (2.*XtXc + 1).*(YtXc + 3)./((XtXc + 1).*(2.*YtXc + 1));  % when x_im = xc

subplot(2,3,3);
ax1 = gca; hold on;
contourf(ax1, XtXc, YtXc, Rv_uiu, 50, 'LineStyle', 'none'); hold on;
[C,hc] = contour(ax1, XtXc, YtXc, Rv_uiu, clevels, 'LineColor', 'k', 'LineWidth', 1);
clabel(C, hc, 'FontSize', 7, 'FontName', 'Cambria', 'Color', 'k'); hold off;
xlabel('xt/xc'); ylabel('yt/xc'); title('UIU @yim=xc');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
colormap(ax1, cmap_cont); colorbar(ax1); caxis(ax1, lims);

% ------------------------------
% Same number of turns per layer
% ------------------------------

% SPLIT WINDING
Rv_spl = (2.*XtXc + 1).*(YtXc + 2)./((4.*XtXc + 1).*(YtXc + 1));

subplot(2,3,4);
ax1 = gca; hold on;
contourf(ax1, XtXc, YtXc, Rv_spl, 50, 'LineStyle', 'none'); hold on;
[C,hc] = contour(ax1, XtXc, YtXc, Rv_spl, clevels, 'LineColor', 'k', 'LineWidth', 1);
clabel(C, hc, 'FontSize', 7, 'FontName', 'Cambria', 'Color', 'k'); hold off;
xlabel('xt/xc'); ylabel('yt/xc'); title('Split-Winding');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
colormap(ax1, cmap_cont); colorbar(ax1); caxis(ax1, lims);

% IMBALANCED WINDING
Rv_imb = (4.*XtXc + 3).*(YtXc + 2)./(2.*(4.*XtXc + 1).*(YtXc + 1));  % when x_im = xc

subplot(2,3,5);
ax1 = gca; hold on;
contourf(ax1, XtXc, YtXc, Rv_imb, 50, 'LineStyle', 'none'); hold on;
[C,hc] = contour(ax1, XtXc, YtXc, Rv_imb, clevels, 'LineColor', 'k', 'LineWidth', 1);
clabel(C, hc, 'FontSize', 7, 'FontName', 'Cambria', 'Color', 'k'); hold off;
xlabel('xt/xc'); ylabel('yt/xc'); title('Imbalanced @xim=xc');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
colormap(ax1, cmap_cont); colorbar(ax1); caxis(ax1, lims);

% 3D-MIT
Rv_uiu = (2.*XtXc + 1).*(YtXc + 3)./((4.*XtXc + 1).*(2.*YtXc + 1));  % when x_im = xc

subplot(2,3,6);
ax1 = gca; hold on;
contourf(ax1, XtXc, YtXc, Rv_uiu, 50, 'LineStyle', 'none'); hold on;
[C,hc] = contour(ax1, XtXc, YtXc, Rv_uiu, clevels, 'LineColor', 'k', 'LineWidth', 1);
clabel(C, hc, 'FontSize', 7, 'FontName', 'Cambria', 'Color', 'k'); hold off;
xlabel('xt/xc'); ylabel('yt/xc'); title('UIU @yim=xc');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
colormap(ax1, cmap_cont); colorbar(ax1); caxis(ax1, lims);
figName = "comp_volume-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
