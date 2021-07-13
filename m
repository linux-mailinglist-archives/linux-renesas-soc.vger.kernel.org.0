Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A40E3C79B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 00:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbhGMWfM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 18:35:12 -0400
Received: from mga17.intel.com ([192.55.52.151]:64051 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234957AbhGMWfL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 18:35:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="190629561"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="190629561"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 15:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="649673083"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2021 15:32:20 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m3Qwt-000ICx-FE; Tue, 13 Jul 2021 22:32:19 +0000
Date:   Wed, 14 Jul 2021 06:31:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-pinctrl-for-v5.15] BUILD SUCCESS
 e9d66bdbc5abecaf705bf5a2f4f6279b9e313b0c
Message-ID: <60ee1449.9r6b+Y6Vi2iPAgP5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v5.15
branch HEAD: e9d66bdbc5abecaf705bf5a2f4f6279b9e313b0c  pinctrl: renesas: r8a77995: Add bias pinconf support

elapsed time: 721m

configs tested: 116
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                   bluestone_defconfig
m68k                          sun3x_defconfig
arm                         lpc32xx_defconfig
sh                          lboxre2_defconfig
powerpc                      ep88xc_defconfig
arc                     haps_hs_smp_defconfig
sh                             espt_defconfig
arm                             ezx_defconfig
riscv                          rv32_defconfig
mips                         tb0219_defconfig
sh                          urquell_defconfig
powerpc                    gamecube_defconfig
arm                         s3c2410_defconfig
arm                    vt8500_v6_v7_defconfig
nds32                               defconfig
arm                       netwinder_defconfig
xtensa                           alldefconfig
sh                            migor_defconfig
mips                         tb0287_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                  storcenter_defconfig
powerpc                     kilauea_defconfig
sh                     magicpanelr2_defconfig
powerpc                    mvme5100_defconfig
arm                        cerfcube_defconfig
arm                  colibri_pxa270_defconfig
arm                            mps2_defconfig
arm                        trizeps4_defconfig
nios2                         3c120_defconfig
powerpc                      mgcoge_defconfig
arm                         mv78xx0_defconfig
mips                        workpad_defconfig
sh                         microdev_defconfig
mips                        omega2p_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                         bigsur_defconfig
m68k                        m5407c3_defconfig
powerpc                      cm5200_defconfig
powerpc                       holly_defconfig
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
i386                 randconfig-a005-20210713
i386                 randconfig-a004-20210713
i386                 randconfig-a006-20210713
i386                 randconfig-a001-20210713
i386                 randconfig-a002-20210713
i386                 randconfig-a003-20210713
x86_64               randconfig-a013-20210713
x86_64               randconfig-a014-20210713
x86_64               randconfig-a012-20210713
x86_64               randconfig-a015-20210713
x86_64               randconfig-a016-20210713
x86_64               randconfig-a011-20210713
i386                 randconfig-a015-20210713
i386                 randconfig-a014-20210713
i386                 randconfig-a011-20210713
i386                 randconfig-a013-20210713
i386                 randconfig-a012-20210713
i386                 randconfig-a016-20210713
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210713
x86_64               randconfig-a005-20210713
x86_64               randconfig-a004-20210713
x86_64               randconfig-a003-20210713
x86_64               randconfig-a002-20210713
x86_64               randconfig-a006-20210713
x86_64               randconfig-a001-20210713

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
