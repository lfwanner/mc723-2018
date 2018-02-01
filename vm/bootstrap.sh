#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get -y install valgrind build-essential libtool dh-autoreconf pkg-config libdw-dev flex bison

export HOMEDIR=/home/ubuntu
export BASEDIR=$HOMEDIR/tools
mkdir $BASEDIR

cd $BASEDIR
mkdir dinero
cd dinero
wget --progress=bar:force ftp://ftp.cs.wisc.edu/markhill/DineroIV/d4-7.tar.gz
wget --progress=bar:force http://www.ece.uah.edu/~lacasa/sbc/programs/dinero4sbc.tgz
tar xzf d4-7.tar.gz
cd d4-7/
tar xzf ../dinero4sbc.tgz
./configure
make
cd
echo PATH=\$PATH:$BASEDIR/dinero/d4-7/ >> $HOMEDIR/.profile

cd $BASEDIR
export SYSTEMCDIR=$BASEDIR/systemc
mkdir src
cd src
wget --progress=bar:force http://www.accellera.org/images/downloads/standards/systemc/systemc-2.3.1.tgz
tar xzf systemc-2.3.1.tgz
rm -f systemc-2.3.1.tgz
cd systemc-2.3.1/
./configure --prefix=$SYSTEMCDIR
make
make install

cd $BASEDIR
export ARCHCDIR=$BASEDIR/archc
cd src
git clone https://github.com/ArchC/ArchC.git
cd ArchC/
./autogen.sh
./configure --prefix=$ARCHCDIR --with-systemc=$SYSTEMCDIR
make
make install
echo source $ARCHCDIR/etc/env.sh >> $HOMEDIR/.profile

cd $BASEDIR
wget --progress=bar:force http://archc.lsc.ic.unicamp.br/downloads/Tools/mips/archc_mips_toolchain_20141215_64bit.tar.bz2
tar -jxf archc_mips_toolchain_20141215_64bit.tar.bz2
rm -f archc_mips_toolchain_20141215_64bit.tar.bz2
echo export PATH=$BASEDIR/mips-newlib-elf/bin:\$PATH >> $HOMEDIR/.profile

cd $BASEDIR
rm -rf src

export BENCHMARKDIR=$HOMEDIR/benchmarks
mkdir $BENCHMARKDIR
cd $BENCHMARKDIR
wget --progress=bar:force http://archc.lsc.ic.unicamp.br/downloads/Bench/MipsMibench.tar.bz2
tar xjf MipsMibench.tar.bz2
rm -f MipsMibench.tar.bz2

cd $BENCHMARKDIR
mkdir traces
cd traces
wget --progress=bar:force -r -nH -nd -np -R index.html* http://www.ece.uah.edu/~lacasa/sbc/traces/
for f in *.tar; do
  d=`basename $f .tar`
  mkdir $d
  (cd $d && tar xf ../$f)
done
rm *tar

export CODEDIR=/home/ubuntu/code

mkdir $CODEDIR/apps
source $HOMEDIR/.profile
export PLATFORMDIR=$CODEDIR/platforms
mkdir $PLATFORMDIR

#export LD_LIBRARY_PATH="$SYSTEMCDIR/lib:$LD_LIBRARY_PATH"
#export PKG_CONFIG_PATH="$SYSTEMCDIR/lib/pkgconfig:$PKG_CONFIG_PATH"

#export LD_LIBRARY_PATH="/home/ubuntu/tools/systemc/lib:$LD_LIBRARY_PATH"
#export PKG_CONFIG_PATH="/home/ubuntu/tools/systemc/systemc/lib/pkgconfig:$PKG_CONFIG_PATH"
