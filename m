Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7BDD3EAD77
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 01:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237699AbhHLXJb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 19:09:31 -0400
Received: from mga01.intel.com ([192.55.52.88]:23713 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229705AbhHLXJa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 19:09:30 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="237506746"
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; 
   d="scan'208";a="237506746"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 16:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; 
   d="scan'208";a="485629417"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 Aug 2021 16:09:03 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mEJot-000N6H-8l; Thu, 12 Aug 2021 23:09:03 +0000
Date:   Fri, 13 Aug 2021 07:09:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-drivers-for-v5.15] BUILD SUCCESS
 148bcca9ad0488d623aa36b21ac152bb056a1ae4
Message-ID: <6115aa0c.NinrIc+ubbnZP+05%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v5.15
branch HEAD: 148bcca9ad0488d623aa36b21ac152bb056a1ae4  soc: renesas: Prefer memcpy() over strcpy()

elapsed time: 724m

configs tested: 139
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210812
arm                    vt8500_v6_v7_defconfig
openrisc                            defconfig
powerpc                     taishan_defconfig
ia64                             alldefconfig
powerpc                     ppa8548_defconfig
ia64                             allmodconfig
arm                       aspeed_g5_defconfig
mips                        omega2p_defconfig
powerpc                        warp_defconfig
powerpc                     stx_gp3_defconfig
xtensa                  nommu_kc705_defconfig
m68k                          hp300_defconfig
sh                         apsh4a3a_defconfig
powerpc                   lite5200b_defconfig
powerpc                        fsp2_defconfig
powerpc                 canyonlands_defconfig
arm                        mvebu_v5_defconfig
xtensa                       common_defconfig
sh                            hp6xx_defconfig
powerpc                     tqm8560_defconfig
sh                        sh7785lcr_defconfig
sh                   sh7724_generic_defconfig
powerpc                 mpc8540_ads_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          simpad_defconfig
m68k                       m5208evb_defconfig
x86_64                           alldefconfig
powerpc                     pseries_defconfig
mips                            gpr_defconfig
mips                      maltaaprp_defconfig
m68k                        mvme147_defconfig
mips                         tb0226_defconfig
mips                  decstation_64_defconfig
mips                        bcm63xx_defconfig
arm                      jornada720_defconfig
sh                          polaris_defconfig
arc                            hsdk_defconfig
sh                        sh7757lcr_defconfig
sh                           se7780_defconfig
arm                         socfpga_defconfig
mips                      malta_kvm_defconfig
arm                            hisi_defconfig
x86_64                            allnoconfig
m68k                        m5272c3_defconfig
m68k                                defconfig
sh                          landisk_defconfig
arm                             mxs_defconfig
mips                           ci20_defconfig
mips                           ip22_defconfig
powerpc                   motionpro_defconfig
mips                     decstation_defconfig
powerpc64                           defconfig
arm                           stm32_defconfig
arm                      integrator_defconfig
alpha                            alldefconfig
powerpc                       ebony_defconfig
mips                            ar7_defconfig
arm                        oxnas_v6_defconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
x86_64               randconfig-a006-20210812
x86_64               randconfig-a004-20210812
x86_64               randconfig-a003-20210812
x86_64               randconfig-a005-20210812
x86_64               randconfig-a002-20210812
x86_64               randconfig-a001-20210812
i386                 randconfig-a004-20210812
i386                 randconfig-a003-20210812
i386                 randconfig-a002-20210812
i386                 randconfig-a001-20210812
i386                 randconfig-a006-20210812
i386                 randconfig-a005-20210812
i386                 randconfig-a004-20210811
i386                 randconfig-a001-20210811
i386                 randconfig-a002-20210811
i386                 randconfig-a003-20210811
i386                 randconfig-a006-20210811
i386                 randconfig-a005-20210811
i386                 randconfig-a011-20210812
i386                 randconfig-a015-20210812
i386                 randconfig-a013-20210812
i386                 randconfig-a014-20210812
i386                 randconfig-a016-20210812
i386                 randconfig-a012-20210812
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210812
x86_64               randconfig-a011-20210812
x86_64               randconfig-a013-20210812
x86_64               randconfig-a012-20210812
x86_64               randconfig-a016-20210812
x86_64               randconfig-a015-20210812
x86_64               randconfig-a014-20210812

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
