Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DB42F2382
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 01:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404133AbhALAZw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jan 2021 19:25:52 -0500
Received: from mga02.intel.com ([134.134.136.20]:63091 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403945AbhAKXP5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 18:15:57 -0500
IronPort-SDR: XUMd6PiE6gzODlUZsu+fvcZip0bscr3dOltXpLkf+kf8h3rWsLJ3rHCfJApHogjRyAnpSfqcp0
 5IwdMQn17kVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="165033930"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; 
   d="scan'208";a="165033930"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 15:15:16 -0800
IronPort-SDR: 1jrakM6zAW2qLA8DUiv9jqNKusLTkFypTfvAE0IHlylOpe7/mtygVuerbWSZbtpgcsqGAzgqw+
 NZGiq3unxZqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; 
   d="scan'208";a="363303099"
Received: from lkp-server01.sh.intel.com (HELO 3cff8e4c45aa) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Jan 2021 15:15:15 -0800
Received: from kbuild by 3cff8e4c45aa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kz6P4-0000OA-KU; Mon, 11 Jan 2021 23:15:14 +0000
Date:   Tue, 12 Jan 2021 07:14:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 e8f19b97c0a6fb88f1ea5e13cfb8fe0d1314827e
Message-ID: <5ffcdbe6.v5Kuj38I1AGtj7rW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  renesas-clk
branch HEAD: e8f19b97c0a6fb88f1ea5e13cfb8fe0d1314827e  clk: renesas: r8a779a0: Add SYS-DMAC clocks

elapsed time: 725m

configs tested: 147
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nios2                            allyesconfig
mips                           jazz_defconfig
powerpc                 mpc8560_ads_defconfig
sh                        dreamcast_defconfig
powerpc                      makalu_defconfig
powerpc                           allnoconfig
arm                     eseries_pxa_defconfig
nds32                             allnoconfig
sh                          sdk7780_defconfig
riscv                            alldefconfig
mips                       rbtx49xx_defconfig
sh                             shx3_defconfig
mips                  cavium_octeon_defconfig
sh                           se7206_defconfig
powerpc                  storcenter_defconfig
arm                          ep93xx_defconfig
mips                        bcm63xx_defconfig
powerpc                  iss476-smp_defconfig
i386                             alldefconfig
sh                          rsk7269_defconfig
sparc                               defconfig
sparc                       sparc64_defconfig
arm                          pxa168_defconfig
riscv                    nommu_k210_defconfig
nios2                         3c120_defconfig
mips                         tb0219_defconfig
sh                          urquell_defconfig
powerpc                      acadia_defconfig
arm                           h5000_defconfig
powerpc                 mpc8315_rdb_defconfig
ia64                          tiger_defconfig
arm                        cerfcube_defconfig
mips                          ath79_defconfig
h8300                     edosk2674_defconfig
powerpc                      ep88xc_defconfig
arc                      axs103_smp_defconfig
arm                       multi_v4t_defconfig
s390                             allyesconfig
powerpc                       maple_defconfig
sh                          polaris_defconfig
arc                     haps_hs_smp_defconfig
arm                             mxs_defconfig
parisc                generic-32bit_defconfig
xtensa                       common_defconfig
mips                         bigsur_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                          pcm027_defconfig
mips                          ath25_defconfig
mips                         cobalt_defconfig
arm                          gemini_defconfig
powerpc                     tqm5200_defconfig
um                             i386_defconfig
powerpc                      bamboo_defconfig
arm                          badge4_defconfig
sh                          lboxre2_defconfig
sh                          sdk7786_defconfig
arc                           tb10x_defconfig
arm                         assabet_defconfig
xtensa                           alldefconfig
sh                  sh7785lcr_32bit_defconfig
arc                     nsimosci_hs_defconfig
parisc                           alldefconfig
powerpc                    mvme5100_defconfig
powerpc                     pseries_defconfig
powerpc                     tqm8540_defconfig
powerpc                      chrp32_defconfig
m68k                          sun3x_defconfig
m68k                       m5275evb_defconfig
arm                       spear13xx_defconfig
arm                        oxnas_v6_defconfig
c6x                        evmc6474_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20210111
x86_64               randconfig-a006-20210111
x86_64               randconfig-a001-20210111
x86_64               randconfig-a003-20210111
x86_64               randconfig-a005-20210111
x86_64               randconfig-a002-20210111
i386                 randconfig-a002-20210111
i386                 randconfig-a005-20210111
i386                 randconfig-a006-20210111
i386                 randconfig-a001-20210111
i386                 randconfig-a003-20210111
i386                 randconfig-a004-20210111
x86_64               randconfig-a015-20210110
x86_64               randconfig-a012-20210110
x86_64               randconfig-a013-20210110
x86_64               randconfig-a016-20210110
x86_64               randconfig-a014-20210110
x86_64               randconfig-a011-20210110
i386                 randconfig-a012-20210111
i386                 randconfig-a011-20210111
i386                 randconfig-a016-20210111
i386                 randconfig-a015-20210111
i386                 randconfig-a013-20210111
i386                 randconfig-a014-20210111
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a016-20210111
x86_64               randconfig-a015-20210111
x86_64               randconfig-a012-20210111
x86_64               randconfig-a013-20210111
x86_64               randconfig-a014-20210111
x86_64               randconfig-a011-20210111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
