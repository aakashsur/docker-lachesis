# Lachesis in Docker

## Usage

```
docker run --rm -v $PWD:/root/ aakashsur/lachesis /root/configuration.ini
```

# Details

The `Lachesis` command has been placed in $PATH. Easiest way to run is to have everything in $PWD, i.e. .ini file, sorted .bam file, and assembly .fasta file. The current local directory then gets mounted to the home directory of the container, which is /root/. In your .ini file, make sure your paths are absolute and something to the effect of /root/configuration.ini, /root/assembly.fasta, /root/sorted.bam. I've included a .ini file I was using to test for yeast for good measure.

