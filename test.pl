#!/usr/bin/perl

use strict;

our @data;
BEGIN { print "<tests>\n" }
END { print "</tests>\n" }

sub add_data {
    s/</&lt;/g;
    s/>/&gt;/g;
    push @data, $_;
}

while (<DATA>) {
  chomp;
  my $emit;
  if (/^$/) {
    if (@data) {
      $emit = 1;
    }
    else {
      next;
    }
  }
  elsif (eof) {
    add_data;
    $emit = 1;
  }

  if ($emit) {
    my $args;
    if ($data[0] =~ /^-/) {
      $args = shift @data;
    }

    print <<EOS;
<test type="$data[0]" args="$args">
    <input>$data[1]</input>
EOS
    if (defined $data[2]) {
      print <<EOS;
    <expected>$data[2]</expected>
EOS
    }
    print <<EOS;
</test>
EOS
    @data = ();
  }
  else {
    add_data;
  }
}

__END__
pass
domain name=address1 data_type char size 75
<domain name = "address1" data_type = "char" size = "75"/>

pass
domain name  =  address2 data_type char size 75
<domain name = "address2" data_type = "char" size = "75"/>

pass
domains
<domains/>

pass
domain name = name data_type char size=75
<domain name = "name" data_type = "char" size = "75"/>

pass
domain name =  "city" data_type=char size 50
<domain name = "city" data_type = "char" size = "50"/>

pass
domain name =  "equal" data_type=\= comment="data type is = sign" 
<domain name = "equal" data_type = "\=" comment = "data type is = sign"/>


pass
domain name comment comment = "Comment with \"quoted\" word"
<domain name = "comment" comment = "Comment with \&amp;quot;quoted\&amp;quot; word"/>

fail
name name name =

--tag column --attribute name
pass
login data_type = "char"
<column name = "login" data_type = "char"/>

-a name
pass
$(cat examples/state-machine.txt)
$(cat examples/state-machine.xml)
