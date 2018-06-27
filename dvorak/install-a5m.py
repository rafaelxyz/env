#!/usr/bin/env python
import sys
import os
import codecs
import xml.etree.ElementTree as et
from optparse import OptionParser

def addVariant(evdevpath, variantname, variantdesc):
    doc = et.parse(evdevpath)
    va0 = et.Element('variant')
    ci0 = et.SubElement(va0, 'configItem')
    na0 = et.Element('name')
    de0 = et.Element('description')
    na0.text = variantname
    de0.text = variantdesc
    ci0.append(na0)
    ci0.append(de0)
    for la in doc.getiterator('layout'):
        ci = la.find('configItem')
        na = ci.find('name')
        if (na.text == 'se'):
            vl = la.find('variantList')
            for va in vl.findall('variant'):
                ci2 = va.find('configItem')
                na2 = ci2.find('name')
                if (na2.text == na0.text):
                    print 'already added variant: ' + na0.text
                    return
            vl = la.find('variantList')
            vl.append(va0)
            print 'inserted new variant element'
    infile = codecs.open(evdevpath, 'w', 'utf-8')
    doc.write(infile)
    infile.close()
    print 'updated file: ' + evdevpath

def addRmSymbols(sepath, symbolpath):
    sefile = codecs.open(sepath, 'r', 'utf-8')
    addsym = codecs.open(symbolpath, 'r', 'utf-8')
    count = 0
    totalcount = 0
    read = True
    lines = ''
    for l in sefile:
        if l.find('//{{{') != -1:
            read = False
        if read == True:
            count += 1
            lines += l
        if l.find('//}}}') != -1:
            read = True
        totalcount += 1
    print "removed {0} lines from {1}".format(totalcount - count, sepath)
    sefile.close()
    sefile = codecs.open(sepath, 'w', 'utf-8')
    sefile.write(lines)
    sefile.write(addsym.read())
    print "adding section from {0}".format(symbolpath)
    addsym.close()
    sefile.close()

newsuse='/usr/share/X11/xkb/symbols/se'
oldsuse='/etc/X11/xkb/symbols/se'
ubuntu='/usr/share/X11/xkb/symbols/se'

def main(argv):
    syp = sys.path[0] + '/a5m.sym'
    desc = 'tool for setting up a custom keyboard layout in x'
    parser = OptionParser(prog='setonly', description=desc)
    options, args = parser.parse_args(argv)

    addVariant(evdevpath='/usr/share/X11/xkb/rules/evdev.xml', \
            variantname='a5m', variantdesc='A5M')
    addRmSymbols(symbolpath=syp, sepath=ubuntu)
    if (os.system("setxkbmap 'se(a5m)' -option ''") == 0):
        print 'keyboard map a5m set with xkbmap'
    if (os.system("setxkbmap -option ctrl:nocaps") == 0):
        print 'remapped caps to ctrl'

if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
    pass

'''
        <variant>
          <configItem>
            <name>a5</name>
            <description>A5</description>
          </configItem>
        </variant>

'''
'''
    file_src = "tmp1"
    file_dst = "tmp2"
    os.system("sed s/pattern/new/g %s >> %s" % (file_src, file_src))
    os.system("cp %s %s" % (file_src, file_dst + "2"))
import shutil
shutil.move( aFile, aFile+"~" )
destination= open( aFile, "w" )
source= open( aFile+"~", "r" )
isSwe = 0
for line in source:
    destination.write( line )
    if line.find("a1", 0, len(line)):
        for sline in source:
            if sline.find("t1", 0, len(sline)):
                destination.write( variant )
source.close()
destination.close()
'''
