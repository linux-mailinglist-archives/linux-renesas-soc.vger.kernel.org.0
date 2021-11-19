Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B89457987
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Nov 2021 00:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235688AbhKSX0g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 18:26:36 -0500
Received: from mga02.intel.com ([134.134.136.20]:9422 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233326AbhKSX0f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 18:26:35 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="221730229"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; 
   d="scan'208";a="221730229"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 15:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; 
   d="scan'208";a="673385326"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Nov 2021 15:23:30 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1moDE9-00054o-SD; Fri, 19 Nov 2021 23:23:29 +0000
Date:   Sat, 20 Nov 2021 07:23:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 4789519c215cde2581c9f3e4847bb3bbf4158648
Message-ID: <619831e0.a9Wnb9YUXZ8bATPw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 4789519c215cde2581c9f3e4847bb3bbf4158648  Merge branches 'renesas-arm-dt-for-v5.17' and 'renesas-dt-bindings-for-v5.17' into renesas-next

elapsed time: 729m

configs tested: 223
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211119
i386                 randconfig-c001-20211118
mips                 randconfig-c004-20211118
powerpc                         ps3_defconfig
sh                                  defconfig
arc                      axs103_smp_defconfig
ia64                          tiger_defconfig
ia64                         bigsur_defconfig
sh                           se7722_defconfig
mips                      fuloong2e_defconfig
mips                        omega2p_defconfig
arm                             rpc_defconfig
sparc64                             defconfig
sh                           sh2007_defconfig
powerpc                        warp_defconfig
arm                        mvebu_v7_defconfig
sh                        dreamcast_defconfig
arm                         orion5x_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                  colibri_pxa300_defconfig
arm                           h3600_defconfig
arc                    vdk_hs38_smp_defconfig
riscv                    nommu_virt_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      walnut_defconfig
arm                        mvebu_v5_defconfig
mips                         mpc30x_defconfig
powerpc                      acadia_defconfig
mips                             allyesconfig
s390                          debug_defconfig
powerpc                 mpc8540_ads_defconfig
mips                malta_qemu_32r6_defconfig
arm                           omap1_defconfig
arm                         palmz72_defconfig
arc                     nsimosci_hs_defconfig
nios2                               defconfig
arm                           stm32_defconfig
arm                        realview_defconfig
s390                             alldefconfig
sh                           se7750_defconfig
powerpc                   bluestone_defconfig
mips                     loongson2k_defconfig
arc                         haps_hs_defconfig
mips                     loongson1b_defconfig
mips                          malta_defconfig
arm                         lubbock_defconfig
arc                          axs103_defconfig
powerpc                      chrp32_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc834x_itx_defconfig
arm                         s5pv210_defconfig
m68k                        stmark2_defconfig
mips                      bmips_stb_defconfig
nds32                               defconfig
arm                       cns3420vb_defconfig
arm                       netwinder_defconfig
powerpc                      katmai_defconfig
arm                      integrator_defconfig
powerpc                     mpc5200_defconfig
powerpc                       maple_defconfig
mips                           gcw0_defconfig
mips                           ip22_defconfig
arm                        spear3xx_defconfig
m68k                         amcore_defconfig
mips                    maltaup_xpa_defconfig
arm                     am200epdkit_defconfig
sh                           se7343_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                      pasemi_defconfig
powerpc                     rainier_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                          collie_defconfig
m68k                             alldefconfig
arc                     haps_hs_smp_defconfig
sh                   sh7770_generic_defconfig
mips                       bmips_be_defconfig
m68k                            mac_defconfig
sh                        edosk7760_defconfig
arm                      pxa255-idp_defconfig
h8300                     edosk2674_defconfig
arm                             mxs_defconfig
sh                               allmodconfig
arm                            hisi_defconfig
i386                             alldefconfig
sh                          sdk7786_defconfig
arm                            mmp2_defconfig
powerpc                 mpc837x_mds_defconfig
sh                   sh7724_generic_defconfig
mips                         db1xxx_defconfig
arm                        cerfcube_defconfig
arm                          pxa168_defconfig
m68k                          multi_defconfig
arm                              alldefconfig
xtensa                          iss_defconfig
microblaze                          defconfig
arm                           sunxi_defconfig
powerpc                       holly_defconfig
arm                        mini2440_defconfig
i386                                defconfig
x86_64                              defconfig
sh                           se7619_defconfig
s390                       zfcpdump_defconfig
powerpc                      ppc40x_defconfig
powerpc                        icon_defconfig
arm                           tegra_defconfig
ia64                            zx1_defconfig
arm                       imx_v6_v7_defconfig
m68k                          sun3x_defconfig
powerpc64                        alldefconfig
powerpc                 mpc834x_mds_defconfig
mips                 decstation_r4k_defconfig
mips                           rs90_defconfig
arm                         mv78xx0_defconfig
ia64                             alldefconfig
sh                        sh7785lcr_defconfig
arm                  randconfig-c002-20211118
arm                  randconfig-c002-20211119
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20211119
x86_64               randconfig-a003-20211119
x86_64               randconfig-a002-20211119
x86_64               randconfig-a001-20211119
x86_64               randconfig-a006-20211119
x86_64               randconfig-a004-20211119
i386                 randconfig-a006-20211119
i386                 randconfig-a003-20211119
i386                 randconfig-a001-20211119
i386                 randconfig-a005-20211119
i386                 randconfig-a004-20211119
i386                 randconfig-a002-20211119
x86_64               randconfig-a015-20211118
x86_64               randconfig-a012-20211118
x86_64               randconfig-a011-20211118
x86_64               randconfig-a013-20211118
x86_64               randconfig-a016-20211118
x86_64               randconfig-a014-20211118
i386                 randconfig-a016-20211120
i386                 randconfig-a015-20211120
i386                 randconfig-a012-20211120
i386                 randconfig-a013-20211120
i386                 randconfig-a014-20211120
i386                 randconfig-a011-20211120
i386                 randconfig-a016-20211118
i386                 randconfig-a014-20211118
i386                 randconfig-a012-20211118
i386                 randconfig-a011-20211118
i386                 randconfig-a013-20211118
i386                 randconfig-a015-20211118
riscv                    nommu_k210_defconfig
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
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20211118
x86_64               randconfig-c007-20211118
arm                  randconfig-c002-20211118
s390                 randconfig-c005-20211118
powerpc              randconfig-c003-20211118
riscv                randconfig-c006-20211118
mips                 randconfig-c004-20211118
i386                 randconfig-c001-20211119
x86_64               randconfig-c007-20211119
arm                  randconfig-c002-20211119
s390                 randconfig-c005-20211119
powerpc              randconfig-c003-20211119
riscv                randconfig-c006-20211119
x86_64               randconfig-a005-20211118
x86_64               randconfig-a003-20211118
x86_64               randconfig-a001-20211118
x86_64               randconfig-a002-20211118
x86_64               randconfig-a006-20211118
x86_64               randconfig-a004-20211118
i386                 randconfig-a006-20211118
i386                 randconfig-a003-20211118
i386                 randconfig-a001-20211118
i386                 randconfig-a005-20211118
i386                 randconfig-a004-20211118
i386                 randconfig-a002-20211118
x86_64               randconfig-a015-20211119
x86_64               randconfig-a011-20211119
x86_64               randconfig-a012-20211119
x86_64               randconfig-a013-20211119
x86_64               randconfig-a016-20211119
x86_64               randconfig-a014-20211119
hexagon              randconfig-r045-20211119
hexagon              randconfig-r041-20211119
riscv                randconfig-r042-20211119
s390                 randconfig-r044-20211119

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
