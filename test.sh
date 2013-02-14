o=`tempfile -p out-`
e=`tempfile -p err-`
perl txt2xml  << EOS > $o 2> $e
domain name=address1 data_type char size 75
EOS
if [ "$?" != "0" ] ; then
    cat <<EOS
unexpected failure! on input
domain name=address1 data_type char size 75
expected:
<domain name = "address1" data_type = "char" size = "75"/>
got:
EOS
cat $e
else
     cmp -s - $o <<EOS
<domain name = "address1" data_type = "char" size = "75"/>
EOS
fi

if [ "$?" != "0" ] ; then
  cat <<EOS
fail! expected:
<domain name = "address1" data_type = "char" size = "75"/>
got:
EOS
  cat $o
fi
rm -f $o $e

o=`tempfile -p out-`
e=`tempfile -p err-`
perl txt2xml  << EOS > $o 2> $e
domain name  =  address2 data_type char size 75
EOS
if [ "$?" != "0" ] ; then
    cat <<EOS
unexpected failure! on input
domain name  =  address2 data_type char size 75
expected:
<domain name = "address2" data_type = "char" size = "75"/>
got:
EOS
cat $e
else
     cmp -s - $o <<EOS
<domain name = "address2" data_type = "char" size = "75"/>
EOS
fi

if [ "$?" != "0" ] ; then
  cat <<EOS
fail! expected:
<domain name = "address2" data_type = "char" size = "75"/>
got:
EOS
  cat $o
fi
rm -f $o $e

o=`tempfile -p out-`
e=`tempfile -p err-`
perl txt2xml  << EOS > $o 2> $e
domains
EOS
if [ "$?" != "0" ] ; then
    cat <<EOS
unexpected failure! on input
domains
expected:
<domains/>
got:
EOS
cat $e
else
     cmp -s - $o <<EOS
<domains/>
EOS
fi

if [ "$?" != "0" ] ; then
  cat <<EOS
fail! expected:
<domains/>
got:
EOS
  cat $o
fi
rm -f $o $e

o=`tempfile -p out-`
e=`tempfile -p err-`
perl txt2xml  << EOS > $o 2> $e
domain name = name data_type char size=75
EOS
if [ "$?" != "0" ] ; then
    cat <<EOS
unexpected failure! on input
domain name = name data_type char size=75
expected:
<domain name = "name" data_type = "char" size = "75"/>
got:
EOS
cat $e
else
     cmp -s - $o <<EOS
<domain name = "name" data_type = "char" size = "75"/>
EOS
fi

if [ "$?" != "0" ] ; then
  cat <<EOS
fail! expected:
<domain name = "name" data_type = "char" size = "75"/>
got:
EOS
  cat $o
fi
rm -f $o $e

o=`tempfile -p out-`
e=`tempfile -p err-`
perl txt2xml  << EOS > $o 2> $e
domain name =  "city" data_type=char size 50
EOS
if [ "$?" != "0" ] ; then
    cat <<EOS
unexpected failure! on input
domain name =  "city" data_type=char size 50
expected:
<domain name = "city" data_type = "char" size = "50"/>
got:
EOS
cat $e
else
     cmp -s - $o <<EOS
<domain name = "city" data_type = "char" size = "50"/>
EOS
fi

if [ "$?" != "0" ] ; then
  cat <<EOS
fail! expected:
<domain name = "city" data_type = "char" size = "50"/>
got:
EOS
  cat $o
fi
rm -f $o $e

o=`tempfile -p out-`
e=`tempfile -p err-`
perl txt2xml  << EOS > $o 2> $e
domain name =  "equal" data_type=\= comment="data type is = sign" 
EOS
if [ "$?" != "0" ] ; then
    cat <<EOS
unexpected failure! on input
domain name =  "equal" data_type=\= comment="data type is = sign" 
expected:
<domain name = "equal" data_type = "\=" comment = "data type is = sign"/>
got:
EOS
cat $e
else
     cmp -s - $o <<EOS
<domain name = "equal" data_type = "\=" comment = "data type is = sign"/>
EOS
fi

if [ "$?" != "0" ] ; then
  cat <<EOS
fail! expected:
<domain name = "equal" data_type = "\=" comment = "data type is = sign"/>
got:
EOS
  cat $o
fi
rm -f $o $e

o=`tempfile -p out-`
e=`tempfile -p err-`
perl txt2xml  << EOS > $o 2> $e
domain name comment comment = "Comment with \"quoted\" word"
EOS
if [ "$?" != "0" ] ; then
    cat <<EOS
unexpected failure! on input
domain name comment comment = "Comment with \"quoted\" word"
expected:
<domain name = "comment" comment = "Comment with \&quot;quoted\&quot; word"/>
got:
EOS
cat $e
else
     cmp -s - $o <<EOS
<domain name = "comment" comment = "Comment with \&quot;quoted\&quot; word"/>
EOS
fi

if [ "$?" != "0" ] ; then
  cat <<EOS
fail! expected:
<domain name = "comment" comment = "Comment with \&quot;quoted\&quot; word"/>
got:
EOS
  cat $o
fi
rm -f $o $e

o=`tempfile -p out-`
e=`tempfile -p err-`
perl txt2xml  << EOS > $o 2> $e
name name name =
EOS
if [ "$?" = "0" ] ; then
cat <<EOS
unexpected success on input
name name name =
EOS
fi
rm -f $o $e

o=`tempfile -p out-`
e=`tempfile -p err-`
perl txt2xml --tag column --attribute name << EOS > $o 2> $e
login data_type = "char"
EOS
if [ "$?" != "0" ] ; then
    cat <<EOS
unexpected failure! on input
login data_type = "char"
expected:
<column name = "login" data_type = "char"/>
got:
EOS
cat $e
else
     cmp -s - $o <<EOS
<column name = "login" data_type = "char"/>
EOS
fi

if [ "$?" != "0" ] ; then
  cat <<EOS
fail! expected:
<column name = "login" data_type = "char"/>
got:
EOS
  cat $o
fi
rm -f $o $e

o=`tempfile -p out-`
e=`tempfile -p err-`
perl txt2xml -a name << EOS > $o 2> $e
$(cat examples/state-machine.txt)
EOS
if [ "$?" != "0" ] ; then
    cat <<EOS
unexpected failure! on input
$(cat examples/state-machine.txt)
expected:
$(cat examples/state-machine.xml)
got:
EOS
cat $e
else
     cmp -s - $o <<EOS
$(cat examples/state-machine.xml)
EOS
fi

if [ "$?" != "0" ] ; then
  cat <<EOS
fail! expected:
$(cat examples/state-machine.xml)
got:
EOS
  cat $o
fi
rm -f $o $e

