Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5123C6805
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 03:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbhGMBY5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 21:24:57 -0400
Received: from mga12.intel.com ([192.55.52.136]:23013 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231770AbhGMBY4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 21:24:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="189763227"
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; 
   d="scan'208";a="189763227"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 18:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; 
   d="scan'208";a="653475925"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Jul 2021 18:22:06 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m377d-000HOO-JC; Tue, 13 Jul 2021 01:22:05 +0000
Date:   Tue, 13 Jul 2021 09:21:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 3c037963715cb04671b4fed157cb11268b526adf
Message-ID: <60ecea82.esYhEVsZTFQ0PXts%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 3c037963715cb04671b4fed157cb11268b526adf  Merge branch 'renesas-next' into renesas-devel

elapsed time: 721m

configs tested: 149
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sparc                               defconfig
powerpc                        fsp2_defconfig
arm                            hisi_defconfig
mips                       rbtx49xx_defconfig
mips                        nlm_xlr_defconfig
sh                     sh7710voipgw_defconfig
mips                     cu1830-neo_defconfig
m68k                        mvme16x_defconfig
powerpc                      ppc40x_defconfig
ia64                             alldefconfig
xtensa                  nommu_kc705_defconfig
powerpc                    adder875_defconfig
arm                        vexpress_defconfig
arm                        magician_defconfig
arm                        spear3xx_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      arches_defconfig
nios2                         3c120_defconfig
powerpc                 mpc8540_ads_defconfig
arm64                            alldefconfig
mips                            gpr_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                          rsk7201_defconfig
arm                          moxart_defconfig
mips                           xway_defconfig
arm                           stm32_defconfig
xtensa                              defconfig
mips                        bcm63xx_defconfig
arm                        clps711x_defconfig
powerpc                    klondike_defconfig
arm                           omap1_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                      tqm8xx_defconfig
sh                         apsh4a3a_defconfig
arc                        nsim_700_defconfig
alpha                            allyesconfig
powerpc                     ppa8548_defconfig
arm                    vt8500_v6_v7_defconfig
xtensa                generic_kc705_defconfig
xtensa                    smp_lx200_defconfig
m68k                        mvme147_defconfig
um                               alldefconfig
sh                          kfr2r09_defconfig
sh                           se7712_defconfig
sh                            hp6xx_defconfig
sh                           se7721_defconfig
openrisc                  or1klitex_defconfig
sh                   sh7724_generic_defconfig
nios2                         10m50_defconfig
s390                             allmodconfig
arm                         vf610m4_defconfig
arm                  colibri_pxa270_defconfig
arm                         s3c2410_defconfig
powerpc                     ep8248e_defconfig
arm                           spitz_defconfig
s390                             alldefconfig
ia64                            zx1_defconfig
arm                        multi_v7_defconfig
nds32                             allnoconfig
mips                           mtx1_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                  iss476-smp_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210712
x86_64               randconfig-a004-20210712
x86_64               randconfig-a003-20210712
x86_64               randconfig-a002-20210712
x86_64               randconfig-a006-20210712
x86_64               randconfig-a001-20210712
i386                 randconfig-a005-20210712
i386                 randconfig-a004-20210712
i386                 randconfig-a006-20210712
i386                 randconfig-a001-20210712
i386                 randconfig-a002-20210712
i386                 randconfig-a003-20210712
x86_64               randconfig-a013-20210711
x86_64               randconfig-a012-20210711
x86_64               randconfig-a015-20210711
x86_64               randconfig-a014-20210711
x86_64               randconfig-a016-20210711
x86_64               randconfig-a011-20210711
i386                 randconfig-a015-20210712
i386                 randconfig-a014-20210712
i386                 randconfig-a011-20210712
i386                 randconfig-a013-20210712
i386                 randconfig-a012-20210712
i386                 randconfig-a016-20210712
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210712
x86_64               randconfig-b001-20210711
x86_64               randconfig-a005-20210711
x86_64               randconfig-a004-20210711
x86_64               randconfig-a002-20210711
x86_64               randconfig-a003-20210711
x86_64               randconfig-a006-20210711
x86_64               randconfig-a001-20210711
x86_64               randconfig-a013-20210712
x86_64               randconfig-a014-20210712
x86_64               randconfig-a015-20210712
x86_64               randconfig-a012-20210712
x86_64               randconfig-a016-20210712
x86_64               randconfig-a011-20210712

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
