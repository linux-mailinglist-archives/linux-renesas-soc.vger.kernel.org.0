Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5F103EC1EA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Aug 2021 12:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237720AbhHNKKh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Aug 2021 06:10:37 -0400
Received: from mga04.intel.com ([192.55.52.120]:11596 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229894AbhHNKKg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Aug 2021 06:10:36 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="213824852"
X-IronPort-AV: E=Sophos;i="5.84,321,1620716400"; 
   d="scan'208";a="213824852"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2021 03:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,321,1620716400"; 
   d="scan'208";a="508618507"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Aug 2021 03:10:06 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mEqcA-000OjR-7L; Sat, 14 Aug 2021 10:10:06 +0000
Date:   Sat, 14 Aug 2021 18:09:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 33d79a656f9e005b45af2cdaffe67f9463fc5231
Message-ID: <61179658.RhUFmfzEazf68s/U%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 33d79a656f9e005b45af2cdaffe67f9463fc5231  Merge branch 'renesas-next' into renesas-devel

elapsed time: 2825m

configs tested: 248
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210814
i386                 randconfig-c001-20210812
i386                 randconfig-c001-20210813
powerpc                 mpc8540_ads_defconfig
ia64                                defconfig
arm                       imx_v6_v7_defconfig
mips                           rs90_defconfig
parisc                generic-32bit_defconfig
arm                     am200epdkit_defconfig
mips                        workpad_defconfig
xtensa                  audio_kc705_defconfig
arc                     nsimosci_hs_defconfig
sh                        sh7757lcr_defconfig
mips                        bcm63xx_defconfig
openrisc                  or1klitex_defconfig
m68k                        m5407c3_defconfig
powerpc                    klondike_defconfig
mips                     loongson1c_defconfig
arm                          ep93xx_defconfig
arm                          iop32x_defconfig
powerpc                      tqm8xx_defconfig
arm                         lpc18xx_defconfig
sh                        edosk7760_defconfig
x86_64                            allnoconfig
sh                             shx3_defconfig
mips                  maltasmvp_eva_defconfig
mips                         bigsur_defconfig
powerpc64                           defconfig
powerpc                        cell_defconfig
arm                     davinci_all_defconfig
arm                       omap2plus_defconfig
powerpc                     pq2fads_defconfig
h8300                            alldefconfig
i386                             alldefconfig
mips                      fuloong2e_defconfig
mips                           mtx1_defconfig
arm                           u8500_defconfig
nios2                         3c120_defconfig
ia64                        generic_defconfig
powerpc                     tqm8555_defconfig
powerpc                      acadia_defconfig
arm                          simpad_defconfig
mips                  cavium_octeon_defconfig
nds32                               defconfig
parisc                           alldefconfig
arm                      tct_hammer_defconfig
powerpc                      obs600_defconfig
powerpc                      makalu_defconfig
arm                         shannon_defconfig
arm                        clps711x_defconfig
powerpc                      ppc64e_defconfig
sh                              ul2_defconfig
arm                         orion5x_defconfig
xtensa                           allyesconfig
arm                       imx_v4_v5_defconfig
powerpc                      ep88xc_defconfig
powerpc                     rainier_defconfig
sh                            shmin_defconfig
h8300                               defconfig
powerpc               mpc834x_itxgp_defconfig
mips                        maltaup_defconfig
mips                           ip22_defconfig
sh                           se7721_defconfig
m68k                       m5208evb_defconfig
x86_64                           alldefconfig
powerpc                     pseries_defconfig
mips                            gpr_defconfig
mips                      maltaaprp_defconfig
powerpc                      ppc6xx_defconfig
powerpc                 mpc837x_mds_defconfig
ia64                             alldefconfig
sh                        edosk7705_defconfig
sh                           se7750_defconfig
powerpc                    socrates_defconfig
riscv                             allnoconfig
powerpc                     ksi8560_defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                        mvme147_defconfig
mips                         tb0226_defconfig
mips                  decstation_64_defconfig
arm                      jornada720_defconfig
h8300                            allyesconfig
h8300                       h8s-sim_defconfig
arm                       aspeed_g4_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                       lemote2f_defconfig
mips                          rm200_defconfig
arm                           stm32_defconfig
powerpc                       ppc64_defconfig
mips                      loongson3_defconfig
mips                          ath79_defconfig
arc                     haps_hs_smp_defconfig
sh                           se7712_defconfig
powerpc                   microwatt_defconfig
sh                          r7780mp_defconfig
arm                       cns3420vb_defconfig
mips                          ath25_defconfig
m68k                             allyesconfig
powerpc                    amigaone_defconfig
arm                         s5pv210_defconfig
arm                           viper_defconfig
sh                          lboxre2_defconfig
powerpc                     akebono_defconfig
mips                     cu1830-neo_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                         s3c2410_defconfig
powerpc                      pcm030_defconfig
powerpc                     ppa8548_defconfig
powerpc                        icon_defconfig
sh                          urquell_defconfig
microblaze                      mmu_defconfig
arm                         nhk8815_defconfig
sh                          rsk7203_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                          malta_defconfig
sparc                       sparc64_defconfig
arm                        neponset_defconfig
m68k                         apollo_defconfig
riscv                            allyesconfig
arm                            xcep_defconfig
arm                            pleb_defconfig
powerpc                        fsp2_defconfig
arm                       multi_v4t_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210812
x86_64               randconfig-a004-20210812
x86_64               randconfig-a003-20210812
x86_64               randconfig-a005-20210812
x86_64               randconfig-a002-20210812
x86_64               randconfig-a001-20210812
x86_64               randconfig-a004-20210814
x86_64               randconfig-a006-20210814
x86_64               randconfig-a003-20210814
x86_64               randconfig-a001-20210814
x86_64               randconfig-a005-20210814
x86_64               randconfig-a002-20210814
i386                 randconfig-a004-20210812
i386                 randconfig-a003-20210812
i386                 randconfig-a002-20210812
i386                 randconfig-a001-20210812
i386                 randconfig-a006-20210812
i386                 randconfig-a005-20210812
i386                 randconfig-a004-20210813
i386                 randconfig-a003-20210813
i386                 randconfig-a001-20210813
i386                 randconfig-a002-20210813
i386                 randconfig-a006-20210813
i386                 randconfig-a005-20210813
i386                 randconfig-a004-20210814
i386                 randconfig-a002-20210814
i386                 randconfig-a001-20210814
i386                 randconfig-a003-20210814
i386                 randconfig-a006-20210814
i386                 randconfig-a005-20210814
i386                 randconfig-a004-20210811
i386                 randconfig-a001-20210811
i386                 randconfig-a002-20210811
i386                 randconfig-a003-20210811
i386                 randconfig-a006-20210811
i386                 randconfig-a005-20210811
x86_64               randconfig-a011-20210813
x86_64               randconfig-a013-20210813
x86_64               randconfig-a012-20210813
x86_64               randconfig-a016-20210813
x86_64               randconfig-a015-20210813
x86_64               randconfig-a014-20210813
i386                 randconfig-a011-20210812
i386                 randconfig-a015-20210812
i386                 randconfig-a013-20210812
i386                 randconfig-a014-20210812
i386                 randconfig-a016-20210812
i386                 randconfig-a012-20210812
i386                 randconfig-a011-20210814
i386                 randconfig-a015-20210814
i386                 randconfig-a013-20210814
i386                 randconfig-a014-20210814
i386                 randconfig-a016-20210814
i386                 randconfig-a012-20210814
i386                 randconfig-a011-20210813
i386                 randconfig-a015-20210813
i386                 randconfig-a014-20210813
i386                 randconfig-a013-20210813
i386                 randconfig-a016-20210813
i386                 randconfig-a012-20210813
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210812
x86_64               randconfig-c001-20210813
x86_64               randconfig-c001-20210814
x86_64               randconfig-a006-20210813
x86_64               randconfig-a004-20210813
x86_64               randconfig-a003-20210813
x86_64               randconfig-a002-20210813
x86_64               randconfig-a005-20210813
x86_64               randconfig-a001-20210813
x86_64               randconfig-a011-20210812
x86_64               randconfig-a013-20210812
x86_64               randconfig-a012-20210812
x86_64               randconfig-a016-20210812
x86_64               randconfig-a015-20210812
x86_64               randconfig-a014-20210812
x86_64               randconfig-a013-20210814
x86_64               randconfig-a011-20210814
x86_64               randconfig-a016-20210814
x86_64               randconfig-a012-20210814
x86_64               randconfig-a014-20210814
x86_64               randconfig-a015-20210814

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
