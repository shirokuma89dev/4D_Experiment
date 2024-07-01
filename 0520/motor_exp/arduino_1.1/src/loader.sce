// This file is released under the 3-clause BSD license. See COPYING-BSD.
// Generated by builder.sce : Please, do not edit this file
// ----------------------------------------------------------------------------
//
//if win64() then
//  warning(_("This module requires a Windows x86 platform."));
//  return
//end
////
serial_path = get_absolute_file_path('loader.sce');
//
// ulink previous function with same name
[bOK, ilib] = c_link('open_serial');
if bOK then
  ulink(ilib);
end
//
[bOK, ilib] = c_link('close_serial');
if bOK then
  ulink(ilib);
end
//
[bOK, ilib] = c_link('write_serial');
if bOK then
  ulink(ilib);
end
//
[bOK, ilib] = c_link('status_serial');
if bOK then
  ulink(ilib);
end
//
[bOK, ilib] = c_link('read_serial');
if bOK then
  ulink(ilib);
end
//
[version, opts]=getversion();
if (opts(2)=='x86') then
    link(serial_path + 'libserial' + getdynlibext(), ['open_serial','close_serial','write_serial','status_serial','read_serial'],'c');
elseif (opts(2)=='x64') then
    link(serial_path + 'libserial64' + getdynlibext(), ['open_serial','close_serial','write_serial','status_serial','read_serial'],'c');
else
    disp('Unsupported architecture')
end
// remove temp. variables on stack
clear serial_path;
clear bOK;
clear ilib;
// ----------------------------------------------------------------------------
