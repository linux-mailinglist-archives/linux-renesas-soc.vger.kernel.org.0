Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 396703B6A78
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jun 2021 23:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233569AbhF1Vja (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Jun 2021 17:39:30 -0400
Received: from mga03.intel.com ([134.134.136.65]:4523 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233163AbhF1Vj0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jun 2021 17:39:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="208077758"
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; 
   d="scan'208";a="208077758"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2021 14:36:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; 
   d="scan'208";a="643479738"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jun 2021 14:36:58 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lxyw5-0008jk-Dl; Mon, 28 Jun 2021 21:36:57 +0000
Date:   Tue, 29 Jun 2021 05:35:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 61e17630932cb1e517a0e7d4d49692254cdc1f23
Message-ID: <60da40bd.i4qsJlJYbwgfCmvQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 61e17630932cb1e517a0e7d4d49692254cdc1f23  Merge tag 'v5.13' into renesas-devel

elapsed time: 720m

configs tested: 132
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7722_defconfig
sh                          landisk_defconfig
mips                      pic32mzda_defconfig
arm                        mvebu_v7_defconfig
arm                       spear13xx_defconfig
xtensa                  cadence_csp_defconfig
powerpc                    sam440ep_defconfig
h8300                       h8s-sim_defconfig
parisc                           alldefconfig
powerpc                 canyonlands_defconfig
m68k                          multi_defconfig
sh                           se7750_defconfig
arm                         palmz72_defconfig
powerpc                         wii_defconfig
riscv                             allnoconfig
m68k                        stmark2_defconfig
arm                             pxa_defconfig
powerpc                      pcm030_defconfig
powerpc                    adder875_defconfig
powerpc                    socrates_defconfig
powerpc                      tqm8xx_defconfig
mips                            ar7_defconfig
arm                        mvebu_v5_defconfig
arm                       versatile_defconfig
m68k                        m5272c3_defconfig
arm                         cm_x300_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      obs600_defconfig
powerpc                        fsp2_defconfig
arm                         vf610m4_defconfig
powerpc                     stx_gp3_defconfig
xtensa                generic_kc705_defconfig
powerpc                      pmac32_defconfig
mips                 decstation_r4k_defconfig
arm                         orion5x_defconfig
s390                                defconfig
sh                         microdev_defconfig
arm                           u8500_defconfig
h8300                    h8300h-sim_defconfig
mips                        vocore2_defconfig
mips                      maltasmvp_defconfig
powerpc                  mpc885_ads_defconfig
arm                            zeus_defconfig
powerpc                     sbc8548_defconfig
xtensa                           alldefconfig
nios2                            alldefconfig
powerpc                 mpc8540_ads_defconfig
sh                          kfr2r09_defconfig
mips                      loongson3_defconfig
mips                        omega2p_defconfig
m68k                        mvme147_defconfig
microblaze                          defconfig
sh                        sh7785lcr_defconfig
arm                           sunxi_defconfig
arm                        trizeps4_defconfig
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
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
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
