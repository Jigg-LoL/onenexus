% Import list of games

gameURL = {
    'http://matchhistory.na.leagueoflegends.com/en/#match-details/TRLH1/1001560015?gameHash=314d26a7b9fb3223&tab=overview';
    'http://matchhistory.na.leagueoflegends.com/en/#match-details/TRLH1/1001560025?gameHash=229b7f6920b359b2&tab=overview';
    'http://matchhistory.na.leagueoflegends.com/en/#match-details/TRLH1/1001560037?gameHash=d4d1fd94568047ab&tab=overview'
    };

for i=1:length(gameURL)
    gameHash = gameURL{i}(62:103);
    idNumber = gameHash(7:16);
    fullURL = strcat('https://acs.leagueoflegends.com/v1/stats/game/',gameHash);
    timeHash = strrep(gameHash,'?','/timeline?');
    timeURL = strcat('https://acs.leagueoflegends.com/v1/stats/game/',timeHash);
    
    websave(strcat('C:\Users\Danny\Documents\onenexus\GameData\NA\Four\',idNumber),fullURL);
    websave(strcat('C:\Users\Danny\Documents\onenexus\GameData\NA\Four\timeline\',idNumber),timeURL);
end