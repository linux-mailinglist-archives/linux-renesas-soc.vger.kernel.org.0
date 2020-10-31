Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E072A12BD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Oct 2020 02:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbgJaBpr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 21:45:47 -0400
Received: from mga03.intel.com ([134.134.136.65]:26796 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725856AbgJaBpr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 21:45:47 -0400
IronPort-SDR: jyYUWekA9fhxq5HhDdYe5I+/cBGX8Aq2c8PsLs70dAFqcXIb3rk0xfQYxClnagUxGu0MIPtuMx
 jpnPLerRIA3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="168785021"
X-IronPort-AV: E=Sophos;i="5.77,435,1596524400"; 
   d="scan'208";a="168785021"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 18:45:47 -0700
IronPort-SDR: taAK2EDF4zYL0KwBkJ6m9XWzCteIEy7U5x0pzmumeN+jW0dgqaG79ncvf9lAccVilpsVYPHubt
 qkxSvCM0gjQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,435,1596524400"; 
   d="scan'208";a="362018418"
Received: from lkp-server02.sh.intel.com (HELO fcc9f8859912) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Oct 2020 18:45:45 -0700
Received: from kbuild by fcc9f8859912 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kYfxg-0000Ne-W8; Sat, 31 Oct 2020 01:45:44 +0000
Date:   Sat, 31 Oct 2020 09:44:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.11] BUILD SUCCESS
 bfada98f210b4ffc45a7d76f0d387f3509f51c17
Message-ID: <5f9cc195.8pvyATlLSTZA7sd5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.11
branch HEAD: bfada98f210b4ffc45a7d76f0d387f3509f51c17  arm64: dts: renesas: r8a77961: ulcb-kf: Initial device tree

elapsed time: 724m

configs tested: 149
configs skipped: 79

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
parisc                           alldefconfig
h8300                    h8300h-sim_defconfig
mips                      maltasmvp_defconfig
sh                          rsk7203_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                     taishan_defconfig
arm                        magician_defconfig
microblaze                          defconfig
arm                          pxa910_defconfig
i386                             alldefconfig
sh                           se7722_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                        mvme16x_defconfig
powerpc                      pasemi_defconfig
arc                         haps_hs_defconfig
sh                        apsh4ad0a_defconfig
xtensa                  nommu_kc705_defconfig
mips                           mtx1_defconfig
sh                             shx3_defconfig
mips                      loongson3_defconfig
arc                     nsimosci_hs_defconfig
parisc                generic-64bit_defconfig
powerpc                     asp8347_defconfig
mips                        jmr3927_defconfig
sh                          rsk7201_defconfig
arc                        vdk_hs38_defconfig
arm                          exynos_defconfig
arm                            pleb_defconfig
sh                           se7712_defconfig
sparc                       sparc64_defconfig
sh                           se7780_defconfig
c6x                        evmc6457_defconfig
powerpc                      ep88xc_defconfig
mips                malta_qemu_32r6_defconfig
arm                     am200epdkit_defconfig
mips                       lemote2f_defconfig
powerpc                      chrp32_defconfig
mips                     loongson1c_defconfig
powerpc                     kmeter1_defconfig
arm                        multi_v7_defconfig
powerpc                 mpc8540_ads_defconfig
mips                          rm200_defconfig
arm                        multi_v5_defconfig
arm                           corgi_defconfig
sh                          kfr2r09_defconfig
arm                      tct_hammer_defconfig
powerpc                     sequoia_defconfig
xtensa                  audio_kc705_defconfig
mips                      maltaaprp_defconfig
powerpc                         ps3_defconfig
arm                         socfpga_defconfig
powerpc                 mpc8560_ads_defconfig
m68k                       bvme6000_defconfig
powerpc                 mpc834x_mds_defconfig
arm                           efm32_defconfig
sh                      rts7751r2d1_defconfig
powerpc                        fsp2_defconfig
arc                        nsim_700_defconfig
microblaze                      mmu_defconfig
nios2                               defconfig
powerpc                       maple_defconfig
m68k                        m5307c3_defconfig
m68k                       m5208evb_defconfig
mips                        omega2p_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                         lubbock_defconfig
mips                        bcm47xx_defconfig
arc                     haps_hs_smp_defconfig
um                             i386_defconfig
arm                        keystone_defconfig
mips                          ath79_defconfig
arm                        clps711x_defconfig
powerpc                      cm5200_defconfig
mips                           rs90_defconfig
arm                        neponset_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20201030
x86_64               randconfig-a001-20201030
x86_64               randconfig-a002-20201030
x86_64               randconfig-a003-20201030
x86_64               randconfig-a006-20201030
x86_64               randconfig-a004-20201030
i386                 randconfig-a005-20201030
i386                 randconfig-a003-20201030
i386                 randconfig-a002-20201030
i386                 randconfig-a001-20201030
i386                 randconfig-a006-20201030
i386                 randconfig-a004-20201030
i386                 randconfig-a011-20201030
i386                 randconfig-a014-20201030
i386                 randconfig-a015-20201030
i386                 randconfig-a012-20201030
i386                 randconfig-a013-20201030
i386                 randconfig-a016-20201030
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20201030
x86_64               randconfig-a014-20201030
x86_64               randconfig-a015-20201030
x86_64               randconfig-a016-20201030
x86_64               randconfig-a011-20201030
x86_64               randconfig-a012-20201030

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
