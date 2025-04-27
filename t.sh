#!/bin/bash
echo "Installing  TERMU☬SHΞN™ 2025 Patch 1.0.0 for android Termux..."

# Install prerequisites
pkg install -y curl wget git zsh figlet lolcat nano termux-api

# Set Termux mirror to a fast source
echo "deb https://mirror.termux.dev/termux-main stable main" > $PREFIX/etc/apt/sources.list
pkg update -y

# Create required directories
mkdir -p ~/.termux

# Set TERMU☬SHΞN™ (termux.properties)
cat << 'EOF' > ~/.termux/termux.properties
background=#4A4A4A
foreground=#FFFFFF
color0=#FF5555
color1=#55FF55
color2=#55FFFF
color3=#FFFF55
EOF

# Set TERMU☬SHΞN™ signature and auto-update (motd.sh)
cat << 'EOF' > ~/.termux/motd.sh
#!/bin/bash
echo -e "\033[1;31m☬\033[1;32mSHΞ\033[1;34mRVIN™\033[0m\nWelcome to Termux! Theme by SHERVIN\n"
echo "Checking for updates..."
pkg update -y && pkg upgrade -y
EOF
chmod +x ~/.termux/motd.sh

# Download font (Fira Code)
if [ ! -f ~/.termux/font.ttf ]; then
    curl -s -o ~/.termux/font.ttf https://github.com/tonsky/FiraCode/releases/download/6.2/FiraCode-Regular.ttf
fi

# Set up Zsh with colored prompts and error hints
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cat << 'EOF' > ~/.zshrc
ZSH_THEME="agnoster"
autoload -U colors && colors
PS1='%F{cyan}%n@%m%f %F{yellow}%~%f $ '
if command -v figlet >/dev/null && command -v lolcat >/dev/null; then
    echo "TERMU☬SHΞN™" | figlet | lolcat
fi
command_not_found_handler() {
    echo -e "\033[1;31mError: Command '$1' not found.\033[0m"
    echo -e "\033[1;33mHint: Try installing it with 'pkg install $1' or check the spelling.\033[0m"
    return 127
}
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
EOF

# Set Zsh as the default shell
chsh -s zsh

# Install TERMU☬SHΞN™ packages
echo "Installing user packages..."
packages="abseil-cpp adwaita-icon-theme-legacy adwaita-icon-theme android-tools appstream apt arj aspell at-spi2-core aterm atk attr autoconf automake bash bc binutils-is-llvm bison bmon boost brotli bsdtar build-essential bzip2 c-ares ca-certificates calc calcurse-caldav calcurse chromaprint clang cmake cmocka command-not-found coreutils cpio curl dash dbus dconf debianutils desktop-file-utils dialog diffutils djvulibre dnsutils dos2unix dpkg ed elinks enchant exo feh ffmpeg fftw figlet file-roller-help file-roller file findutils flex fluxbox fmt fontconfig-utils fontconfig freetype fribidi fsmon game-music-emu garcon gawk gcr4 gdbm gdk-pixbuf geany gh ghostscript giflib git glib-bin glib-networking glib gnupg gnustep-make gperf gpgv graphene graphviz grep gsettings-desktop-schemas gst-plugins-bad gst-plugins-base gst-plugins-good gstreamer gtk-layer-shell gtk-update-icon-cache gtk2 gtk3 gtk4 gvfs gzip harfbuzz-icu harfbuzz hicolor-icon-theme hping3 htop hunspell-en-us hunspell imagemagick imath imlib2 inetutils iproute2 iso-codes jbig2dec jq json-c json-glib jsoncpp krb5 ldns leafpad less libadwaita libandroid-execinfo libandroid-glob libandroid-posix-semaphore libandroid-selinux libandroid-shmem libandroid-support libandroid-utimes libandroid-wordexp libao libaom libarchive libass libassuan libbluray libbsd libbz2 libc++ libcaca libcairo libcanberra libcap-ng libcap libcompiler-rt libconfig libconfuse libcrypt libcurl libdav1d libdb libde265 libdisplay-info libdrm libedit libepoxy libevent libexif libexpat libffi libflac libfontenc libgcrypt libgd libglade libglvnd libgmp libgnustep-base libgnutls libgpg-error libgraphite libgtop libgts libheif libhyphen libice libiconv libicu libid3tag libidn2 libidn libjansson libjasper libjpeg-turbo-progs libjpeg-turbo libjxl libksba libllvm liblqr libltdl liblua54 liblz4 liblzma liblzo libmad libmd libmp3lame libmpdclient libmpfr libnettle libnfs libnghttp2 libnghttp3 libnl libnotify libnpth libobjc2 libogg libopencore-amr libopenmpt libopus libpcap libpixman libpng libprotobuf libpsl libraqm librav1e libraw libresolv-wrapper librsvg libsamplerate libsasl libsm libsmartcols libsndfile libsodium libsoup3 libsoxr libsqlite libsrt libssh2 libssh libstemmer libtasn1 libtheora libtiff libtirpc libtool libudfread libunbound libunistring liburcu libuuid libuv libv4l libvidstab libvmaf libvo-amrwbenc libvorbis libvpx libvte libwavpack libwayland libwebp libwebrtc-audio-processing libwnck libx11 libx264 libx265 libxau libxaw libxcb libxcomposite libxcursor libxdamage libxdmcp libxext libxfce4ui libxfce4util libxfce4windowing libxfixes libxfont2 libxft libxi libxinerama libxkbcommon libxkbfile libxklavier libxml2 libxmlb libxmu libxpm libxrandr libxrender libxshmfence libxslt libxt libxtst libxv libxxf86vm libyaml libzimg libzip libzmq littlecms lld llvm lsof lxde-icon-theme lynx lz4 lzip lzop m4 mailutils make man media-types mesa-vulkan-icd-swrast mesa mpc mpd mpg123 mutt nano ncmpcpp ncurses-ui-libs ncurses-utils ncurses ndk-sysroot neofetch net-tools netcat-openbsd netsurf nmap-ncat nmap nodejs obconf ocl-icd oniguruma openal-soft openbox openexr opengl openh264 openjpeg openssh-sftp-server openssh openssl-tool openssl p11-kit p7zip pango patch pcre2 perl pinentry pkg-config polybar procps psmisc pulseaudio python-ensurepip-wheels python-pip python2 python ranger readline resolv-conf rhash rofi root-repo rubberband runit sed shared-mime-info speexdsp sqlite sslscan startup-notification svt-av1 taglib tar tcl tcpdump telegram-cli termux-am-socket termux-am termux-api termux-auth termux-core termux-exec termux-keyring termux-licenses termux-services termux-tools thunar-archive-plugin thunar tigervnc toilet traceroute tsu ttf-dejavu tumbler unar unrar unzip utf8cpp util-linux v2ray vim vulkan-icd vulkan-loader-generic vulkan-loader webkitgtk-6.0 wget whois woff2 x11-repo xarchiver xbitmaps xcb-util-cursor xcb-util-image xcb-util-keysyms xcb-util-renderutil xcb-util-wm xcb-util-xrm xcb-util xcompmgr xfce4-panel xfce4-settings xfce4-terminal xfconf xkeyboard-config xmlstarlet xorg-font-util xorg-fonts-75dpi xorg-fonts-alias xorg-fonts-encodings xorg-mkfontscale xorg-xauth xorg-xkbcomp xorg-xmessage xorg-xrdb xvidcore xxd xxhash xz-utils yajl zenity zip zlib zsh-completions zsh zstd"

for pkg in $packages; do
    echo "Installing $pkg..."
    pkg install -y "$pkg" || echo "Failed to install $pkg, skipping..."
done

# Apply settings
termux-reload-settings

echo "TERMU☬SHΞN™ installed successfully! Restart Termux & enjoy your performance..!"
