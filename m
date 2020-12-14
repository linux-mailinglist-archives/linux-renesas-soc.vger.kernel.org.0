Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A9E2DA22B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 21:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502882AbgLNU7j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 15:59:39 -0500
Received: from mga03.intel.com ([134.134.136.65]:15092 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503624AbgLNU7g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 15:59:36 -0500
IronPort-SDR: ZhT3hCjvF4XeqPZTAuo9eKlbDd7EltzdrV/GblFcjIejyM8a1bEk290HNwxIw+WowWH2qCTLEH
 2u9suV77DA8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="174888490"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="174888490"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 12:58:53 -0800
IronPort-SDR: lkxuQaQUqtVf+3imr+iUGpOLKiVjJ4Zyq9yDgt+/B07pBvLOUk/wRInXwlpBs7t+0hNR0QgKfl
 f2m+pXkCToiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="336305771"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Dec 2020 12:58:52 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kouvj-0000Su-Bd; Mon, 14 Dec 2020 20:58:51 +0000
Date:   Tue, 15 Dec 2020 04:58:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk-for-v5.12] BUILD SUCCESS
 5612ede5516f8ef9760231e03f73163061a3beb1
Message-ID: <5fd7d206.ugXMac0jTlhw0Nco%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  renesas-clk-for-v5.12
branch HEAD: 5612ede5516f8ef9760231e03f73163061a3beb1  clk: renesas: r8a77995: Add TMU clocks

elapsed time: 723m

configs tested: 152
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5249evb_defconfig
powerpc                mpc7448_hpc2_defconfig
microblaze                      mmu_defconfig
sh                           se7705_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7206_defconfig
powerpc                   bluestone_defconfig
sh                   secureedge5410_defconfig
c6x                         dsk6455_defconfig
xtensa                    smp_lx200_defconfig
mips                          malta_defconfig
h8300                            allyesconfig
m68k                       m5208evb_defconfig
openrisc                            defconfig
sh                           se7712_defconfig
riscv                             allnoconfig
powerpc                  iss476-smp_defconfig
xtensa                    xip_kc705_defconfig
mips                           xway_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     ppa8548_defconfig
microblaze                    nommu_defconfig
arm                         hackkit_defconfig
parisc                              defconfig
mips                         bigsur_defconfig
m68k                       m5275evb_defconfig
arc                      axs103_smp_defconfig
mips                          rm200_defconfig
arm                       spear13xx_defconfig
sh                                  defconfig
c6x                        evmc6678_defconfig
sh                        sh7763rdp_defconfig
sparc                            alldefconfig
powerpc                        fsp2_defconfig
powerpc                        icon_defconfig
i386                             alldefconfig
arm                       cns3420vb_defconfig
arc                            hsdk_defconfig
m68k                          sun3x_defconfig
powerpc                      acadia_defconfig
arm                          pxa168_defconfig
powerpc                    sam440ep_defconfig
powerpc                      cm5200_defconfig
xtensa                  audio_kc705_defconfig
sh                        dreamcast_defconfig
arm                        clps711x_defconfig
mips                        jmr3927_defconfig
i386                                defconfig
arm                  colibri_pxa270_defconfig
powerpc                     mpc512x_defconfig
powerpc                         ps3_defconfig
powerpc                      obs600_defconfig
sh                ecovec24-romimage_defconfig
sh                   sh7770_generic_defconfig
powerpc                     kmeter1_defconfig
mips                        nlm_xlp_defconfig
powerpc                     akebono_defconfig
powerpc                    adder875_defconfig
m68k                          amiga_defconfig
powerpc                       holly_defconfig
mips                      maltaaprp_defconfig
mips                     loongson1b_defconfig
sh                             sh03_defconfig
x86_64                           alldefconfig
arm                      pxa255-idp_defconfig
arm                         cm_x300_defconfig
openrisc                         alldefconfig
arm                         at91_dt_defconfig
arm                       netwinder_defconfig
arm                          ixp4xx_defconfig
arm                          pxa910_defconfig
sh                         ap325rxa_defconfig
powerpc                     tqm5200_defconfig
csky                             alldefconfig
mips                      pistachio_defconfig
arm                           sama5_defconfig
arm                        mvebu_v5_defconfig
mips                         mpc30x_defconfig
m68k                       m5475evb_defconfig
mips                        bcm47xx_defconfig
m68k                          multi_defconfig
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20201214
i386                 randconfig-a004-20201214
i386                 randconfig-a003-20201214
i386                 randconfig-a002-20201214
i386                 randconfig-a006-20201214
i386                 randconfig-a005-20201214
x86_64               randconfig-a016-20201214
x86_64               randconfig-a012-20201214
x86_64               randconfig-a013-20201214
x86_64               randconfig-a015-20201214
x86_64               randconfig-a014-20201214
x86_64               randconfig-a011-20201214
i386                 randconfig-a014-20201214
i386                 randconfig-a013-20201214
i386                 randconfig-a012-20201214
i386                 randconfig-a011-20201214
i386                 randconfig-a015-20201214
i386                 randconfig-a016-20201214
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201214
x86_64               randconfig-a006-20201214
x86_64               randconfig-a002-20201214
x86_64               randconfig-a005-20201214
x86_64               randconfig-a004-20201214
x86_64               randconfig-a001-20201214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
