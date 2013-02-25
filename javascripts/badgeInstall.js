var flashvars = {};
flashvars.id = 'air_badge';
flashvars.airversion = '3.1';
flashvars.appname = 'Backendless Gallery Exmample';
flashvars.appurl = 'http://rozd.github.com/backendless-examples/artifacts/gallery.air';
flashvars.imageurl = 'assets/app-image.png';
flashvars.appid = 'com.backendless.examples.flex.gallery';
flashvars.pubid = '';
flashvars.appversion = '1.0';
flashvars.installarg = '';
flashvars.launcharg = '';
flashvars.helpurl = 'help.html';
flashvars.hidehelp = 'true';
flashvars.skiptransition = 'false';
flashvars.titlecolor = '#aaff';
flashvars.buttonlabelcolor = '#aaff';
flashvars.appnamecolor = '#aaff';


var params = {};
params.wmode = 'window';
params.menu = 'false';
params.quality = 'high';

var attributes = {};

swfobject.embedSWF('install_swf/AIRInstallBadge.swf', 'badge_div', '215', '180', '9.0.115', 'install_swf/expressInstall.swf', flashvars, params, attributes);