#! /bin/sh
# vim:expandtab:shiftwidth=2:tabstop=8

# Shell script to create "nvwa-x.y.tar.gz"

VER="0.8"
RELEASE="nvwa-$VER"
rm -rf $RELEASE
mkdir $RELEASE
cd $RELEASE

export CVSROOT=:pserver:anonymous@nvwa.cvs.sourceforge.net:/cvsroot/nvwa
echo | cvs login
cvs -z9 co doc nvwa

cp -pr ../../doc/latex/refman.ps ../../doc/html/ doc/
( cd doc/html; rm -f *.dot *.map *.md5 )

cd ..
tar cvfz $RELEASE.tar.gz $RELEASE/
