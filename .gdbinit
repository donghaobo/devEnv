python
import gdb
import gdb.types
class StructOffset(gdb.Command):
    def __init__(self):
        super (StructOffset, self).__init__ ('offsets', gdb.COMMAND_DATA)

    def invoke(self, arg, from_tty):
        argv = gdb.string_to_argv(arg)
        if len(argv) == 0:
            raise gdb.GdbError('struct-offsets [struct] structName')
        elif len(argv) == 2:
            if argv[0] != 'struct':
                raise gdb.GdbError('struct-offsets [struct] structName')
            name = 'struct ' + argv[1]
        elif len(argv) == 1:
            name = argv[0]
        else:
            raise gdb.GdbError('struct-offsets [struct] structName')

        try:
            stype = gdb.lookup_type(name)
        except:
            try:
                stype = gdb.lookup_type("struct " + name)
            except:
                raise gdb.GdbError('no struct named ' + name)

        print name, '{'
        for field in stype.fields():
            print '\t%d:\t%s:\t%s' % (field.bitpos//8, field.name, gdb.types.get_basic_type(field.type))
        print '}'

StructOffset()
end
