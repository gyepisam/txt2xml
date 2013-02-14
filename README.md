<A name="toc3-0" title="Description" />
### Description

txt2xml converts indented text data to xml.

The purpose of txt2xml is to make it possible to edit data in a simplified 
and editor, both human and text, friendly way while without incurring any conversion
cost.

In my particular case, I use [GSL] (http://github.com/imatix/gsl) for code generation,
schema construction, state machine, etc but I don't particular like editing XML so
this tool allows me to have the best of both worlds.

<A name="toc3-13" title="Format " />
### Format 

The format consists of lines text representing xml tags and attributes
where each line is indented to denote hierarchical placement.

The format looks quite similarly to well formatted XML, but without
brackets, end tags and most xml quoting.

A line consists of tag name followed by any number of attribute name value pairs.

Each attribute name value pair can be optionally separated by an equal sign (=).
Single word attribute values do not need to be quoted, while multi word attributes
must be quoted, either with single or double quotes. Quotes inside attributes can
be escaped with a backslash. If an attribute name or value has an equal sign in it
the name or value can be quoted or the equal sign escaped with a backslash.

The input is expected to have a single root, just like XML.
In any case, the produced results reflects the input structure.

Lines that begin with one or more octothorpes (#) are parsed and output as comments.

If every XML element has a common tag name, it can be omitted from the text and added
back upon XML generation.

A common attribute can be similarly added as well.

Here is an example format from (examples/state-machine.txt) that omits
the 'name' attribute since it is common to all elements.


    machine Turnstile
      state Locked
          event coin
              action "set Unlocked"
          event pass
              action "sound alarm"

      state Unlocked
          event coin
              action "refund coin"
          event pass
              action "set Locked"

<A name="toc3-57" title="Usage" />
### Usage

    Usage: ./txt2xml [-tag=TAG] [attribute=ATTRIBUTE] [FILE]
    Converts text read from FILE(s), or standard input, to XML.
    -t --tag TAG       Use TAG as element tag for each element.
    -a --attribute     Use ATTRIBUTE as the first attribute for each element.
    -h -? --help       Show this help output.
    
    With no FILE, reads standard input.
    Report bugs to self-github@gyepi.com.

<A name="toc3-62" title="Usage Example" />
### Usage Example

The command

    txt2xml --attribute name examples/state-machine.txt

Generates the corresponding xml for the file and adds the missing attribute name
as seen in the output:


    &lt;machine name = "Turnstile">
      &lt;state name = "Locked">
          &lt;event name = "coin">
              &lt;action name = "set Unlocked"/>
          &lt;/event>
          &lt;event name = "pass">
              &lt;action name = "sound alarm"/>
          &lt;/event>
      &lt;/state>
      &lt;state name = "Unlocked">
          &lt;event name = "coin">
              &lt;action name = "refund coin"/>
          &lt;/event>
          &lt;event name = "pass">
              &lt;action name = "set Locked"/>
          &lt;/event>
      &lt;/state>
    &lt;/machine>

<A name="toc3-92" title="Installation" />
### Installation

txt2xml can be installed using the `make install` command or by copying the script
to your favorite path location. By default, `make install` acts like `make DESTDIR=/usr/local/bin install`.
Specify DESTDIR, with a different value if desired.

<A name="toc3-99" title="Dependencies" />
### Dependencies

txt2xml is a Perl program and requires the perl interpreter. There are no unusual construct
so the code should run fine on most extant versions of perl.

If you want to hack on the code, you'll need to install [GSL] (imatix/gsl) in order to add tests
and [gitdown] (/imatix/gitdown) in order to generate documentation in markdown format.

<A name="toc3-108" title="Future Work" />
### Future Work

I think it would be useful to specify the --tag command in a more discriminating
manner. Either by specifying a path '/a/b/c' to to which the command will be applied
or specifying an exclusion set of tags {a, b, c} to which the command will not apply.

Also, useful is the ability to add text. This would be simple to implement as a here doc.

    tag attr1 value1 <<TEXT
    Text content line 1
    Text content line 2
    TEXT


<A name="toc3-123" title="Author" />
### Author

This tool is written and maintained by Gyepi Sam <self-github@gyepi.com>.
Please send suggestions or bug reports.
