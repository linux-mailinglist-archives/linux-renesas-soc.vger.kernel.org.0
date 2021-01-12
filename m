Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014142F2659
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 03:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730673AbhALCjH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jan 2021 21:39:07 -0500
Received: from mga09.intel.com ([134.134.136.24]:47586 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730712AbhALCjG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 21:39:06 -0500
IronPort-SDR: 3reHFLxB8wI3aJZAbchvk8TkYiIG7JrMXA/G4w5bAz/hHbWAkIhGmXdl/+r41klzLrsCTLrYsa
 G2ElAQIgKvpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="178120991"
X-IronPort-AV: E=Sophos;i="5.79,340,1602572400"; 
   d="scan'208";a="178120991"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 18:38:25 -0800
IronPort-SDR: tu1TsmFYwn2vH90jM9qUVpfV9mKgEFOyznkEiV4MTVvgIt4ZJcT7pvI4H424T10bLKUXDkrlps
 KDKCqp3IDJ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,340,1602572400"; 
   d="scan'208";a="400024244"
Received: from lkp-server01.sh.intel.com (HELO 3cff8e4c45aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jan 2021 18:38:24 -0800
Received: from kbuild by 3cff8e4c45aa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kz9Zf-0000Sx-7x; Tue, 12 Jan 2021 02:38:23 +0000
Date:   Tue, 12 Jan 2021 10:37:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.12] BUILD SUCCESS
 8811955d0a6d0abfa3e1c0cee30090fda0015069
Message-ID: <5ffd0b83.Wtfsnm5XDpQnZlOh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.12
branch HEAD: 8811955d0a6d0abfa3e1c0cee30090fda0015069  arm64: dts: renesas: rzg2: Add RPC-IF Support

elapsed time: 721m

configs tested: 140
configs skipped: 97

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                          hp300_defconfig
arm                         bcm2835_defconfig
openrisc                            defconfig
mips                           rs90_defconfig
csky                                defconfig
arm                          iop32x_defconfig
mips                  cavium_octeon_defconfig
sh                           se7206_defconfig
powerpc                  storcenter_defconfig
arm                          ep93xx_defconfig
mips                        bcm63xx_defconfig
powerpc                  iss476-smp_defconfig
sh                          r7785rp_defconfig
arm                         s5pv210_defconfig
sparc                       sparc32_defconfig
microblaze                      mmu_defconfig
powerpc                      walnut_defconfig
mips                           mtx1_defconfig
powerpc                      arches_defconfig
powerpc                      ppc6xx_defconfig
arm                      tct_hammer_defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                          atari_defconfig
arm                         lpc32xx_defconfig
sh                           sh2007_defconfig
h8300                     edosk2674_defconfig
arm                           h5000_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                         tb0219_defconfig
sh                           se7712_defconfig
m68k                          sun3x_defconfig
mips                  decstation_64_defconfig
arm                         orion5x_defconfig
mips                         tb0287_defconfig
powerpc                      ep88xc_defconfig
m68k                       m5249evb_defconfig
powerpc                     rainier_defconfig
sh                   secureedge5410_defconfig
arm                        vexpress_defconfig
mips                malta_kvm_guest_defconfig
mips                         rt305x_defconfig
powerpc                      ppc64e_defconfig
arm                         vf610m4_defconfig
m68k                           sun3_defconfig
sh                               allmodconfig
arm                            pleb_defconfig
sh                        sh7785lcr_defconfig
arm                        multi_v7_defconfig
powerpc                      mgcoge_defconfig
powerpc                       ppc64_defconfig
m68k                       m5275evb_defconfig
mips                       rbtx49xx_defconfig
powerpc                      makalu_defconfig
arm                       cns3420vb_defconfig
arm                           efm32_defconfig
nios2                            alldefconfig
mips                  maltasmvp_eva_defconfig
powerpc                     sbc8548_defconfig
arm                         palmz72_defconfig
arm                        mvebu_v7_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210111
x86_64               randconfig-a006-20210111
x86_64               randconfig-a001-20210111
x86_64               randconfig-a003-20210111
x86_64               randconfig-a005-20210111
x86_64               randconfig-a002-20210111
i386                 randconfig-a002-20210111
i386                 randconfig-a005-20210111
i386                 randconfig-a006-20210111
i386                 randconfig-a001-20210111
i386                 randconfig-a003-20210111
i386                 randconfig-a004-20210111
x86_64               randconfig-a015-20210110
x86_64               randconfig-a012-20210110
x86_64               randconfig-a013-20210110
x86_64               randconfig-a016-20210110
x86_64               randconfig-a014-20210110
x86_64               randconfig-a011-20210110
i386                 randconfig-a012-20210111
i386                 randconfig-a011-20210111
i386                 randconfig-a016-20210111
i386                 randconfig-a015-20210111
i386                 randconfig-a013-20210111
i386                 randconfig-a014-20210111
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210111
x86_64               randconfig-a012-20210111
x86_64               randconfig-a013-20210111
x86_64               randconfig-a016-20210111
x86_64               randconfig-a014-20210111
x86_64               randconfig-a011-20210111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
