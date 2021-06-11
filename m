Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377523A3968
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 03:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhFKB4e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 21:56:34 -0400
Received: from mga14.intel.com ([192.55.52.115]:23428 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230190AbhFKB4e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 21:56:34 -0400
IronPort-SDR: Y4soKPZ88b5zElJM7uBt8FyLGe8axVDEb4vbIm3xnITfLSVlPzj2Z9HNciOJOuBSboT8AH7L7Q
 zU43/LumCRpg==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="205261288"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="205261288"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 18:54:36 -0700
IronPort-SDR: rrRWxWbeb55WIkTpKwTZ71Z+BlhawZ4+spwkYKbhq74bsy+rqWcE2rYadd464hJGKr55t7ZTd9
 1JIhW/NAGh8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="552553994"
Received: from lkp-server02.sh.intel.com (HELO 3cb98b298c7e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 10 Jun 2021 18:54:35 -0700
Received: from kbuild by 3cb98b298c7e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lrWNX-0000NK-30; Fri, 11 Jun 2021 01:54:35 +0000
Date:   Fri, 11 Jun 2021 09:54:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 17f0ff3d49ff1a9d4027f9c2bef4725ab41aa9a5
Message-ID: <60c2c246.16i/w5mz/1p/+rjf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 17f0ff3d49ff1a9d4027f9c2bef4725ab41aa9a5  clk: renesas: Add support for R9A07G044 SoC

elapsed time: 722m

configs tested: 204
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
sh                          rsk7269_defconfig
arm                       imx_v6_v7_defconfig
arm                        mini2440_defconfig
arm                        keystone_defconfig
sh                          sdk7780_defconfig
arc                    vdk_hs38_smp_defconfig
arm                         vf610m4_defconfig
m68k                           sun3_defconfig
mips                        nlm_xlp_defconfig
sh                          rsk7264_defconfig
powerpc                     powernv_defconfig
arm                      footbridge_defconfig
arm                        multi_v5_defconfig
sh                          lboxre2_defconfig
powerpc                  mpc885_ads_defconfig
arm                         lpc18xx_defconfig
arm                          pxa910_defconfig
xtensa                  cadence_csp_defconfig
arm                  colibri_pxa300_defconfig
arm                         bcm2835_defconfig
arm                      tct_hammer_defconfig
csky                             alldefconfig
sparc                       sparc32_defconfig
sh                              ul2_defconfig
ia64                        generic_defconfig
arm                           viper_defconfig
powerpc                 mpc836x_mds_defconfig
arm                        clps711x_defconfig
sparc                            alldefconfig
sh                   sh7770_generic_defconfig
arm                       mainstone_defconfig
arm                           sama5_defconfig
powerpc                 mpc832x_mds_defconfig
mips                          rb532_defconfig
xtensa                          iss_defconfig
mips                           jazz_defconfig
arm                          ep93xx_defconfig
microblaze                      mmu_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                        shmobile_defconfig
arc                         haps_hs_defconfig
powerpc                         wii_defconfig
mips                        vocore2_defconfig
arm                     davinci_all_defconfig
powerpc                 mpc8560_ads_defconfig
arm                      pxa255-idp_defconfig
mips                           ip32_defconfig
powerpc                     tqm8560_defconfig
sh                          polaris_defconfig
arc                                 defconfig
m68k                          sun3x_defconfig
arm                   milbeaut_m10v_defconfig
ia64                             allmodconfig
xtensa                    xip_kc705_defconfig
sparc                       sparc64_defconfig
mips                         mpc30x_defconfig
h8300                            alldefconfig
sh                           se7721_defconfig
sh                      rts7751r2d1_defconfig
arm                         axm55xx_defconfig
powerpc                      pasemi_defconfig
powerpc                      makalu_defconfig
h8300                     edosk2674_defconfig
arm                         at91_dt_defconfig
sh                               alldefconfig
powerpc                 mpc8272_ads_defconfig
h8300                               defconfig
sh                           se7619_defconfig
mips                         tb0287_defconfig
powerpc                    mvme5100_defconfig
arm                       cns3420vb_defconfig
sh                         ap325rxa_defconfig
powerpc                     asp8347_defconfig
arm                        oxnas_v6_defconfig
powerpc                    ge_imp3a_defconfig
sh                          urquell_defconfig
arm                          gemini_defconfig
parisc                           alldefconfig
mips                            gpr_defconfig
nios2                               defconfig
sh                           se7712_defconfig
mips                      pistachio_defconfig
arm                       spear13xx_defconfig
sh                           se7780_defconfig
powerpc                         ps3_defconfig
arm                            mmp2_defconfig
powerpc                     sequoia_defconfig
arm                        mvebu_v7_defconfig
alpha                               defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                        cell_defconfig
microblaze                          defconfig
powerpc                 mpc85xx_cds_defconfig
parisc                generic-64bit_defconfig
powerpc                       holly_defconfig
powerpc                     tqm8555_defconfig
mips                         db1xxx_defconfig
sh                               j2_defconfig
powerpc                          allmodconfig
powerpc                      pmac32_defconfig
mips                         rt305x_defconfig
powerpc                      tqm8xx_defconfig
nios2                         3c120_defconfig
mips                     loongson2k_defconfig
powerpc64                           defconfig
m68k                        mvme16x_defconfig
mips                       bmips_be_defconfig
arm                            mps2_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                          r7780mp_defconfig
powerpc                      walnut_defconfig
arc                        nsimosci_defconfig
mips                      maltasmvp_defconfig
arm                           sunxi_defconfig
powerpc                 linkstation_defconfig
powerpc                   lite5200b_defconfig
powerpc                      ppc44x_defconfig
x86_64                            allnoconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
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
powerpc                           allnoconfig
i386                 randconfig-a002-20210610
i386                 randconfig-a006-20210610
i386                 randconfig-a004-20210610
i386                 randconfig-a001-20210610
i386                 randconfig-a005-20210610
i386                 randconfig-a003-20210610
x86_64               randconfig-a015-20210610
x86_64               randconfig-a011-20210610
x86_64               randconfig-a012-20210610
x86_64               randconfig-a014-20210610
x86_64               randconfig-a016-20210610
x86_64               randconfig-a013-20210610
i386                 randconfig-a015-20210608
i386                 randconfig-a013-20210608
i386                 randconfig-a016-20210608
i386                 randconfig-a011-20210608
i386                 randconfig-a012-20210608
i386                 randconfig-a014-20210608
i386                 randconfig-a015-20210610
i386                 randconfig-a013-20210610
i386                 randconfig-a016-20210610
i386                 randconfig-a014-20210610
i386                 randconfig-a012-20210610
i386                 randconfig-a011-20210610
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210610
x86_64               randconfig-a001-20210610
x86_64               randconfig-a004-20210610
x86_64               randconfig-a003-20210610
x86_64               randconfig-a006-20210610
x86_64               randconfig-a005-20210610
x86_64               randconfig-a002-20210607
x86_64               randconfig-a004-20210607
x86_64               randconfig-a003-20210607
x86_64               randconfig-a006-20210607
x86_64               randconfig-a005-20210607
x86_64               randconfig-a001-20210607

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
