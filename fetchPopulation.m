load("workingFile.mat")
url ='https://dof.ca.gov/wp-content/uploads/sites/352/Forecasting/Demographics/Documents/E-1_2024_InternetVersion.xlsx';
popData = readtable(websave('countyPopulations', url), 'UseExcel',true,'Sheet','E-1 CountyState2024');
popData = popData(2:59,["Var1", "TotalPopulation"]);
clear 'url'
save("workingFile.mat")
