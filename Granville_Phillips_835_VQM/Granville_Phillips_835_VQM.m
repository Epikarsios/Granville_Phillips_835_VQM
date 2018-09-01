classdef Granville_Phillips_835_VQM < handle
    %GRANVILLE_PHILLIPS_835_VQM Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Current_Pressure;
        
        
        
        Log_Pressure;
         
    end
    
    methods
        
        
        function get_VQM_Data( Serial_Obj )
%get_VQM_Data Function retrives VQM data from serial(Vacuum Quality Monitor) 
%   

            query(Serial_Obj,'fetch?');   % Queries controller for data

        end
        function Get_Total_Pressure(obj, Serial_Obj )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
            fprintf(Serial_Obj,'inst etpr');
            fprintf(Serial_Obj,'outp on');
            obj.Current_Pressure = str2double(query(Serial_Obj, 'meas:pres?'));

        end
        function Add_Log_Data(obj)
           obj.Log_Pressure{end+1} = obj.Current_Pressure; 
        end
        
    end
    
end

