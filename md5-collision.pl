# from http://www.hyuki.com/cr/#crcontents


#
# This script is based on the article
# "Collisions for Hash Functions
#  MD4, MD5, HAVAL-128 and RIPEMD
#  by Xiaoyun Wang, Dengguo Feng, Xuejia Lai, Hongbo Yu".
# http://eprint.iacr.org/2004/199.pdf
#
# ...and these web pages.
# http://www.rtfm.com/movabletype/archives/2004_08.html#001055
# http://slashdot.jp/comments.pl?sid=203703&cid=607766
#
# This script is written by Hiroshi Yuki. (Thanks to aurora-san!)
#
use strict;
use Digest::MD5 qw(md5_hex);

my $a = <<"EOD";
d1  31  dd  02  c5  e6  ee  c4  69  3d  9a  06  98  af  f9  5c
2f  ca  b5  87  12  46  7e  ab  40  04  58  3e  b8  fb  7f  89
55  ad  34  06  09  f4  b3  02  83  e4  88  83  25  71  41  5a
08  51  25  e8  f7  cd  c9  9f  d9  1d  bd  f2  80  37  3c  5b
d8  82  3e  31  56  34  8f  5b  ae  6d  ac  d4  36  c9  19  c6
dd  53  e2  b4  87  da  03  fd  02  39  63  06  d2  48  cd  a0
e9  9f  33  42  0f  57  7e  e8  ce  54  b6  70  80  a8  0d  1e
c6  98  21  bc  b6  a8  83  93  96  f9  65  2b  6f  f7  2a  70
EOD
my $b = <<"EOD";
d1  31  dd  02  c5  e6  ee  c4  69  3d  9a  06  98  af  f9  5c
2f  ca  b5  07  12  46  7e  ab  40  04  58  3e  b8  fb  7f  89
55  ad  34  06  09  f4  b3  02  83  e4  88  83  25  f1  41  5a
08  51  25  e8  f7  cd  c9  9f  d9  1d  bd  72  80  37  3c  5b
d8  82  3e  31  56  34  8f  5b  ae  6d  ac  d4  36  c9  19  c6
dd  53  e2  34  87  da  03  fd  02  39  63  06  d2  48  cd  a0
e9  9f  33  42  0f  57  7e  e8  ce  54  b6  70  80  28  0d  1e
c6  98  21  bc  b6  a8  83  93  96  f9  65  ab  6f  f7  2a  70
EOD

print "Message A:\n", $a;
print "Message B:\n", $b;

$a =~ s/\s+//g;
$b =~ s/\s+//g;

$a = pack("H*", $a);
$b = pack("H*", $b);

print "MD5(A) = ", md5_hex($a), "\n";
print "MD5(B) = ", md5_hex($b), "\n";

open(FILE, "> a.dat") or die;
binmode(FILE);
print FILE $a;
close(FILE);

open(FILE, "> b.dat") or die;
binmode(FILE);
print FILE $b;
close(FILE);
