classdef plotParams < handle
    
    properties
        xname = ""
        yname = ""
        optPlot = {'Linewidth',5}
        optLabels = ...
            {...
            'Interpreter','latex',...
            'FontSize', 30, ...
            'Color', 'black',...
            'FontWeight', 'bold'...
            }
        optLegends = {'FontSize',30,'Interpreter','latex'}
        optAxes = {'FontSize', 30,'FontName','Times New Roman'}
    end
end