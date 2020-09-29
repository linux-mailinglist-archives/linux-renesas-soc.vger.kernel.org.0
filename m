Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B642727B921
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Sep 2020 02:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgI2A4a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Sep 2020 20:56:30 -0400
Received: from mga11.intel.com ([192.55.52.93]:26671 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727043AbgI2A43 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Sep 2020 20:56:29 -0400
IronPort-SDR: 2ZJQOyWy3s4V5D1VUyIcqJhfJp78wkmiNGXtMKyDSryq3xu2r+7ZcWP4GZgJU/1flA1/Vnl3t1
 IEHq+e555KSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="159425175"
X-IronPort-AV: E=Sophos;i="5.77,316,1596524400"; 
   d="scan'208";a="159425175"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 17:50:27 -0700
IronPort-SDR: BiGyf9D3BGMqMKLLFHVJUa6J0ZibgMq3sV4dx4MUYCW5jUGvsV2IUk0CCDXrD13s/fjB7UJazs
 ZvcL5tCIceCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,316,1596524400"; 
   d="scan'208";a="312008216"
Received: from lkp-server01.sh.intel.com (HELO 0e0978ea3297) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Sep 2020 17:50:24 -0700
Received: from kbuild by 0e0978ea3297 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kN3qb-0000SR-GA; Tue, 29 Sep 2020 00:50:25 +0000
Date:   Tue, 29 Sep 2020 08:49:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.11] BUILD SUCCESS
 04a01b9d3d353256d0a003e4e6399ff1b17aee52
Message-ID: <5f7284a8.fLRaUzdHRcy2CAvZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.11
branch HEAD: 04a01b9d3d353256d0a003e4e6399ff1b17aee52  ARM: dts: r8a7742-iwg21d-q7: Add LCD support

elapsed time: 723m

configs tested: 188
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      arches_defconfig
powerpc                      cm5200_defconfig
sparc                       sparc32_defconfig
arm                          badge4_defconfig
powerpc                        cell_defconfig
arc                                 defconfig
sparc                               defconfig
mips                           mtx1_defconfig
powerpc                      bamboo_defconfig
riscv                    nommu_virt_defconfig
s390                                defconfig
arm                       imx_v6_v7_defconfig
m68k                            mac_defconfig
sh                              ul2_defconfig
mips                        vocore2_defconfig
openrisc                    or1ksim_defconfig
powerpc                    amigaone_defconfig
sh                          kfr2r09_defconfig
mips                         cobalt_defconfig
powerpc                     tqm8541_defconfig
powerpc64                           defconfig
csky                             alldefconfig
sh                             shx3_defconfig
riscv                          rv32_defconfig
sh                          rsk7201_defconfig
sh                          rsk7269_defconfig
powerpc                    adder875_defconfig
powerpc                 mpc8560_ads_defconfig
m68k                         amcore_defconfig
sparc64                          alldefconfig
powerpc                      acadia_defconfig
openrisc                         alldefconfig
mips                      pic32mzda_defconfig
arm                   milbeaut_m10v_defconfig
m68k                          multi_defconfig
sh                        edosk7705_defconfig
nios2                         3c120_defconfig
powerpc                     rainier_defconfig
powerpc                     mpc512x_defconfig
mips                       lemote2f_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                      mgcoge_defconfig
mips                        maltaup_defconfig
alpha                            allyesconfig
powerpc                     tqm8548_defconfig
arm                          simpad_defconfig
arc                         haps_hs_defconfig
mips                        qi_lb60_defconfig
arm                        vexpress_defconfig
mips                           ci20_defconfig
sh                        edosk7760_defconfig
mips                      bmips_stb_defconfig
sh                        apsh4ad0a_defconfig
arm                        magician_defconfig
mips                           ip22_defconfig
mips                        workpad_defconfig
xtensa                       common_defconfig
powerpc64                        alldefconfig
arm                          lpd270_defconfig
arm                        multi_v7_defconfig
arm                        spear6xx_defconfig
mips                         db1xxx_defconfig
powerpc                 mpc836x_rdk_defconfig
arc                      axs103_smp_defconfig
arm                              zx_defconfig
arm                        mvebu_v5_defconfig
c6x                        evmc6472_defconfig
powerpc                    socrates_defconfig
sh                             espt_defconfig
mips                     loongson1b_defconfig
xtensa                    smp_lx200_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                  colibri_pxa300_defconfig
powerpc                      ppc40x_defconfig
arm                      integrator_defconfig
arc                          axs103_defconfig
powerpc                       ebony_defconfig
arm                       cns3420vb_defconfig
powerpc                     pseries_defconfig
arm                         vf610m4_defconfig
mips                           gcw0_defconfig
m68k                             allmodconfig
mips                       rbtx49xx_defconfig
nios2                         10m50_defconfig
mips                     cu1000-neo_defconfig
sh                           se7619_defconfig
powerpc                     stx_gp3_defconfig
sh                      rts7751r2d1_defconfig
m68k                             alldefconfig
mips                     decstation_defconfig
arm                           stm32_defconfig
powerpc                     kilauea_defconfig
arm                         lpc32xx_defconfig
ia64                            zx1_defconfig
powerpc                 mpc8540_ads_defconfig
sh                            titan_defconfig
powerpc                   currituck_defconfig
mips                        bcm47xx_defconfig
sh                          polaris_defconfig
powerpc                      walnut_defconfig
sh                         microdev_defconfig
arm                           sunxi_defconfig
microblaze                    nommu_defconfig
sh                           se7750_defconfig
mips                           xway_defconfig
arm                        cerfcube_defconfig
arm                  colibri_pxa270_defconfig
mips                      maltaaprp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20200928
x86_64               randconfig-a003-20200928
x86_64               randconfig-a004-20200928
x86_64               randconfig-a002-20200928
x86_64               randconfig-a006-20200928
x86_64               randconfig-a001-20200928
i386                 randconfig-a006-20200928
i386                 randconfig-a002-20200928
i386                 randconfig-a003-20200928
i386                 randconfig-a004-20200928
i386                 randconfig-a005-20200928
i386                 randconfig-a001-20200928
i386                 randconfig-a002-20200927
i386                 randconfig-a006-20200927
i386                 randconfig-a003-20200927
i386                 randconfig-a004-20200927
i386                 randconfig-a005-20200927
i386                 randconfig-a001-20200927
x86_64               randconfig-a011-20200927
x86_64               randconfig-a013-20200927
x86_64               randconfig-a014-20200927
x86_64               randconfig-a015-20200927
x86_64               randconfig-a012-20200927
x86_64               randconfig-a016-20200927
i386                 randconfig-a012-20200928
i386                 randconfig-a016-20200928
i386                 randconfig-a014-20200928
i386                 randconfig-a013-20200928
i386                 randconfig-a015-20200928
i386                 randconfig-a011-20200928
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20200928
x86_64               randconfig-a013-20200928
x86_64               randconfig-a015-20200928
x86_64               randconfig-a014-20200928
x86_64               randconfig-a016-20200928
x86_64               randconfig-a012-20200928

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
