load("workingFile.mat")
perPerson = [.05, 75/365, 125/365]; %cubic meters/person/day
perField = [1.5, 3, 5];
perField = perField*(1233/365); %cubic meters/acre/day
numCounties = 58;

agData = sortrows(agData, 'County');
acres = zeros(58, 1);

isaD = ismember(acres, ' (D)');
for i = 1:numCounties
    if(isaD(i))
        acres(i) = 0;
    else
        acres(i) = str2double(agData{i, "Value"});
    end
        
end


%countysAndAcres = agData(1:numCounties, ["County", "Value"]); %Acres
%a

%cell2mat(countysAndAcres(1,1))

popneed = perPerson(1)*popData{:, "TotalPopulation"};

%sortAlphabetic
countymapTable = sortrows(struct2table(countymap), 'NAME');
countymapStruct = table2struct(countymapTable);


close()
% close()
% figure()
% 
% %popMap
popcolorRange = [0, 10^2, 10^3, 10^4, 10^5, 10^6];
popcolorVals = makeColorScale(popneed, popcolorRange);
% hold on
% %countymap = projinv(p, countymap)
% for i = 1:length(countymapStruct)
%     mapshow(countymapStruct(i), 'FaceColor',popcolorVals(i, :));
% end
% 
% title("Expected Population Water Use by County", 'fontsize', 12, 'Interpreter','latex')
% xlabel("longitude (degrees)"), ylabel("latitude (degrees)")
% 
% axis([-128 -112 31 43])
% for i = 1:length(popcolorVals)
%     scatter(500, 500, 'MarkerFaceColor', popcolorVals(i, :), 'MarkerEdgeColor','flat')
% end
% %legend("foo", "0-100 acrefeet/day", "100-1000 acrefeet/day", "1000-10000 acrefeet/day", "10^4-10^5 acrefeet/day", "10^5-10^6")
% hold off

agNeed = acres*perField(1);
agcolorRange = linspace(0, 3000, 10);
agcolorVals = makeColorScale(agNeed, agcolorRange);

% figure()
% hold on
% %fjkldkfj
% for i = 1:length(countymapStruct)
%     mapshow(countymapStruct(i), 'FaceColor', agcolorVals(i, :));
% end
% 
% title("Expected Agricultural Water Use by County", 'fontsize', 12, 'Interpreter','latex')
% xlabel("longitude (degrees)"), ylabel("latitude (degrees)")
% axis([-128 -112 31 43])
% %legend("Reservoirs")
% hold off


figure()
subplot(2, 2, 1)
totNeed = acres*perField(1) + popneed;
totcolorRange = linspace(min(totNeed), max(totNeed), 50);
totcolorVals = makeColorScale(totNeed, totcolorRange);
hold on
%fjkldkfj
for i = 1:length(countymapStruct)
    mapshow(countymapStruct(i), 'FaceColor', totcolorVals(i, :));
end

title("Low per-Person, Low per-Acre", 'fontsize', 12, 'Interpreter','latex')
xlabel("longitude (degrees)"), ylabel("latitude (degrees)")
axis([-128 -112 31 43])
%legend("Reservoirs")
hold off

subplot(2, 2, 2)
totNeed = acres*perField(3) + popneed;
totcolorRange = linspace(min(totNeed), max(totNeed), 50);
totcolorVals = makeColorScale(totNeed, totcolorRange);

hold on
%fjkldkfj
for i = 1:length(countymapStruct)
    mapshow(countymapStruct(i), 'FaceColor', totcolorVals(i, :));
end

title("Low per-Person, High per-Acre", 'fontsize', 12, 'Interpreter','latex')
xlabel("longitude (degrees)"), ylabel("latitude (degrees)")
axis([-128 -112 31 43])
hold off

%modify perPerson
popneed = perPerson(3)*popData{:, "TotalPopulation"};

subplot(2, 2, 3)
totNeed = acres*perField(1) + popneed;
totcolorRange = linspace(min(totNeed), max(totNeed), 50);
totcolorVals = makeColorScale(totNeed, totcolorRange);
hold on
%fjkldkfj
for i = 1:length(countymapStruct)
    mapshow(countymapStruct(i), 'FaceColor', totcolorVals(i, :));
end

title("High per-Person, Low per-Acre", 'fontsize', 12, 'Interpreter','latex')
xlabel("longitude (degrees)"), ylabel("latitude (degrees)")
axis([-128 -112 31 43])
%legend("Reservoirs")
hold off

subplot(2, 2, 4)
totNeed = acres*perField(3) + popneed;
totcolorRange = linspace(min(totNeed), max(totNeed), 50);
totcolorVals = makeColorScale(totNeed, totcolorRange);

hold on
%fjkldkfj
for i = 1:length(countymapStruct)
    mapshow(countymapStruct(i), 'FaceColor', totcolorVals(i, :));
end

title("High per-Person, High per-Acre", 'fontsize', 12, 'Interpreter','latex')
xlabel("longitude (degrees)"), ylabel("latitude (degrees)")
axis([-128 -112 31 43])
hold off
