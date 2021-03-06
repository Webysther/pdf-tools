# PDF analysis tools

Pack of tools used to quickly analyze malicious documents in semi-safe environment

## Usage

### Peepdf

```
$ peepdf -fc sample.pdf
Warning: PyV8 is not installed!!
Warning: pylibemu is not installed!!

File: sample.pdf
MD5: 432...
SHA1: b03f...
SHA256: a255...
Size: 51488 bytes
Version: 1.5
Binary: True
Linearized: False
Encrypted: False
Updates: 0
Objects: 15
Streams: 4
URIs: 0
Comments: 0
Errors: 1

Version 0:
	Catalog: 1
	Info: 2
	Objects (15): [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
		Errors (2): [8, 14]
	Streams (4): [8, 14, 15, 5]
		Encoded (3): [8, 14, 5]
		Decoding errors (3): [8, 14, 5]
```

### Score

```
$ score sample.pdf
================================================
[+] Indicator Scores
------------------------------------------------
[-] PDF Creator Application............: 7.0
[-] pagesNumber........................: 3.0
[-] Large streams (1)..................: 6.0
[-] PDF Producer Application...........: 7.0
------------------------------------------------
[-] Total calculated...................: 23.0
[-] Threshold calculated...............: 90.0
[-] Overall Maliciousness Score........: 2.6/10
================================================
```

### Convert to safe PDF

```
pdfconvert sample.pdf
[+] Creating downsampled PDF for sample.pdf ...
[+] Moving old file sample.pdf to sample.pdf.old
```