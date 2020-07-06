# LAST_USBserial
Utilities for disambiguating names of USB-serial ports

**Problem:** serial adapters connected to the computer take arbitrary names (e.g. `/dev/USB0`, `/dev/USB1`, ..., `/dev/ACM0`, ...). 
This is a hindrance when several serial devices are present, and need to be uniquely addressed.

**Solution:** retrieve long identifiers of each serial adapter, including chip type and serial number. These names can help to
associate uniquely the device to the physical USB-serial adapter connected to it.

The association is derived in linux, reading the contents of the peudodirectory `/dev/serial/by-id`, and resolving the symbolic links.
