
% Hardware friendly implementation of peak finder
%
% Function inputs:
% * WindowLen - non-tunable parameter defined under Simulink->Edit Data
% * threhold  - input port (connected to constant)
% * DataBuff  - input port (buffering done using Simulink block)
%
% Function outputs:
% * "detected" is set when MidSample is local max

function [MidSample,detected] = fcn(threshold, DataBuff, WindowLen)
%#codegen


MidIdx = ceil(WindowLen/2);

% Compare each value in the window to the middle sample via subtraction
MidSample = DataBuff(MidIdx);
CompareOut = DataBuff - MidSample; % this is a vector

% if all values in the result are negative and the middle sample is
% greater than a threshold, it is a local max
if all(CompareOut <= 0) && (MidSample > threshold)
    detected = true;
else
    detected = false;
end
