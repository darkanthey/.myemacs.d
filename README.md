This's emacs config which flexible and configurable founded on starter-kit with ORG mode.
You can just choose prefer languages in starter-kit.org.

For start rename username.org in my case this is "darkanthey.org" to yours
For example:
  mv darkanthey.org "$USER".org


# Compile from source
sudo apt install -y stow build-essential libx11-dev xaw3dg-dev \
     libjpeg-dev libpng12-dev libgif-dev libtiff4-dev libncurses5-dev \
     libxft-dev librsvg2-dev libmagickcore-dev libmagick++-dev \
     libxml2-dev libgpm-dev libghc-gconf-dev libotf-dev libm17n-dev \
     libgnutls-dev texinfo libtiff-dev libgif-dev libxpm-dev libgnutls-dev libncurses5-dev libxml2-dev

# Local build from source
git clone https://github.com/emacs-mirror/emacs.git
or If you prefer emacs based on Rush lang.
git clone https://github.com/Wilfred/remacs.git
cd emacs
./configure --with-modules --with-xft --with-libsystemd --enable-link-time-optimization --without-pop --prefix=/home/darkanthey/.local
make && make install

# Install fonts
mkdir ~/.fonts
cd /tmp
;; Inconsolata-LGC font
git clone https://github.com/DeLaGuardo/Inconsolata-LGC.git
find . -type f -name "*.ttf" -exec cp {} ~/.fonts/ \;
wget http://www.fantascienza.net/leonardo/ar/inconsolatag/inconsolata-g_font.zip
unzip -p inconsolata-g_font.zip Inconsolata-g.ttf > ~/.fonts/Inconsolata-g.ttf

## Hack font
wget https://github.com/source-foundry/Hack/releases/download/v3.000/Hack-v3.000-ttf.zip
unzip Hack-v3.000-ttf.zip -d ~/.fonts/

fc-cache -f -v

;; For make
sudo apt install libtool textinfo ImageMagick

;; --- For gnus email ---
sudo apt install starttls openssl, w3m, w3m-img

;; --- For flemake xml ---
sudo apt install xmlstarlet

;; --- For spell check ---
sudo apt install hunspell

# Programming Languages

## Python
sudo apt install pyflakes
virtualenv --no-site-packages --distribute -p /usr/bin/python3.6 ~/.emacs.d/.python-environments/default
~/.emacs.d/.python-environments/default/bin/pip3 install --use-wheel --upgrade jedi isort pylint pyflakes pep8 autopep8 importmagic yapf coala-bears
ln -s ~/.emacs.d/.python-environments/default ~/.virtualenvs/emacs

## Haskell
cd ~/.emacs.d/.haskell-environments/
cabal sandbox init
cabal install happy hasktags stylish-haskell present ghc-mod hlint hoogle structured-haskell-mode hindent present

## Go lang
go get golang.org/x/tools/cmd/oracle
go get golang.org/x/tools/cmd/godef
go get -u github.com/nsf/gocode
go get -u github.com/dougm/goflymake


# For backup. Find and remove compile starter kit el file
find . -type f -name "starter-kit*.el" -exec rm -f {} \; && rm -f "$(whoami).el";

