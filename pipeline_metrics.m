% Circos Plot Toolbox
addpath('/home/guillem/Downloads/Programs/Circos/circos/')

% Brain Connectivity Toolbox
addpath('/home/guillem/Downloads/Programs/BCT/2019_03_03_BCT/')
addpath('/home/guillem/Downloads/Programs/BCT/2019_03_03_BCT/data_and_demos/')

% MULTILAYER Data.
addpath('/home/guillem/Desktop/Data_Science/TFM/data/MULTILAYER/')

% Funcional
%addpath('/home/guillem/Desktop/Data_Science/TFM/data/MULTILAYER/Functional/') % subject_networks_rfMRI_v1/')

% Estructural
%addpath('/home/guillem/Desktop/Data_Science/TFM/data/MULTILAYER/Structural/')% subject_networks_FA_v1/')

% Morphological
addpath('/home/guillem/Desktop/Data_Science/TFM/data/MULTILAYER/Morphological/')% subject_networks_GM_v1-no-thr/')


% Which data we use?
%type_data = '_r_matrix.csv'; % Functional data
%type_data = '_FA_factor.csv'; % Structural data
type_data = '_GM_matrix.csv'; % Morphological data

%type_data_folder = 'Functional';
%type_data_folder = 'Structural';
type_data_folder = 'Morphological';


% Load data from CSV
clinic_data = readtable('clinic.csv');
all_ids = clinic_data.id;

% Divide by healthy patients or MS patients.
clinic_data_healthy = clinic_data(clinic_data.controls_ms == 0, :);
clinic_data_ms = clinic_data(clinic_data.controls_ms == 1, :);
all_ids_healthy = clinic_data_healthy.id;
all_ids_ms = clinic_data_ms.id;

clinic_data.edges = zeros(height(clinic_data), 1);
clinic_data.degree = zeros(height(clinic_data), 1);
clinic_data.max_degree = zeros(height(clinic_data), 1);
clinic_data.density = zeros(height(clinic_data), 1);
clinic_data.clustering_coef = zeros(height(clinic_data), 1);
clinic_data.assortativity = zeros(height(clinic_data), 1);
clinic_data.betw_centr = zeros(height(clinic_data), 1);
clinic_data.eglob = zeros(height(clinic_data), 1);
clinic_data.eloc = zeros(height(clinic_data), 1);
clinic_data.modularity = zeros(height(clinic_data), 1);
clinic_data.transitivity = zeros(height(clinic_data), 1);
clinic_data.strength = zeros(height(clinic_data), 1);

% Global Metrics.
for idx = 1:length(all_ids)
    % Get the name of the functional data file.
    file_name_functional_data = strcat(all_ids{idx}, type_data);
    
    file_path = fullfile('/home/guillem/Desktop/Data_Science/TFM/data/MULTILAYER/', type_data_folder, file_name_functional_data);

    % READ CSV - FUNCTIONAL
    functional_matrix = csvread(file_path); % functional MRI (weighted undirected network).

    % Caracteritzacio de la Matriu de Connectivitat Cerebral Funcional.
    % 1. Nombre de Nodes: 
    numNodes = size(functional_matrix, 1);

    % 2. Nombre d'arestes:
    numEdges = sum(sum(triu(functional_matrix))) - sum(diag(functional_matrix));
    clinic_data.edges(idx) = numEdges;

    % 3. Grau mitja:
    degree_ = degrees_und(functional_matrix);
    clinic_data.degree(idx) = mean(degree_);

    % 4. Maximum Degree:
    maximumDegree = max(sum(functional_matrix));
    clinic_data.max_degree(idx) = maximumDegree;

    % 5. Density:
    D = density_und(functional_matrix);
    clinic_data.density(idx) = D;

    % 6. Clustering Coefficient:
    clustering_coefficients = clustering_coef_bu(functional_matrix);
    clinic_data.clustering_coef(idx) = mean(clustering_coefficients);

    % 12. Assortivity:
    A = assortativity_bin(functional_matrix, 0);
    clinic_data.assortativity(idx) = A;

    % 13. Betwennees Centrality:
    betweeness_centrality = betweenness_bin(functional_matrix);
    clinic_data.betw_centr(idx) = mean(betweeness_centrality);

    % 14. Global and Local Efficiency:
    Eglob = efficiency_bin(functional_matrix);
    clinic_data.eglob(idx) = Eglob;

    Eloc = efficiency_bin(functional_matrix, 1);
    clinic_data.eloc(idx) = mean(Eloc);

    % 15. Modularity:
    [Ci, Q] = modularity_dir(functional_matrix);
    clinic_data.modularity(idx) = mean(Ci);

    % 16. Transitivity:
    T = transitivity_bu(functional_matrix);
    clinic_data.transitivity(idx) = T;
    
    % 17. Strength:
    strengths = strengths_und(functional_matrix);
    clinic_data.strength(idx) = mean(strengths);
end

% Export the table to CSV
writetable(clinic_data, strcat('/home/guillem/Downloads/table_metrics_', lower(type_data_folder), '.csv'));








