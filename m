Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12563C91DF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 22:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234095AbhGNUOV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 16:14:21 -0400
Received: from mga09.intel.com ([134.134.136.24]:10830 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241053AbhGNUOK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 16:14:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="210407990"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; 
   d="scan'208";a="210407990"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2021 13:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; 
   d="scan'208";a="494636217"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2021 13:11:16 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m3lDv-000Izc-R1; Wed, 14 Jul 2021 20:11:15 +0000
Date:   Thu, 15 Jul 2021 04:10:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 55e35ffd52dc3092b56be6935908b6e0c0ac0675
Message-ID: <60ef44d3.4Z8bxyMAdsZeM6HJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 55e35ffd52dc3092b56be6935908b6e0c0ac0675  clk: renesas: r9a07g044: Add SSIF-2 clock and reset entries

elapsed time: 727m

configs tested: 144
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv             nommu_k210_sdcard_defconfig
arm                  colibri_pxa270_defconfig
microblaze                          defconfig
ia64                             alldefconfig
sh                           se7705_defconfig
mips                           gcw0_defconfig
powerpc                    amigaone_defconfig
mips                           ip32_defconfig
arm                              alldefconfig
sh                                  defconfig
mips                           ip27_defconfig
arm                           stm32_defconfig
powerpc                     tqm8555_defconfig
arm                        mini2440_defconfig
powerpc                      tqm8xx_defconfig
openrisc                         alldefconfig
powerpc                      mgcoge_defconfig
arm                         lubbock_defconfig
arm                           spitz_defconfig
s390                                defconfig
powerpc                     pq2fads_defconfig
parisc                generic-64bit_defconfig
riscv                    nommu_virt_defconfig
powerpc                      katmai_defconfig
arm                         lpc32xx_defconfig
powerpc                     redwood_defconfig
mips                            gpr_defconfig
powerpc                 linkstation_defconfig
mips                        qi_lb60_defconfig
sh                        dreamcast_defconfig
arm                         bcm2835_defconfig
sh                ecovec24-romimage_defconfig
sparc                            alldefconfig
powerpc                      bamboo_defconfig
arm                        oxnas_v6_defconfig
arm                         orion5x_defconfig
powerpc                  mpc866_ads_defconfig
arm                            lart_defconfig
mips                       capcella_defconfig
arc                              alldefconfig
sh                        edosk7705_defconfig
mips                      maltaaprp_defconfig
m68k                        m5307c3_defconfig
m68k                          sun3x_defconfig
arm                          collie_defconfig
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
i386                 randconfig-a004-20210713
i386                 randconfig-a001-20210713
i386                 randconfig-a002-20210713
i386                 randconfig-a003-20210713
i386                 randconfig-a005-20210714
i386                 randconfig-a006-20210714
i386                 randconfig-a004-20210714
i386                 randconfig-a001-20210714
i386                 randconfig-a003-20210714
i386                 randconfig-a002-20210714
i386                 randconfig-a005-20210713
i386                 randconfig-a006-20210713
x86_64               randconfig-a013-20210713
x86_64               randconfig-a014-20210713
x86_64               randconfig-a012-20210713
x86_64               randconfig-a015-20210713
x86_64               randconfig-a016-20210713
x86_64               randconfig-a011-20210713
i386                 randconfig-a014-20210714
i386                 randconfig-a015-20210714
i386                 randconfig-a011-20210714
i386                 randconfig-a013-20210714
i386                 randconfig-a012-20210714
i386                 randconfig-a016-20210714
i386                 randconfig-a015-20210713
i386                 randconfig-a014-20210713
i386                 randconfig-a011-20210713
i386                 randconfig-a013-20210713
i386                 randconfig-a012-20210713
i386                 randconfig-a016-20210713
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                      rhel-8.3-kbuiltin
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210713
x86_64               randconfig-a013-20210714
x86_64               randconfig-a015-20210714
x86_64               randconfig-a012-20210714
x86_64               randconfig-a014-20210714
x86_64               randconfig-a016-20210714
x86_64               randconfig-a011-20210714
x86_64               randconfig-a005-20210713
x86_64               randconfig-a004-20210713
x86_64               randconfig-a003-20210713
x86_64               randconfig-a002-20210713
x86_64               randconfig-a006-20210713
x86_64               randconfig-a001-20210713

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
