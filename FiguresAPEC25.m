clear; close all;
colorsNORM = ["#505150", "#FF5050", "#77C8A6", "#42ACC6", "#588DCA", "#897AFA", "#9A9CA1"];
colorsPAST = ["#BFBFBF", "#FF9C9C", "#BEEBD8", "#9BD9E9", "#88ABCC", "#C7BDF9", "#C6C9CF"];
colorsDARK = ["#000000", "#992F2F", "#417C61", "#3C7A84", "#3D618A", "#545096", "#000000"];
colorsPALE = ["#E9E9E9", "#FFDDDD", "#E8F8F2", "#DCF2F8", "#D6E2ED", "#ECE8FD", "#000000"];

%% ANALYTICAL DESIGN
%% ---------------------------------------------------------


calcAnalytical = true;
if calcAnalytical == true


% Material constants.
rho_cu = 2.3e-08;  % [Ohm*m] resistivity of copper
mu_0 = 4 * pi * 1e-7;  % [H/m] permeability of free space
alpha = 2.661;  % [-] Steinmetz parameter from curve fitting 3F36
beta = 2.461;  % [-] Steinmetz parameter from curve fitting 3F36
k_stein = 2.137e-7;  % [-] Steinmetz parameter from curve fitting 3F36

% Input converter parameters.
fsw = 250e3;  % [Hz] switching frequency
Irms = 1.25;  % [A] rated current
Vrms = 800;   % [V] rated voltage

%% Winding loss
% Input winding parameters.
N = linspace(10, 40, 100)';  % [num_N x 1] number of turns (column vector)
MTL = 85e-3;  % [m] approximate average length based on 4 turns
oz = 2;  % [-] copper weight
h = oz * 0.035e-3;  % [m] copper thickness
wt = 3.6e-3;  % [m] copper track width for about 5 A/mm² average
nl = linspace(4,10,100);  % [1 x num_nl] number of PCB layers (row vector)

% Calculate skin depth and ratio.
delta = calcSkinDepth(fsw);  % [m] skin depth (ensure this function is defined)
xi = h / delta;  % [-] skin depth ratio (scalar)

% Number of points.
num_N = length(N);
num_nl = length(nl);

% Create grids for N and nl.
[N_grid, nl_grid] = ndgrid(N, nl);  % Grids of size [num_N x num_nl]

% Calculate the avg m-factor
m_avg_non = (sum(1:nl)*2)./nl;
m_avg_1in = (2+sum(1:(nl-1))*2)./nl;
m_avg_2in = (4+sum(1:(nl-2))*2)./nl;

% Expand average m factors to match the size of N_grid and nl_grid.
m_avg_non_grid = repmat(m_avg_non, num_N, 1);  % [num_N x num_nl]
m_avg_1in_grid = repmat(m_avg_1in, num_N, 1);  % [num_N x num_nl]
m_avg_2in_grid = repmat(m_avg_2in, num_N, 1);  % [num_N x num_nl]

% Common terms in Dowell's equation.
Fr_common_term1 = (sinh(xi) + sin(xi)) / (cosh(xi) - cos(xi));  % Scalar
Fr_common_term2 = (sinh(xi) - sin(xi)) / (cosh(xi) + cos(xi));  % Scalar

% Calculate Fr ratios using the average m factors.
Fr_non = 0.5 * xi * (Fr_common_term1 + (2 * abs(m_avg_non_grid) - 1).^2 .* Fr_common_term2);  % [num_N x num_nl]
Fr_1in = 0.5 * xi * (Fr_common_term1 + (2 * abs(m_avg_1in_grid) - 1).^2 .* Fr_common_term2);  % [num_N x num_nl]
Fr_2in = 0.5 * xi * (Fr_common_term1 + (2 * abs(m_avg_2in_grid) - 1).^2 .* Fr_common_term2);  % [num_N x num_nl]

% Calculate DC resistance.
Rdc = rho_cu * MTL * 2 .* N_grid / (wt * h);  % [Ohm] [num_N x num_nl]

% Calculate total AC resistance for each interleaving method.
R_non = Rdc .* Fr_non;  % [Ohm] [num_N x num_nl]
R_1in = Rdc .* Fr_1in;  % [Ohm] [num_N x num_nl]
R_2in = Rdc .* Fr_2in;  % [Ohm] [num_N x num_nl]

% Calculate winding losses.
Pw_non = R_non * Irms^2;  % [W] [num_N x num_nl]
Pw_1in = R_1in * Irms^2;  % [W] [num_N x num_nl]
Pw_2in = R_2in * Irms^2;  % [W] [num_N x num_nl]

%% Core loss
% Core parameters.
Ae = 0.5*519e-6;  % [m²] effective area of single core (from datasheet)
Ve = (41500 - (5*5*50) + 35500) * 1e-9;  % [m³] effective volume of single block (from datasheet)
dp = 200;  % [-] number of datapoints per period

% Calculate basic parameters.
Vmax = Vrms;  % [V] peak voltage
T = 1/fsw;  % [s] period
dt = T/dp;  % [s] dt between each datapoint
t = linspace(0, T, dp);  % [s] time of one period
Vsqr = Vrms.*square(2*pi.*fsw.*t);  % [V] voltage waveform

% Calculate flux density and iGSE core losses.
[Bsqr, Bpeak_sqr] = calcWaveform_B(Vsqr,t,Ae,N);
Pv = calcIGSE_Pv(Bsqr,t,fsw,k_stein,alpha,beta);
Pfe = Pv.*Ve;  % [W] core loss [num_N x 1]

% Expand Pfe to match [num_N x num_nl]
Pfe_grid = repmat(Pfe, 1, num_nl);  % [num_N x num_nl]

%% Footprint and total loss calculation
x_core = 64e-3;  % [m]
y_core = 50e-3;  % [m]

% Clearance
d_TC = 2e-3;  % [m] Distance between the transformer and the first copper track
w_fr4 = 1e-3;  % [m] FR4 clearance between two tracks in the same layer

% Number of turns per layer
N_per_nl = N_grid ./ nl_grid;  % [num_N x num_nl]

% Winding width
x_wind = 2 .* (d_TC + N_per_nl .* wt + w_fr4);  % [num_N x num_nl]
y_wind = x_wind;  % [num_N x num_nl]

% Footprint
fp = (x_core + x_wind) .* (y_core + y_wind);  % [num_N x num_nl], in m²
fp_cm2 = fp * 1e4;  % Convert footprint to cm²

% Total loss for each interleaving method
P_total_non = Pw_non + Pfe_grid;  % [W] [num_N x num_nl]
P_total_1in = Pw_1in + Pfe_grid;  % [W] [num_N x num_nl]
P_total_2in = Pw_2in + Pfe_grid;  % [W] [num_N x num_nl]


%% Plotting code

% COLOR MAP
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
cmap_dark = [cmap1; cmap2; cmap3];

color1 = hex2rgb(char(colorsPALE(5)));  % Start color
color2 = hex2rgb(char(colorsPALE(1)));  % Middle color
color3 = hex2rgb(char(colorsPALE(2)));  % End color
nColors = 256;  % Adjust this number as needed for smoothness
nSegment1 = floor(nColors / 2);      % From color1 to color2
nSegment2 = nColors - nSegment1;     % From color2 to color3
cmap1 = [linspace(color1(1), color2(1), nSegment1)', linspace(color1(2), color2(2), nSegment1)', linspace(color1(3), color2(3), nSegment1)'];
cmap2 = [linspace(color2(1), color3(1), nSegment2)', linspace(color2(2), color3(2), nSegment2)', linspace(color2(3), color3(3), nSegment2)'];
cmap_pale = [cmap1; cmap2];

% Create meshgrid for plotting
[N_plot, nl_plot] = meshgrid(N, nl);  % [num_nl x num_N]

% Transpose data matrices to match dimensions
fp_cm2_plot = fp_cm2';                    % [num_nl x num_N]
P_total_non_plot = P_total_non';          % [num_nl x num_N]
P_total_1in_plot = P_total_1in';          % [num_nl x num_N]
P_total_2in_plot = P_total_2in';          % [num_nl x num_N]

% SEPERATE CONTOUR PLOTS FOR FOOTPRINT AND LOSS
fig=figure('units','centimeters','position',[[2 2] [25 15]]);
subplot(2,2,1);
contourf(N_plot, nl_plot, fp_cm2_plot, 100, 'LineStyle', 'none'); hold on;
clevels = [20 40 60 80 100 120 140 160];
[C,h] = contour(N_plot, nl_plot, fp_cm2_plot, clevels, 'LineColor', 'k');
clabel(C, h, 'FontSize', 8, 'FontName', 'Cambria', 'Color', 'k'); hold off;
colormap(cmap_dark); colorbar; title('Footprint (cm²)'); caxis([50, 180]);  % Set color axis limits
xlabel('Number of Turns'); ylabel('Number of Layers');

subplot(2,2,2);
contourf(N_plot, nl_plot, P_total_non_plot, 100, 'LineStyle', 'none'); hold on;
clevels = [0.5 1 2 5 10 20];
[C,h] = contour(N_plot, nl_plot, P_total_non_plot, clevels, 'LineColor', 'k');
clabel(C, h, 'FontSize', 8, 'FontName', 'Cambria', 'Color', 'k'); hold off;
colormap(cmap_dark); colorbar; title('Total Loss (W)'); caxis([0.5,30]);  % Set color axis limits
xlabel('Number of Turns'); ylabel('Number of Layers');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);

subplot(2,2,3);
contourf(N_plot, nl_plot, P_total_1in_plot, 100, 'LineStyle', 'none'); hold on;
[C,h] = contour(N_plot, nl_plot, P_total_1in_plot, clevels, 'LineColor', 'k');
clabel(C, h, 'FontSize', 8, 'FontName', 'Cambria', 'Color', 'k'); hold off;
colormap(cmap_dark); colorbar; title('Total Loss (W)'); caxis([0.5,30]);  % Set color axis limits
xlabel('Number of Turns'); ylabel('Number of Layers');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);

subplot(2,2,4);
contourf(N_plot, nl_plot, P_total_2in_plot, 100, 'LineStyle', 'none'); hold on;
[C,h] = contour(N_plot, nl_plot, P_total_2in_plot, clevels, 'LineColor', 'k');
clabel(C, h, 'FontSize', 8, 'FontName', 'Cambria', 'Color', 'k'); hold off;
colormap(cmap_dark); colorbar; title('Total Loss (W)'); caxis([0.5,30]);  % Set color axis limits
xlabel('Number of Turns'); ylabel('Number of Layers');
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
figName = "contour_all-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
figName = "contour_all-rw.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);


% COMBINED CONTOUR PLOTS FOR FOOTPRINT AND LOSS
fig=figure('units','centimeters','position',[[2 2] [20 10]]);
[C,h] = contour(N_plot, nl_plot, fp_cm2_plot, [20 40 60 80 100 120 140 160], 'LineColor', 'k');
clabel(C, h, 'FontSize', 8, 'FontName', 'Cambria', 'Color', 'k'); hold off;
colormap(cmap_pale);caxis([50, 180]);  % Set color axis limits
xlabel('Number of Turns'); ylabel('Number of Layers'); hold on;
[C,h] = contour(N_plot, nl_plot, P_total_1in_plot, [0.5 1 2 5 10 20], 'LineColor', 'k');
clabel(C, h, 'FontSize', 8, 'FontName', 'Cambria', 'Color', 'k'); hold off;
set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
figName = "contour_comb-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
figName = "contour_comb-rw.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);

end



%% OTHER PLOTS
%% ---------------------------------------------------------


%% EXPERIMENTAL PLOTS

plotExp = false;
if plotExp == true
    data_v1 = textscan(fopen('241118174356 Hioki v1 OC.csv', 'r'), '%q%q%q%q', 'Delimiter', ',', 'HeaderLines', 1);
    data_v2 = textscan(fopen('241118181821 Hioki v2 OC.csv', 'r'), '%q%q%q%q', 'Delimiter', ',', 'HeaderLines', 1);
    data_v3 = textscan(fopen('241118183435 Hioki v3 OC.csv', 'r'), '%q%q%q%q', 'Delimiter', ',', 'HeaderLines', 1);
    data_v4 = textscan(fopen('250311005656 Hioki v4 OC.csv', 'r'), '%q%q%q%q', 'Delimiter', ',', 'HeaderLines', 1);
    
    f_v1 = str2double(data_v1{2});
    f_v2 = str2double(data_v2{2});
    f_v3 = str2double(data_v3{2});
    f_v4 = str2double(data_v4{2});
    
    Z_v1 = str2double(data_v1{3});
    Z_v2 = str2double(data_v2{3});
    Z_v3 = str2double(data_v3{3});
    Z_v4 = str2double(data_v4{4});
    
    L_v1 = str2double(data_v1{4});
    L_v2 = str2double(data_v2{4});
    L_v3 = str2double(data_v3{4});
    L_v4 = str2double(data_v4{3});
    
    plotHioki = true;
    if plotHioki == true
        fig = figure('units','centimeters','position',[[6 6] [20 8]]); hold on;
        subplot(1,2,1)
        h0 = plot(f_v1, L_v1*1e3, '-', 'color', colorsDARK(1), 'LineWidth', 1.2); hold on;
        h0 = plot(f_v2, L_v2*1e3, '-', 'color', colorsDARK(5), 'LineWidth', 1.2);
        h0 = plot(f_v3, L_v3*1e3, '-', 'color', colorsPAST(5), 'LineWidth', 1.2);
        h0 = plot(f_v4, L_v4*1e3, '-', 'color', colorsNORM(2), 'LineWidth', 1.2);
        xlabel('Frequency (Hz)'); ylabel('Inductance (uH)');
        %xlim([1e4, 5e6]);
        ylim([-2.2, 2.6]);
        grid on; ax = gca;
        ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1; box on;
        ax.XScale = "log";
        
        subplot(1,2,2)
        h0 = plot(f_v1.*1e-3, L_v1*1e3, '-', 'color', colorsDARK(1), 'LineWidth', 1.2); hold on;
        h0 = plot(f_v2.*1e-3, L_v2*1e3, '-', 'color', colorsDARK(5), 'LineWidth', 1.2);
        h0 = plot(f_v3.*1e-3, L_v3*1e3, '-', 'color', colorsPAST(5), 'LineWidth', 1.2);
        h0 = plot(f_v4.*1e-3, L_v4*1e3, '-', 'color', colorsNORM(2), 'LineWidth', 1.2);
        xlabel('Frequency (kHz)'); ylabel('Inductance (µH)');
        xlim([250, 600]); ylim([-3, 3]);
        grid on; ax = gca;
        ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1; box on;
        ax.XScale = "log";
        set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
        figName = "hioki_oc2.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
        %figName = "hioki_oc2.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);
    end


    %% PLECS PLOTS
    
    data_rippled = readtable('data_rippled.csv');
    data_smooth = readtable('data_smooth.csv');
    
    i_ripple = data_rippled.L1_InductorCurrent-mean(data_rippled.L1_InductorCurrent);
    i_smooth = data_smooth.L1_InductorCurrent-mean(data_smooth.L1_InductorCurrent);
    
    i_smooth = i_smooth.*mean(abs(i_ripple))/mean(abs(i_smooth));
    
    plotPlecs = false;
    if plotPlecs == true
        fig = figure('units','centimeters','position',[[6 6] [15 7.4]]); hold on;
        plot(data_rippled.Time_S, i_ripple, '-', 'color', colorsPAST(5), 'LineWidth', 1.2);
        plot(data_smooth.Time_S, i_smooth, '-', 'color', colorsDARK(5), 'LineWidth', 1.2);
        xlabel('Time (s)'); ylabel('Inductor Current (A)');
        grid on; ax = gca;
        xlim([2, 2.00002]); ylim([-1.1 1.1]);
        ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1; box on;
        set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
        %figName = "plecs_wave.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
    end
    
    %% PLECS fourier
    
    fourier_rippled = readtable('fourier_rippled.csv');
    fourier_smooth = readtable('fourier_smooth.csv');
    
    % Exclude the 0 Hz harmonic
    fourier_rippled = fourier_rippled(fourier_rippled.Frequency_Hz > 0, :);
    fourier_smooth = fourier_smooth(fourier_smooth.Frequency_Hz > 0, :);
    
    % Normalize data by the amplitude at 250 kHz
    norm_factor_rippled = fourier_rippled.L1_InductorCurrent(fourier_rippled.Frequency_Hz == 250000);
    norm_factor_smooth = fourier_smooth.L1_InductorCurrent(fourier_smooth.Frequency_Hz == 250000);
    fourier_rippled.L1_InductorCurrent = fourier_rippled.L1_InductorCurrent / norm_factor_rippled;
    fourier_smooth.L1_InductorCurrent = fourier_smooth.L1_InductorCurrent / norm_factor_smooth;
    
    % Select only the first 10 harmonics after the 0 Hz
    fourier_rippled = fourier_rippled(1:10, :);
    fourier_smooth = fourier_smooth(1:10, :);
    
    X = categorical(cellstr(num2str(fourier_rippled.Frequency_Hz/1000, '%.0fkHz')));
    X = reordercats(X, cellstr(num2str(sort(fourier_rippled.Frequency_Hz)/1000, '%.0fkHz')));
    Y_rippled = fourier_rippled.L1_InductorCurrent;
    Y_smooth = fourier_smooth.L1_InductorCurrent;
    
    % Bar plot
    plotBar = false;
    if plotBar == true
        fig=figure('units','centimeters','position',[[4 4] [8 8]]); hold on;
        b0 = bar(X, [Y_rippled Y_smooth], 'grouped');
        b0(1).FaceColor = colorsPAST(5);  % Dark blue
        b0(2).FaceColor = colorsDARK(5);  % Black
        ylabel('Normalised Inductor Current (-)');
        grid on; box on; ax = gca; ax.GridLineStyle = ':'; ax.GridColor = 'k'; ax.GridAlpha = 1;
        set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
        %figName = "plecs_ffte.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
    end
    
    %% Plot spider graph comparison
    
    % Extracted and normalized data for each case
    A1 = [6.1, 5.7, 7510, 314, 0.0934, 15.10];
    A2 = [6.1, 1.4, 7510, 81, 0.17, 15.10];
    A3 = [6.1, 0.5, 9000, 0.2, 0.95, 15.10];
    B1 = [6.1, 1.3, 9000, 30, 0.2875, 14.86];
    B2 = [6.1, 3.7, 9000, 111, 0.22, 14.86];
    
    % Reference data should be the highest values or a specific baseline
    refdata = max([A1; A2; A3; B1; B2]);
    
    % Normalizing the data relative to the reference data
    A1_rel = round(A1./refdata.*100, 2);
    A2_rel = round(A2./refdata.*100, 2);
    A3_rel = round(A3./refdata.*100, 2);
    B1_rel = round(B1./refdata.*100, 2);
    B2_rel = round(B2./refdata.*100, 2);
    
    % Labels matrix
    labels = [A1_rel; A2_rel; A3_rel; B1_rel; B2_rel];
    
    plotSpider = false;
    if plotSpider == true
        fig = figure('units','centimeters','position',[[1 1] [15 15]]); hold on;
        % Spider plot
        spider_plot_R2019b(labels,...
            'AxesLabels', {'Core Loss (W)', 'Winding Loss (W)', 'Footprint (mm²)', 'Leakage Inductance (uH)', 'Lumped Cap. (F)', 'Total Cost (€)'},...
            'AxesInterval', 2, ...
            'AxesLimits', [0, 0, 0, 0, 0, 0; 100, 100, 100, 100, 100, 100], ...
            'FillOption', {'on', 'on', 'on', 'on', 'on'}, ...
            'FillTransparency', [0.05, 0.05, 0.05, 0.05, 0.05], ...
            'Color', [hex2rgb(colorsPAST(5)); hex2rgb(colorsNORM(5)); hex2rgb(colorsDARK(5)); hex2rgb(colorsPAST(2)); hex2rgb(colorsNORM(2))],...
            'LineWidth', 0.75);  % Add this line to control line thickness
        legend('A1', 'A2', 'A3', 'B1', 'B2', 'Location', 'northwest');
        set(findall(fig, '-property', 'FontName'), 'FontName', 'Cambria', 'Fontsize', 12);
        %figName = "spider_interl-rw.pdf"; exportgraphics(fig, figName, 'BackgroundColor', 'none', 'ContentType', 'vector');
        %figName = "spider_interl-rw.png"; exportgraphics(fig, figName, 'BackgroundColor', 'white', 'Resolution', 600);
    end
end