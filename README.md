;; For compile from source
sudo apt install -y stow build-essential libx11-dev xaw3dg-dev \
     libjpeg-dev libpng12-dev libgif-dev libtiff4-dev libncurses5-dev \
     libxft-dev librsvg2-dev libmagickcore-dev libmagick++-dev \
     libxml2-dev libgpm-dev libghc-gconf-dev libotf-dev libm17n-dev \
     libgnutls-dev texinfo libtiff-dev libgif-dev libxpm-dev libgnutls-dev libncurses5-dev libxml2-dev

;; For build from source
./configure --with-modules --with-xft --with-libsystemd --enable-link-time-optimization --without-pop --prefix=/home/darkanthey/.local
make && make install

;; Install fonts
mkdir ~/.fonts
cd /tmp
;; Inconsolata-LGC
git clone https://github.com/DeLaGuardo/Inconsolata-LGC.git
find . -type f -name "*.ttf" -exec cp {} ~/.fonts/ \;

wget http://www.fantascienza.net/leonardo/ar/inconsolatag/inconsolata-g_font.zip
unzip -p inconsolata-g_font.zip Inconsolata-g.ttf > ~/.fonts/Inconsolata-g.ttf

;; Hack
wget https://github.com/source-foundry/Hack/releases/download/v3.000/Hack-v3.000-ttf.zip
unzip Hack-v3.000-ttf.zip -d ~/.fonts/

fc-cache -f -v

;; For make
dnf install libtool textinfo ImageMagick

;; For gnus
dnf install starttls openssl, w3m, w3m-img

;; For flemake xml
dnf install xmlstarlet

;; For python
;; make python3 environment for jedi
dnf install pyflakes
virtualenv --no-site-packages --distribute -p /usr/bin/python3.6 ~/.emacs.d/.python-environments/default
~/.emacs.d/.python-environments/default/bin/pip3 install --upgrade jedi isort pylint pyflakes pep8 autopep8 importmagic yapf coala-bears
ln -s ~/.emacs.d/.python-environments/default ~/.virtualenvs/emacs

;; For spell check
dnf install hunspell

;; For haskell
cd ~/.emacs.d/.haskell-environments/
cabal sandbox init
cabal install happy hasktags stylish-haskell present ghc-mod hlint hoogle structured-haskell-mode hindent present

;; For go
;;go get golang.org/x/tools/cmd/oracle
;;go get golang.org/x/tools/cmd/godef
;;go get -u github.com/nsf/gocode
;;go get -u github.com/dougm/goflymake

git submodule init
git submodule update

;; Find and remove compile starter kit el file
find . -type f -name "starter-kit*.el" -exec rm -f {} \; && rm -f "$(whoami).el";

