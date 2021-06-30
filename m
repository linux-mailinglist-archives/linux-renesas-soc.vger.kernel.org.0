Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37E73B7BF4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 05:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbhF3DFL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Jun 2021 23:05:11 -0400
Received: from mga18.intel.com ([134.134.136.126]:3700 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232417AbhF3DFK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jun 2021 23:05:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="195571142"
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; 
   d="scan'208";a="195571142"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2021 20:02:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; 
   d="scan'208";a="643935043"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2021 20:02:40 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lyQUp-0009Vw-U1; Wed, 30 Jun 2021 03:02:39 +0000
Date:   Wed, 30 Jun 2021 11:02:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:topic/renesas-overlays] BUILD SUCCESS
 0e38674ad80b6bf09f351b3ebf767c0477b32fcf
Message-ID: <60dbdec5.931ASvHxW+4TYa7w%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
branch HEAD: 0e38674ad80b6bf09f351b3ebf767c0477b32fcf  arm64: dts: renesas: salvator-x: exio-d: Add overlay for SCIF3

elapsed time: 720m

configs tested: 150
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         tb0219_defconfig
mips                         db1xxx_defconfig
sh                               j2_defconfig
arm                          badge4_defconfig
powerpc                        icon_defconfig
sh                     magicpanelr2_defconfig
powerpc                     mpc5200_defconfig
sh                        edosk7760_defconfig
mips                            ar7_defconfig
sh                           se7712_defconfig
mips                      maltasmvp_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         hackkit_defconfig
m68k                        m5307c3_defconfig
powerpc                      mgcoge_defconfig
powerpc                     skiroot_defconfig
arm                      integrator_defconfig
powerpc                      chrp32_defconfig
parisc                              defconfig
arm                            mmp2_defconfig
arm                         palmz72_defconfig
powerpc                     stx_gp3_defconfig
arm                         cm_x300_defconfig
powerpc                      obs600_defconfig
arm                        keystone_defconfig
arm                          exynos_defconfig
openrisc                 simple_smp_defconfig
mips                 decstation_r4k_defconfig
ia64                          tiger_defconfig
powerpc                     tqm8548_defconfig
arm                      jornada720_defconfig
powerpc                  mpc885_ads_defconfig
arm                            zeus_defconfig
riscv                    nommu_k210_defconfig
arc                         haps_hs_defconfig
arm                      pxa255-idp_defconfig
powerpc                     tqm8540_defconfig
mips                           gcw0_defconfig
powerpc                    amigaone_defconfig
arm                            lart_defconfig
riscv                    nommu_virt_defconfig
arm                          moxart_defconfig
arm                         s5pv210_defconfig
arm                         s3c2410_defconfig
h8300                            allyesconfig
sh                         apsh4a3a_defconfig
powerpc                   currituck_defconfig
arc                          axs101_defconfig
sh                          sdk7786_defconfig
powerpc                       maple_defconfig
powerpc                      ep88xc_defconfig
arc                     haps_hs_smp_defconfig
m68k                       bvme6000_defconfig
xtensa                              defconfig
arm                         shannon_defconfig
mips                      pic32mzda_defconfig
mips                          rm200_defconfig
arm                           h5000_defconfig
m68k                        mvme16x_defconfig
m68k                          sun3x_defconfig
arm                         lpc32xx_defconfig
sh                         ap325rxa_defconfig
openrisc                  or1klitex_defconfig
powerpc                     powernv_defconfig
arm                        vexpress_defconfig
arc                          axs103_defconfig
powerpc                     asp8347_defconfig
powerpc                       holly_defconfig
powerpc                       eiger_defconfig
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
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
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
i386                 randconfig-a001-20210628
i386                 randconfig-a002-20210628
i386                 randconfig-a003-20210628
i386                 randconfig-a006-20210628
i386                 randconfig-a005-20210628
i386                 randconfig-a004-20210628
i386                 randconfig-a002-20210629
i386                 randconfig-a001-20210629
i386                 randconfig-a003-20210629
i386                 randconfig-a006-20210629
i386                 randconfig-a005-20210629
i386                 randconfig-a004-20210629
x86_64               randconfig-a012-20210628
x86_64               randconfig-a016-20210628
x86_64               randconfig-a015-20210628
x86_64               randconfig-a013-20210628
x86_64               randconfig-a014-20210628
x86_64               randconfig-a011-20210628
i386                 randconfig-a011-20210628
i386                 randconfig-a014-20210628
i386                 randconfig-a013-20210628
i386                 randconfig-a015-20210628
i386                 randconfig-a016-20210628
i386                 randconfig-a012-20210628
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210628
x86_64               randconfig-a002-20210628
x86_64               randconfig-a005-20210628
x86_64               randconfig-a001-20210628
x86_64               randconfig-a003-20210628
x86_64               randconfig-a004-20210628
x86_64               randconfig-a006-20210628

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
