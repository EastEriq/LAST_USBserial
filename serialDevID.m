function IDstring=serialDevID(port)

% find identifier names for USB-serial converters connected to the USB
%  ports. A problem with non-serial locked drivers is that the enumeration
% of a dongle connected to an arbitrarily port is can take any value.

% port: character array, e.g. '/dev/ttyUSB0' or '/dev/ttyACM0'

% in Linux (ubuntu XX):

% strip '/dev/'
sport=strrep(port,'/dev/','');

IDstring='';

if exist('/dev/serial/by-id','file')
    [~,IDstring]=unix(['find /dev/serial/by-id -type l -printf ''%l %p\n'' |grep ' ...
                          sport '| cut -d" " -f2']);
end

IDstring=strrep(IDstring(1:end-1),'/dev/serial/by-id/','');
