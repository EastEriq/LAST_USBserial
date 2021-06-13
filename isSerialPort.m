function isSerial=isSerialPort(address)
% checks if a string has the format of logical serial port (linux)
% i.e. e.g. /dev/ttyS0, /dev/ttyUSB1, /dev/ttyACM3
         parts=split(address,'/');
         if  numel(parts)==3
             isSerial = startsWith(address,'/') & strcmp(parts(2),'dev') & ...
                 ~isempty(regexp(char(parts(3)),'tty[A-Z]*[0-9]+$','once'));
         else
             isSerial=false;
         end
               