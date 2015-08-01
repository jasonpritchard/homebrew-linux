class Bin2hex < Formula
  homepage "http://www.headcrashers.org/comp/programs/bin2hex.html"
  url "http://www.headcrashers.org/comp/programs/bin2hex.tar.gz"
  sha256 "16a396c0d63ba6ea982529fb84d44bae477cd3f6c32929fd1141d83dcbaf042b"
  version "0.1"

  depends_on 'automake' => :build
  depends_on 'autoconf' => :build
  
  # add automake
  patch :DATA

  def install
    system "aclocal"
    system "autoconf"
    system "automake --add-missing"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    #system "make", "install"
  end

end

__END__
diff -rupN bin2hex.ori/Makefile bin2hex/Makefile
--- bin2hex.ori/Makefile	2007-10-05 04:42:15.000000000 -0700
+++ bin2hex/Makefile	1969-12-31 16:00:00.000000000 -0800
@@ -1,14 +0,0 @@
-CFLAGS= -I. -Wall
-SRCS=	bin2hex.c endian.c aout16.c aout32.c bin.c com.c elf.c exe.c rel.c sav.c
-OBJS=	bin2hex.o endian.o aout16.o aout32.o bin.o com.o elf.o exe.o rel.o sav.o
-
-all:	bin2hex
-
-bin2hex: ${OBJS}
-	${CC} ${CFLAGS}  -o bin2hex ${OBJS}
-
-clean:
-	rm -f ${OBJS} bin2hex .depend
-
-depend:	${SRCS}
-	mkdep ${CFLAGS} ${SRCS}
diff -rupN bin2hex.ori/Makefile.am bin2hex/Makefile.am
--- bin2hex.ori/Makefile.am	1969-12-31 16:00:00.000000000 -0800
+++ bin2hex/Makefile.am	2015-08-01 10:30:04.000000000 -0700
@@ -0,0 +1,4 @@
+AUTOMAKE_OPTIONS = foreign
+bin_PROGRAMS = bin2hex
+bin2hex_SOURCES = bin2hex.c endian.c aout16.c aout32.c bin.c com.c elf.c exe.c rel.c sav.c
+
diff -rupN bin2hex.ori/configure.ac bin2hex/configure.ac
--- bin2hex.ori/configure.ac	1969-12-31 16:00:00.000000000 -0800
+++ bin2hex/configure.ac	2015-08-01 10:28:33.000000000 -0700
@@ -0,0 +1,6 @@
+AC_INIT([bin2hex], [0.1], [rosenfeld@grumpf.hope-2000.org])
+AM_INIT_AUTOMAKE
+AC_PROG_CC
+AC_CONFIG_FILES([Makefile])
+AC_OUTPUT
+
