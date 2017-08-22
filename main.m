 close all;
clear all;
clc;

%a = xlsread('lihongbo_run2.xlsx');
string_name = 'get_data20170822150252';
fid = fopen([string_name,'.txt']);
read_txt = textscan(fid, '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s','EmptyValue', -Inf);
fclose(fid);


tmp_1 = read_txt{1};        % time
tmp_2 = read_txt{2};        % x1
tmp_3 = read_txt{3};        % y1
tmp_4 = read_txt{4};        % z1
tmp_5 = read_txt{5};        % x2
tmp_6 = read_txt{6};        % y2
tmp_7 = read_txt{7};        % z2
tmp_8 = read_txt{8};        % x3
tmp_9 = read_txt{9};        % y3
tmp_10 = read_txt{10};      % z3
tmp_11 = read_txt{11};      % x4
tmp_12 = read_txt{12};      % y4
tmp_13 = read_txt{13};      % z4
tmp_14 = read_txt{14};      % ppg1_high
tmp_15 = read_txt{15};      % ppg1_low
tmp_16 = read_txt{16};      % ppg2_high
tmp_17 = read_txt{17};      % ppg2_low
tmp_18 = read_txt{18};
tmp_19 = read_txt{19};
tmp_20 = read_txt{20};
tmp_21 = read_txt{21};      % serial num



tmp = [tmp_1,tmp_2,tmp_3,tmp_4,tmp_5,tmp_6,tmp_7,tmp_8,tmp_9,tmp_10, ...
    tmp_11,tmp_12,tmp_13,tmp_14,tmp_15,tmp_16,tmp_17,tmp_18,tmp_19,tmp_20,tmp_21];

row_num = find(~strcmp(tmp_21,''));
tmp_valid = tmp(row_num,:);

% gsensor 
gsensor_x = [tmp_valid(:,2),tmp_valid(:,5),tmp_valid(:,8),tmp_valid(:,11)];
gsensor_y = [tmp_valid(:,3),tmp_valid(:,6),tmp_valid(:,9),tmp_valid(:,12)];
gsensor_z = [tmp_valid(:,4),tmp_valid(:,7),tmp_valid(:,10),tmp_valid(:,13)];

gsensor_x_num = hex2dec(gsensor_x');
gsensor_y_num = hex2dec(gsensor_y');
gsensor_z_num = hex2dec(gsensor_z');
len_gsensor_num  = length(gsensor_x_num(:,1));

% ppg
ppg1 = [tmp_valid(:,14),tmp_valid(:,15)];
ppg2 = [tmp_valid(:,16),tmp_valid(:,17)];

pp1_com = strcat(ppg1(:,1),ppg1(:,2));
pp2_com = strcat(ppg2(:,1),ppg2(:,2));
pp1_num = hex2dec(pp1_com);
pp2_num = hex2dec(pp2_com);
ppg_num = [pp1_num,pp2_num];
len_ppg_num = length(ppg_num);
ppg_reshape = reshape(ppg_num',len_ppg_num*2,1);

figure(1);
plot(ppg_reshape);



%plot(t_fft_time,fft_time);
%hold on;


