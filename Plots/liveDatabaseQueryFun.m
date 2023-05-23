% Author: Atanu Giri
% Date: 12/12/2022
% This function generate the query to get data from live_database according
% to the input argument
% healthType: 0(no selection of health); healthType: 1(Saline-Ghrelin); 2(Food Deprivation); 3(Pre-Feeding)
% approachTrials = logical

function liveDatabaseQuery = liveDatabaseQueryFun(healthType,approachTrials)
switch healthType
    case 1
        if approachTrials
            liveDatabaseQuery = strcat("SELECT id, subjectid, referencetime, " + ...
                "gender, feeder, health, lightlevel FROM live_table WHERE " + ...
                "health ILIKE ANY (ARRAY['__Hour_S%','__Hour_G%']) " + ...
                "AND approachavoid = '1.000000' ORDER BY id;");
        else
            % Get all data from live_table for saline ghrelin
            liveDatabaseQuery = strcat("SELECT id, subjectid, referencetime, " + ...
                "gender, feeder, health, lightlevel FROM live_table WHERE " + ...
                "health ILIKE ANY (ARRAY['__Hour_S%','__Hour_G%']) " + ...
                "ORDER BY id;");
        end
    case 2
        % Get all data from live_table for food deprivation
        if approachTrials
            liveDatabaseQuery = strcat("SELECT id, subjectid, referencetime, " + ...
                "gender, feeder, health, lightlevel FROM live_table WHERE " + ...
                "(health = 'Food Deprivation' OR health = 'N/A') AND " + ...
                "approachavoid = '1.000000' ORDER BY id;");
        else
            liveDatabaseQuery = strcat("SELECT id, subjectid, referencetime, " + ...
                "gender, feeder, health, lightlevel FROM live_table WHERE " + ...
                "health = 'Food Deprivation' OR health = 'N/A' ORDER BY id;");
        end
    case 3
        % Get all data from live_table for pre feeding
        if approachTrials
            liveDatabaseQuery = strcat("SELECT id, subjectid, referencetime, " + ...
                "gender, feeder, health, lightlevel FROM live_table WHERE " + ...
                "(health = 'Pre-Feeding' OR health = 'N/A') AND " + ...
                "approachavoid = '1.000000' ORDER BY id;");
        else
            liveDatabaseQuery = strcat("SELECT id, subjectid, referencetime, " + ...
                "gender, feeder, health, lightlevel FROM live_table WHERE " + ...
                "health = 'Pre-Feeding' OR health = 'N/A' ORDER BY id;");
        end
    otherwise
        if approachTrials
            liveDatabaseQuery = strcat("SELECT id, subjectid, referencetime, " + ...
                "gender, feeder, health, lightlevel FROM live_table WHERE " + ...
                "approachavoid = '1.000000' ORDER BY id;");
        else
            liveDatabaseQuery = strcat("SELECT id, subjectid, referencetime, " + ...
                "gender, feeder, health, lightlevel FROM live_table " + ...
                "ORDER BY id;");
        end
end