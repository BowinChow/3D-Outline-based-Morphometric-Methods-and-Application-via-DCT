function c = RGB2MatlabColor(rgb)
c = round(100 * rgb/255) / 100;
end