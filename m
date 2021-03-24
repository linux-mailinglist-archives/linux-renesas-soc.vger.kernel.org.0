Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F029834849D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 23:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235201AbhCXW2k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 18:28:40 -0400
Received: from mga07.intel.com ([134.134.136.100]:2993 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232761AbhCXW2L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 18:28:11 -0400
IronPort-SDR: QllmCtlys94xQoDHuJjjdjYKAhAwAjHQkotNgS6qav00xv2EZjEWedrw34B6W0jcagaSl3mtQb
 LuvpDU7+eBfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="254787516"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="254787516"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 15:28:10 -0700
IronPort-SDR: 4WCrQPhpLsAuwdEfeokbfUcCZ8waEejX6W3CoPif5DF/T+Ws44aIBC+0oXi+jM6s7JdjmNC1jQ
 hWGIKNedU9Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="391462822"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Mar 2021 15:28:08 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lPByy-0001ZM-4l; Wed, 24 Mar 2021 22:28:08 +0000
Date:   Thu, 25 Mar 2021 06:27:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.13] BUILD SUCCESS
 c7b22b504404c27c2496892161e5c6d43ddaab10
Message-ID: <605bbcee.6y9KqdY0IadaX71S%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.13
branch HEAD: c7b22b504404c27c2496892161e5c6d43ddaab10  arm64: dts: renesas: r8a77961: Add VIN and CSI-2 device nodes

elapsed time: 720m

configs tested: 158
configs skipped: 70

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
riscv                            allyesconfig
i386                             allyesconfig
powerpc                         ps3_defconfig
um                           x86_64_defconfig
s390                             allmodconfig
ia64                         bigsur_defconfig
powerpc                     tqm8560_defconfig
mips                        workpad_defconfig
nds32                             allnoconfig
powerpc                 mpc8313_rdb_defconfig
mips                     cu1000-neo_defconfig
arm                        mini2440_defconfig
mips                         tb0287_defconfig
sh                ecovec24-romimage_defconfig
mips                        qi_lb60_defconfig
arm                        vexpress_defconfig
sh                  sh7785lcr_32bit_defconfig
arc                                 defconfig
sh                        edosk7760_defconfig
arm                             ezx_defconfig
riscv             nommu_k210_sdcard_defconfig
riscv                               defconfig
sh                           se7780_defconfig
arm                      tct_hammer_defconfig
arm                             mxs_defconfig
sh                            titan_defconfig
mips                 decstation_r4k_defconfig
arc                    vdk_hs38_smp_defconfig
mips                           gcw0_defconfig
powerpc                      ep88xc_defconfig
powerpc                     rainier_defconfig
arm                        mvebu_v5_defconfig
xtensa                           alldefconfig
sparc                            alldefconfig
mips                          rb532_defconfig
sparc                       sparc32_defconfig
m68k                        m5272c3_defconfig
mips                            e55_defconfig
m68k                          hp300_defconfig
arc                           tb10x_defconfig
mips                        bcm63xx_defconfig
h8300                       h8s-sim_defconfig
mips                      pic32mzda_defconfig
arm                       versatile_defconfig
sh                        sh7785lcr_defconfig
arm                          collie_defconfig
sh                            hp6xx_defconfig
um                            kunit_defconfig
arm                          lpd270_defconfig
sh                          sdk7780_defconfig
powerpc                  storcenter_defconfig
powerpc                     kilauea_defconfig
mips                   sb1250_swarm_defconfig
m68k                            q40_defconfig
mips                     loongson1b_defconfig
m68k                        m5407c3_defconfig
arm                      footbridge_defconfig
arm                          simpad_defconfig
xtensa                         virt_defconfig
powerpc                 mpc8540_ads_defconfig
sh                          sdk7786_defconfig
arm                           stm32_defconfig
sh                           se7721_defconfig
powerpc                 mpc85xx_cds_defconfig
m68k                       m5475evb_defconfig
sh                   rts7751r2dplus_defconfig
mips                      maltaaprp_defconfig
nios2                         3c120_defconfig
sh                          landisk_defconfig
mips                             allyesconfig
sh                   secureedge5410_defconfig
arm                      integrator_defconfig
powerpc                 mpc836x_mds_defconfig
arm                         lpc18xx_defconfig
mips                           rs90_defconfig
mips                       capcella_defconfig
arm                         axm55xx_defconfig
arm64                            alldefconfig
mips                     loongson1c_defconfig
powerpc                      makalu_defconfig
mips                  maltasmvp_eva_defconfig
ia64                             alldefconfig
riscv                          rv32_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                     stx_gp3_defconfig
ia64                             allmodconfig
ia64                                defconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210324
i386                 randconfig-a003-20210324
i386                 randconfig-a001-20210324
i386                 randconfig-a002-20210324
i386                 randconfig-a006-20210324
i386                 randconfig-a005-20210324
x86_64               randconfig-a012-20210324
x86_64               randconfig-a015-20210324
x86_64               randconfig-a014-20210324
x86_64               randconfig-a013-20210324
x86_64               randconfig-a016-20210324
x86_64               randconfig-a011-20210324
i386                 randconfig-a014-20210324
i386                 randconfig-a011-20210324
i386                 randconfig-a015-20210324
i386                 randconfig-a016-20210324
i386                 randconfig-a013-20210324
i386                 randconfig-a012-20210324
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210323
x86_64               randconfig-a015-20210323
x86_64               randconfig-a013-20210323
x86_64               randconfig-a014-20210323
x86_64               randconfig-a011-20210323
x86_64               randconfig-a016-20210323
x86_64               randconfig-a002-20210324
x86_64               randconfig-a003-20210324
x86_64               randconfig-a001-20210324
x86_64               randconfig-a006-20210324
x86_64               randconfig-a005-20210324
x86_64               randconfig-a004-20210324

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
