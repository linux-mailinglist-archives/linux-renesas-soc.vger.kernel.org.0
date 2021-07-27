Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA213D6B78
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 03:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhG0AaT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 20:30:19 -0400
Received: from mga02.intel.com ([134.134.136.20]:47455 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231479AbhG0AaT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 20:30:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="199528054"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; 
   d="scan'208";a="199528054"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 18:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; 
   d="scan'208";a="437066664"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2021 18:10:45 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m8BcL-0006IB-5M; Tue, 27 Jul 2021 01:10:45 +0000
Date:   Tue, 27 Jul 2021 09:10:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.15] BUILD SUCCESS
 a3d7d983236a6a7f08dddf88522f6f4c1d4bbf75
Message-ID: <60ff5d06.p0RRiNb3ZVvCb1Jm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.15
branch HEAD: a3d7d983236a6a7f08dddf88522f6f4c1d4bbf75  arm64: dts: renesas: hihope-rzg2-ex: Add EtherAVB internal rx delay

elapsed time: 727m

configs tested: 154
configs skipped: 85

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210726
sh                          landisk_defconfig
arm                            lart_defconfig
powerpc                      katmai_defconfig
arm                          pxa168_defconfig
sh                           se7722_defconfig
arm                            qcom_defconfig
powerpc                   lite5200b_defconfig
arm                          pcm027_defconfig
mips                            gpr_defconfig
arm                            mps2_defconfig
xtensa                           allyesconfig
m68k                          amiga_defconfig
powerpc                      acadia_defconfig
sh                           se7343_defconfig
sh                   rts7751r2dplus_defconfig
arm                           sunxi_defconfig
sh                          kfr2r09_defconfig
sh                          r7780mp_defconfig
arm                            xcep_defconfig
mips                       bmips_be_defconfig
powerpc                          allmodconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                          g5_defconfig
mips                           rs90_defconfig
riscv                    nommu_virt_defconfig
m68k                        mvme147_defconfig
sh                     magicpanelr2_defconfig
powerpc                 linkstation_defconfig
sh                          r7785rp_defconfig
ia64                          tiger_defconfig
arm                           spitz_defconfig
ia64                             alldefconfig
sparc                               defconfig
mips                           gcw0_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     tqm8555_defconfig
mips                       rbtx49xx_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                      pic32mzda_defconfig
xtensa                  audio_kc705_defconfig
mips                           ci20_defconfig
arm                      jornada720_defconfig
powerpc                    sam440ep_defconfig
riscv                    nommu_k210_defconfig
i386                             allyesconfig
arc                            hsdk_defconfig
sh                        sh7785lcr_defconfig
powerpc                     kilauea_defconfig
mips                     cu1830-neo_defconfig
sh                          urquell_defconfig
mips                        bcm47xx_defconfig
arm                          exynos_defconfig
powerpc                     stx_gp3_defconfig
sh                   sh7770_generic_defconfig
mips                           ip27_defconfig
mips                         bigsur_defconfig
sh                        sh7763rdp_defconfig
x86_64                              defconfig
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
x86_64                            allnoconfig
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                                defconfig
sparc                            allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210726
x86_64               randconfig-a006-20210726
x86_64               randconfig-a001-20210726
x86_64               randconfig-a005-20210726
x86_64               randconfig-a004-20210726
x86_64               randconfig-a002-20210726
i386                 randconfig-a005-20210726
i386                 randconfig-a003-20210726
i386                 randconfig-a004-20210726
i386                 randconfig-a002-20210726
i386                 randconfig-a001-20210726
i386                 randconfig-a006-20210726
i386                 randconfig-a005-20210725
i386                 randconfig-a003-20210725
i386                 randconfig-a004-20210725
i386                 randconfig-a002-20210725
i386                 randconfig-a001-20210725
i386                 randconfig-a006-20210725
x86_64               randconfig-a011-20210727
x86_64               randconfig-a016-20210727
x86_64               randconfig-a013-20210727
x86_64               randconfig-a014-20210727
x86_64               randconfig-a012-20210727
x86_64               randconfig-a015-20210727
i386                 randconfig-a016-20210726
i386                 randconfig-a013-20210726
i386                 randconfig-a012-20210726
i386                 randconfig-a011-20210726
i386                 randconfig-a014-20210726
i386                 randconfig-a015-20210726
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210726
x86_64               randconfig-a003-20210725
x86_64               randconfig-a006-20210725
x86_64               randconfig-a001-20210725
x86_64               randconfig-a005-20210725
x86_64               randconfig-a004-20210725
x86_64               randconfig-a002-20210725
x86_64               randconfig-a003-20210727
x86_64               randconfig-a006-20210727
x86_64               randconfig-a001-20210727
x86_64               randconfig-a005-20210727
x86_64               randconfig-a004-20210727
x86_64               randconfig-a002-20210727
x86_64               randconfig-a011-20210726
x86_64               randconfig-a016-20210726
x86_64               randconfig-a013-20210726
x86_64               randconfig-a014-20210726
x86_64               randconfig-a012-20210726
x86_64               randconfig-a015-20210726

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
