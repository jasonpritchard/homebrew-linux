class KconfigFrontends < Formula
  homepage "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
  url "http://ymorin.is-a-geek.org/download/kconfig-frontends/kconfig-frontends-3.12.0.0.tar.xz"
  sha1 "08895aa4edd9e44e0a04aa031fd094f27458ea96"

  def install
    system "./configure", "--prefix=#{prefix}"
    #, "--disable-shared", "--enable-static", "--disable-gconf", "--disable-qconf", "--disable-nconf", "--disable-utils"
    system "make"
    system "make", "install"
  end

end
