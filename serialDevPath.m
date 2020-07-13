function [IDpaths,ports]=serialDevPath(ports)
% Find identifier names for USB-serial converters connected to the USB
%  ports. A problem with non-serial locked drivers is that the enumeration
%  of a dongle connected to an arbitrarily port can take any value.
%
% port: single character or string array, e.g. '/dev/ttyUSB0', for a single port
%       or string array, e.g. ["/dev/ttyUSB0","/dev/ttyACM0"], serialportlist('all')
%
% Empty IDstrings are returned for nonexisting ports or ports which are not
%   virtual ports created by USB converters, e.g. real physical ports (/dev/ttyS*) 
%
% Example: [IDs,names]=serialDevID(serialportlist)
%
% Using strings, i.e. working only in matlab>2017a

% In Linux (ubuntu XX): resolve the symlinks in the pseudodir /dev/serial/by-id 

if ~exist('ports','var')
    try
        ports=serialportlist('all');
    catch
        ports=seriallist; %older matlab versions
    end
end

% set up for single or multiple ports
if isa(ports,'string') && length(ports)>1
    nports=length(ports);
elseif ~isempty(ports)
    nports=1;
    ports=string(ports);
else
    nports=0;
end
IDpaths(1:nports)="";

for i=1:nports
    % strip '/dev/'
    portID=strrep(char(ports(i)),'/dev/','');
    IDstring='';
%     if exist('/sys/bus/usb-serial/devices','file')
%         [~,IDstring]=unix(['find /sys/bus/usb-serial/devices/ -type l -printf ''%l %p\n'' |grep ' ...
%             portID '| cut -d" " -f1']);
%         maybe better parse ['udevadm info --name' ports(i)] instead
%     end
%     IDpaths(i)=strrep(IDstring(1:end-1),'/dev/serial/by-id/','');
    [~,IDstring]=unix(['udevadm info --name ' char(ports(i)) '| grep ID_PATH=|cut -d= -f2']);
    IDpaths(i)=IDstring(1:end-1);
end
