#!/usr/bin/env bash
set -e

base="https://github.com/jgm/pandoc/releases/download/3.8.3"
is_mac=false
if [[ "$HOME" =~ "/User" ]];then
  is_mac=true
  release=pandoc-3.8.3-arm64-macOS.zip
else
  release=pandoc-3.8.3-linux-amd64.tar.gz
fi

mkdir -p ~/.local/opt
mkdir -p ~/.local/bin
wget -q "$base/$release" -O "$HOME/.local/opt/$release" 2>&1 > /dev/null

pushd ~/.local/opt/ 2>&1 > /dev/null
if $is_mac;then
  unzip "$release" 2>&1 > /dev/null
  dest="pandoc-3.8.3-arm64"
else
  tar xzvf "$release" 2>&1 > /dev/null
  dest="pandoc-3.8.3"
fi
rm "$release"
ln -srf "$dest"/bin/* ~/.local/bin/ 2>&1 > /dev/null
popd 2>&1 > /dev/null

if $is_mac;then
  rc="~/.zshrc"
else
  rc="~/.bashrc"
fi
echo "# Add ~/.local/bin to your PATH"
echo "echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> $rc"
echo "# Source your $rc to apply the changes"
echo "source $rc"
