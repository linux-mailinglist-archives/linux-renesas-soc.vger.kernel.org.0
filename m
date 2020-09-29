Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7D427B90A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Sep 2020 02:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgI2Au2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Sep 2020 20:50:28 -0400
Received: from mga02.intel.com ([134.134.136.20]:13243 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726698AbgI2Au2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Sep 2020 20:50:28 -0400
IronPort-SDR: F9cZlN2Q5y4DZSbUwlAC1wLiaqZfxTbEaq8twlVMRD1m+aq20+pbqpEUJEj8XvubLfdws+xuba
 cje0CwMGFqrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="149748708"
X-IronPort-AV: E=Sophos;i="5.77,316,1596524400"; 
   d="scan'208";a="149748708"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 17:50:27 -0700
IronPort-SDR: Zu+yJswbisnuGKfQaiz1YqZcFVkYl0BBzB+uNgHgwrROcyxc+SP3waxRqvkOeTt/39drxtmnmy
 lvBe8njxK5Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,316,1596524400"; 
   d="scan'208";a="338398059"
Received: from lkp-server01.sh.intel.com (HELO 0e0978ea3297) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Sep 2020 17:50:26 -0700
Received: from kbuild by 0e0978ea3297 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kN3qb-0000SO-C8; Tue, 29 Sep 2020 00:50:25 +0000
Date:   Tue, 29 Sep 2020 08:49:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 567345b5a1f61f1b039e64adba6205d1610f7fa1
Message-ID: <5f7284aa.n7GKtEa9Hlm+8gBv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 567345b5a1f61f1b039e64adba6205d1610f7fa1  Merge branch 'renesas-arm-dt-for-v5.11' into renesas-devel

elapsed time: 723m

configs tested: 155
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         rt305x_defconfig
mips                      fuloong2e_defconfig
arm                       versatile_defconfig
mips                        nlm_xlp_defconfig
sh                        edosk7705_defconfig
powerpc                      arches_defconfig
powerpc                      cm5200_defconfig
sparc                       sparc32_defconfig
arm                          badge4_defconfig
powerpc                        cell_defconfig
mips                           mtx1_defconfig
powerpc                      bamboo_defconfig
arm                       imx_v6_v7_defconfig
m68k                            mac_defconfig
sh                              ul2_defconfig
mips                        vocore2_defconfig
openrisc                    or1ksim_defconfig
sh                          rsk7269_defconfig
powerpc                    adder875_defconfig
powerpc                 mpc8560_ads_defconfig
m68k                         amcore_defconfig
sparc64                          alldefconfig
powerpc                      acadia_defconfig
nios2                         3c120_defconfig
powerpc                     rainier_defconfig
powerpc                     mpc512x_defconfig
mips                       lemote2f_defconfig
riscv                          rv32_defconfig
mips                      bmips_stb_defconfig
sh                        apsh4ad0a_defconfig
arm                        magician_defconfig
mips                           ip22_defconfig
sh                        edosk7760_defconfig
arm                        spear6xx_defconfig
mips                         db1xxx_defconfig
mips                     loongson1b_defconfig
xtensa                    smp_lx200_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                       ebony_defconfig
arm                       cns3420vb_defconfig
powerpc                     pseries_defconfig
arm                         vf610m4_defconfig
mips                           gcw0_defconfig
m68k                             allmodconfig
mips                       rbtx49xx_defconfig
nios2                         10m50_defconfig
mips                     cu1000-neo_defconfig
sh                           se7619_defconfig
powerpc                     stx_gp3_defconfig
arc                           tb10x_defconfig
arm                          ep93xx_defconfig
powerpc                     mpc83xx_defconfig
ia64                             alldefconfig
sh                   rts7751r2dplus_defconfig
arm                         ebsa110_defconfig
m68k                            q40_defconfig
um                           x86_64_defconfig
sh                           se7780_defconfig
powerpc                 mpc8540_ads_defconfig
sh                            titan_defconfig
powerpc                   currituck_defconfig
mips                        bcm47xx_defconfig
sh                          polaris_defconfig
powerpc                      walnut_defconfig
sh                         microdev_defconfig
arm                           sunxi_defconfig
microblaze                    nommu_defconfig
parisc                              defconfig
powerpc                     ep8248e_defconfig
sh                        dreamcast_defconfig
parisc                           allyesconfig
arm                          pxa910_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
s390                             allyesconfig
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
i386                 randconfig-a002-20200928
i386                 randconfig-a003-20200928
i386                 randconfig-a004-20200928
i386                 randconfig-a001-20200928
i386                 randconfig-a002-20200927
i386                 randconfig-a006-20200927
i386                 randconfig-a003-20200927
i386                 randconfig-a004-20200927
i386                 randconfig-a005-20200927
i386                 randconfig-a001-20200927
i386                 randconfig-a006-20200928
i386                 randconfig-a005-20200928
x86_64               randconfig-a005-20200928
x86_64               randconfig-a003-20200928
x86_64               randconfig-a004-20200928
x86_64               randconfig-a002-20200928
x86_64               randconfig-a006-20200928
x86_64               randconfig-a001-20200928
x86_64               randconfig-a011-20200927
x86_64               randconfig-a013-20200927
x86_64               randconfig-a014-20200927
x86_64               randconfig-a015-20200927
x86_64               randconfig-a012-20200927
x86_64               randconfig-a016-20200927
i386                 randconfig-a012-20200928
i386                 randconfig-a016-20200928
i386                 randconfig-a014-20200928
i386                 randconfig-a013-20200928
i386                 randconfig-a015-20200928
i386                 randconfig-a011-20200928
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20200928
x86_64               randconfig-a013-20200928
x86_64               randconfig-a015-20200928
x86_64               randconfig-a014-20200928
x86_64               randconfig-a016-20200928
x86_64               randconfig-a012-20200928

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
