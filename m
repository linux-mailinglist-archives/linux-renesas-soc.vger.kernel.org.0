Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAC54640C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 22:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhK3Vyw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 16:54:52 -0500
Received: from mga09.intel.com ([134.134.136.24]:13358 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232408AbhK3Vyv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 16:54:51 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="236146626"
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; 
   d="scan'208";a="236146626"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 13:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; 
   d="scan'208";a="459776780"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Nov 2021 13:51:28 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1msB27-000Dnu-N1; Tue, 30 Nov 2021 21:51:27 +0000
Date:   Wed, 01 Dec 2021 05:50:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v5.17] BUILD SUCCESS
 05b22caa7490e4f4c94bbde33c61cf72d187b8f7
Message-ID: <61a69cb2.iVbJWWOH1ljBn5de%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v5.17
branch HEAD: 05b22caa7490e4f4c94bbde33c61cf72d187b8f7  soc: renesas: Consolidate product register handling

elapsed time: 726m

configs tested: 241
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211128
i386                 randconfig-c001-20211201
i386                 randconfig-c001-20211130
sh                          rsk7269_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                   secureedge5410_defconfig
m68k                             allmodconfig
arm                        realview_defconfig
arm                          exynos_defconfig
mips                       capcella_defconfig
powerpc                     tqm8555_defconfig
i386                                defconfig
arm                         mv78xx0_defconfig
sh                           se7750_defconfig
powerpc                      pasemi_defconfig
sh                               alldefconfig
arm                       imx_v6_v7_defconfig
powerpc                      acadia_defconfig
m68k                        m5272c3_defconfig
sh                          polaris_defconfig
powerpc                    adder875_defconfig
sh                        edosk7760_defconfig
powerpc                       holly_defconfig
arm                      footbridge_defconfig
xtensa                  cadence_csp_defconfig
arm                    vt8500_v6_v7_defconfig
mips                          malta_defconfig
arm                          ep93xx_defconfig
xtensa                       common_defconfig
arm                         s3c2410_defconfig
powerpc                     kilauea_defconfig
um                               alldefconfig
mips                           ci20_defconfig
sh                          rsk7201_defconfig
arm                     davinci_all_defconfig
riscv                            allyesconfig
mips                malta_qemu_32r6_defconfig
powerpc                      cm5200_defconfig
mips                        qi_lb60_defconfig
mips                         cobalt_defconfig
powerpc                       maple_defconfig
sh                           se7722_defconfig
sh                            titan_defconfig
mips                    maltaup_xpa_defconfig
arm                  colibri_pxa270_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                 canyonlands_defconfig
sh                     sh7710voipgw_defconfig
m68k                          hp300_defconfig
arm                       omap2plus_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                       m5208evb_defconfig
powerpc                 linkstation_defconfig
arm                            xcep_defconfig
mips                         tb0287_defconfig
arm                         s5pv210_defconfig
powerpc                   currituck_defconfig
arm                          imote2_defconfig
arm                        mvebu_v7_defconfig
x86_64                              defconfig
arm                       versatile_defconfig
microblaze                      mmu_defconfig
arm                         orion5x_defconfig
mips                           ip22_defconfig
arm                     eseries_pxa_defconfig
sparc64                             defconfig
sh                            shmin_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                      ep88xc_defconfig
arm                             mxs_defconfig
arc                        nsimosci_defconfig
powerpc                           allnoconfig
mips                           ip28_defconfig
mips                  maltasmvp_eva_defconfig
m68k                        m5407c3_defconfig
arc                        nsim_700_defconfig
arm                         lubbock_defconfig
sh                     magicpanelr2_defconfig
powerpc                          g5_defconfig
powerpc64                        alldefconfig
openrisc                    or1ksim_defconfig
powerpc                  iss476-smp_defconfig
arm                         bcm2835_defconfig
sh                               j2_defconfig
powerpc                     tqm8548_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                           gcw0_defconfig
mips                        omega2p_defconfig
mips                           rs90_defconfig
arm                           h5000_defconfig
m68k                             allyesconfig
sh                          landisk_defconfig
ia64                         bigsur_defconfig
powerpc                     stx_gp3_defconfig
mips                       lemote2f_defconfig
nds32                               defconfig
openrisc                            defconfig
arm                          pcm027_defconfig
powerpc                        warp_defconfig
mips                 decstation_r4k_defconfig
parisc                              defconfig
powerpc                 mpc834x_mds_defconfig
arc                        vdk_hs38_defconfig
mips                        workpad_defconfig
nios2                            alldefconfig
arm                         socfpga_defconfig
mips                     decstation_defconfig
arm                         vf610m4_defconfig
arm                             pxa_defconfig
powerpc                 mpc8540_ads_defconfig
sh                         apsh4a3a_defconfig
sparc                            alldefconfig
powerpc                      katmai_defconfig
mips                           ip27_defconfig
arm                       aspeed_g5_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        cerfcube_defconfig
powerpc                      chrp32_defconfig
arm                           h3600_defconfig
arm                  randconfig-c002-20211129
arm                  randconfig-c002-20211128
arm                  randconfig-c002-20211130
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a005-20211130
i386                 randconfig-a002-20211130
i386                 randconfig-a006-20211130
i386                 randconfig-a004-20211130
i386                 randconfig-a003-20211130
i386                 randconfig-a001-20211130
i386                 randconfig-a001-20211129
i386                 randconfig-a002-20211129
i386                 randconfig-a006-20211129
i386                 randconfig-a005-20211129
i386                 randconfig-a004-20211129
i386                 randconfig-a003-20211129
x86_64               randconfig-a011-20211128
x86_64               randconfig-a014-20211128
x86_64               randconfig-a012-20211128
x86_64               randconfig-a016-20211128
x86_64               randconfig-a013-20211128
x86_64               randconfig-a015-20211128
i386                 randconfig-a015-20211128
i386                 randconfig-a016-20211128
i386                 randconfig-a013-20211128
i386                 randconfig-a012-20211128
i386                 randconfig-a014-20211128
i386                 randconfig-a011-20211128
x86_64               randconfig-a001-20211130
x86_64               randconfig-a006-20211130
x86_64               randconfig-a003-20211130
x86_64               randconfig-a004-20211130
x86_64               randconfig-a005-20211130
x86_64               randconfig-a002-20211130
arc                  randconfig-r043-20211129
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20211128
i386                 randconfig-c001-20211128
riscv                randconfig-c006-20211128
arm                  randconfig-c002-20211128
powerpc              randconfig-c003-20211128
x86_64               randconfig-c007-20211128
mips                 randconfig-c004-20211128
s390                 randconfig-c005-20211130
i386                 randconfig-c001-20211130
powerpc              randconfig-c003-20211130
riscv                randconfig-c006-20211130
mips                 randconfig-c004-20211130
arm                  randconfig-c002-20211130
x86_64               randconfig-c007-20211130
x86_64               randconfig-a001-20211128
x86_64               randconfig-a006-20211128
x86_64               randconfig-a003-20211128
x86_64               randconfig-a005-20211128
x86_64               randconfig-a004-20211128
x86_64               randconfig-a002-20211128
i386                 randconfig-a001-20211128
i386                 randconfig-a002-20211128
i386                 randconfig-a006-20211128
i386                 randconfig-a005-20211128
i386                 randconfig-a004-20211128
i386                 randconfig-a003-20211128
x86_64               randconfig-a014-20211130
x86_64               randconfig-a016-20211130
x86_64               randconfig-a013-20211130
x86_64               randconfig-a012-20211130
x86_64               randconfig-a015-20211130
x86_64               randconfig-a011-20211130
i386                 randconfig-a015-20211129
i386                 randconfig-a016-20211129
i386                 randconfig-a013-20211129
i386                 randconfig-a012-20211129
i386                 randconfig-a014-20211129
i386                 randconfig-a011-20211129
hexagon              randconfig-r045-20211129
hexagon              randconfig-r041-20211129
s390                 randconfig-r044-20211129
riscv                randconfig-r042-20211129
riscv                randconfig-r042-20211130
hexagon              randconfig-r045-20211130
s390                 randconfig-r044-20211130
hexagon              randconfig-r041-20211130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
