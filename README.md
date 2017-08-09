# Malicious file analysis toolset

Pack of tools used to quickly analyze malicious documents in semi-safe environment (Docker ;)

## Build image locally from Dockerfile (optional)

You could build image localy (from attached Dockerfile) or download whole image from DockerHub:

```
docker build . -t "nshadov/malware-tools"
```

## Install & Run

This would drop you to shell inside container, with current working directory mounted (RW)
as HOME. Open it up in directory where you have disposable copy of your malicious files.

```
docker run --rm -it --security-opt="no-new-privileges" --cap-drop=all
       -v $(pwd):/home/malware
       --name python-test nshadov/malware-tools
```

## Example Usage

### Microsoft Word Documents

Use **MRAPTOR** to search for suspicious files (DOC, XLS, PPT, XML, VSD ...).

```
mraptor FILE.doc
```

Use **OLEVBA** to analyze Microsoft Word documents and extract VBA scripts:

```
olevba --decode --reveal FILE.doc
```

Dump specific RTF object (or ```all```) to separate file with **RTFOBJ**.

```
rtfobj --save 2 FILE.rtf
```

You can find files embedded into another file using **HACHOIR-SUBFILE**:

```
hachoir-subfile FILE.doc
```

### PDF Documents

Inspect for suspicious elements using **PDFID** (/opt/tools/):

```
/opt/tools/pdfid/pdfid.py FILE.pdf
...
 /JS                    0
 /JavaScript            1
 /AA                    0
 /OpenAction            1
 /AcroForm              0
```

Take a closer look for suspicious elements using **PDF-PARSER**:

```
pdfparse FILE.pdf
```

Search for specific strings (case insensitive):

```
pdfparse -s script FILE.pdf
pdfparse -s URI FILE.pdf
pdfparse -s action FILE.pdf
```

Dump specific object stream to a file:

```
pdfparse -f -o 8 -w FILE.pdf > object8.txt
```

Or interactively analyze and walk through PDF file with **PEEPDF**:

```
$ peepdf --interactive FILE.pdf

PPDF> tree
...

PPDF> offsets
...

PPDF> metadata
...

PPDF> rawobject 1
...

PPDF> stream 13
...

PPDF> js_analyse object 13
...
```

You can convert PDF file into series of PNG images with **GHOSTSCRIPT** (to preview
it or get rid of active content):

```
ghostscript -dNOPAUSE -dBATCH -sDEVICE=pngalpha -r96 -sOutputFile='page-%000d.png'
```

## Cheat Sheets

 * OLE Tools -  https://github.com/decalage2/oletools/blob/master/cheatsheet/oletools_cheatsheet.pdf
 * Great tools collection distro - https://remnux.org/docs/distro/tools/
