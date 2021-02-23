function PortName=idpath_to_port(ID)
% Convert the physical name (IDpath) of a serial device into a logical port name
% Input  : - Physical ID name (e.g., 'pci-0000:45:00.1-usb-0:4.4:1.0').
% Output : - PortName (e.g., /dev/ttyUSB0)
% Example: PortName=idpath_to_port('pci-0000:45:00.1-usb-0:4.4:1.0')
%      By : Eran Ofek                    Feb 2021

[IDpaths,Ports]=serialDevPath;

Ind = find(strcmp(IDpaths,ID));

if isempty(Ind)
    % did not find PortName
    PortName = [];
else
    PortName = Ports{Ind};
end


    