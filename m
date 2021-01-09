Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2E732EFCF0
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Jan 2021 02:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbhAIB6W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 20:58:22 -0500
Received: from mga12.intel.com ([192.55.52.136]:63663 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbhAIB6W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 20:58:22 -0500
IronPort-SDR: hd6G/O0sdfe7ZmrARkK/JvcWd5o64BXcJ9+nqVZG5dkmjMzAq5L9OCiApwf6UfS2nxkdKRKG1u
 VdFqBtqfXG+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9858"; a="156861614"
X-IronPort-AV: E=Sophos;i="5.79,333,1602572400"; 
   d="scan'208";a="156861614"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 17:57:41 -0800
IronPort-SDR: i58RDo4S8EsJEy3OFjXYqRo/e/Xx1Ct5bDeZpcykpD1t0bcSMVPMqNfGlKZcI+3dMos9XBbVWe
 Kh5W7dYemNFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,333,1602572400"; 
   d="scan'208";a="351044936"
Received: from lkp-server01.sh.intel.com (HELO 412602b27703) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Jan 2021 17:57:39 -0800
Received: from kbuild by 412602b27703 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ky3Vb-0000os-02; Sat, 09 Jan 2021 01:57:39 +0000
Date:   Sat, 09 Jan 2021 09:57:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 193fd4c76240952c702846d6225c1c60d80537e8
Message-ID: <5ff90d70.TOPv2jhGZJnzLVle%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  renesas-clk
branch HEAD: 193fd4c76240952c702846d6225c1c60d80537e8  clk: renesas: r8a779a0: Add MSIOF clocks

elapsed time: 1456m

configs tested: 165
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm                          iop32x_defconfig
powerpc                         wii_defconfig
mips                      pistachio_defconfig
m68k                           sun3_defconfig
nios2                            alldefconfig
c6x                         dsk6455_defconfig
arm                        mini2440_defconfig
mips                          rb532_defconfig
mips                       rbtx49xx_defconfig
nios2                            allyesconfig
powerpc                    mvme5100_defconfig
mips                          ath25_defconfig
sh                             shx3_defconfig
m68k                          multi_defconfig
sh                          lboxre2_defconfig
arc                     haps_hs_smp_defconfig
um                           x86_64_defconfig
sparc64                          alldefconfig
arm                        oxnas_v6_defconfig
sh                           se7721_defconfig
arm                       aspeed_g4_defconfig
arm                         vf610m4_defconfig
arm                          badge4_defconfig
arm                        neponset_defconfig
arm                       imx_v4_v5_defconfig
sh                         ap325rxa_defconfig
m68k                         amcore_defconfig
ia64                             alldefconfig
sh                        sh7785lcr_defconfig
arm                         socfpga_defconfig
powerpc                       ebony_defconfig
mips                         bigsur_defconfig
arm                        realview_defconfig
sh                            migor_defconfig
arm                           h3600_defconfig
m68k                          atari_defconfig
sparc                       sparc64_defconfig
c6x                        evmc6472_defconfig
xtensa                generic_kc705_defconfig
mips                  decstation_64_defconfig
mips                        workpad_defconfig
mips                        omega2p_defconfig
sh                            titan_defconfig
powerpc                      ppc64e_defconfig
sh                        dreamcast_defconfig
arm                         lpc18xx_defconfig
arm                        mvebu_v7_defconfig
microblaze                          defconfig
m68k                         apollo_defconfig
powerpc64                           defconfig
arm                       cns3420vb_defconfig
m68k                        mvme147_defconfig
sh                            shmin_defconfig
powerpc                  iss476-smp_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                          rm200_defconfig
powerpc                        cell_defconfig
powerpc                  mpc885_ads_defconfig
mips                malta_kvm_guest_defconfig
i386                             allyesconfig
powerpc                       ppc64_defconfig
powerpc                     tqm8560_defconfig
mips                         cobalt_defconfig
nios2                         3c120_defconfig
powerpc                  storcenter_defconfig
powerpc                mpc7448_hpc2_defconfig
m68k                        m5272c3_defconfig
sh                         ecovec24_defconfig
powerpc                     pseries_defconfig
arm                         lpc32xx_defconfig
powerpc                     kilauea_defconfig
arm                       aspeed_g5_defconfig
m68k                       m5249evb_defconfig
sh                           se7619_defconfig
mips                      maltaaprp_defconfig
arc                          axs103_defconfig
nds32                            alldefconfig
sh                           se7724_defconfig
powerpc                      cm5200_defconfig
ia64                         bigsur_defconfig
arm                     eseries_pxa_defconfig
sh                          r7780mp_defconfig
powerpc                      acadia_defconfig
arc                          axs101_defconfig
mips                           gcw0_defconfig
mips                      pic32mzda_defconfig
parisc                generic-32bit_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      chrp32_defconfig
arm                          lpd270_defconfig
mips                           ci20_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210108
x86_64               randconfig-a006-20210108
x86_64               randconfig-a001-20210108
x86_64               randconfig-a002-20210108
x86_64               randconfig-a003-20210108
x86_64               randconfig-a005-20210108
i386                 randconfig-a005-20210108
i386                 randconfig-a002-20210108
i386                 randconfig-a001-20210108
i386                 randconfig-a003-20210108
i386                 randconfig-a006-20210108
i386                 randconfig-a004-20210108
i386                 randconfig-a016-20210108
i386                 randconfig-a011-20210108
i386                 randconfig-a014-20210108
i386                 randconfig-a015-20210108
i386                 randconfig-a013-20210108
i386                 randconfig-a012-20210108
riscv                    nommu_k210_defconfig
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
x86_64               randconfig-a013-20210108
x86_64               randconfig-a011-20210108
x86_64               randconfig-a012-20210108
x86_64               randconfig-a016-20210108
x86_64               randconfig-a014-20210108
x86_64               randconfig-a015-20210108

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
