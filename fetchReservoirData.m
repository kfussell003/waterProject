%fetch HTML as textfile
url = 'https://cdec.water.ca.gov/reportapp/javareports?name=RES';
page = websave('reservoirData.txt', url);

%file to string
fid = fopen('reservoirData.txt');
text = fscanf(fid, '%s');
fclose(fid);

%split into name and outflow
table = split(text, 'noborder');
table = table(5:end, 1);
reservoirNames = strings(0);
outflow = strings(0);
headers = 0;
for i = 1:length(table)
     line = table(i);
     if contains(line, 'header3') == false
         if mod(i-headers, 12) == 1
             list1 = split(line, ">");
             str1 = list1{2};
             list2 = split(str1, "<");
             reservoirNames(ceil((i-headers)/12)) = list2{1};
         elseif mod(i-headers, 12) == 8
             list1 = split(line, ">");
             str1 = list1{2};
             list2 = split(str1, "<");
             outflow(ceil((i-headers)/12)) = list2{1};
         end
     else
         headers = headers + 1;
     end
% 
end

%convert outflow to integer without commas
for i = 1:length(outflow) 
    outflow(i) = erase(outflow(i), ",");
end
outflow = arrayfun(@str2num, outflow);
