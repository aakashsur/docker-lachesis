# Lachesis in Docker

(Lachesis)[https://github.com/shendurelab/LACHESIS] was the first Hi-C assembler and is widely cited. However it has not been maintained and is quite challenging to install. Forked from zitsen, this repo fleshes out the details to help make a docker container a stand-in exectuable for Lachesis. 


## Usage

```
docker run --rm -v $PWD:/root/ aakashsur/lachesis /root/configuration.ini
```

# Details

The `Lachesis` command has been placed in $PATH. Easiest way to run is to have everything in $PWD, i.e. .ini file, sorted .bam file, and assembly .fasta file. The current local directory then gets mounted to the home directory of the container, which is /root/. In your .ini file, make sure your paths are absolute and something to the effect of /root/configuration.ini, /root/assembly.fasta, /root/sorted.bam. I've included a .ini file I was using to test for yeast for good measure.

I haven't bothered installing R which is needed for drawing the heatmaps since I think there are better visualization tools now, but feel free to amend and then build from the Dockerfile if you so choose.

```
docker build -t username/lachesis:latest .
```

For running in an HPC setting, where singularity is often the choice of containerization. 

```
singularity pull docker://aakashsur/lachesis
singularity run --bind $PWD:/root/ lachesis_latest.sif /root/configuration.ini
```
