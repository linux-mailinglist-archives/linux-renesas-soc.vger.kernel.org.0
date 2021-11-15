Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B7E4519A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 00:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347143AbhKOXZJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 18:25:09 -0500
Received: from mga04.intel.com ([192.55.52.120]:48303 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240670AbhKOXXH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 18:23:07 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="232276117"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; 
   d="scan'208";a="232276117"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 15:16:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; 
   d="scan'208";a="604069734"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Nov 2021 15:16:53 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mmlDY-000N7z-Dz; Mon, 15 Nov 2021 23:16:52 +0000
Date:   Tue, 16 Nov 2021 07:16:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v5.17] BUILD SUCCESS
 4c7924fb905b02323ff6d9d20f370892615dccfa
Message-ID: <6192ea5c.dHQQ7kQd5qaT7d3G%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v5.17
branch HEAD: 4c7924fb905b02323ff6d9d20f370892615dccfa  soc: renesas: rcar-rst: Add support to set rproc boot address

elapsed time: 734m

configs tested: 225
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
arm                            zeus_defconfig
nios2                         10m50_defconfig
arm                          pcm027_defconfig
arm                         assabet_defconfig
arm                           tegra_defconfig
h8300                            alldefconfig
arc                                 defconfig
sh                           se7751_defconfig
arm                        mini2440_defconfig
mips                        bcm63xx_defconfig
sh                           se7721_defconfig
s390                          debug_defconfig
arm64                            alldefconfig
arc                            hsdk_defconfig
arm                         lpc32xx_defconfig
powerpc                      pasemi_defconfig
powerpc                      walnut_defconfig
powerpc                     sequoia_defconfig
arm                        mvebu_v7_defconfig
sh                     sh7710voipgw_defconfig
arm                       omap2plus_defconfig
arm                       cns3420vb_defconfig
sh                            shmin_defconfig
sh                        sh7763rdp_defconfig
mips                          malta_defconfig
powerpc                         wii_defconfig
arm                          collie_defconfig
arm                        multi_v7_defconfig
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
powerpc                    sam440ep_defconfig
mips                         bigsur_defconfig
sh                        edosk7760_defconfig
um                                  defconfig
arm                       netwinder_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                      rts7751r2d1_defconfig
nios2                            alldefconfig
mips                         db1xxx_defconfig
ia64                          tiger_defconfig
mips                         cobalt_defconfig
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
powerpc                      katmai_defconfig
arm                        cerfcube_defconfig
arm                         cm_x300_defconfig
m68k                          atari_defconfig
sh                             espt_defconfig
arm                        vexpress_defconfig
h8300                    h8300h-sim_defconfig
openrisc                  or1klitex_defconfig
mips                     loongson1c_defconfig
powerpc                        warp_defconfig
powerpc                        icon_defconfig
arm                       aspeed_g4_defconfig
powerpc                     tqm8541_defconfig
m68k                            mac_defconfig
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
mips                     decstation_defconfig
sh                         apsh4a3a_defconfig
sparc64                             defconfig
sh                          urquell_defconfig
parisc                           alldefconfig
sh                ecovec24-romimage_defconfig
powerpc                 mpc832x_mds_defconfig
arm                        trizeps4_defconfig
arm                     eseries_pxa_defconfig
powerpc                 xes_mpc85xx_defconfig
x86_64                           allyesconfig
powerpc                     taishan_defconfig
mips                           ip28_defconfig
arm                         socfpga_defconfig
arm                        shmobile_defconfig
powerpc                     tqm8548_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      ppc64e_defconfig
mips                           ip32_defconfig
arm                         at91_dt_defconfig
m68k                         amcore_defconfig
powerpc                      ppc6xx_defconfig
sh                   sh7770_generic_defconfig
arm                          pxa3xx_defconfig
mips                      malta_kvm_defconfig
arm                      pxa255-idp_defconfig
powerpc                  mpc866_ads_defconfig
arc                      axs103_smp_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                 mpc837x_mds_defconfig
m68k                        m5272c3_defconfig
powerpc                     pq2fads_defconfig
arm                         palmz72_defconfig
powerpc                 mpc836x_rdk_defconfig
parisc                generic-32bit_defconfig
arm                     am200epdkit_defconfig
arm                          lpd270_defconfig
h8300                               defconfig
mips                      maltaaprp_defconfig
xtensa                    xip_kc705_defconfig
sh                          sdk7786_defconfig
mips                  decstation_64_defconfig
arm                             mxs_defconfig
parisc                generic-64bit_defconfig
arm                        mvebu_v5_defconfig
powerpc                     pseries_defconfig
arm                  randconfig-c002-20211115
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
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
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
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
riscv                            allyesconfig
riscv                            allmodconfig
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
