Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E1A41BB16
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Sep 2021 01:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243366AbhI1XkT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 19:40:19 -0400
Received: from mga01.intel.com ([192.55.52.88]:52152 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243314AbhI1XkT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 19:40:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="247345136"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; 
   d="scan'208";a="247345136"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2021 16:38:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; 
   d="scan'208";a="478992757"
Received: from lkp-server02.sh.intel.com (HELO f7acefbbae94) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Sep 2021 16:38:33 -0700
Received: from kbuild by f7acefbbae94 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mVMgD-0001cm-2o; Tue, 28 Sep 2021 23:38:33 +0000
Date:   Wed, 29 Sep 2021 07:38:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v5.15] BUILD SUCCESS
 fa2a30f8e0aa9304919750b116a9e9e322465299
Message-ID: <6153a75b.edYnk9Mw8WF+LyIr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.15
branch HEAD: fa2a30f8e0aa9304919750b116a9e9e322465299  clk: renesas: rzg2l: Fix clk status function

elapsed time: 415m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210928
arc                 nsimosci_hs_smp_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     ppa8548_defconfig
powerpc                     powernv_defconfig
arm                      pxa255-idp_defconfig
arm                          pxa168_defconfig
sh                           se7721_defconfig
sh                               alldefconfig
nios2                         10m50_defconfig
powerpc                      arches_defconfig
sh                           se7722_defconfig
arm                            pleb_defconfig
arm                          ep93xx_defconfig
arm                     am200epdkit_defconfig
mips                      maltasmvp_defconfig
powerpc                 mpc837x_rdb_defconfig
nds32                               defconfig
powerpc                      ep88xc_defconfig
m68k                          atari_defconfig
mips                           ip32_defconfig
arc                        nsimosci_defconfig
arm                       imx_v4_v5_defconfig
arm                         bcm2835_defconfig
powerpc                     ep8248e_defconfig
m68k                       bvme6000_defconfig
arc                        nsim_700_defconfig
arm                           tegra_defconfig
arm                         hackkit_defconfig
mips                           ci20_defconfig
arm                         lpc18xx_defconfig
powerpc                      bamboo_defconfig
powerpc                      ppc6xx_defconfig
mips                  decstation_64_defconfig
mips                      maltaaprp_defconfig
arm                         axm55xx_defconfig
mips                          rm200_defconfig
arc                         haps_hs_defconfig
um                             i386_defconfig
arm                              alldefconfig
h8300                            allyesconfig
arm                        spear6xx_defconfig
m68k                        mvme16x_defconfig
sparc                       sparc32_defconfig
sh                          urquell_defconfig
mips                           ip27_defconfig
mips                      fuloong2e_defconfig
sh                          r7780mp_defconfig
m68k                        m5272c3_defconfig
powerpc                     tqm5200_defconfig
powerpc                 linkstation_defconfig
arm                         palmz72_defconfig
powerpc                      acadia_defconfig
microblaze                      mmu_defconfig
sh                        sh7785lcr_defconfig
sh                           se7751_defconfig
sh                          sdk7780_defconfig
arm                             ezx_defconfig
sh                             shx3_defconfig
x86_64               randconfig-c001-20210928
arm                  randconfig-c002-20210928
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a014-20210928
x86_64               randconfig-a011-20210928
x86_64               randconfig-a013-20210928
x86_64               randconfig-a012-20210928
x86_64               randconfig-a015-20210928
x86_64               randconfig-a016-20210928
i386                 randconfig-a014-20210928
i386                 randconfig-a013-20210928
i386                 randconfig-a016-20210928
i386                 randconfig-a011-20210928
i386                 randconfig-a015-20210928
i386                 randconfig-a012-20210928
arc                  randconfig-r043-20210928
riscv                randconfig-r042-20210928
s390                 randconfig-r044-20210928
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a002-20210928
x86_64               randconfig-a005-20210928
x86_64               randconfig-a001-20210928
x86_64               randconfig-a006-20210928
x86_64               randconfig-a003-20210928
x86_64               randconfig-a004-20210928
i386                 randconfig-a001-20210928
i386                 randconfig-a005-20210928
i386                 randconfig-a002-20210928
i386                 randconfig-a006-20210928
i386                 randconfig-a004-20210928
i386                 randconfig-a003-20210928
hexagon              randconfig-r045-20210928
hexagon              randconfig-r041-20210928

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
