Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E463A479932
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Dec 2021 07:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232204AbhLRGmi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 18 Dec 2021 01:42:38 -0500
Received: from mga07.intel.com ([134.134.136.100]:51055 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232203AbhLRGmh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 Dec 2021 01:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639809757; x=1671345757;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cYNntU7OQW8HHAAG+S3aLKNjQxomh1GvW7XBfgfCFkQ=;
  b=X+Sz9wVDjluUG1Ar1UwZW7N1z9HK4+8fEuSk1S4RYZZWrALv70KqFZ50
   hEk0t6W3gaWaFeWUh+3kc+eqlXSXF2QI9qCaFXpiZl4FU3t3Mb/Qla7Rx
   xqI+ZBBeQV60BjgqII+R276EEXg2e/06+xEz+Dr3b4dLibJuVq5WE5HdA
   BFOtlgmP/LkSrm84ureKxZ3xVRkeqEopNyUiqNIPYJ1uJqFSuibBBH5x4
   IS1tuIysDgBo/iaTzILcU6E4dm+u7Gb0QyErICaxktdpM137oRYZ+HClx
   C9+gaL/ZPlBwM9nUdLhZxQZvsMIxeobyWRM/r8HqBEI7anY3GPU6WSTG9
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="303269791"
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; 
   d="scan'208";a="303269791"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 22:42:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; 
   d="scan'208";a="683644746"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Dec 2021 22:42:36 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1myTQR-0005ig-Jj; Sat, 18 Dec 2021 06:42:35 +0000
Date:   Sat, 18 Dec 2021 14:41:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 9aa3a08281f795eec94a1d7ee8c48ed7dec31a7c
Message-ID: <61bd82b4.aH9j7cl1+0qwWMQo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 9aa3a08281f795eec94a1d7ee8c48ed7dec31a7c  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1205m

configs tested: 163
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm                              allmodconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211216
mips                         rt305x_defconfig
sh                      rts7751r2d1_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                      bamboo_defconfig
powerpc                     ppa8548_defconfig
sh                           se7780_defconfig
mips                            ar7_defconfig
m68k                       bvme6000_defconfig
arm                              alldefconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                 mpc8560_ads_defconfig
x86_64                           allyesconfig
arm                           sama5_defconfig
sh                   secureedge5410_defconfig
h8300                    h8300h-sim_defconfig
arm                          collie_defconfig
arc                                 defconfig
sparc                               defconfig
arm                       imx_v6_v7_defconfig
powerpc                      cm5200_defconfig
arm                   milbeaut_m10v_defconfig
arm                        multi_v7_defconfig
arm                            pleb_defconfig
mips                       bmips_be_defconfig
arm                       multi_v4t_defconfig
arm                         orion5x_defconfig
sh                           se7750_defconfig
mips                  cavium_octeon_defconfig
powerpc                 mpc832x_mds_defconfig
mips                    maltaup_xpa_defconfig
m68k                        stmark2_defconfig
powerpc                      makalu_defconfig
arc                        vdk_hs38_defconfig
sh                            titan_defconfig
arm                           stm32_defconfig
arm                        neponset_defconfig
powerpc                     tqm8540_defconfig
mips                        bcm63xx_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                      walnut_defconfig
mips                        omega2p_defconfig
arm                         lubbock_defconfig
arm                        magician_defconfig
sh                           se7721_defconfig
arc                     haps_hs_smp_defconfig
sh                           se7724_defconfig
powerpc                 linkstation_defconfig
powerpc                        fsp2_defconfig
powerpc                        cell_defconfig
arm                         axm55xx_defconfig
parisc                           alldefconfig
m68k                          amiga_defconfig
m68k                        mvme147_defconfig
sh                        sh7757lcr_defconfig
arm                       omap2plus_defconfig
parisc                generic-32bit_defconfig
h8300                            allyesconfig
powerpc                    adder875_defconfig
arm                         s3c6400_defconfig
mips                      pic32mzda_defconfig
powerpc                    mvme5100_defconfig
arm                          iop32x_defconfig
arm                         vf610m4_defconfig
arm                         assabet_defconfig
arm                  randconfig-c002-20211216
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a006-20211216
x86_64               randconfig-a005-20211216
x86_64               randconfig-a001-20211216
x86_64               randconfig-a002-20211216
x86_64               randconfig-a003-20211216
x86_64               randconfig-a004-20211216
i386                 randconfig-a001-20211216
i386                 randconfig-a002-20211216
i386                 randconfig-a005-20211216
i386                 randconfig-a003-20211216
i386                 randconfig-a006-20211216
i386                 randconfig-a004-20211216
x86_64               randconfig-a011-20211217
x86_64               randconfig-a014-20211217
x86_64               randconfig-a012-20211217
x86_64               randconfig-a013-20211217
x86_64               randconfig-a016-20211217
x86_64               randconfig-a015-20211217
arc                  randconfig-r043-20211216
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a006-20211217
x86_64               randconfig-a005-20211217
x86_64               randconfig-a001-20211217
x86_64               randconfig-a002-20211217
x86_64               randconfig-a003-20211217
x86_64               randconfig-a004-20211217
x86_64               randconfig-a011-20211216
x86_64               randconfig-a014-20211216
x86_64               randconfig-a012-20211216
x86_64               randconfig-a013-20211216
x86_64               randconfig-a016-20211216
x86_64               randconfig-a015-20211216
x86_64               randconfig-a011-20211214
x86_64               randconfig-a014-20211214
x86_64               randconfig-a012-20211214
x86_64               randconfig-a013-20211214
x86_64               randconfig-a016-20211214
x86_64               randconfig-a015-20211214
i386                 randconfig-a011-20211216
i386                 randconfig-a014-20211216
i386                 randconfig-a012-20211216
i386                 randconfig-a013-20211216
i386                 randconfig-a015-20211216
i386                 randconfig-a016-20211216
hexagon              randconfig-r045-20211216
s390                 randconfig-r044-20211216
riscv                randconfig-r042-20211216
hexagon              randconfig-r041-20211216

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
