% Circos Plot Toolbox
addpath('/home/guillem/Downloads/Programs/Circos/circos/')

% Brain Connectivity Toolbox
addpath('/home/guillem/Downloads/Programs/BCT/2019_03_03_BCT/')
addpath('/home/guillem/Downloads/Programs/BCT/2019_03_03_BCT/data_and_demos/')

% MULTILAYER Data.
addpath('/home/guillem/Desktop/Data_Science/TFM/data/MULTILAYER/')

% Funcional
addpath('/home/guillem/Desktop/Data_Science/TFM/data/MULTILAYER/Functional/') % subject_networks_rfMRI_v1/')

% Estructural
%addpath('/home/guillem/Desktop/Data_Science/TFM/data/MULTILAYER/Structural/')% subject_networks_FA_v1/')

% Morphological
%addpath('/home/guillem/Desktop/Data_Science/TFM/data/MULTILAYER/Morphological/')% subject_networks_GM_v1-no-thr/')


% Which data we use?
type_data = '_r_matrix.csv'; % Functional data
%type_data = '_FA_factor.csv'; % Structural data
%type_data = '_GM_matrix.csv'; % Morphological data

type_data_folder = 'Functional';
%type_data_folder = 'Structural';
%type_data_folder = 'Morphological';


% Load data from CSV
clinic_data = readtable('clinic.csv');
all_ids = clinic_data.id;

% Divide by healthy patients or MS patients.
clinic_data_healthy = clinic_data(clinic_data.controls_ms == 0, :);
clinic_data_ms = clinic_data(clinic_data.controls_ms == 1, :);
all_ids_healthy = clinic_data_healthy.id;
all_ids_ms = clinic_data_ms.id;




% Afegir 76 columnes de 0s per degree.
for i = 0:75
    ColumnName = ['degree_' num2str(i)];
    clinic_data.(ColumnName) = zeros(height(clinic_data), 1);
end
% Afegir 76 columnes de 0s per betweenness centrality.
for i = 0:75
    ColumnName = ['betw_centr_' num2str(i)];
    clinic_data.(ColumnName) = zeros(height(clinic_data), 1);
end
% Afegir 76 columnes de 0s per eigenvector centrality.
for i = 0:75
    ColumnName = ['eigenv_centr_' num2str(i)];
    clinic_data.(ColumnName) = zeros(height(clinic_data), 1);
end
% Afegir 76 columnes de 0s per pagerank centrality.
for i = 0:76
    ColumnName = ['pager_centr_' num2str(i)];
    clinic_data.(ColumnName) = zeros(height(clinic_data), 1);
end
% Afegir 76 columnes de 0s per clustering coefficient.
for i = 0:75
    ColumnName = ['clust_coef_' num2str(i)];
    clinic_data.(ColumnName) = zeros(height(clinic_data), 1);
end
% Afegir 76 columnes de 0s per local_eficiency.
for i = 0:75
    ColumnName = ['local_ef_' num2str(i)];
    clinic_data.(ColumnName) = zeros(height(clinic_data), 1);
end
% Afegir 76 columnes de 0s per strength.
for i = 0:75
    ColumnName = ['strength_' num2str(i)];
    clinic_data.(ColumnName) = zeros(height(clinic_data), 1);
end
% Afegir 76 columnes de 0s per modularity.
for i = 0:75
    ColumnName = ['modularity_' num2str(i)];
    clinic_data.(ColumnName) = zeros(height(clinic_data), 1);
end

% Local Metrics.
for idx_row = 1:length(all_ids)
    % Get the name of the functional data file.
    file_name_functional_data = strcat(all_ids{idx_row}, type_data);
    
    file_path = fullfile('/home/guillem/Desktop/Data_Science/TFM/data/MULTILAYER/', type_data_folder, file_name_functional_data);

    % READ CSV - FUNCTIONAL
    functional_matrix = csvread(file_path); % functional MRI (weighted undirected network).

    % Caracteritzacio de la Matriu de Connectivitat Cerebral Funcional.
    % 3. Grau per node:
    degree_ = degrees_und(functional_matrix);
    
    for i = 0:75
        ColumnName = ['degree_' num2str(i)];
        clinic_data.(ColumnName)(idx_row) = degree_(i+1);
    end

    % 6. Clustering Coefficient:
    clustering_coefficients = clustering_coef_bu(functional_matrix);
    for i = 0:75
        ColumnName = ['clust_coef_' num2str(i)];
        clinic_data.(ColumnName)(idx_row) = clustering_coefficients(i+1);
    end

    % 13. Betwennees Centrality:
    betweeness_centrality = betweenness_bin(functional_matrix);
    for i = 0:75
        ColumnName = ['betw_centr_' num2str(i)];
        clinic_data.(ColumnName)(idx_row) = betweeness_centrality(i+1);
    end

    % 14. Global and Local Efficiency:
    Eloc = efficiency_bin(functional_matrix, 1);
    for i = 0:75
        ColumnName = ['local_ef_' num2str(i)];
        clinic_data.(ColumnName)(idx_row) = Eloc(i+1);
    end

    % 15. Modularity:
    [Ci, Q] = modularity_dir(functional_matrix);
    for i = 0:75
        ColumnName = ['modularity_' num2str(i)];
        clinic_data.(ColumnName)(idx_row) = Ci(i+1);
    end

    % 17. Strength:
    strengths = strengths_und(functional_matrix);
    for i = 0:75
        ColumnName = ['strength_' num2str(i)];
        clinic_data.(ColumnName)(idx_row) = strengths(i+1);
    end
    
    % 18. Pagerank:
    pagerank_centr = pagerank_centrality(functional_matrix, 0.85);
    for i = 0:75
        ColumnName = ['pager_centr_' num2str(i)];
        clinic_data.(ColumnName)(idx_row) = pagerank_centr(i+1);
    end

    % 19. Eigenvector Centrality:
    eigenVector_Centrality = eigenvector_centrality_und(functional_matrix);
    for i = 0:75
        ColumnName = ['eigenv_centr_' num2str(i)];
        clinic_data.(ColumnName)(idx_row) = eigenVector_Centrality(i+1);
    end

end

% Export the table to CSV
writetable(clinic_data, strcat('/home/guillem/Downloads/table_metrics_local_', lower(type_data_folder), '.csv'));








