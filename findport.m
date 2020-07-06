function port=findport(ID)
% finds the USB-serial port(s) whose long identifier is or contains the string ID
% 
% Example: findport('FTDI')

[IDstrings,ports]=serialDevID(serialportlist);

port=ports(contains(IDstrings,ID));
