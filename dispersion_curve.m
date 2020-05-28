classdef dispersion_curve
    
    properties (SetAccess = private)
        OSNRreqs
        residual_disp
        required_BER
        number_of_points = 0
        description = "Unkonwn dispersion curve"
    end
    
    methods
        
        function obj = dispersion_curve(OSNRs, disps, BER, varargin)
            obj.OSNRreqs = OSNRs;
            obj.residual_disp = disps;
            obj.required_BER = BER;
            if ~isempty(varargin)
                obj.description = varargin{1};
            end
            if length(obj.OSNRreqs) ~= length(obj.residual_disp)
                error("Inconsistency of lengths(OSNR) and length(disps)")
            end
            obj.number_of_points = length(obj.OSNRreqs);
        end
        
        function obj = set.OSNRreqs(obj, OSNR)
            if isa(OSNR, 'double')
                obj.OSNRreqs = OSNR;
            else
                error('Invalid OSNR')
            end
        end
        
        function obj = set.residual_disp(obj, disps)
            if isa(disps, 'double')
                obj.residual_disp = disps;
            else
                error('Invalid disp')
            end
        end
        
        function obj = set.required_BER(obj, BER)
            if isa(BER, 'double')
                obj.required_BER = BER;
            else
                error('Invalid BER');
            end
        end
        
    end
    
    methods (Static)
        
        function res_fig = onePlot(curves, paramsForPlot)
            numb_of_curves = length(curves);
            res_fig = figure;
            set(gca,paramsForPlot.optAxes{:});
            hold on;
            for k = 1:numb_of_curves
                plot(curves(k).residual_disp, curves(k).OSNRreqs, paramsForPlot.optPlot{:})
            end
            xlabel(paramsForPlot.xname, paramsForPlot.optLabels{:});
            ylabel(paramsForPlot.yname, paramsForPlot.optLabels{:});
            names=[curves(:).description];
            legend(names,paramsForPlot.optLegends{:});
            hold off;
        end
        
    end
end