Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C53297A37
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Oct 2020 03:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758616AbgJXBpc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 21:45:32 -0400
Received: from mga17.intel.com ([192.55.52.151]:50965 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758589AbgJXBpc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 21:45:32 -0400
IronPort-SDR: Mf1fY+RSkA6MntD84pxf8NRef9RJfM6c5EMVdK1gzO7ZDwvb8yPfz99wd6hL1+STAnA1O9fGP/
 v+aGRNu9V5fA==
X-IronPort-AV: E=McAfee;i="6000,8403,9783"; a="147606464"
X-IronPort-AV: E=Sophos;i="5.77,410,1596524400"; 
   d="scan'208";a="147606464"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2020 18:45:29 -0700
IronPort-SDR: AKYKqyOAn6L9IDVq6Bg0fxh+T4BBuloEdZkFQd2hUvn8RN0G0V9HvUTFI5jQXJ/fMD3CWIjHNd
 XHmfu3Ds3zsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,410,1596524400"; 
   d="scan'208";a="360407577"
Received: from lkp-server01.sh.intel.com (HELO cda15bb6d7bd) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Oct 2020 18:45:26 -0700
Received: from kbuild by cda15bb6d7bd with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kW8cX-0000JP-Hq; Sat, 24 Oct 2020 01:45:25 +0000
Date:   Sat, 24 Oct 2020 09:44:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.11] BUILD SUCCESS
 e323fa4edfcaee0e522989b1768ef5ec8c467679
Message-ID: <5f938716.r/KoGeVaYJfKzjsG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.11
branch HEAD: e323fa4edfcaee0e522989b1768ef5ec8c467679  arm64: dts: r8a77965: Add DRIF support

elapsed time: 723m

configs tested: 194
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          landisk_defconfig
sh                          r7780mp_defconfig
openrisc                            defconfig
arm                        cerfcube_defconfig
powerpc                 mpc837x_mds_defconfig
mips                          ath79_defconfig
powerpc                     ppa8548_defconfig
sh                               allmodconfig
powerpc                          g5_defconfig
arm                         s5pv210_defconfig
powerpc                     tqm8548_defconfig
sh                           se7619_defconfig
arm                         orion5x_defconfig
arm                         s3c6400_defconfig
mips                        maltaup_defconfig
arm                           omap1_defconfig
arm                         lubbock_defconfig
arm                           spitz_defconfig
sh                           se7751_defconfig
powerpc                 linkstation_defconfig
arm                        spear6xx_defconfig
arm                     am200epdkit_defconfig
microblaze                          defconfig
powerpc                      obs600_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                          sun3x_defconfig
arm                      integrator_defconfig
mips                           gcw0_defconfig
powerpc                     redwood_defconfig
s390                             allyesconfig
sh                             espt_defconfig
powerpc                       ppc64_defconfig
um                            kunit_defconfig
arm                            zeus_defconfig
sh                           se7722_defconfig
mips                     decstation_defconfig
arm                      jornada720_defconfig
sh                          lboxre2_defconfig
nios2                         3c120_defconfig
arm                           tegra_defconfig
arm                          lpd270_defconfig
arc                          axs103_defconfig
arm                           efm32_defconfig
sh                      rts7751r2d1_defconfig
i386                             alldefconfig
powerpc                    klondike_defconfig
arm                            pleb_defconfig
xtensa                              defconfig
powerpc                      chrp32_defconfig
xtensa                    xip_kc705_defconfig
m68k                            q40_defconfig
openrisc                    or1ksim_defconfig
sh                           se7705_defconfig
sh                          polaris_defconfig
arm                           stm32_defconfig
powerpc                         wii_defconfig
powerpc                    sam440ep_defconfig
xtensa                         virt_defconfig
arm                      tct_hammer_defconfig
m68k                          atari_defconfig
powerpc                      bamboo_defconfig
powerpc                     ksi8560_defconfig
sh                           se7206_defconfig
parisc                generic-64bit_defconfig
sparc64                          alldefconfig
powerpc                     mpc5200_defconfig
arm                              zx_defconfig
mips                malta_qemu_32r6_defconfig
mips                        bcm47xx_defconfig
xtensa                           alldefconfig
xtensa                  nommu_kc705_defconfig
powerpc                     akebono_defconfig
sh                           se7343_defconfig
arm                            dove_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                  iss476-smp_defconfig
powerpc                        warp_defconfig
arm                        neponset_defconfig
arm                        oxnas_v6_defconfig
arm                             ezx_defconfig
powerpc                     mpc83xx_defconfig
sh                           se7724_defconfig
arm                      pxa255-idp_defconfig
powerpc                      ppc40x_defconfig
arm                           viper_defconfig
powerpc                      ppc6xx_defconfig
arm                       versatile_defconfig
h8300                               defconfig
m68k                        stmark2_defconfig
powerpc                        icon_defconfig
nios2                               defconfig
powerpc                          allyesconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                        qi_lb60_defconfig
arc                        nsim_700_defconfig
arm                          iop32x_defconfig
sh                              ul2_defconfig
sh                             sh03_defconfig
arm                        magician_defconfig
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
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201023
x86_64               randconfig-a002-20201023
x86_64               randconfig-a003-20201023
x86_64               randconfig-a006-20201023
x86_64               randconfig-a004-20201023
x86_64               randconfig-a005-20201023
i386                 randconfig-a002-20201023
i386                 randconfig-a005-20201023
i386                 randconfig-a003-20201023
i386                 randconfig-a001-20201023
i386                 randconfig-a006-20201023
i386                 randconfig-a004-20201023
i386                 randconfig-a002-20201022
i386                 randconfig-a005-20201022
i386                 randconfig-a003-20201022
i386                 randconfig-a001-20201022
i386                 randconfig-a006-20201022
i386                 randconfig-a004-20201022
x86_64               randconfig-a011-20201022
x86_64               randconfig-a013-20201022
x86_64               randconfig-a016-20201022
x86_64               randconfig-a015-20201022
x86_64               randconfig-a012-20201022
x86_64               randconfig-a014-20201022
i386                 randconfig-a016-20201023
i386                 randconfig-a014-20201023
i386                 randconfig-a015-20201023
i386                 randconfig-a012-20201023
i386                 randconfig-a013-20201023
i386                 randconfig-a011-20201023
i386                 randconfig-a016-20201022
i386                 randconfig-a014-20201022
i386                 randconfig-a015-20201022
i386                 randconfig-a012-20201022
i386                 randconfig-a013-20201022
i386                 randconfig-a011-20201022
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
x86_64               randconfig-a001-20201022
x86_64               randconfig-a002-20201022
x86_64               randconfig-a003-20201022
x86_64               randconfig-a006-20201022
x86_64               randconfig-a004-20201022
x86_64               randconfig-a005-20201022
x86_64               randconfig-a011-20201023
x86_64               randconfig-a013-20201023
x86_64               randconfig-a016-20201023
x86_64               randconfig-a015-20201023
x86_64               randconfig-a012-20201023
x86_64               randconfig-a014-20201023

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
