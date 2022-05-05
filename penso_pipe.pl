# Ultima Alteracao: Andre Antonioli - 08/03/2022

$|=1;
use MIME::Base64;

while(<STDIN>) {
	
	if ( $_ =~ m!^From:\s([A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6})!gmis) {
		$from = $1;
	}

	if ( $_ =~ m!^To:\s([A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6})!gmis) {
		$to = $1;
	}
	#if ( $_ =~ m!xxxxxmbox01.aws.xxxx.com.br!gmis) {
	#	$_ =~ s/xxxxmbox01.aws.xxxx.com.br/teste.com.br/;
	#}

!gmis) {if ( $_ =~ m!
//;		$_ =~ s/
	}

        $message .= $_;
}

open OUT, "> /dev/shm/msg.$$";
print OUT $message ;
close OUT;

system("/usr/sbin/sendmail -G -i -f $from -- $to < /dev/shm/msg.$$");
#system("/usr/bin//mac2unix -n /dev/shm/msg.$$ /dev/shm/msg.$$.conv; /usr/sbin/sendmail -G -i -f $from -- $to < /dev/shm/msg.$$.conv");
system("/usr/bin//mac2unix -n /dev/shm/msg.$$ /dev/shm/msg.$$.conv; /usr/sbin/sendmail -G -i -f $from -- inova.teste2\@xxxxxx.org.br < /dev/shm/msg.$$.conv");

$cod_erro = $? ;

if ( $cod_erro == 0 ) {
        #system("/bin/rm -f /dev/shm/msg.$$");
}

exit $cod_erro;
