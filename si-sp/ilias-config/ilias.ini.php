; <?php exit; ?>
[server]
http_path = "http://192.168.1.64"
absolute_path = "/var/www/html/ilias"
presetting = ""
timezone = "Europe/Paris"

[clients]
path = "data"
inifile = "client.ini.php"
datadir = "/home/www-data/iliasdata"
default = "ilias"
list = "0"

[setup]
pass = "63a9f0ea7bb98050796b649e85481845"

[tools]
convert = "/usr/bin/convert"
zip = "/usr/bin/zip"
unzip = "/usr/bin/unzip"
java = ""
ffmpeg = ""
ghostscript = "/usr/bin/gs"
latex = ""
vscantype = "none"
scancommand = ""
cleancommand = ""
enable_system_styles_management = ""
lessc = ""

[log]
path = "/var/log/iliaslog"
file = "ilias.log"
enabled = "1"
level = "WARNING"
error_path = "/var/log"

[debian]
data_dir = "/var/opt/ilias"
log = "/var/log/ilias/ilias.log"
convert = "/usr/bin/convert"
zip = "/usr/bin/zip"
unzip = "/usr/bin/unzip"
java = ""
ffmpeg = "/usr/bin/ffmpeg"

[redhat]
data_dir = ""
log = ""
convert = ""
zip = ""
unzip = ""
java = ""

[suse]
data_dir = ""
log = ""
convert = ""
zip = ""
unzip = ""
java = ""

[https]
auto_https_detect_enabled = "0"
auto_https_detect_header_name = ""
auto_https_detect_header_value = ""
