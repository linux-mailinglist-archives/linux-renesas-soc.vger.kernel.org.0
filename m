Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCE164518E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 00:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346974AbhKOXKZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 18:10:25 -0500
Received: from mga07.intel.com ([134.134.136.100]:25549 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348134AbhKOXIW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 18:08:22 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="296977183"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; 
   d="scan'208";a="296977183"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 15:01:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; 
   d="scan'208";a="454205861"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Nov 2021 15:01:52 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mmkz2-000N6x-1P; Mon, 15 Nov 2021 23:01:52 +0000
Date:   Tue, 16 Nov 2021 07:01:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 161450134ae9bab3778c5f5732941162626d0eaa
Message-ID: <6192e6b6.WyHSquJuP7Z2ngAe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 161450134ae9bab3778c5f5732941162626d0eaa  clk: renesas: r9a07g044: Add OSTM clock and reset entries

elapsed time: 720m

configs tested: 169
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211115
arc                                 defconfig
sh                           se7751_defconfig
arm                        mini2440_defconfig
mips                        bcm63xx_defconfig
sh                           se7721_defconfig
s390                          debug_defconfig
arm64                            alldefconfig
arc                            hsdk_defconfig
arm                         lpc32xx_defconfig
arm                       omap2plus_defconfig
arm                       cns3420vb_defconfig
sh                            shmin_defconfig
powerpc                    adder875_defconfig
powerpc                 linkstation_defconfig
sparc                            alldefconfig
powerpc                 mpc836x_mds_defconfig
arm                         nhk8815_defconfig
powerpc                    ge_imp3a_defconfig
xtensa                  audio_kc705_defconfig
arm                          ixp4xx_defconfig
m68k                          multi_defconfig
arm                      jornada720_defconfig
powerpc                   bluestone_defconfig
mips                     loongson2k_defconfig
mips                          rb532_defconfig
mips                          ath79_defconfig
arc                        nsimosci_defconfig
sh                          r7780mp_defconfig
arm                            xcep_defconfig
sh                        apsh4ad0a_defconfig
openrisc                 simple_smp_defconfig
m68k                        m5307c3_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                           rs90_defconfig
arc                        nsim_700_defconfig
mips                       capcella_defconfig
arm                       netwinder_defconfig
powerpc                      katmai_defconfig
arm                        cerfcube_defconfig
openrisc                  or1klitex_defconfig
mips                     loongson1c_defconfig
powerpc                        warp_defconfig
powerpc                        icon_defconfig
m68k                       m5475evb_defconfig
mips                          ath25_defconfig
arm                        spear3xx_defconfig
sh                          rsk7203_defconfig
arm                            qcom_defconfig
arm                        multi_v5_defconfig
microblaze                      mmu_defconfig
xtensa                generic_kc705_defconfig
m68k                        mvme16x_defconfig
sh                        sh7757lcr_defconfig
powerpc                     redwood_defconfig
arc                         haps_hs_defconfig
powerpc                       holly_defconfig
powerpc                       ppc64_defconfig
powerpc                  iss476-smp_defconfig
arm                     eseries_pxa_defconfig
powerpc                 xes_mpc85xx_defconfig
x86_64                           allyesconfig
powerpc                     taishan_defconfig
mips                           ip28_defconfig
arm                         socfpga_defconfig
arm                        shmobile_defconfig
powerpc                     tqm8548_defconfig
arm                         at91_dt_defconfig
m68k                         amcore_defconfig
powerpc                      ppc6xx_defconfig
sh                   sh7770_generic_defconfig
arm                          pxa3xx_defconfig
mips                      malta_kvm_defconfig
arm                      pxa255-idp_defconfig
powerpc                     pq2fads_defconfig
arm                         palmz72_defconfig
arm                           tegra_defconfig
h8300                               defconfig
mips                      maltaaprp_defconfig
xtensa                    xip_kc705_defconfig
sh                          sdk7786_defconfig
mips                  decstation_64_defconfig
um                                  defconfig
arm                  randconfig-c002-20211115
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a005-20211115
x86_64               randconfig-a003-20211115
x86_64               randconfig-a002-20211115
x86_64               randconfig-a001-20211115
x86_64               randconfig-a006-20211115
x86_64               randconfig-a004-20211115
i386                 randconfig-a006-20211115
i386                 randconfig-a003-20211115
i386                 randconfig-a005-20211115
i386                 randconfig-a001-20211115
i386                 randconfig-a004-20211115
i386                 randconfig-a002-20211115
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211115
i386                 randconfig-c001-20211115
arm                  randconfig-c002-20211115
riscv                randconfig-c006-20211115
powerpc              randconfig-c003-20211115
s390                 randconfig-c005-20211115
mips                 randconfig-c004-20211115
x86_64               randconfig-a015-20211115
x86_64               randconfig-a013-20211115
x86_64               randconfig-a011-20211115
x86_64               randconfig-a012-20211115
x86_64               randconfig-a016-20211115
x86_64               randconfig-a014-20211115
i386                 randconfig-a014-20211115
i386                 randconfig-a016-20211115
i386                 randconfig-a012-20211115
i386                 randconfig-a013-20211115
i386                 randconfig-a011-20211115
i386                 randconfig-a015-20211115
hexagon              randconfig-r045-20211115
hexagon              randconfig-r041-20211115
s390                 randconfig-r044-20211115
riscv                randconfig-r042-20211115

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
