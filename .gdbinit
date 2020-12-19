python
import gdb
import gdb.types
help_str = 'offsets [/r] [struct] structName'
class StructOffset(gdb.Command):
    def __init__(self):
        super (StructOffset, self).__init__ ('offsets', gdb.COMMAND_DATA)

    def invoke(self, arg, from_tty):
        argv = gdb.string_to_argv(arg)
        recursive = 0
        if argv[0] == '/r':
            recursive = 1
            del argv[0]
        if len(argv) == 0:
            raise gdb.GdbError(help_str)
        elif len(argv) == 2:
            if argv[0] != 'struct':
                raise gdb.GdbError(help_str)
            name = 'struct ' + argv[1]
        elif len(argv) == 1:
            name = argv[0]
        else:
            raise gdb.GdbError(help_str)
        self.print_struct(name, '', 0, recursive)

    def print_struct(self, name, prefix, off, recursive):
        try:
            stype = gdb.lookup_type(name)
        except:
            try:
                stype = gdb.lookup_type("struct " + name)
            except:
                if off != 0:
                    return
                raise gdb.GdbError('no struct named ' + name)

        if off == 0:
            print prefix, name, '{'
        for field in stype.fields():
            type_str = str(field.type)
            type_off = field.bitpos//8 + off
            if field.type.code == gdb.TYPE_CODE_STRUCT and recursive:
                print prefix, '\t%d:\t%s:\t%s {' % (type_off, field.name, type_str)
                self.print_struct(type_str, "\t" + prefix, type_off, recursive)
            else:
                print prefix, '\t%d:\t%s:\t%s' % (type_off, field.name, type_str)
        print prefix, '}'

StructOffset()
end
