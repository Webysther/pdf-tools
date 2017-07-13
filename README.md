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

## Usage

Use *OLEVBA* to analyze Microsoft Word documents and extract VBA scripts:

```
olevba --decode --reveal FILE.doc
```
