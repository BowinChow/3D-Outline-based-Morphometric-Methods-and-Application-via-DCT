function [] = tilefigs(hands)

scrnsz = get(0,'screensize');
if nargin < 1;
   hands = get(0,'Children');
   hands = sort(hands);
end

numFigs = length(hands);

% Centrepoint:
c = 0.5*([scrnsz(3), scrnsz(4)]);

figHt = scrnsz(4)*0.38;
vertXtra = 78;
horizXtra = 15;
figWth = 1.25*figHt;

set(hands(1), 'Position', [c(1)-figWth, c(2), figWth, figHt-vertXtra]);

if numFigs>1
   set(hands(2), 'Position', [c(1)+horizXtra, c(2), figWth, figHt-vertXtra]);
end

if numFigs>2
   set(hands(3), 'Position', [c(1)-figWth, c(2)-figHt, figWth, figHt-vertXtra]);
end

if numFigs>3
   for k = fliplr(4:numFigs)
      set(hands(k), 'Position', [c(1)+horizXtra, c(2)-figHt, figWth, figHt-vertXtra]);
   end
end