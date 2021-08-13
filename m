Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4FF53EBE53
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Aug 2021 00:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235079AbhHMWlC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 18:41:02 -0400
Received: from mga03.intel.com ([134.134.136.65]:42586 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235029AbhHMWlC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 18:41:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="215669993"
X-IronPort-AV: E=Sophos;i="5.84,320,1620716400"; 
   d="scan'208";a="215669993"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2021 15:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,320,1620716400"; 
   d="scan'208";a="677690700"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Aug 2021 15:40:32 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mEfqq-000ODZ-AX; Fri, 13 Aug 2021 22:40:32 +0000
Date:   Sat, 14 Aug 2021 06:39:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 e8425dd55abb12881694875972465f40bb0fe41b
Message-ID: <6116f4be.tSiy6i10lSItzbqQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: e8425dd55abb12881694875972465f40bb0fe41b  clk: renesas: Make CLK_R9A06G032 invisible

elapsed time: 722m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210813
i386                 randconfig-c001-20210812
nios2                            allyesconfig
arm                         lpc18xx_defconfig
arm                           spitz_defconfig
arm                           tegra_defconfig
arm                          badge4_defconfig
xtensa                           allyesconfig
arm                       imx_v4_v5_defconfig
powerpc                      ep88xc_defconfig
powerpc                     rainier_defconfig
sh                            shmin_defconfig
h8300                               defconfig
riscv                    nommu_k210_defconfig
mips                  maltasmvp_eva_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                        maltaup_defconfig
mips                           ip22_defconfig
sh                           se7721_defconfig
m68k                        mvme147_defconfig
powerpc                     stx_gp3_defconfig
arm                           viper_defconfig
sh                     magicpanelr2_defconfig
sh                          urquell_defconfig
microblaze                      mmu_defconfig
arm                         nhk8815_defconfig
powerpc                     tqm5200_defconfig
xtensa                              defconfig
arm                       omap2plus_defconfig
arm                         bcm2835_defconfig
arm                            pleb_defconfig
arc                        nsim_700_defconfig
mips                 decstation_r4k_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
sparc                            allyesconfig
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
x86_64               randconfig-a011-20210813
x86_64               randconfig-a013-20210813
x86_64               randconfig-a012-20210813
x86_64               randconfig-a016-20210813
x86_64               randconfig-a015-20210813
x86_64               randconfig-a014-20210813
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210814
x86_64               randconfig-c001-20210813
x86_64               randconfig-a006-20210813
x86_64               randconfig-a004-20210813
x86_64               randconfig-a003-20210813
x86_64               randconfig-a002-20210813
x86_64               randconfig-a005-20210813
x86_64               randconfig-a001-20210813
x86_64               randconfig-a013-20210814
x86_64               randconfig-a011-20210814
x86_64               randconfig-a016-20210814
x86_64               randconfig-a012-20210814
x86_64               randconfig-a014-20210814
x86_64               randconfig-a015-20210814
x86_64               randconfig-a011-20210812
x86_64               randconfig-a013-20210812
x86_64               randconfig-a012-20210812
x86_64               randconfig-a016-20210812
x86_64               randconfig-a015-20210812
x86_64               randconfig-a014-20210812

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
