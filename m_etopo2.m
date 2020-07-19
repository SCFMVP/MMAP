m_proj('utm','ellipse','grs80','zone',10,'lat',[49+15.7/60 49+21/60],...
        'long',[-123-15/60 -123-3/60]);      

% Uses multibeam bathymetry with 10m horizontal resolution
% Already regularly gridded in UTM coords with vector x2/y2, and
% matrix Z2.
caxis([-150 0]);
colormap([m_colmap('water',128)]);
m_shadedrelief(x2,y2,-Z2,'lightangle',-45,'gradient',8,'coord','z');

% Add some contours
hold on;

[cs,h]=contour(x2,y2,Z2,[0:20:150],'color','k');
clabel(cs,h,'fontsize',6);
hold off;

% Land parts from a previously saved high-resolution coastline
col=[255 214 140]/255; % CHS chart land colour

m_usercoast('/ocean/rich/more/mmapbase/bcgeo/PNW.mat','patch',col);
m_usercoast('/ocean/rich/more/mmapbase/bcgeo/PNWrivers.mat','patch',col);

% Lat/long AND a UTM grid
 
m_grid('tickdir','out','fontsize',12,'linest','none','xaxisloc','top','yaxisloc','right');
m_utmgrid('xcolor','b','ycolor','b','linest','-'); 

m_ruler([.5 .8],.9,'tickdir','out','ticklen',[.007 .007]);
xlabel('Vancouver Harbour','color','k'); 