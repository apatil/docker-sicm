# Dockerized mit-scheme in Emacs with scmutils

For ["Structure and Interpretation of Classical Mechanics"](http://www.fisica.net/mecanicaclassica/struture_and_interpretation_of_classical_mechanics_by_gerald_jay_sussman.pdf) (SICM) by Wisdom and Sussman.

SICM teaches classical mechanics using notation so unambiguous that it can be 
transliterated to a computer program, and I find that that makes it much easier
to understand. [This review](http://www.ids.ias.edu/~piet/publ/other/sicm.html)
explains the difference.

This [Docker](https://docker.com) image gets you up and running with a good 
Emacs-based SICM development environment. It will only work on x86-64/amd64
machines.

## Usage

```bash
docker run -i -t -v /path/to/workdir:/work apatil:docker-sicm
```

This command will run the image and drop you in an Emacs session. To run an MIT 
Scheme repl with the [scmutils](http://groups.csail.mit.edu/mac/users/gjs/6946/refman.txt) 
package (a requirement for running the SICM examples) preloaded, do

```
M-x run-scheme-with-sicm
```

You can interact with the repl using [these commands.](http://www.gnu.org/software/mit-scheme/documentation/mit-scheme-user/GNU-Emacs-Interface.html)