function [region] = FindRegion(varargin)
% This function helps to identify the numerical region of the ratio of
% control gains used in the paper.
% Author: Tairan Liu
% Email: liutairan2012@gmail.com
% 
% varargin: input, 1x3 vector, [d12, d32, d31]
% Example Input: [2 2 2]
%         Output:    Inf
%                 0.7500
% Every two lines of the output is one pair of the regions.

if isempty(varargin)
    error('No input is given.');
end

vin = cell2mat(varargin);

if ~(length(vin) == 3)
    error('Invalid input format');
end

d12 = vin(1);
d23 = vin(2);
d31 = vin(3);

if (d12<=0) || (d23<=0) || (d31<=0)
    error('Triangle edge length must be positive');
end

if (d12+d23-d31<=0) || (d12+d31-d23<=0) || (d31+d23-d12<=0)
    error('Triangle condition not satisfied.');
end

if abs(d31-d23)<1e-7
    kmin = d31^2/d12^2-1/4;
    region = [Inf; kmin];
else
    di15c = ((d12^12*d23^12)/16 - (d12^14*d23^10)/8 - (7*d12^16*d23^8)/16 + d12^18*d23^6 - (d12^20*d23^4)/2 + (d12^12*d31^12)/16 - (d12^14*d31^10)/8 - (7*d12^16*d31^8)/16 + d12^18*d31^6 - (d12^20*d31^4)/2 - (3*d12^12*d23^2*d31^10)/8 + (15*d12^12*d23^4*d31^8)/16 - (5*d12^12*d23^6*d31^6)/4 + (15*d12^12*d23^8*d31^4)/16 - (3*d12^12*d23^10*d31^2)/8 + (3*d12^14*d23^2*d31^8)/8 - (d12^14*d23^4*d31^6)/4 - (d12^14*d23^6*d31^4)/4 + (3*d12^14*d23^8*d31^2)/8 + (7*d12^16*d23^2*d31^6)/4 - (21*d12^16*d23^4*d31^4)/8 + (7*d12^16*d23^6*d31^2)/4 - d12^18*d23^2*d31^4 - d12^18*d23^4*d31^2 + d12^20*d23^2*d31^2);
    di14c = ((21*d12^10*d23^14)/16 - (27*d12^8*d23^16)/64 + (65*d12^12*d23^12)/32 - (193*d12^14*d23^10)/16 + (1521*d12^16*d23^8)/64 - (47*d12^18*d23^6)/2 + (71*d12^20*d23^4)/8 - (27*d12^8*d31^16)/64 + (21*d12^10*d31^14)/16 + (65*d12^12*d31^12)/32 - (193*d12^14*d31^10)/16 + (1521*d12^16*d31^8)/64 - (47*d12^18*d31^6)/2 + (71*d12^20*d31^4)/8 + (27*d12^8*d23^2*d31^14)/8 - (189*d12^8*d23^4*d31^12)/16 + (189*d12^8*d23^6*d31^10)/8 - (945*d12^8*d23^8*d31^8)/32 + (189*d12^8*d23^10*d31^6)/8 - (189*d12^8*d23^12*d31^4)/16 + (27*d12^8*d23^14*d31^2)/8 - (105*d12^10*d23^2*d31^12)/16 + (189*d12^10*d23^4*d31^10)/16 - (105*d12^10*d23^6*d31^8)/16 - (105*d12^10*d23^8*d31^6)/16 + (189*d12^10*d23^10*d31^4)/16 - (105*d12^10*d23^12*d31^2)/16 - (255*d12^12*d23^2*d31^10)/16 + (1455*d12^12*d23^4*d31^8)/32 - (505*d12^12*d23^6*d31^6)/8 + (1455*d12^12*d23^8*d31^4)/32 - (255*d12^12*d23^10*d31^2)/16 + (579*d12^14*d23^2*d31^8)/16 - (193*d12^14*d23^4*d31^6)/8 - (193*d12^14*d23^6*d31^4)/8 + (579*d12^14*d23^8*d31^2)/16 - (785*d12^16*d23^2*d31^6)/16 + (1619*d12^16*d23^4*d31^4)/32 - (785*d12^16*d23^6*d31^2)/16 + (47*d12^18*d23^2*d31^4)/2 + (47*d12^18*d23^4*d31^2)/2 - (71*d12^20*d23^2*d31^2)/4);
    di13c = ((33*d12^10*d23^14)/2 - (15*d12^8*d23^16)/16 - (1575*d12^12*d23^12)/16 + (1785*d12^14*d23^10)/8 - 273*d12^16*d23^8 + (387*d12^18*d23^6)/2 - (243*d12^20*d23^4)/4 - (15*d12^8*d31^16)/16 + (33*d12^10*d31^14)/2 - (1575*d12^12*d31^12)/16 + (1785*d12^14*d31^10)/8 - 273*d12^16*d31^8 + (387*d12^18*d31^6)/2 - (243*d12^20*d31^4)/4 + (21*d12^8*d23^2*d31^14)/2 - (177*d12^8*d23^4*d31^12)/4 + (195*d12^8*d23^6*d31^10)/2 - (1005*d12^8*d23^8*d31^8)/8 + (195*d12^8*d23^10*d31^6)/2 - (177*d12^8*d23^12*d31^4)/4 + (21*d12^8*d23^14*d31^2)/2 - (177*d12^10*d23^2*d31^12)/2 + (333*d12^10*d23^4*d31^10)/2 - (189*d12^10*d23^6*d31^8)/2 - (189*d12^10*d23^8*d31^6)/2 + (333*d12^10*d23^10*d31^4)/2 - (177*d12^10*d23^12*d31^2)/2 + (3141*d12^12*d23^2*d31^10)/8 - (10953*d12^12*d23^4*d31^8)/16 + (3123*d12^12*d23^6*d31^6)/4 - (10953*d12^12*d23^8*d31^4)/16 + (3141*d12^12*d23^10*d31^2)/8 - (4011*d12^14*d23^2*d31^8)/8 + (1113*d12^14*d23^4*d31^6)/4 + (1113*d12^14*d23^6*d31^4)/4 - (4011*d12^14*d23^8*d31^2)/8 + 432*d12^16*d23^2*d31^6 - 318*d12^16*d23^4*d31^4 + 432*d12^16*d23^6*d31^2 - (387*d12^18*d23^2*d31^4)/2 - (387*d12^18*d23^4*d31^2)/2 + (243*d12^20*d23^2*d31^2)/2);
    di12c = ((103*d12^8*d23^16)/16 - (d12^6*d23^18)/2 - (653*d12^10*d23^14)/8 + (7675*d12^12*d23^12)/16 - (4187*d12^14*d23^10)/4 + 1152*d12^16*d23^8 - (1419*d12^18*d23^6)/2 + (801*d12^20*d23^4)/4 - (d12^6*d31^18)/2 + (103*d12^8*d31^16)/16 - (653*d12^10*d31^14)/8 + (7675*d12^12*d31^12)/16 - (4187*d12^14*d31^10)/4 + 1152*d12^16*d31^8 - (1419*d12^18*d31^6)/2 + (801*d12^20*d31^4)/4 + (3*d12^6*d23^2*d31^16)/2 - 4*d12^6*d23^6*d31^12 + 3*d12^6*d23^8*d31^10 + 3*d12^6*d23^10*d31^8 - 4*d12^6*d23^12*d31^6 + (3*d12^6*d23^16*d31^2)/2 - (57*d12^8*d23^2*d31^14)/2 + (233*d12^8*d23^4*d31^12)/4 - (159*d12^8*d23^6*d31^10)/2 + (693*d12^8*d23^8*d31^8)/8 - (159*d12^8*d23^10*d31^6)/2 + (233*d12^8*d23^12*d31^4)/4 - (57*d12^8*d23^14*d31^2)/2 + (2369*d12^10*d23^2*d31^12)/8 - (3189*d12^10*d23^4*d31^10)/8 + (1473*d12^10*d23^6*d31^8)/8 + (1473*d12^10*d23^8*d31^6)/8 - (3189*d12^10*d23^10*d31^4)/8 + (2369*d12^10*d23^12*d31^2)/8 - (12425*d12^12*d23^2*d31^10)/8 + (40565*d12^12*d23^4*d31^8)/16 - (11695*d12^12*d23^6*d31^6)/4 + (40565*d12^12*d23^8*d31^4)/16 - (12425*d12^12*d23^10*d31^2)/8 + (7537*d12^14*d23^2*d31^8)/4 - (1675*d12^14*d23^4*d31^6)/2 - (1675*d12^14*d23^6*d31^4)/2 + (7537*d12^14*d23^8*d31^2)/4 - 1548*d12^16*d23^2*d31^6 + 792*d12^16*d23^4*d31^4 - 1548*d12^16*d23^6*d31^2 + (1419*d12^18*d23^2*d31^4)/2 + (1419*d12^18*d23^4*d31^2)/2 - (801*d12^20*d23^2*d31^2)/2);
    di11c = ((79*d12^8*d23^16)/2 - 2*d12^6*d23^18 - (225*d12^10*d23^14)/2 - 424*d12^12*d23^12 + (3119*d12^14*d23^10)/2 - (3813*d12^16*d23^8)/2 + 1170*d12^18*d23^6 - 324*d12^20*d23^4 - 2*d12^6*d31^18 + (79*d12^8*d31^16)/2 - (225*d12^10*d31^14)/2 - 424*d12^12*d31^12 + (3119*d12^14*d31^10)/2 - (3813*d12^16*d31^8)/2 + 1170*d12^18*d31^6 - 324*d12^20*d31^4 + 6*d12^6*d23^2*d31^16 - 16*d12^6*d23^6*d31^12 + 12*d12^6*d23^8*d31^10 + 12*d12^6*d23^10*d31^8 - 16*d12^6*d23^12*d31^6 + 6*d12^6*d23^16*d31^2 - 132*d12^8*d23^2*d31^14 + 322*d12^8*d23^4*d31^12 - 732*d12^8*d23^6*d31^10 + 1005*d12^8*d23^8*d31^8 - 732*d12^8*d23^10*d31^6 + 322*d12^8*d23^12*d31^4 - 132*d12^8*d23^14*d31^2 + (437*d12^10*d23^2*d31^12)/2 - (985*d12^10*d23^4*d31^10)/2 + (773*d12^10*d23^6*d31^8)/2 + (773*d12^10*d23^8*d31^6)/2 - (985*d12^10*d23^10*d31^4)/2 + (437*d12^10*d23^12*d31^2)/2 + 2164*d12^12*d23^2*d31^10 - 4328*d12^12*d23^4*d31^8 + 5176*d12^12*d23^6*d31^6 - 4328*d12^12*d23^8*d31^4 + 2164*d12^12*d23^10*d31^2 - (5773*d12^14*d23^2*d31^8)/2 + 1327*d12^14*d23^4*d31^6 + 1327*d12^14*d23^6*d31^4 - (5773*d12^14*d23^8*d31^2)/2 + 2538*d12^16*d23^2*d31^6 - 1263*d12^16*d23^4*d31^4 + 2538*d12^16*d23^6*d31^2 - 1170*d12^18*d23^2*d31^4 - 1170*d12^18*d23^4*d31^2 + 648*d12^20*d23^2*d31^2);
    di10c = (417*d12^10*d23^14 - (189*d12^8*d23^16)/4 - 498*d12^12*d23^12 - 345*d12^14*d23^10 + (3927*d12^16*d23^8)/4 - 738*d12^18*d23^6 + (459*d12^20*d23^4)/2 - (189*d12^8*d31^16)/4 + 417*d12^10*d31^14 - 498*d12^12*d31^12 - 345*d12^14*d31^10 + (3927*d12^16*d31^8)/4 - 738*d12^18*d31^6 + (459*d12^20*d31^4)/2 - 30*d12^8*d23^2*d31^14 + 357*d12^8*d23^4*d31^12 - 402*d12^8*d23^6*d31^10 + (489*d12^8*d23^8*d31^8)/2 - 402*d12^8*d23^10*d31^6 + 357*d12^8*d23^12*d31^4 - 30*d12^8*d23^14*d31^2 - 645*d12^10*d23^2*d31^12 + 969*d12^10*d23^4*d31^10 - 741*d12^10*d23^6*d31^8 - 741*d12^10*d23^8*d31^6 + 969*d12^10*d23^10*d31^4 - 645*d12^10*d23^12*d31^2 - 1416*d12^12*d23^2*d31^10 + 4386*d12^12*d23^4*d31^8 - 4944*d12^12*d23^6*d31^6 + 4386*d12^12*d23^8*d31^4 - 1416*d12^12*d23^10*d31^2 + 1995*d12^14*d23^2*d31^8 - 1650*d12^14*d23^4*d31^6 - 1650*d12^14*d23^6*d31^4 + 1995*d12^14*d23^8*d31^2 - 1863*d12^16*d23^2*d31^6 + (3525*d12^16*d23^4*d31^4)/2 - 1863*d12^16*d23^6*d31^2 + 738*d12^18*d23^2*d31^4 + 738*d12^18*d23^4*d31^2 - 459*d12^20*d23^2*d31^2);
    di9c = (8*d12^6*d23^18 - 31*d12^8*d23^16 - 278*d12^10*d23^14 + 851*d12^12*d23^12 - 892*d12^14*d23^10 + 423*d12^16*d23^8 - 54*d12^18*d23^6 - 27*d12^20*d23^4 + 8*d12^6*d31^18 - 31*d12^8*d31^16 - 278*d12^10*d31^14 + 851*d12^12*d31^12 - 892*d12^14*d31^10 + 423*d12^16*d31^8 - 54*d12^18*d31^6 - 27*d12^20*d31^4 - 24*d12^6*d23^2*d31^16 + 64*d12^6*d23^6*d31^12 - 48*d12^6*d23^8*d31^10 - 48*d12^6*d23^10*d31^8 + 64*d12^6*d23^12*d31^6 - 24*d12^6*d23^16*d31^2 + 360*d12^8*d23^2*d31^14 - 1028*d12^8*d23^4*d31^12 + 1368*d12^8*d23^6*d31^10 - 1338*d12^8*d23^8*d31^8 + 1368*d12^8*d23^10*d31^6 - 1028*d12^8*d23^12*d31^4 + 360*d12^8*d23^14*d31^2 + 110*d12^10*d23^2*d31^12 - 198*d12^10*d23^4*d31^10 + 366*d12^10*d23^6*d31^8 + 366*d12^10*d23^8*d31^6 - 198*d12^10*d23^10*d31^4 + 110*d12^10*d23^12*d31^2 + 478*d12^12*d23^2*d31^10 - 2147*d12^12*d23^4*d31^8 + 1636*d12^12*d23^6*d31^6 - 2147*d12^12*d23^8*d31^4 + 478*d12^12*d23^10*d31^2 - 460*d12^14*d23^2*d31^8 + 1352*d12^14*d23^4*d31^6 + 1352*d12^14*d23^6*d31^4 - 460*d12^14*d23^8*d31^2 + 324*d12^16*d23^2*d31^6 - 1494*d12^16*d23^4*d31^4 + 324*d12^16*d23^6*d31^2 + 54*d12^18*d23^2*d31^4 + 54*d12^18*d23^4*d31^2 + 54*d12^20*d23^2*d31^2);
    di8c = (8*d12^6*d23^18 - 95*d12^8*d23^16 + 354*d12^10*d23^14 - 653*d12^12*d23^12 + 692*d12^14*d23^10 - 441*d12^16*d23^8 + 162*d12^18*d23^6 - 27*d12^20*d23^4 + 8*d12^6*d31^18 - 95*d12^8*d31^16 + 354*d12^10*d31^14 - 653*d12^12*d31^12 + 692*d12^14*d31^10 - 441*d12^16*d31^8 + 162*d12^18*d31^6 - 27*d12^20*d31^4 - 24*d12^6*d23^2*d31^16 + 64*d12^6*d23^6*d31^12 - 48*d12^6*d23^8*d31^10 - 48*d12^6*d23^10*d31^8 + 64*d12^6*d23^12*d31^6 - 24*d12^6*d23^16*d31^2 + 360*d12^8*d23^2*d31^14 - 772*d12^8*d23^4*d31^12 + 1368*d12^8*d23^6*d31^10 - 1722*d12^8*d23^8*d31^8 + 1368*d12^8*d23^10*d31^6 - 772*d12^8*d23^12*d31^4 + 360*d12^8*d23^14*d31^2 - 874*d12^10*d23^2*d31^12 + 1010*d12^10*d23^4*d31^10 - 490*d12^10*d23^6*d31^8 - 490*d12^10*d23^8*d31^6 + 1010*d12^10*d23^10*d31^4 - 874*d12^10*d23^12*d31^2 + 926*d12^12*d23^2*d31^10 - 643*d12^12*d23^4*d31^8 + 740*d12^12*d23^6*d31^6 - 643*d12^12*d23^8*d31^4 + 926*d12^12*d23^10*d31^2 - 604*d12^14*d23^2*d31^8 - 88*d12^14*d23^4*d31^6 - 88*d12^14*d23^6*d31^4 - 604*d12^14*d23^8*d31^2 + 324*d12^16*d23^2*d31^6 + 234*d12^16*d23^4*d31^4 + 324*d12^16*d23^6*d31^2 - 162*d12^18*d23^2*d31^4 - 162*d12^18*d23^4*d31^2 + 54*d12^20*d23^2*d31^2);

    p5c = 8*d12^6;
    p4c = (- 21*d12^6 - 22*d12^4*d23^2 - 22*d12^4*d31^2 + 3*d12^2*d23^4 - 6*d12^2*d23^2*d31^2 + 3*d12^2*d31^4);
    p3c = (12*d12^6 + 40*d12^4*d23^2 + 40*d12^4*d31^2 + 12*d12^2*d23^4 - 24*d12^2*d23^2*d31^2 + 12*d12^2*d31^4);
    p2c = (12*d12^6 - 24*d12^4*d23^2 - 24*d12^4*d31^2 + 12*d12^2*d23^4 - 24*d12^2*d23^2*d31^2 + 12*d12^2*d31^4);

    d10c = (-16*d12^12);
    d9c = (48*d12^12 + 160*d12^10*d23^2 + 160*d12^10*d31^2 - 48*d12^8*d23^4 + 96*d12^8*d23^2*d31^2 - 48*d12^8*d31^4);
    d8c = (45*d12^12 - 820*d12^10*d23^2 - 820*d12^10*d31^2 + 110*d12^8*d23^4 - 524*d12^8*d23^2*d31^2 + 110*d12^8*d31^4 + 12*d12^6*d23^6 - 12*d12^6*d23^4*d31^2 - 12*d12^6*d23^2*d31^4 + 12*d12^6*d31^6 - 3*d12^4*d23^8 + 12*d12^4*d23^6*d31^2 - 18*d12^4*d23^4*d31^4 + 12*d12^4*d23^2*d31^6 - 3*d12^4*d31^8);
    d7c = (1376*d12^10*d23^2 - 280*d12^12 + 1376*d12^10*d31^2 + 112*d12^8*d23^4 + 1440*d12^8*d23^2*d31^2 + 112*d12^8*d31^4 + 96*d12^6*d23^6 - 96*d12^6*d23^4*d31^2 - 96*d12^6*d23^2*d31^4 + 96*d12^6*d31^6 - 24*d12^4*d23^8 + 96*d12^4*d23^6*d31^2 - 144*d12^4*d23^4*d31^4 + 96*d12^4*d23^2*d31^6 - 24*d12^4*d31^8);
    d6c = (312*d12^12 - 736*d12^10*d23^2 - 736*d12^10*d31^2 - 560*d12^8*d23^4 - 2080*d12^8*d23^2*d31^2 - 560*d12^8*d31^4 + 32*d12^6*d23^6 - 32*d12^6*d23^4*d31^2 - 32*d12^6*d23^2*d31^4 + 32*d12^6*d31^6 - 72*d12^4*d23^8 + 288*d12^4*d23^6*d31^2 - 432*d12^4*d23^4*d31^4 + 288*d12^4*d23^2*d31^6 - 72*d12^4*d31^8);
    d5c = (448*d12^8*d23^4 - 128*d12^10*d23^2 - 128*d12^10*d31^2 - 96*d12^12 + 1664*d12^8*d23^2*d31^2 + 448*d12^8*d31^4 - 128*d12^6*d23^6 + 128*d12^6*d23^4*d31^2 + 128*d12^6*d23^2*d31^4 - 128*d12^6*d31^6 - 96*d12^4*d23^8 + 384*d12^4*d23^6*d31^2 - 576*d12^4*d23^4*d31^4 + 384*d12^4*d23^2*d31^6 - 96*d12^4*d31^8);
    d4c = (- 48*d12^12 + 192*d12^10*d23^2 + 192*d12^10*d31^2 - 288*d12^8*d23^4 - 192*d12^8*d23^2*d31^2 - 288*d12^8*d31^4 + 192*d12^6*d23^6 - 192*d12^6*d23^4*d31^2 - 192*d12^6*d23^2*d31^4 + 192*d12^6*d31^6 - 48*d12^4*d23^8 + 192*d12^4*d23^6*d31^2 - 288*d12^4*d23^4*d31^4 + 192*d12^4*d23^2*d31^6 - 48*d12^4*d31^8);

    rdi = roots([di15c di14c di13c di12c di11c di10c di9c di8c]);
    rp = roots([p5c p4c p3c p2c]);
    rd = roots([d10c d9c d8c d7c d6c d5c d4c]);

    rdi1 = rdi(imag(rdi)==0);
    rp1 = rp(imag(rp)==0);
    rd1 = rd(imag(rd)==0);

    rgdi = region_select(7,di15c,rdi1,1);
    rgp = region_select(3,p5c,rp1,1);
    rgd = region_select(6,d10c,rd1,1);

    region_or(rgp,rgd);
    region_and(rgdi, region_or(rgp,rgd));
    final_rg1 = region_and(region_and(rgdi, region_or(rgp,rgd)),[inf;0]);
    region = final_rg1;
    % check k = 2
    if 2*(d31^2+d23^2)-9*d12^2>=0
        final_rg2 = region_remove(final_rg1);
        region = final_rg2;
    end
end

end

function [rgs]= region_select(order, high_coeff, ros, pn)
% Get sets from equation roots.
if mod(order,2)==1
    if (high_coeff>0 && pn>0) || (high_coeff<0 && pn<0)
        rgs = [inf; ros];
    elseif (high_coeff>0 && pn<0) || (high_coeff<0 && pn>0)
        rgs = [ros; -inf];
    end
elseif mod(order,2)==0
    if (high_coeff>0 && pn>0) || (high_coeff<0 && pn<0)
        rgs = [inf; ros; -inf];
    elseif (high_coeff>0 && pn<0) || (high_coeff<0 && pn>0)
        rgs = ros;
    end
end     
rgs = sort(rgs,'descend');
end

function [rg] = region_and(rg1,rg2)
% all sets &&
rg = [];
for i = 1:2:size(rg1,1)-1
    for j = 1:2:size(rg2,1)-1
        temp_rg = region_inter(rg1(i:i+1),rg2(j:j+1));
        rg = union(rg,temp_rg);
        rg = sort(rg,'descend');
    end
end

end

function [rg] = region_inter(rg1,rg2)
% sets &&
if (rg2(2) >= rg1(1)) || (rg2(1) <= rg1(2))
    rg = [];
else
    rg = [min([rg1(1),rg2(1)]); max([rg1(2),rg2(2)])];
end
end

function [rg] = region_or(rg1,rg2)
% all sets ||
rg = rg1;
for j = 1:2:size(rg2,1)-1
    rg = region_or_temp(rg,rg2(j:j+1));
end
end

function [rg] = region_or_temp(rg1,rg2)
% sets ||
rg = [];
temp_rg = sort(union(rg1,rg2),'descend');
ind1 = find(temp_rg==rg2(1));
ind2 = find(temp_rg==rg2(2));
if (mod(ind1,2)==1) && (mod(ind2,2)==1)
    rg_u1 = rg1(1:ind1-1);
    rg_u2 = [rg2(1);temp_rg(ind2+1)];
    rg_u3 = temp_rg(ind2+2:end);
    rg = sort(union(union(rg_u1,rg_u2),rg_u3),'descend');
elseif (mod(ind1,2)==1) && (mod(ind2,2)==0)
    rg_u1 = rg1(1:ind1-1);
    rg_u2 = [rg2(1);temp_rg(ind2)];
    rg_u3 = temp_rg(ind2+1:end);
    rg = sort(union(union(rg_u1,rg_u2),rg_u3),'descend');
elseif (mod(ind1,2)==0) && (mod(ind2,2)==0)
    rg_u1 = rg1(1:ind1-2);
    rg_u2 = [temp_rg(ind1-1);temp_rg(ind2)];
    rg_u3 = temp_rg(ind2+1:end);
    rg = sort(union(union(rg_u1,rg_u2),rg_u3),'descend');
elseif (mod(ind1,2)==0) && (mod(ind2,2)==1)
    rg_u1 = rg1(1:ind1-2);
    rg_u2 = [temp_rg(ind1-1);temp_rg(ind2+1)];
    rg_u3 = temp_rg(ind2+1:end);
    rg = sort(union(union(rg_u1,rg_u2),rg_u3),'descend');
end
end

function [rg] = region_remove(rg1)
% remove 2 from the region if it is inside the region.
rg = rg1;
for i = 1:2:size(rg1,1)-1
    if rg1(i)>2 && rg1(i+1)<2
        rg = [rg1(1:i);2;2;rg1(i+1:end)];
    end
end

end