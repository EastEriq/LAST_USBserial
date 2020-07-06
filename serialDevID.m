function [IDstrings,ports]=serialDevID(ports)
% find identifier names for USB-serial converters connected to the USB
%  ports. A problem with non-serial locked drivers is that the enumeration
% of a dongle connected to an arbitrarily port can take any value.

% port: single character or string array, e.g. '/dev/ttyUSB0', for a single port
%       or string array, e.g. ["/dev/ttyUSB0","/dev/ttyACM0"], serialportlist('all')

% Empty IDstrings are returned for nonexisting ports or ports which are not
%   virtual ports created by USB converters, e.g. real physical ports (/dev/ttyS*) 

% Example: [IDs,names]=serialDevID(serialportlist)

% using strings, i.e. working only in matlab>2017a

% In Linux (ubuntu XX): resolve the symlinks in the pseudodir /dev/serial/by-id 

if ~exist('ports','var')
    ports=serialportlist('all');
end

% set up for single or multiple ports
if isa(ports,'string') && length(ports)>1
    nports=length(ports);
else
    nports=1;
    ports=string(ports);
end
IDstrings(1:nports)="";

for i=1:nports
    % strip '/dev/'
    portID=strrep(char(ports(i)),'/dev/','');
    IDstring='';
    if exist('/dev/serial/by-id','file')
        [~,IDstring]=unix(['find /dev/serial/by-id -type l -printf ''%l %p\n'' |grep ' ...
            portID '| cut -d" " -f2']);
    end    
    IDstrings(i)=strrep(IDstring(1:end-1),'/dev/serial/by-id/','');
end
