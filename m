Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3425746CCC6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 06:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbhLHFHC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Dec 2021 00:07:02 -0500
Received: from mga02.intel.com ([134.134.136.20]:37387 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230245AbhLHFG7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 00:06:59 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="225014255"
X-IronPort-AV: E=Sophos;i="5.87,296,1631602800"; 
   d="scan'208";a="225014255"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 21:03:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,296,1631602800"; 
   d="scan'208";a="461570740"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 07 Dec 2021 21:03:26 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mup6z-000050-S3; Wed, 08 Dec 2021 05:03:25 +0000
Date:   Wed, 08 Dec 2021 13:02:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD REGRESSION
 6496166cb5d7dd163ceea55390060d77f008bc8b
Message-ID: <61b03c7a.ZlMJw4hoTf4U3Sf/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 6496166cb5d7dd163ceea55390060d77f008bc8b  clk: renesas: r9a07g044: Add GPU clock and reset entries

Error/Warning reports:

https://lore.kernel.org/linux-renesas-soc/202112080709.fFYm8JaQ-lkp@intel.com
https://lore.kernel.org/linux-renesas-soc/202112081010.7vN3rLa4-lkp@intel.com

Error/Warning in current branch:

aarch64-linux-ld: drivers/clk/renesas/r8a779a0-cpg-mssr.o:(.init.rodata+0x70): undefined reference to `rcar_gen4_cpg_clk_register'
arm-linux-gnueabi-ld: drivers/clk/renesas/r8a779a0-cpg-mssr.o:(.init.rodata+0x44): undefined reference to `rcar_gen4_cpg_clk_register'

possible Error/Warning in current branch (please contact us if interested):

arc-elf-ld: drivers/clk/renesas/r8a779a0-cpg-mssr.o:(.init.rodata+0x44): undefined reference to `rcar_gen4_cpg_clk_register'
arceb-elf-ld: drivers/clk/renesas/r8a779a0-cpg-mssr.o:(.init.rodata+0x44): undefined reference to `rcar_gen4_cpg_clk_register'
powerpc-linux-ld: drivers/clk/renesas/r8a779a0-cpg-mssr.o:(.init.rodata+0x44): undefined reference to `rcar_gen4_cpg_clk_register'
r8a779a0-cpg-mssr.c:(.init.text+0x84): undefined reference to `rcar_gen4_cpg_init'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-m031-20211207
|   `-- arceb-elf-ld:drivers-clk-renesas-r8a779a0-cpg-mssr.o:(.init.rodata):undefined-reference-to-rcar_gen4_cpg_clk_register
|-- arc-randconfig-r031-20211206
|   `-- arc-elf-ld:drivers-clk-renesas-r8a779a0-cpg-mssr.o:(.init.rodata):undefined-reference-to-rcar_gen4_cpg_clk_register
|-- arm-randconfig-r023-20211207
|   `-- arm-linux-gnueabi-ld:drivers-clk-renesas-r8a779a0-cpg-mssr.o:(.init.rodata):undefined-reference-to-rcar_gen4_cpg_clk_register
|-- arm64-randconfig-p002-20211207
|   `-- aarch64-linux-ld:drivers-clk-renesas-r8a779a0-cpg-mssr.o:(.init.rodata):undefined-reference-to-rcar_gen4_cpg_clk_register
`-- powerpc-randconfig-m031-20211207
    |-- powerpc-linux-ld:drivers-clk-renesas-r8a779a0-cpg-mssr.o:(.init.rodata):undefined-reference-to-rcar_gen4_cpg_clk_register
    `-- r8a779a0-cpg-mssr.c:(.init.text):undefined-reference-to-rcar_gen4_cpg_init

elapsed time: 721m

configs tested: 168
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211207
m68k                             alldefconfig
csky                                defconfig
arc                           tb10x_defconfig
arm                           tegra_defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                          atari_defconfig
arm                           sama7_defconfig
arm                         s5pv210_defconfig
arm                       spear13xx_defconfig
powerpc                  iss476-smp_defconfig
h8300                     edosk2674_defconfig
mips                           rs90_defconfig
mips                      maltasmvp_defconfig
h8300                            allyesconfig
mips                         tb0287_defconfig
sh                                  defconfig
powerpc                    mvme5100_defconfig
sh                            shmin_defconfig
mips                        bcm63xx_defconfig
sh                           se7705_defconfig
mips                           xway_defconfig
powerpc                      cm5200_defconfig
sparc64                             defconfig
powerpc                         wii_defconfig
powerpc                   motionpro_defconfig
parisc                           alldefconfig
arm                           h3600_defconfig
mips                      loongson3_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                           ip22_defconfig
arm                        shmobile_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                           omap1_defconfig
powerpc                       holly_defconfig
arm                      pxa255-idp_defconfig
sh                   rts7751r2dplus_defconfig
mips                        workpad_defconfig
sh                             espt_defconfig
arm                      footbridge_defconfig
powerpc                      acadia_defconfig
sh                     sh7710voipgw_defconfig
sh                           se7721_defconfig
arm                        mvebu_v7_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                         ecovec24_defconfig
arm                         orion5x_defconfig
sh                           se7780_defconfig
i386                             allyesconfig
mips                         db1xxx_defconfig
sh                          sdk7786_defconfig
arc                            hsdk_defconfig
powerpc                      katmai_defconfig
s390                                defconfig
powerpc                      tqm8xx_defconfig
parisc                generic-64bit_defconfig
sparc64                          alldefconfig
arm                         mv78xx0_defconfig
mips                          ath79_defconfig
arm                          pcm027_defconfig
m68k                          sun3x_defconfig
m68k                        m5272c3_defconfig
powerpc                     powernv_defconfig
arc                      axs103_smp_defconfig
mips                     cu1000-neo_defconfig
arm                        cerfcube_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     ppa8548_defconfig
m68k                            q40_defconfig
nds32                             allnoconfig
powerpc                     tqm8548_defconfig
sh                        sh7757lcr_defconfig
nios2                            allyesconfig
sh                 kfr2r09-romimage_defconfig
arm                         at91_dt_defconfig
sparc                               defconfig
mips                       rbtx49xx_defconfig
xtensa                  nommu_kc705_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                      walnut_defconfig
arm                   milbeaut_m10v_defconfig
arm                  randconfig-c002-20211207
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211207
x86_64               randconfig-a005-20211207
x86_64               randconfig-a001-20211207
x86_64               randconfig-a002-20211207
x86_64               randconfig-a004-20211207
x86_64               randconfig-a003-20211207
i386                 randconfig-a001-20211207
i386                 randconfig-a005-20211207
i386                 randconfig-a002-20211207
i386                 randconfig-a003-20211207
i386                 randconfig-a006-20211207
i386                 randconfig-a004-20211207
x86_64               randconfig-a016-20211208
x86_64               randconfig-a011-20211208
x86_64               randconfig-a013-20211208
x86_64               randconfig-a012-20211208
x86_64               randconfig-a015-20211208
x86_64               randconfig-a014-20211208
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211207
arm                  randconfig-c002-20211207
riscv                randconfig-c006-20211207
mips                 randconfig-c004-20211207
i386                 randconfig-c001-20211207
powerpc              randconfig-c003-20211207
s390                 randconfig-c005-20211207
x86_64               randconfig-a016-20211207
x86_64               randconfig-a011-20211207
x86_64               randconfig-a013-20211207
x86_64               randconfig-a014-20211207
x86_64               randconfig-a015-20211207
x86_64               randconfig-a012-20211207
i386                 randconfig-a016-20211207
i386                 randconfig-a013-20211207
i386                 randconfig-a011-20211207
i386                 randconfig-a014-20211207
i386                 randconfig-a012-20211207
i386                 randconfig-a015-20211207
hexagon              randconfig-r045-20211207
s390                 randconfig-r044-20211207
riscv                randconfig-r042-20211207
hexagon              randconfig-r041-20211207

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
