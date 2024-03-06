close all; clear;
colorsNORM = ["#505150", "#FF5050", "#77C8A6", "#42ACC6", "#588DCA", "#897AFA", "#9A9CA1"];
colorsPAST = ["#BFBFBF", "#FF9C9C", "#BEEBD8", "#9BD9E9", "#88ABCC", "#C7BDF9", "#C6C9CF"];
colorsDARK = ["#000000", "#992F2F", "#417C61", "#3C7A84", "#3D618A", "#545096", "#000000"];

%% Year publications vs category figure
year1 = [2006 2007 2007 2010 2010 2010 2011 2011 2011 2011 2012 2012 2012 2012 2012 2012 2012 2012 2012 2012 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022];
labels = {'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Energy management', 'Converter control', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter control', 'Converter design', 'Converter design', 'Converter control', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Energy management', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter control', 'Converter design', 'Energy management', 'Converter control', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter design', 'Converter design', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter control', 'Energy management', 'Energy management', 'Converter design', 'Converter design', 'Converter control', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Energy management', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Energy management', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter control', 'Energy management', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter control', 'Energy management', 'Converter control', 'Energy management', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter design', 'Converter design', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter design', 'Converter control', 'Converter design', 'Converter control', 'Converter design', 'Converter control', 'Converter control', 'Converter design', 'Energy management', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter control', 'Converter design', 'Converter design', 'Converter control', 'Converter control', 'Converter design', 'Energy management', 'Converter control', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Converter design', 'Energy management', 'Converter control'};

% Count the number of times each label appears in the list
uniqueLabels = unique(labels);
count1 = zeros(length(unique(year1)), length(uniqueLabels));
for i = 1:length(year1)
    for j = 1:length(uniqueLabels)
        if strcmp(labels{i}, uniqueLabels{j})
            yearIndex = find(year1(i) == unique(year1));
            count1(yearIndex,j) = count1(yearIndex,j) + 1;
        end
    end
end

plotPubl = false;
if plotPubl == true
    fig = figure('units','centimeters','position',[[1 1] [15 10]]); hold on;
    bh = bar(unique(year1), count1, 'stacked');
    legend(uniqueLabels, 'Orientation', 'vertical','Location','northwest');
    set(bh, 'FaceColor', 'Flat')
    bh(1).CData = colorsB(1:3);
    bh(2).CData = colorsB(4:6);
    bh(3).CData = colorsB(7:9);
    xlabel('Publication year');
    ylabel('Number of publications');
    grid on; box on;
    grid(gca,'minor')
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    %figName = "publications"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end


%% Plot energy graph Elia
xx = 0:0.1:24;

% Curve fitting avg charging load without V2G.
xg = [0    1    4.1   5.6  6.7  8.8  11   12   13    14.5  17   19.4  21.7  22.3  24];
yg = [400  750  1250  610  125  -30  600  950  1100  1000  400  -280  40    38    400]*1e-3;
yyg = spline(xg, yg, xx);

% Curve fitting avg charging load with V2G.
xb = [0    2    6   8.5  11   14   16   18.5  22.5  24 ];
yb = [600  190  40  360  250  315  450  1150  800   600]*1e-3;
yyb = spline(xb, yb, xx);

% Curve fitting avg total load.
xr = [0     4  11    15.5  18.5  21.5  24  ];
yr = [10.5  8  11.6  11.3  12.5  11.3  10.5];
yyr = spline(xr, yr, xx);

plotEnergy = false;
if plotEnergy == true
    fig = figure('units','centimeters','position',[[2 2] [15 8]]); hold on;
    yyaxis left;
    ylabel('EV power demand (GW)');
    ylim([-0.5 2]);
    h0 = plot(xx, yyb, '-', 'color', colorsDARK(5), 'LineWidth', 1.5);
    h0 = plot(xx, yyg, '--', 'color', colorsPAST(5), 'LineWidth', 1.5);
    ax = gca; ax.YAxis(1).Color = hex2rgb(colorsDARK(5));  % change color of this y-axis to hex
    yyaxis right;
    ylabel('Total power demand (GW)');
    ylim([-5 20]);
    h0 = plot(xx, yyr, '-', 'color', colorsNORM(2), 'LineWidth', 1.5);
    ax = gca; ax.YAxis(2).Color = hex2rgb(colorsNORM(2));  % change color of this y-axis to hex
    xlim([0 24]);
    xticks([0 3 6 9 12 15 18 21 24]);
    xlabel('Time of day (h)'); 
    legend({'Uncoordinated charging load', 'V2G charging load', 'Total load'}, 'Orientation', 'vertical', 'Location', 'northwest');
    grid on; box on;
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    %figName = "V2G-elia-raw"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end


%% Plot OBC eff as function of power

% Datasheet 6.6kW Texas Instr. PMP22650
pow_TI06 = [177 354 531 706 883 1059 1235 1412 1588 1764 1940 2117 2293 2470 2645 2922 2998 3175 3350 3527 3704 3881 4058 4235 4411 4588 4765 4942 5119 5295 5472 5649 5825 6177 6363 6530 6709];  % [W]
eff_TI06 = [77.08 87.11 90.39 91.87 92.74 93.41 93.85 94.18 94.41 94.59 94.82 95.05 95.26 95.45 95.64 95.81 95.94 96.04 96.12 96.18 96.22 96.24 96.25 96.25 96.24 96.23 96.21 96.19 96.16 96.13 96.09 96.05 96 95.85 95.78 95.69 95.6];  % [%]
pow_TI06_xx = linspace(pow_TI06(1), pow_TI06(end), 20);
eff_TI06_xx = spline(pow_TI06, eff_TI06, pow_TI06_xx);
% Datasheet 3.3kW OnSemi TND6327D 
pow_OS03 = 3300*[0.10 0.25 0.50 0.75 1.0];  % [W]
eff_OS03 = [96.75 97.94 97.96 97.95 97.82];  % [%]
% Datasheet 11kW Infineon DAB11KIZSICSYS 
pow_IN11 = 116.3+822.3.*[1 2 3 4 5 6 7 8 9 10 11 12];  % [W]
eff_IN11 = 0.98*[52.5 85.4 92.8 94.5 95.5 96.1 96.4 96.8 96.8 96.75 96.70 96.65];  % [%] using X% efficiency PFC
% Datasheet 6.6kW Wolfspeed CRD-06600FF065N-K
pow_WS11 = [502.09 1010.6 1519.5 2024.1 2528.1 3023.8 3525.5 4027.7 4529.8 5037.6];
eff_WS11 = 0.98*[89.838 94.601 95.718 96.24 96.409 96.46 96.431 96.336 96.211 96.038];  % [%] using X% efficiency PFC

% Plot figure.
plotEfficiencies = false;
if plotEfficiencies == true
    fig = figure('units','centimeters','position',[[3 3] [15 8]]); hold on;
    h1 = plot(pow_OS03*1e-3, eff_OS03, '-o','color', colorsPAST(5), 'LineWidth', 1.5);  % 3.3kW
    h1 = plot(pow_TI06_xx*1e-3, eff_TI06_xx, '-o','color', colorsNORM(5), 'LineWidth', 1.5);  % 6.6KW
    h1 = plot(pow_IN11*1e-3, eff_IN11, '-o','color', colorsDARK(5), 'LineWidth', 1.5);  % 22kW
    %h1 = plot(pow_WS11*1e-3, eff_WS11, '-o','color', colors(7), 'LineWidth', 1.5);  % 11KW
    legend({'3.3kW OnSemi OBC (TND6327D)', '6.6kW Texas Instr. OBC (PMP22650', '11kW Infineon OBC (w/ DAB11KIZSICSYS)'}, 'Orientation', 'vertical','Location','southeast');
    xlabel('Power (kW)');
    ylabel('Efficiency (%)');
    grid on; box on;
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    %figName = "power-eff"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end


%% Battery voltage with copper loss as function of charging power plot
V1 = 400;
V2 = 800;
power = [3.3 6.6 11 22 43]*1e3;
time = 60e3./power;  % at 90 kWh
I1 = power./V1;  % at 800V battery
I2 = power./V2;  % at 800V battery
R = 0.3;
Pcu1 = I1.^2.*R;
Pcu2 = I2.^2.*R;

% Plot figure.
plotVoltage = false;
if plotVoltage == true
    fig = figure('units','centimeters','position',[[4 4] [15 8]]); hold on;
    yyaxis left;
    h0 = plot(power*1e-3, time, '-x', 'color', colorsDARK(5), 'LineWidth', 1.5);
    ylabel('Charging time (hours)');
    ax = gca;
    ax.YAxis(1).Color = hex2rgb(colorsDARK(5));  % change color of this y-axis to hex
    yyaxis right;
    h0 = plot(power*1e-3, I1.^2*1e-3, '-o', 'color', colorsPAST(2), 'LineWidth', 1.5);
    h0 = plot(power*1e-3, I2.^2*1e-3, '-o', 'color', colorsNORM(2), 'LineWidth', 1.5);
    ax = gca;
    ax.YAxis(2).Color = hex2rgb(colorsNORM(2));  % change color of this y-axis to hex
    xlabel('Charging power (kW)');
    ylabel('Copper loss per unit of resistance (kW/Ω)');
    legend({'Charging time @60kWh battery', 'Normalised copper loss @400V battery', 'Normalised copper loss @800V battery'}, 'Orientation', 'vertical','Location','northwest');
    xlim([3.3 43]);
    grid on; box on;
    ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    %figName = "charging-voltage-raw"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end


%% GaN vs SiC illustrative figure
plotWBG = false;
if plotWBG == true
    x = [];
    y = [];
    fig = figure('units','centimeters','position',[[5 5] [15 8]]); hold on;
    plot(x,y);
    xlabel('Frequency (Hz)')
    ylabel('Power (W)')
    xlim([100, 1e7]);
    ylim([100, 1e7]);
    grid on; box on;
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    ax.XScale = 'log'; ax.YScale = 'log';
    %figName = "wbg-comp"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end


%% Plot SOA OBC pd vs eff v2
% Datapoints for academic OBCs.
ef_aca = 100.*[0.95 0.961 0.97 0.981 0.925 0.947 0.958 0.962 0.962 0.962 0.962 0.962 0.96 0.92 0.962 0.956];
pd_aca = [1.1 0.3 2.5 0.5 0.5 3.257 3.4 2.3 2.3 2.3 2.6 2.7 3.2 0.479 0.897 2.7];
lb_aca = ["Aachen '20 []", "Aalborg '21 []", "Flint '15 []", "Maryland '18 []", "Myongji '11 []", "Nanjin '18 []", "Nanjin '20 []", "Virginia '18 []", "Virginia '16 []", "Virginia '17 []", "Virginia '17 []", "Virginia '18 []", "Virginia '22 []", "Guimarães '18 []", "Nanjing '21 []", "Nanjing '19 []"];

% Datapoints for EV OBCs.
ef_evs = 100.*[0.926 0.921 0.95 0.943];
pd_evs = [1.467 1 1.1 0.95];
lb_evs = ["Tesla '16 []", "Renault '13 []", "Tesla '20 []", "Chevrolet '17 []"];

% Datapoints for industry OBCs.
ef_ind = 100.*[0.965 0.94 0.94 0.97 0.965 0.936 0.94 0.97 0.972 0.95 0.954 0.955 0.97 0.95 0.975];
pd_ind = [3.80 3.80 2.04 3 1.4 0.6 2 3.3 3 1.8 3.2 1.75 2.2 3 3.1];
lb_ind = ["Texas Instr '21 []", "Toyota  '14 []", "BRUSA '13 []", "Wolfspeed '16 []", "Delta '17 []", "Delta-Q '17 []", "Fraunhofer '14 []", "GaN Systems '18 []", "Infineon '20 []", "OnSemi '20 []", "Toyota '20 []", "VALEO '16 []", "Wolfspeed '19 []", "Fraunhofer '17 []", "SAL '22 []"];

% Datapoints for singe stage OBCs.
ef_sin = 100.*[0.972 0.99 0.98 0.957 0.957 0.977 0.963 0.971 0.97 0.945 0.961 0.97];
pd_sin = [1.4 4 4 0.5 0.5 5.25 5.5 7.3 5.9 6.7 2 4];
lb_sin = ["Zurich '18 []", "Zurich '20 []", "Michigan '18 []", "Seoul '15 []", "Seoul '17 []", "Seoul '22 []", "Seoul '20 []", "Seoul '22 []", "Seoul '22 []", "Seoul '22 []", "Eindhoven '16 []", "Flint '17 []"];

plotSOAobc = false;
if plotSOAobc == true
    fig = figure('units','centimeters','position',[[3 3] [30 15]]); hold on;
    set(gca,'FontSize',12)
    % Plot academic OBCs.
    scatter(ef_aca, pd_aca, 60, 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);    
    for i = 1:length(ef_aca)
        text(ef_aca(i), pd_aca(i), lb_aca{i}, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top')
    end
    % Plot industry OBCs.
    scatter(ef_ind, pd_ind, 60, 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);    
    for i = 1:length(ef_ind)
        text(ef_ind(i), pd_ind(i), lb_ind{i}, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top')
    end
    % Plot EV OBCs.
    scatter(ef_evs, pd_evs, 60, 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceColor', colorsPAST(3), 'LineWidth',0.5);    
    for i = 1:length(ef_evs)
        text(ef_evs(i), pd_evs(i), lb_evs{i}, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top')
    end
    % Plot singe-stage OBCs.
    scatter(ef_sin, pd_sin, 60, 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceColor', colorsPAST(6), 'LineWidth',0.5);    
    for i = 1:length(ef_sin)
        text(ef_sin(i), pd_sin(i), lb_sin{i}, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top')
    end
    legend({'Academic OBC', 'Industry OBCs', 'Electric vehicle OBCs', 'Single-stage OBCs'}, 'Orientation', 'vertical','Location','northwest');
    xlabel('Peak efficiency (%)')
    ylabel('Power density (kW/l)')
    xlim([91.5, 99.5]);
    ylim([0 7.5]);
    grid on; box on;
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    %figName = "soa-obc-v3-raw"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end


%% Plot SOA DC-DC pd vs eff v1
% Datapoints for academic dc-dc conv.
ef_aca = 100.*[0.975 0.975 0.978 0.978 0.978 0.980 0.877 0.979 0.978 0.978 0.988 0.973 0.987 0.986 0.979 0.984 0.984 0.960 0.990 0.990];
pd_aca = [1.000 2.538 4.500 4.500 5.200 5.600 6.100 7.000 7.900 8.000 8.700 9.500 10.000 11.000 12.200 12.200 3.900 6.000 6.700 10.500];
lb_aca = ["Maryland '17 []", "Brussels '22 []", "Virginia '16 []", "Virginia '18 []", "Virginia '17 []", "Virginia '18 []", "Virginia '21 []", "Arizona '20 []", "Virginia '17 []", "Virginia '19 []", "Zurich '22 []", "Virginia '18 []", "Virginia '22 []", "Virginia '21 []", "Virginia '22 []", "Virginia '21 []", "ORNL '18 []", "CNRS '22 []", "ORNL '18 []", "ORNL '18 []"];

% Datapoints for industry dc-dc conv.
ef_ind = 100.*[0.980 0.985 0.982 0.972];
pd_ind = [1.5 8.0 7.2 3];
lb_ind = ["Wolfspeed '16 []", "Wolfspeed '20 []", "Delta '23 []", "Infineon '20 []"];

plotSOAdc = false;
if plotSOAdc == true
    fig = figure('units','centimeters','position',[[4 4] [15 12]]); hold on;
    set(gca,'FontSize',12)
    % Plot academic dc-dc conv.
    scatter(ef_aca, pd_aca, 60, 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);    
    for i = 1:length(ef_aca)
        text(ef_aca(i), pd_aca(i), lb_aca{i}, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top')
    end
    % Plot industry dc-dc conv.
    scatter(ef_ind, pd_ind, 60, 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);    
    for i = 1:length(ef_ind)
        text(ef_ind(i), pd_ind(i), lb_ind{i}, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top')
    end
    legend({'Academia', 'Industry'}, 'Orientation', 'vertical','Location','northwest');
    xlabel('Peak efficiency (%)')
    ylabel('Power density (kW/l)')
    xlim([95.5, 99.5]);
    ylim([0 14]);
    grid on; box on;
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    %figName = "soa-dc-v2-raw"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end


%% Plot SOA AC-DC pd vs eff v1
% Datapoints for academic ac-dc conv.
ef_aca = 100.*[0.985 0.986 0.985 0.986 0.980 0.989 0.982];
pd_aca = [4.5 4.5 4.5 5.2 5.3 7.8 11.1];
lb_aca = ["Virginia '16 []", "Virginia '18 []", "Virginia '17 []", "Virginia '17 []", "Virginia '18 []", "Virginia '18 []", "Virginia '22 []"];

% Datapoints for industry ac-dc conv.
ef_ind = 100.*[0.989 0.987 0.990 0.990];
pd_ind = [3.9 11.0 5.63 2.86];
lb_ind = ["Texas Instr '19 []", "Texas Instr '22 []", "Wolfspeed '22 []", "GaN Systems '18 []"];

plotSOAac = false;
if plotSOAac == true
    fig = figure('units','centimeters','position',[[5 5] [15 12]]); hold on;
    set(gca,'FontSize',12)
    % Plot academic ac-dc conv.
    scatter(ef_aca, pd_aca, 60, 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);    
    for i = 1:length(ef_aca)
        text(ef_aca(i), pd_aca(i), lb_aca{i}, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top')
    end
    % Plot industry ac-dc conv.
    scatter(ef_ind, pd_ind, 60, 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);    
    for i = 1:length(ef_ind)
        text(ef_ind(i), pd_ind(i), lb_ind{i}, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top')
    end
    legend({'Academia', 'Industry'}, 'Orientation', 'vertical','Location','northwest');
    xlabel('Peak efficiency (%)')
    ylabel('Power density (kW/l)')
    xlim([97.5, 99.5]);
    ylim([0 14]);
    grid on; box on;
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    %figName = "soa-ac-v1-raw"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end

%% Plot trends in efficiency
% Datapoints for academic ac-dc conv.
ef = 100.*[0.812 0.893 0.925 0.926 0.926 0.936 0.94 0.94 0.94 0.94 0.943 0.945 0.947 0.95 0.95 0.95 0.954 0.955 0.955 0.957 0.957 0.958 0.96 0.96 0.96 0.96 0.96 0.961 0.962 0.962 0.962 0.962 0.962 0.963 0.965 0.965 0.967 0.97 0.97 0.97 0.972 0.972 0.976 0.977 0.98 0.981 0.99 0.92 0.962 0.97 0.956 0.95 0.975 0.9 0.928 0.92 0.925 0.964 0.961 0.9758 0.902 0.978];
yr = [2019 2015 2011 2016 2018 2011 2014 2022 2013 2014 2017 2017 2018 2020 2020 2020 2020 2021 2016 2015 2017 2020 2022 2020 2012 2020 2016 2021 2016 2018 2017 2018 2017 2020 2021 2017 2021 2015 2016 2018 2018 2020 2020 2022 2018 2018 2020 2018 2021 2019 2019 2017 2022 2013 2014 2015 2015 2015 2020 2021 2022 2017];
lb = ["Academic", "Academic", "Academic", "EV", "Academic", "Industry", "Industry", "Industry", "Industry", "Industry", "EV", "Academic", "Academic", "Academic", "EV", "Industry", "Industry", "Industry", "Industry", "Academic", "Academic", "Academic", "Academic", "Industry", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Industry", "Industry", "Academic", "Academic", "Industry", "Industry", "Academic", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Industry", "Academic", "Industry", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic"];
pw = [1.5 3.3 3.3 10 3.3 3.3 6.1 7 22 22 3.65 2 6.6 6.6 11.5 6.6 3 11 10.5 3.3 3.3 6.6 11 22 3.3 19.2 10 2 6.6 6.6 6.6 6.6 6.6 11 6.6 10 3.3 7.2 6.6 22 7.5 11 3 11 7.2 3.3 8 4 6.6 6.6 6.6 6 7 20 3 1.44 10 6.9 3.3 3.5 1.1 6.6];

plotSOAeff = false;
if plotSOAeff == true
    fig = figure('units','centimeters','position',[[6 6] [15 8]]); hold on;
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);  % dummy scatter points for the legend
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);    
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(3), 'LineWidth',0.5);  
    yrs = 2010:1:2025;  % get trend line and plot it
    trend = polyfit(yr, ef,1);     trendline = trend(1).*yrs+trend(2);
    h0 = plot(yrs, trendline, '--', 'color', colorsNORM(1), 'LineWidth', 1);
    for i = 1:length(ef)
        if lb(i) == "Academic"
            scatter(yr(i), ef(i), 40, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);    
        elseif lb(i) == "Industry"
            scatter(yr(i), ef(i), 40, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);    
        elseif lb(i) == "EV"
            scatter(yr(i), ef(i), 40, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(3), 'LineWidth',0.5);    
        end
    end
    legend({'Academia', 'Industry', 'Electric vehicle', 'Trendline'}, 'Orientation', 'vertical','Location','southeast');
    xlabel('Year')
    ylabel('Peak efficiency (%)')
    xlim([2010.5, 2022.5]);
    ylim([85 99.5]);
    grid on; box on;
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    %figName = "soa-ef-yr-raw"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end

%% Plot trends in power density

plotSOApw1 = false;
if plotSOApw1 == true
    fig = figure('units','centimeters','position',[[8 8] [15 8]]); hold on;
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(3), 'LineWidth',0.5);
    for i = 1:length(ef)
        if lb(i) == "Academic"
            scatter(yr(i), pw(i), 40, '^', 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);    
        elseif lb(i) == "Industry"
            scatter(yr(i), pw(i), 40, '^', 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);    
        elseif lb(i) == "EV"
            scatter(yr(i), pw(i), 40, '^', 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceColor', colorsPAST(3), 'LineWidth',0.5);    
        end
    end
    legend({'Academia', 'Industry', 'Electric vehicle'}, 'Orientation', 'vertical','Location','southeast');
    xlabel('Year'); ylabel('Power (kW)')
    xlim([2010.5, 2022.5]); ylim([1 25]);
    grid on; box on; ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    %figName = "soa-pw-yr-raw"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end

plotSOApw2 = false;
if plotSOApw2 == true
    fig = figure('units','centimeters','position',[[8 8] [15 8]]); hold on;
    for i = 1:length(pw)
        %pw(i) = 5*floor(pw(i)/5)+1;
        pw(i) = 2*floor(pw(i)/2)+1;
    end
    [~, idx] = sort(round(pw));
    sortedYears = yr(idx);
    sortedValues = round(pw(idx));
    duplicates = diff([0, sortedValues]) == 0;
    duplicatesCount = cumsum(duplicates);
    sizes = 10 * (duplicatesCount + 1); % The '30' here can be adjusted based on how big you want your markers to be
    scatter(sortedYears, sortedValues, sizes, 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceAlpha', 0.5, 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);
    xlabel('Year'); ylabel('Power (kW)')
end

plotSOApw3 = false;
if plotSOApw3 == true
    fig = figure('units','centimeters','position',[[8 8] [15 8]]); hold on;
    yr = [2011 2011 2012 2013 2013 2013 2014 2014 2014 2015 2015 2015 2015 2015 2015 2016 2016 2016 2016 2016 2017 2017 2017 2017 2017 2017 2017 2017 2018 2018 2018 2018 2018 2018 2018 2018 2018 2019 2019 2019 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2021 2021 2021 2021 2021 2021 2022 2022 2022 2022 2022];
    po = [3.3 3.3 3.3 43 22 20 6.1 22 3 3.3 3.3 7.2 1.44 10 6.9 10 10.5 10 6.6 6.6 3.65 2 3.3 6.6 6.6 10 6 6.6 3.3 6.6 6.6 6.6 22 7.5 7.2 3.3 4 1.5 6.6 6.6 6.6 11.5 6.6 3 6.6 22 19.2 11 11 3 8 3.3 11 2 6.6 3.3 6.6 3.5 7 11 11 7 1.1];
    edges = [0, 3.4, 6.7, 11.1, 22.1, Inf];
    categories = {'0-3.3', '3.4-6.6', '6.7-11', '11.1-22', '>22'};
    bin_indices = discretize(po, edges);
    countMatrix = zeros(max(yr)-min(yr)+1, numel(categories));
    for i = min(yr):max(yr)
        power_values = po(yr == i);
        bin_indices = discretize(power_values, edges);
        bin_counts = histcounts(bin_indices, 1:numel(categories)+1);
        countMatrix(i-min(yr)+1, :) = bin_counts / sum(bin_counts) * 100;
    end
    b = bar(min(yr):max(yr), countMatrix, 'stacked');
    xlabel('Year');
    ylabel('Percentage (%)');
    legend(categories, 'Location', 'northwest');
    title('Power Data Distribution per Year');
    hexColors = {'#9A9CA1', '#88ABCC', '#588DCA', '#3D618A', '#000000'};
    rgbColors = cellfun(@(x) hex2rgb(x), hexColors, 'UniformOutput', false);
    rgbColors = vertcat(rgbColors{:});
    colormap(rgbColors);
    for k = 1:length(b)
        b(k).FaceColor = 'flat';
        b(k).CData = k;
    end
end

XX = [15 24 1];
X = XX/sum(XX)*100;
value = compose([newline '(%.0f/40)'], XX);
percents = compose('%.0f%%', X/sum(X)*100);

plotSOApw4 = false;
if plotSOApw4 == true
    fig = figure('units','centimeters','position',[[8 8] [15 8]]);
    p0 = pie(X, strcat(percents, value));
    %p0 = pie(X);
    legend({'Level-1', 'Level-2', 'Level-3'}, 'Orientation', 'vertical', 'Location', 'southwest');
    newColors = [hex2rgb(colorsNORM(5)); hex2rgb(colorsDARK(5)); hex2rgb(colorsPAST(5))];
    patchHand = findobj(p0, 'Type', 'Patch');
    set(patchHand, {'FaceColor'}, mat2cell(newColors, ones(size(newColors,1),1), 3))
    %figName = "soa-pow-old"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end

XX = [29 69 1];
X = XX/sum(XX)*100;
value = compose([newline '(%.0f/90)'], XX);
percents = compose('%.0f%%', X/sum(X)*100);

plotSOApw4 = false;
if plotSOApw4 == true
    fig = figure('units','centimeters','position',[[18 8] [15 8]]);
    p0 = pie(X, strcat(percents, value));
    %p0 = pie(X);
    legend({'Level-1', 'Level-2', 'Level-3'}, 'Orientation', 'vertical', 'Location', 'southwest');
    newColors = [hex2rgb(colorsNORM(5)); hex2rgb(colorsDARK(5)); hex2rgb(colorsPAST(5))];
    patchHand = findobj(p0, 'Type', 'Patch');
    set(patchHand, {'FaceColor'}, mat2cell(newColors, ones(size(newColors,1),1), 3))
    %figName = "soa-pow-old"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end

yr = [2021 2018 2011 2015 2017 2011 2016 2017 2013 2020 2020 2018 2017 2016 2020 2014 2013 2016 2018 2017 2015 2017 2018 2016 2020 2020 2022 2018 2018 2020 2021 2014 2020 2018 2022 2020 2018 2021 2019 2019 2017 2022];
pd = [0.30 0.50 0.50 0.50 0.50 0.60 0.22 0.95 1.00 1.10 1.10 1.40 1.40 1.75 1.80 2.00 2.04 2.30 2.30 2.30 2.50 2.60 2.70 3.00 3.00 3.20 3.20 3.26 3.30 3.40 3.80 3.80 4.00 4.00 5.25 5.50 0.48 0.90 2.20 2.70 3.00 3.10];
lb = ["Academic", "Academic", "Academic", "Academic", "Academic", "Industry", "EV", "EV", "EV", "Academic", "EV", "Academic", "Industry", "Industry", "Industry", "Industry", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Industry", "Industry", "Industry", "Academic", "Academic", "Industry", "Academic", "Industry", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Industry", "Academic", "Industry", "Industry"];

plotSOApd = false;
if plotSOApd == true
    fig = figure('units','centimeters','position',[[10 10] [15 8]]); hold on;
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(3), 'LineWidth',0.5);
    yrs = 2010:1:2025;  % get trend line and plot it
    trend = polyfit(yr, pd, 1);     trendline = trend(1).*yrs+trend(2);
    h0 = plot(yrs, trendline, '--', 'color', colorsNORM(1), 'LineWidth', 1);
    for i = 1:length(pd)
        if lb(i) == "Academic"
            scatter(yr(i), pd(i), 40, '^', 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);    
        elseif lb(i) == "Industry"
            scatter(yr(i), pd(i), 40, '^', 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);    
        elseif lb(i) == "EV"
            scatter(yr(i), pd(i), 40, '^', 'MarkerEdgeColor',colorsNORM(1), 'MarkerFaceColor', colorsPAST(3), 'LineWidth',0.5);    
        end
    end
    legend({'Academia', 'Industry', 'Electric vehicle', 'Trendline'}, 'Orientation', 'vertical','Location','northwest');
    xlabel('Year')
    ylabel('Power density (kW/l)')
    xlim([2010.5, 2022.5]);
    ylim([0 6.5]);
    grid on; box on;
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    %figName = "soa-pd-yr-raw"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end


%% Year journal vs conference paper by year

year1 = [2010 2010 2010 2010 2010 2010 2010 2011 2011 2011 2011 2012 2012 2012 2012 2012 2012 2012 2012 2012 2012 2012 2012 2012 2012 2012 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022];
labels = {'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Conference papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers', 'Journal papers'};

% Count the number of times each label appears in the list
uniqueLabels = unique(labels);
count1 = zeros(length(unique(year1)), length(uniqueLabels));
for i = 1:length(year1)
    for j = 1:length(uniqueLabels)
        if strcmp(labels{i}, uniqueLabels{j})
            yearIndex = find(year1(i) == unique(year1));
            count1(yearIndex,j) = count1(yearIndex,j) + 1;
        end
    end
end

plotType = false;
if plotType == true
    fig = figure('units','centimeters','position',[[6 6] [15 10]]); hold on;
    bh = bar(unique(year1), count1, 'stacked');
    legend(uniqueLabels, 'Orientation', 'vertical','Location','northwest');
    set(bh, 'FaceColor', 'Flat')
    bh(1).CData = [88 141 202]./255;  % Change color to first level
    bh(2).CData = [255 80 80]./255;
    xlabel('Publication year'); ylabel('Number of publications');
    grid on; box on; grid(gca,'minor');
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
end



%% GaN vs SiC vs Si in SOA figure 

XX = [21 11 4];
X = XX/sum(XX)*100;
value = compose([newline '(%.0f/36)'], XX);
percents = compose('%.0f%%', X/sum(X)*100);

plotWBGSOA1 = false;
if plotWBGSOA1 == true
    fig = figure('units','centimeters','position',[[8 8] [15 8]]);
    p0 = pie(X, strcat(percents, value));
    %p0 = pie(X);
    %legend({'SiC switches', 'GaN switches', 'Si switches'}, 'Orientation', 'vertical', 'Location', 'southwest');
    newColors = [hex2rgb(colorsNORM(5)); hex2rgb(colorsDARK(5)); hex2rgb(colorsPAST(5))];
    patchHand = findobj(p0, 'Type', 'Patch');
    set(patchHand, {'FaceColor'}, mat2cell(newColors, ones(size(newColors,1),1), 3))
    %figName = "soa-wbg-old"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end

XX = [8 57 29];
X = XX/sum(XX)*100;
value = compose([newline '(%.0f/94)'], XX);
percents = compose('%.0f%%', X/sum(X)*100);

plotWBGSOA2 = false;
if plotWBGSOA2 == true
    fig = figure('units','centimeters','position',[[18 8] [15 8]]);
    p0 = pie(X, strcat(percents, value));
    %p0 = pie(X);
    %legend({'SiC switches', 'GaN switches', 'Si switches'}, 'Orientation', 'vertical', 'Location', 'southwest');
    newColors = [hex2rgb(colorsNORM(5)); hex2rgb(colorsDARK(5)); hex2rgb(colorsPAST(5))];
    patchHand = findobj(p0, 'Type', 'Patch');
    set(patchHand, {'FaceColor'}, mat2cell(newColors, ones(size(newColors,1),1), 3))
    %figName = "soa-wbg-new"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end


%% Spider plot SOA

% Initialize data pointsx   
SOA = [95 3.8 11 0 20];  % SoA
TARGETS = [98 4 11 1 28];  % research
P = [SOA; TARGETS];

plotSpider = false;
if plotSpider == true
    fig = figure('units','centimeters','position',[[7 7] [15 10]]);
    spider_plot_R2019b(P,...
        'AxesLabels', {'Efficiency [%]', 'Power density [kW/l]', 'Power [kW]', 'Bidirectional [0/1]', 'Cost [W/€]'},...
        'AxesInterval', 2, 'AxesLimits', [80, 3, 0, 0, 0; 100, 4.5, 22, 1, 40], 'FillOption', {'on', 'on'}, 'FillTransparency', [0.2, 0.1], 'Color', [colorsB(1:3); colorsB(4:6)]);
    legend('SOA', 'TARGETS', 'Location', 'eastoutside');
end

%% stacked bar graph patents

% Example input data
companies = {'Texas Instruments', 'Huawei', 'Delta Electronics' ,'Infineon Technologies' ,'ASTEC International' ,'Murata Manufacturing' ,'Semiconductor Comp. Industr.' ,'ABB Scheiz' ,'Apple' ,'Delta Electronics Thailand' ,'Huawei Digital Power Tech.' ,'Mitsubishi Electric' ,'Taiwan University of S&T' ,'Solum' ,'Virginia Tech University' ,'ABB Research Center' ,'LITE ON' ,'Philips Lighting Holding' ,'Samsung Electro' ,'ST Microelectronics' ,'Toshiba' ,'ZTE Corp'};
numItemsCat1 = [1, 8, 1];
numItemsCat2 = [3, 4, 2];
numItemsCat3 = [1, 5, 1];
numItemsCat4 = [0, 4, 1];
numItemsCat5 = [1, 3, 0];
numItemsCat6 = [0, 3, 1];
numItemsCat7 = [0, 4, 0];
numItemsCat8 = [1, 2, 0];
numItemsCat9 = [0, 3, 0];
numItemsCat10 = [0, 2, 1];
numItemsCat11 = [0, 3, 0];
numItemsCat12 = [1, 2, 0];
numItemsCat13 = [0, 3, 0];
numItemsCat14 = [0, 3, 0];
numItemsCat15 = [1, 1, 1];
numItemsCat16 = [0, 1, 1];
numItemsCat17 = [1, 1, 0];
numItemsCat18 = [0, 0, 2];
numItemsCat19 = [0, 2, 0];
numItemsCat20 = [0, 2, 0];
numItemsCat21 = [0, 2, 0];
numItemsCat22 = [1, 1, 0];

% Combine the data into a single matrix
data = [numItemsCat1; numItemsCat2; numItemsCat3; numItemsCat4; numItemsCat5; numItemsCat6; numItemsCat7; numItemsCat8; numItemsCat9; numItemsCat10; numItemsCat11; numItemsCat12; numItemsCat13; numItemsCat14; numItemsCat15; numItemsCat16; numItemsCat17; numItemsCat18; numItemsCat19; numItemsCat20; numItemsCat21; numItemsCat22];
plotPlayers = false;
if plotPlayers == true
    fig = figure('units','centimeters','position',[[7 7] [15 10]]);
    % Create the stacked bar graph
    barh = barh(data, 'stacked');
    legend('Pending', 'Granted', 'Dead');
    set(barh, 'FaceColor', 'Flat')
    barh(1).CData = colorsB(1:3); barh(2).CData = colorsB(4:6); barh(3).CData = colorsB(7:9);
    grid on; box on; grid(gca,'minor')
    xlabel('No. of patent families');
    set(gca, 'yticklabel', companies);
    set(gca,'YTick',1:length(companies), 'YDir', 'reverse');
end


%% soa voltage levels 400V vs 800V bar graph

periods = {'2010-2011', '2012-2013', '2014-2015', '2016-2017', '2018-2019', '2020-2021', '2022-2023'};
val_400 = [100.00 100.00 100.00 100.00 96.67 66.01 65.83];
val_800 = [0.00 0.00 0.00 0.00 3.33 33.99 34.17];

plotSOAvolt = false;
if plotSOAvolt == true
    fig = figure('units','centimeters','position',[[10 10] [15 8]]);
    color1 = [hex2dec('3D')/255, hex2dec('61')/255, hex2dec('8A')/255];
    color2 = [hex2dec('88')/255, hex2dec('AB')/255, hex2dec('CC')/255];
    b = bar(categorical(periods), [val_400; val_800]', 'BarWidth', 2);
    b(1).FaceColor = color1; b(2).FaceColor = color2;
    legend('400V battery', '800V battery');
    ylabel('Percentage used in OBC converters'); xlabel('Publication year');
    ylim([0 115]);
    grid on; box on;
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    %figName = "soa-volt-raw"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end



%% sankey diagram

plotSankey = false;
if plotSankey == true
    fig = figure('units','centimeters','position',[[7 7] [15 7]]);
    links={'aca',   'l1',     23  ;
           'aca',   'l2',     78  ;
           'ind',   'l1',     5   ;
           'ind',   'l2',     23  ;
           'evs',   'l2',     4   ;
           'evs',   'l3',     1   ;
           'l1',    'Si',     10  ;
           'l1',    'SiC',    9   ;
           'l1',    'GaN',    9   ;
           'l2',    'Si',     18  ;
           'l2',    'SiC',    60  ;
           'l2',    'GaN',    27  ;
           'l3',    'Si',     1   ;
           'Si',    '400V',   29  ;
           'SiC',   '400V',   51  ;
           'SiC',   '800V',   18  ;
           'GaN',   '800V',   1   ;
           'GaN',   '400V',   35  ;};
    SK=SSankey(links(:,1),links(:,2),links(:,3));  % Create a Sankey diagram object
    SK.NodeList={'aca', 'ind', 'evs', 'l1','l2','l3','Si','SiC','GaN','400V','800V'};  % Modify node arrangement order and plot
    SK.Sep=.1; SK.draw()
    %figName = "sankey-test"; export_fig(fullfile('Figures', figName), '-svg', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end


%% wbg bar graphs
data = [1.1, 3.3, 3.5; 0.3, 2.2, 2.0; 1.5, 1.1, 1.3; 1.5, 4.9, 1.3; 1.9, 2.0, 2.2];
labels = ["Bandgap (eV)", "Breakdown field (MV/cm)", "Electron mobility (cm²/Vs)", "Thermal cond. (W/cm.K", "Drift velocity"];

plotWBGbar = false;
if plotWBGbar == true
    fig = figure('units','centimeters','position',[[10 10] [15 7]]);
    h = bar(data);
    h(1).FaceColor = hex2rgb(colorsNORM(5)); % Si color
    h(2).FaceColor = hex2rgb(colorsDARK(5)); % SiC color
    h(3).FaceColor = hex2rgb(colorsPAST(5)); % GaN color
    set(gca, 'XTickLabel', labels);
    ylabel('Material proporties');
    grid on; box on;
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    legend({'Si', 'SiC', 'GaN'}, 'Orientation', 'vertical', 'Location', 'northeast');
    %figName = "wbgbar-raw"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end


%% Plot SOA OBC pd vs freq
pd = [0.3 0.48 0.5 0.5 0.6 0.9 0.95 1.1 1.4 1.75 1.8 2.2 2.3 2.3 2.3 2.6 2.7 2.7 3 3 3.1 3.2 3.2 3.2 3.26 3.3 3.3 3.4 3.42 3.8 3.8 4 4 5.25 5.5 5.9 6.7 7.3];
fr = [100 20 90 127 200 300 65 120 72 180 360 200 500 500 500 500 500 300 86 108 88 225 100 500 300 50 500 300 300 500 300 100 31 150 150 150 300 150];
lb = ["Academic", "Academic", "Academic", "Academic", "Industry", "Academic", "Industry", "Academic", "Academic", "Industry", "Industry", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Industry", "Industry", "Industry", "Industry", "Industry", "Academic", "Academic", "Academic", "Industry", "Academic", "Academic", "Industry", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic"];

plotPdFr = false;
if plotPdFr == true
    fig = figure('units','centimeters','position',[[6 6] [8 8]]); hold on;
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);  % dummy scatter points for the legend
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);   
    frs = 10:1:550;  % get trend line and plot it
    trend = polyfit(fr, pd,1); trendline = trend(1).*frs+trend(2);
    h0 = plot(frs, trendline, '--', 'color', colorsNORM(1), 'LineWidth', 1);
    for i = 1:length(pd)
        if lb(i) == "Academic"
            scatter(fr(i), pd(i), 40, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);    
        elseif lb(i) == "Industry"
            scatter(fr(i), pd(i), 40, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);      
        end
    end    
    legend({'Academic OBCs', 'Industry OBCs', 'Trendline'}, 'Orientation', 'vertical','Location','northwest');
    xlabel('Frequency DC-DC (kHz)'); ylabel('Power Density OBC (kW/l)')
    xlim([0 550]);
    grid on; box on;
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    %figName = "soa-fr-pd-raw"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end


%% Plot trends in frequency
fr = [100 20 90 127 200 300 65 120 72 180 360 200 500 500 500 500 500 300 86 108 88 225 100 500 300 50 500 300 300 500 300 100 31 150 150 150 300 150 300 110 500 500 500 1000 150 500 500 500 500 500 500 175 120 150 400 140 200 120 500 20 185 100 300 500 20 20 75 125 150 50 100 100 40 100 100 100 120 150 180 100 125 391 50 120 100 146 200 250 300 750 800 1500 500];
yr = [2021 2018 2011 2018 2011 2021 2017 2020 2018 2016 2020 2019 2016 2017 2018 2017 2018 2019 2020 2017 2022 2016 2020 2022 2018 2018 2018 2020 2020 2014 2021 2018 2020 2022 2020 2022 2022 2022 2016 2017 2018 2019 2020 2020 2020 2021 2021 2021 2022 2022 2023 2023 2016 2017 2021 2022 2012 2016 2017 2018 2020 2021 2022 2022 2010 2013 2014 2015 2015 2017 2017 2017 2018 2018 2018 2019 2019 2019 2019 2020 2020 2020 2021 2021 2022 2022 2022 2022 2022 2022 2022 2022 2023];
lb = ["Academic", "Academic", "Academic", "Academic", "Industry", "Academic", "Industry", "Academic", "Academic", "Industry", "Industry", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Industry", "Industry", "Industry", "Industry", "Industry", "Academic", "Academic", "Academic", "Industry", "Academic", "Academic", "Industry", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Industry", "Academic", "Academic", "Industry", "Industry", "Industry", "Academic", "Academic", "Academic", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Industry"];

plotSOAfreq = false;
if plotSOAfreq == true
    fig = figure('units','centimeters','position',[[14 6] [8 8]]); hold on;
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);  % dummy scatter points for the legend
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);    
    yrs = 2010:1:2025;  % get trend line and plot it
    trend = polyfit(yr, fr,1); trendline = trend(1).*yrs+trend(2);
    h0 = plot(yrs, trendline, '--', 'color', colorsNORM(1), 'LineWidth', 1);
    for i = 1:length(fr)
        if lb(i) == "Academic"
            scatter(yr(i), fr(i), 40, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);    
        elseif lb(i) == "Industry"
            scatter(yr(i), fr(i), 40, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);      
        end
    end
    legend({'Academic DC-DC', 'Industry DC-DC', 'Trendline'}, 'Orientation', 'vertical','Location','northwest');
    xlabel('Year'); ylabel('Frequency DC-DC (kHz)');
    xlim([2010.5, 2023.5]); ylim([0 1550]);
    grid on; box on;
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    %figName = "soa-fr-yr-raw"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "temp.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end


%% temp plots wilmar charging

% Data low and high SoC
pow_SoC_hi = [4885 6300 7000 7700 9110 9840 11200];  % [W]
eff_SoC_hi = [89.7 91.5 91.5 92.2 92.4 90.9 92.3];  % [%]
pow_SoC_lo = [4180 4860 6235 7010 7625 9055 9790 11170 11280];  % [W]
eff_SoC_lo = [87.4 87.9 89.8 90.6 90.9 92.0 91.7 90.1 91.3];  % [%]

% Plot figure.
plotWilmarEff = false;
if plotWilmarEff == true
    fig = figure('units','centimeters','position',[[3 3] [15 8]]); hold on;
    h1 = plot(pow_SoC_hi*1e-3, eff_SoC_hi, '-o','color', colorsDARK(5), 'LineWidth', 1.5);
    h1 = plot(pow_SoC_lo*1e-3, eff_SoC_lo, '-x','color', colorsPAST(5), 'LineWidth', 1.5);  
    legend({'Tesla Model Y @High SoC 16~36%', 'Tesla Model Y @Low SoC 92~95'}, 'Orientation', 'vertical', 'Location','southeast');
    xlabel('Power (kW)'); ylabel('Efficiency (%)');
    grid on; box on; ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    %figName = "eff_wilmar1"; export_fig(fullfile('Figures', figName), '-pdf', '-nocrop', '-transparent');
    %figName = "eff_wilmar1.pdf"; exportgraphics(fig, figName,'BackgroundColor','none','ContentType','vector')
end


%% temp publications integrated

year1 = [2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2017 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2014 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 2012 2012 2012 2012 2012 2012 2012 2012 2012 2012 2012 2012 2011 2011 2011 2011 2011 2011 2011 2011 2011 2011 2010 2010 2010 2010 2010 2010 2010 2009 2009 2009 2009 2009 2009 2008 2008 2008 2008 2008 2008 2008 2008 2008 2008 2008 2007 2007 2007 2007 2007 2007 2006 2006 2006 2006 2006 2006 2006 2005 2005 2005 2005 2005 2005 2005 2005 2005 2005 2005 2004 2004 2004 2004 2004 2004 2004 2004 2004 2004 2004 2003 2003 2003 2003 2002 2002 2002 2001 2001 2000 2000 2000 1999 1999 1997 1997 1997 1997 1996 1996 1994 1993 1993 1993 1991 1987 1987 1986 1984 1983 1980];
year2 = [2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2023 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2022 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2021 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2020 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 2018 2018 2018 2018 2018 2018 2018 2017 2017 2017 2017 2017 2017 2016 2016 2016 2016 2015 2015 2014 2014 2014 2013 2013 2013 2013 2013 2013 2013 2012 2012 2011 2011 2011 2010 2008 2008 2008 2008 2008 2007 2007 2005 2004 2003 2002 2002 2001 2000 1999 1997];

% Count the number of times each year appears
uniqueYear1 = unique(year1);
uniqueYear2 = unique(year2);
count1 = zeros(length(uniqueYear1), 1);
for i = 1:length(year1)
    yearIndex = find(year1(i) == uniqueYear1);
    count1(yearIndex) = count1(yearIndex) + 1;
end
count2 = zeros(length(uniqueYear2), 1);
for i = 1:length(year2)
    yearIndex = find(year2(i) == uniqueYear2);
    count2(yearIndex) = count2(yearIndex) + 1;
end

% Fit a smoother spline to the data
ft = fittype('smoothingspline');
options = fitoptions(ft);
options.SmoothingParam = 0.25; % Adjust this value between 0 and 1
[curveFit, ~] = fit(uniqueYear1', count1, ft, options);

% Evaluate the fitted spline
fittedCounts = feval(curveFit, uniqueYear1);

plotPubl = true;
if plotPubl == true
    fig = figure('units','centimeters','position',[[4 4] [15 8]]); hold on;
    bh1 = bar(uniqueYear1, count1);
    bh2 = bar(uniqueYear2, count2);
    set(bh1, 'FaceColor', 'Flat'); bh1(1).CData = hex2rgb(colorsDARK(5));
    set(bh2, 'FaceColor', 'Flat'); bh2(1).CData = hex2rgb(colorsPAST(5));
    plot(uniqueYear1, fittedCounts, '--', 'color', colorsPAST(2), 'LineWidth', 1.5); % Add the fitted line plot
    xlabel('Publication Year'); ylabel('Number of Publications');
    legend({'All publications', 'Passing inclusion criteria', 'Trendline (all)'}, 'Orientation', 'vertical', 'Location','northwest');
    grid on; box on; grid(gca,'minor')
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria');
    %figName = "publ_integr.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector')
end

%% TEMP freq vs power 

po = [960 320 120 200 500 200 80 6600 1000 500 6000 150 200 650 500 500 2000 11000 3300 12500 12500 1000 144 12500 20 1800 480 350 120 1000 1000 3000 350 80 400 8000 8000 3300 12 6600 970 300 2000 84 3000 3300 1000 100 300 3000 10000 6600 1000 25 1000 1200 2000 2000 12500 3000 700 700 700 100 800];
fr = [875 600 1000 1000 500 60-130 200 500 1000 200 20 60 350 250 175 50 100 500 80 500 500 150 200 500 100 75 300 800 100 1000 60 200 105 100 500 300 300 500 270 500 400 120 600 100 100 500 325 300 110 360 1000 60 50 250 100 1000 500 500 10 200 800 800 800 1000 1000];
lb = ["Academic", "Academic", "Academic", "Academic", "Industry", "Academic", "Industry", "Academic", "Academic", "Industry", "Industry", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Industry", "Industry", "Industry", "Industry", "Industry", "Academic", "Academic", "Academic", "Industry", "Academic", "Academic", "Industry", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Industry", "Academic", "Academic", "Industry", "Industry", "Industry", "Academic", "Academic", "Academic", "Industry", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Academic", "Industry"];

plotSOAfreq = true;
if plotSOAfreq == true
    fig = figure('units','centimeters','position',[[14 6] [8 8]]); hold on;
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);  % dummy scatter points for the legend
    scatter(0, 0, 60, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);    
    yrs = 2010:1:2025;  % get trend line and plot it
    trend = polyfit(po, fr,1); trendline = trend(1).*yrs+trend(2);
    h0 = plot(yrs, trendline, '--', 'color', colorsNORM(1), 'LineWidth', 1);
    for i = 1:length(fr)
        if lb(i) == "Academic"
            scatter(po(i), fr(i), 40, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(2), 'LineWidth',0.5);    
        elseif lb(i) == "Industry"
            scatter(po(i), fr(i), 40, '^', 'MarkerEdgeColor', colorsNORM(1), 'MarkerFaceColor', colorsPAST(5), 'LineWidth',0.5);      
        end
    end
    legend({'Academic DC-DC', 'Industry DC-DC'}, 'Orientation', 'vertical','Location','northeast');
    xlabel('Power (W)'); ylabel('Frequency (kHz)');
    xlim([0 10e3]); ylim([0 1500]);
    grid on; box on;
    ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
    ax.XScale = 'log';
    set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria');
    figName = "soa_po_fr.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector')
end

