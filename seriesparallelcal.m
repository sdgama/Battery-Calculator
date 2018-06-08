
clear all; clc; close all; format compact;

%% Input cell parameters

cap_eachcell = input('Please enter one cell capacity in Ah: ');
volt_eachcell = input('Please enter nominal cell voltage in V: ');
no_ofcells = input('Please enter the number of cells in the battery pack: ');

disp('-----------------------------------------------------------');

%% Desired Module parameters

volt_module = input('Please enter the desired module volatge: ');

disp('-----------------------------------------------------------');

%% Calculation of the Module's Voltage

 ser_cells = volt_module/volt_eachcell;

a = convergent(ser_cells);                                    % rounds to the closest even number
 if (mod(a,2)==0 || mod(a,2)==1)
      ser_cells = a;  
 else
     ser_cells = a -1;
 end
 
par_cells = no_ofcells/ser_cells;

dispconfig = ['The configuration for this Battery Module is: ',num2str(par_cells), 'p',num2str(ser_cells), 's'];
disp(dispconfig);

tot_cap = cap_eachcell * par_cells;
tot_cap = tot_cap*0.922;
tot_cap = round(tot_cap);
disp_capacity = ['Total Capacity of the Battery Module is: ',num2str(tot_cap),'Ah'];
disp(disp_capacity);

tot_energy = tot_cap * volt_module/1000;
tot_energy = round(tot_energy,2);
disp_energy = ['Total Energy of the Battery Module is: ',num2str(tot_energy),'kWh'];
disp(disp_energy);

%% Ploting the configuration graphically

lc_x = 0.25;
lc_y = 1;

for j = 1:1:par_cells
    for i = 1:1:ser_cells
        rectangle('Position',[lc_x lc_y 0.5 1.5])
        lc_x = lc_x + 1;
    end
    
lc_x = 0.25; 
lc_y = lc_y + 2.5;

end
axis([0 ser_cells 0 lc_y+1])
grid on

