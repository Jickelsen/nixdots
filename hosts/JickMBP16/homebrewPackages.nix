{
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    taps = [ ];
    masApps = {
      "Yoink" = 457622435;
    };
    brews = [
      "abseil"
      "act"
      "ansible"
      "aom"
      "aribb24"
      "assimp"
      "autoconf"
      "automake"
      "bash"
      "bdw-gc"
      "berkeley-db"
      "berkeley-db@5"
      "brotli"
      "bundletool"
      "c-ares"
      "ca-certificates"
      "cairo"
      "certifi"
      "cffi"
      "cfitsio"
      "cjson"
      "cliclick"
      "cmake"
      "cmocka"
      "coreutils"
      "cowsay"
      "cryptography"
      "curl"
      "dav1d"
      "dbus"
      "dfu-util"
      "diffutils"
      "docbook"
      "docbook-xsl"
      "docutils"
      "double-conversion"
      "doxygen"
      "epsilon"
      "esptool"
      "expat"
      "ext4fuse"
      "fd"
      "ffmpeg"
      "flac"
      "fontconfig"
      "freetype"
      "freexl"
      "frei0r"
      "fribidi"
      "fzf"
      "gcc"
      "gdbm"
      "geos"
      "gettext"
      "ghostscript"
      "giflib"
      "git"
      "git-lfs"
      "glib"
      "gmp"
      "gnu-getopt"
      "gnupg"
      "gnutls"
      "go"
      "gobject-introspection"
      "gpgme"
      "graphite2"
      "guile"
      "harfbuzz"
      "hdf5"
      "helm"
      "heroku"
      "heroku-node"
      "highlight"
      "highway"
      "htop"
      "hugo"
      "hunspell"
      "icu4c@76"
      "imagemagick"
      "imath"
      "imlib2"
      "influxdb"
      "inih"
      "isl"
      "jaggr"
      "jasper"
      "jbig2dec"
      "jpeg"
      "jpeg-turbo"
      "jpeg-xl"
      "jplot"
      "jq"
      "json-c"
      "keyring"
      "kind"
      "kompose"
      "krb5"
      "lame"
      "leptonica"
      "libarchive"
      "libass"
      "libassuan"
      "libb2"
      "libbluray"
      "libcaca"
      "libdap"
      "libde265"
      "libdeflate"
      "libevent"
      "libffi"
      "libgcrypt"
      "libgeotiff"
      "libgpg-error"
      "libheif"
      "libice"
      "libidn"
      "libidn2"
      "libksba"
      "liblinear"
      "liblqr"
      "libmicrohttpd"
      "libmng"
      "libmpc"
      "libnghttp2"
      "libogg"
      "libomp"
      "libplist"
      "libpng"
      "libpq"
      "libpthread-stubs"
      "libraw"
      "librist"
      "librttopo"
      "libsamplerate"
      "libsm"
      "libsndfile"
      "libsodium"
      "libsoxr"
      "libspatialite"
      "libssh"
      "libssh2"
      "libtasn1"
      "libtiff"
      "libtommath"
      "libtool"
      "libunibreak"
      "libunistring"
      "libusb"
      "libusbmuxd"
      "libuv"
      "libvidstab"
      "libvmaf"
      "libvorbis"
      "libvpx"
      "libwebsockets"
      "libx11"
      "libxau"
      "libxcb"
      "libxdmcp"
      "libxext"
      "libxml2"
      "libxmu"
      "libxrender"
      "libxt"
      "libyaml"
      "little-cms2"
      "lua"
      "luarocks"
      "lz4"
      "lzo"
      "m4"
      "macos-term-size"
      "mas"
      "mbedtls"
      "md4c"
      "micropython"
      "midnight-commander"
      "minicom"
      "minizip"
      "mosh"
      "mosquitto"
      "mpdecimal"
      "mpfr"
      "mpg123"
      "ncurses"
      # "neovim"
      "netcdf"
      "nettle"
      "nmap"
      "node"
      "node@14"
      "npth"
      "nspr"
      "nss"
      "numpy"
      "oniguruma"
      "openblas"
      "opencore-amr"
      "openexr"
      "openjdk"
      "openjpeg"
      "openldap"
      "openssl@1.1"
      "openssl@3"
      "opus"
      "p11-kit"
      "pandoc"
      "pango"
      "pcre"
      "pcre2"
      "perl"
      "pinentry"
      "pixman"
      "pkgconf"
      "poppler"
      "popt"
      "proj"
      "protobuf"
      "pv"
      "pycparser"
      "pyenv"
      "pygments"
      "python"
      "python-certifi"
      "python-cryptography"
      "python-packaging"
      "python-setuptools"
      "python-tabulate"
      "python-tk@3.10"
      "python@3.10"
      "python@3.11"
      "python@3.12"
      "python@3.13"
      "python@3.9"
      "qt"
      "ranger"
      "rav1e"
      "readline"
      "ripgrep"
      "ripgrep-all"
      "rtmpdump"
      "rubberband"
      "ruby"
      "s-lang"
      "sdl2"
      "shared-mime-info"
      "six"
      "skhd"
      "snappy"
      "spacebar"
      "speex"
      "sphinx-doc"
      "sqlite"
      "srt"
      "ssh-copy-id"
      "svt-av1"
      "tcl-tk"
      "tcl-tk@8"
      "telnet"
      "terminalimageviewer"
      "tesseract"
      "the_silver_searcher"
      "theora"
      "tig"
      "tio"
      "tmux"
      "truncate"
      "unbound"
      "unixodbc"
      "utf8proc"
      "vegeta"
      "virtualenv"
      "w3m"
      "webp"
      "wget"
      "x264"
      "x265"
      "xclip"
      "xerces-c"
      "xmlto"
      "xorgproto"
      "xsel"
      "xvid"
      "xz"
      "yabai"
      "yarn"
      "ykman"
      "zeromq"
      "zimg"
      "zsh"
      "zstd"
    ];
    casks = [
      "amethyst"
      "android-platform-tools"
      "arduino"
      "bettertouchtool"
      "blender"
      "discord"
      "graphql-playground"
      "hammerspoon"
      "hyper"
      "iterm2"
      "karabiner-elements"
      "microsoft-auto-update"
      "microsoft-edge"
      "mu-editor"
      "nrlquaker-winbox"
      "osxfuse"
      "skype"
      "skype-for-business"
      "slack"
      "sourcetree"
      "spotify"
      "visual-studio-code"
      "vlc"
      "whalebird"
      "whichspace"
      "zen-browser"
    ];
  };
}