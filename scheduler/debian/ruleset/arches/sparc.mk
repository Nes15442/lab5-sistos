######################### -*- Mode: Makefile-Gmake -*- ########################
## sparc.mk --- 
## Author           : Manoj Srivastava ( srivasta@glaurung.internal.golden-gryphon.com ) 
## Created On       : Mon Oct 31 18:31:02 2005
## Created On Node  : glaurung.internal.golden-gryphon.com
## Last Modified By : Manoj Srivastava
## Last Modified On : Mon Oct 31 18:31:02 2005
## Last Machine Used: glaurung.internal.golden-gryphon.com
## Update Count     : 0
## Status           : Unknown, Use with caution!
## HISTORY          : 
## Description      : handle the architecture specific variables.
## 
## arch-tag: eb066682-43d8-4ef1-8d0b-163e3ebf0ab6
## 
## 
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
##
###############################################################################

kimage := vmlinuz
loaderdep = silo
loader = silo
loaderdoc=SiloDefault
NEED_DIRECT_GZIP_IMAGE = YES
kimagedest = $(INT_IMAGE_DESTDIR)/vmlinuz-$(version)
DEBCONFIG = $(CONFDIR)/config.sparc

ifeq (,$(KPKG_SUBARCH))
  ifeq (sparc64,$(strip $(shell uname -m)))
    KPKG_SUBARCH = sparc64
  else
    KPKG_SUBARCH = sparc32
  endif
endif

ifneq (,$(filter sparc64%,$(KPKG_SUBARCH)))
   KERNEL_ARCH = sparc64
else
   ifneq (,$(filter sparc%,$(KPKG_SUBARCH)))
      KERNEL_ARCH = sparc
   else
      KERNEL_ARCH = $(strip $(shell uname -m))
   endif
endif

ifneq ($(shell if [ $(VERSION)  -ge  2 ] && [ $(PATCHLEVEL) -ge 5 ] &&  \
                  [ $(SUBLEVEL) -ge 41 ]; then echo new; \
             elif [ $(VERSION)  -ge  2 ] && [ $(PATCHLEVEL) -ge 6 ]; then \
                                          echo new; \
             elif [ $(VERSION)  -ge  3 ]; then echo new; fi),)
  target    = image
  kimagesrc = arch/$(KERNEL_ARCH)/boot/image
  kelfimagesrc = vmlinux
  kelfimagedest = $(INT_IMAGE_DESTDIR)/vmlinux-$(version)
else
  target    = vmlinux
  kimagesrc = vmlinux
endif

#Local variables:
#mode: makefile
#End:
