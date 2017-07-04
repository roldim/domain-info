#!/bin/bash

[[ $EUID -ne 0 ]] && echo "Please, run as root" && exit 1
INST_DIR=/usr/local/


echo "Installing domain-info..."
cp domain-info /tmp
sed -i "s:funcs:$INST_DIR/include:g" /tmp/domain-info
mv /tmp/domain-info ${INST_DIR}bin/
echo "Installing functions..."
cp funcs/* ${INST_DIR}include/
chmod 755 ${INST_DIR}bin/domain-info
echo "All done!"
