function [ gameIds ] = getGameIds( varargin )
%getGameIds Get a list of game ID Numbers
%   Inputs: region, week, team
%   Outputs: gameIds

validRegions = {'NA','EU','KR','CH','TW'};
validWeeks = {'One','Two','Three','Four','Five','Six','Seven','Eight','Nine','Ten','Eleven'};

for i=1:nargin
    if sum(strcmp(varargin{i},validRegions))==1
        region = varargin{i};
    elseif sum(strcmp(varargin{i},validWeeks))==1
        week = varargin{i};
    else
        team = varargin{i};
    end
end

if ~exist('region','var')
    region = {'NA'};
end
if ~exist('week','var')
    week = {'all'};
end
if ~exist('team','var')
    team = {'all'};
end

for r=1:length(region)
    if week


end