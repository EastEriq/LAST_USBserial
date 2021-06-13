function isPCI=isPCIusb(address)
% checks if a string has the format of physical address of an USB port
%  connected to the PCI bridge, like e.g.  pci-0000:45:00.1-usb-0:1:1.0
%  (approximate: check only that it is a string which begnis with 'pci-', 
%  splittable by ':' and which contains 'usb' somewhere) 
         parts=split(address,':');
         isPCI = contains(parts(1),'pci-') & any(contains(parts(2:end),'usb'));