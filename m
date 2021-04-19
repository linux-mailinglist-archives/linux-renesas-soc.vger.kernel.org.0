Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EC2364E97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Apr 2021 01:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhDSXZz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Apr 2021 19:25:55 -0400
Received: from mga09.intel.com ([134.134.136.24]:63452 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229723AbhDSXZy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 19:25:54 -0400
IronPort-SDR: SqVk2ZAu5MNcT+YzLjb2N/CpEmlW19kc/MH4Z4gPOGWYthG25St3Fnf5ePpu5IF5c6FGtt7eLR
 Ps4JHQYETvNA==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="195528904"
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; 
   d="scan'208";a="195528904"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2021 16:25:23 -0700
IronPort-SDR: 8GJW1rW4028bNsQ3kTsLCuaknNEThAPkZDm3v+cW1yvG2r9TzdXLPz0V0LUn+wbjhyl9VYJaVV
 C9/YEwuryEjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; 
   d="scan'208";a="534303234"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Apr 2021 16:25:21 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lYdGb-0001xe-2b; Mon, 19 Apr 2021 23:25:21 +0000
Date:   Tue, 20 Apr 2021 07:25:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.14] BUILD SUCCESS
 7f9ea367e21bee52345ec49192f0c45876fc97b9
Message-ID: <607e115d.ZaFF7jmc0Ocu/bSB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.14
branch HEAD: 7f9ea367e21bee52345ec49192f0c45876fc97b9  arm64: dts: renesas: falcon-csi-dsi: Add GPIO extenders

elapsed time: 720m

configs tested: 169
configs skipped: 93

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
powerpc                     mpc5200_defconfig
m68k                          atari_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                     kmeter1_defconfig
openrisc                 simple_smp_defconfig
m68k                        mvme16x_defconfig
powerpc                 mpc832x_mds_defconfig
mips                           xway_defconfig
sh                             espt_defconfig
sparc64                          alldefconfig
powerpc                   motionpro_defconfig
sh                         ap325rxa_defconfig
nds32                             allnoconfig
mips                      pic32mzda_defconfig
sh                      rts7751r2d1_defconfig
xtensa                         virt_defconfig
arm                            mmp2_defconfig
arm                           omap1_defconfig
arm                        multi_v5_defconfig
powerpc                     tqm8540_defconfig
sh                           se7206_defconfig
powerpc                      ep88xc_defconfig
powerpc                     sbc8548_defconfig
mips                            gpr_defconfig
arm                         orion5x_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                     davinci_all_defconfig
h8300                     edosk2674_defconfig
arm                       multi_v4t_defconfig
mips                          ath79_defconfig
sh                         ecovec24_defconfig
powerpc                 mpc834x_itx_defconfig
xtensa                    smp_lx200_defconfig
arm                        mini2440_defconfig
arm                        neponset_defconfig
mips                        bcm63xx_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                           se7750_defconfig
sh                         apsh4a3a_defconfig
sparc                       sparc32_defconfig
um                               alldefconfig
m68k                        m5272c3_defconfig
powerpc                         ps3_defconfig
xtensa                           allyesconfig
powerpc                 mpc832x_rdb_defconfig
sparc                       sparc64_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                            hp6xx_defconfig
powerpc                 linkstation_defconfig
sh                          sdk7786_defconfig
s390                             allmodconfig
arm                        vexpress_defconfig
alpha                            alldefconfig
arm                            lart_defconfig
powerpc                          g5_defconfig
powerpc                      bamboo_defconfig
mips                        nlm_xlr_defconfig
arm                    vt8500_v6_v7_defconfig
mips                     cu1830-neo_defconfig
powerpc                      cm5200_defconfig
arm                      pxa255-idp_defconfig
s390                             alldefconfig
powerpc                      arches_defconfig
xtensa                          iss_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                      integrator_defconfig
mips                      fuloong2e_defconfig
parisc                generic-64bit_defconfig
mips                        maltaup_defconfig
arm                           h5000_defconfig
powerpc                     mpc83xx_defconfig
arm                         hackkit_defconfig
powerpc                     ep8248e_defconfig
xtensa                       common_defconfig
h8300                               defconfig
m68k                         amcore_defconfig
mips                        jmr3927_defconfig
mips                       capcella_defconfig
powerpc                        warp_defconfig
alpha                            allyesconfig
mips                        bcm47xx_defconfig
ia64                             allmodconfig
powerpc                 xes_mpc85xx_defconfig
ia64                                defconfig
powerpc                      katmai_defconfig
powerpc                       ppc64_defconfig
powerpc                     kilauea_defconfig
mips                      maltaaprp_defconfig
arm                        spear3xx_defconfig
riscv                    nommu_virt_defconfig
nios2                         3c120_defconfig
sh                          landisk_defconfig
arm                          pcm027_defconfig
arm                          imote2_defconfig
arm                          gemini_defconfig
arm                          exynos_defconfig
powerpc                 mpc834x_mds_defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210419
x86_64               randconfig-a001-20210419
x86_64               randconfig-a005-20210419
x86_64               randconfig-a002-20210419
x86_64               randconfig-a006-20210419
x86_64               randconfig-a004-20210419
i386                 randconfig-a003-20210419
i386                 randconfig-a001-20210419
i386                 randconfig-a006-20210419
i386                 randconfig-a005-20210419
i386                 randconfig-a004-20210419
i386                 randconfig-a002-20210419
i386                 randconfig-a015-20210419
i386                 randconfig-a013-20210419
i386                 randconfig-a014-20210419
i386                 randconfig-a016-20210419
i386                 randconfig-a012-20210419
i386                 randconfig-a011-20210419
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210419
x86_64               randconfig-a015-20210419
x86_64               randconfig-a013-20210419
x86_64               randconfig-a011-20210419
x86_64               randconfig-a012-20210419
x86_64               randconfig-a016-20210419

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
