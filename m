Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA1B93A3985
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 04:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbhFKCHg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 22:07:36 -0400
Received: from mga11.intel.com ([192.55.52.93]:50822 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231184AbhFKCHf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 22:07:35 -0400
IronPort-SDR: DVEK0WtxnbaaGjQgQaYyXJ4eYyPu+kRngJKNOd1RqtwnTr2gfN4QCExZgr1CoVA99HHvVUwVdK
 4YFzNDzmsEVA==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="202417831"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="202417831"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 19:05:38 -0700
IronPort-SDR: 9B6U1zvqI59a/lQ1NFe0bC/JezcKoXz1CM1CNjN9qW4JXAZhB7venpiZnE7rgDQGWZP0qFcQK4
 qxeB+U9fTyOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="402877991"
Received: from lkp-server02.sh.intel.com (HELO 3cb98b298c7e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 10 Jun 2021 19:05:36 -0700
Received: from kbuild by 3cb98b298c7e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lrWYC-0000No-47; Fri, 11 Jun 2021 02:05:36 +0000
Date:   Fri, 11 Jun 2021 10:04:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.14] BUILD SUCCESS
 42bbd003910906229cb1dc0eaa812d9cc59e4c77
Message-ID: <60c2c4c7.ZYok3hjC4xBDwYJr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.14
branch HEAD: 42bbd003910906229cb1dc0eaa812d9cc59e4c77  arm64: dts: renesas: r9a07g044: Add SYSC node

elapsed time: 722m

configs tested: 198
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          sdk7780_defconfig
arc                    vdk_hs38_smp_defconfig
arm                         vf610m4_defconfig
m68k                           sun3_defconfig
mips                        nlm_xlp_defconfig
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
sh                          rsk7264_defconfig
ia64                        generic_defconfig
arm                           viper_defconfig
powerpc                 mpc836x_mds_defconfig
arm                        clps711x_defconfig
sparc                            alldefconfig
sh                   sh7770_generic_defconfig
sh                          lboxre2_defconfig
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
ia64                             allmodconfig
sh                          polaris_defconfig
arc                                 defconfig
m68k                          sun3x_defconfig
arm                      footbridge_defconfig
arm                   milbeaut_m10v_defconfig
xtensa                    xip_kc705_defconfig
sparc                       sparc64_defconfig
mips                         mpc30x_defconfig
h8300                            alldefconfig
sh                           se7721_defconfig
sh                      rts7751r2d1_defconfig
arm                         axm55xx_defconfig
powerpc                      pasemi_defconfig
powerpc                      makalu_defconfig
mips                        workpad_defconfig
powerpc                      mgcoge_defconfig
m68k                       m5249evb_defconfig
arm                           h5000_defconfig
microblaze                          defconfig
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
m68k                       m5475evb_defconfig
mips                             allyesconfig
m68k                        mvme147_defconfig
sh                           se7343_defconfig
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
parisc                generic-64bit_defconfig
powerpc                       holly_defconfig
powerpc                     tqm8555_defconfig
mips                         db1xxx_defconfig
sh                               j2_defconfig
powerpc                      pmac32_defconfig
powerpc                          allmodconfig
mips                         rt305x_defconfig
powerpc                      tqm8xx_defconfig
nios2                         3c120_defconfig
powerpc                     tqm8541_defconfig
arc                            hsdk_defconfig
powerpc                       ppc64_defconfig
arm                        neponset_defconfig
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
