class KconfigFrontends < Formula
  homepage "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
  url "http://ymorin.is-a-geek.org/download/kconfig-frontends/kconfig-frontends-3.12.0.0.tar.xz"
  sha256 "ea2615a62c74bea6ce3b38402f00c7513858f307f6ba7aa9fdbf0bbc12bcf407"

  def install
    system "./configure", "--prefix=#{prefix}"
    #, "--disable-shared", "--enable-static", "--disable-gconf", "--disable-qconf", "--disable-nconf", "--disable-utils"
    system "make"
    system "make", "install"
  end

end
