#!/bin/bash

dir=$(dirname $0)

SHELL=${SHELL##*/}
RCFILE=${HOME}/.${SHELL}rc

\cp ${dir}/.gdbinit ${HOME}/.gdbinit
\cp ${dir}/.vimrc ${HOME}/.vimrc
\cp -r ${dir}/.vim ${HOME}/.vim
\cp -r ${dir}/.shellenv ${HOME}/.shellenv

sed -i '/##DEVENV-ABCABCABC##/d' ${RCFILE} ## make sure not delete other config...
echo 'for f in ${HOME}/.shellenv/*;do if [ -x $f ];then . $f;fi;done ##DEVENV-ABCABCABC##' >> ${RCFILE}

. ${RCFILE}

