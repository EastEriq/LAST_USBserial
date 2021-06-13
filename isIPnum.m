function isIP=isIPnum(address)
% checks if a string has the format of an IPv4 address, 123.123.123.123
%  (not rigorously, returns true even for numbers>256)
         isIP=~isempty(regexp(address,...
             '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$', 'once'));