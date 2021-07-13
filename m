Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42DBF3C6806
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 03:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231770AbhGMBY5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 21:24:57 -0400
Received: from mga02.intel.com ([134.134.136.20]:32614 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232254AbhGMBY4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 21:24:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="197264212"
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; 
   d="scan'208";a="197264212"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 18:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; 
   d="scan'208";a="629875830"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Jul 2021 18:22:06 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m377d-000HOU-LB; Tue, 13 Jul 2021 01:22:05 +0000
Date:   Tue, 13 Jul 2021 09:21:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.15] BUILD SUCCESS
 9ea3ddf72ca2358588d6569abe3f88c5664b47ed
Message-ID: <60ecea8b.HeBA7PfZBEaUGP1v%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.15
branch HEAD: 9ea3ddf72ca2358588d6569abe3f88c5664b47ed  arm64: dts: renesas: r8a77990: ebisu: Add SW4 support

elapsed time: 721m

configs tested: 178
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
powerpc                 mpc8540_ads_defconfig
arc                 nsimosci_hs_smp_defconfig
xtensa                    smp_lx200_defconfig
mips                        jmr3927_defconfig
mips                      maltasmvp_defconfig
arm                       aspeed_g4_defconfig
m68k                         amcore_defconfig
riscv                    nommu_virt_defconfig
sh                        sh7757lcr_defconfig
i386                             alldefconfig
powerpc                     pq2fads_defconfig
sparc                       sparc32_defconfig
mips                  decstation_64_defconfig
powerpc                    adder875_defconfig
arm                        vexpress_defconfig
arm                        magician_defconfig
arm                        spear3xx_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      arches_defconfig
nios2                         3c120_defconfig
arm64                            alldefconfig
mips                            gpr_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                          rsk7201_defconfig
sh                   sh7724_generic_defconfig
nios2                         10m50_defconfig
mips                        bcm47xx_defconfig
m68k                        mvme147_defconfig
powerpc                      pmac32_defconfig
arm                          moxart_defconfig
mips                           xway_defconfig
arm                           stm32_defconfig
xtensa                              defconfig
mips                        bcm63xx_defconfig
powerpc                     tqm5200_defconfig
sh                ecovec24-romimage_defconfig
arm                     am200epdkit_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                           ip32_defconfig
powerpc                      tqm8xx_defconfig
sh                         apsh4a3a_defconfig
arc                        nsim_700_defconfig
alpha                            allyesconfig
powerpc                     ppa8548_defconfig
sh                      rts7751r2d1_defconfig
mips                      malta_kvm_defconfig
arm                        mvebu_v5_defconfig
arm                       spear13xx_defconfig
powerpc                     akebono_defconfig
arc                     haps_hs_smp_defconfig
m68k                          atari_defconfig
powerpc                       ppc64_defconfig
arm                          pxa168_defconfig
arm                    vt8500_v6_v7_defconfig
xtensa                generic_kc705_defconfig
um                               alldefconfig
arc                          axs101_defconfig
sh                          landisk_defconfig
mips                           jazz_defconfig
arm                          pcm027_defconfig
m68k                       bvme6000_defconfig
powerpc                 mpc836x_rdk_defconfig
openrisc                            defconfig
xtensa                  audio_kc705_defconfig
mips                          rb532_defconfig
powerpc                     kilauea_defconfig
sh                          kfr2r09_defconfig
sh                           se7712_defconfig
sh                            hp6xx_defconfig
sh                   rts7751r2dplus_defconfig
sh                           se7721_defconfig
mips                         tb0287_defconfig
powerpc                   motionpro_defconfig
powerpc                  storcenter_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                     taishan_defconfig
arm                        cerfcube_defconfig
s390                             allmodconfig
arm                         vf610m4_defconfig
arm                  colibri_pxa270_defconfig
arm                         s3c2410_defconfig
arm                             rpc_defconfig
m68k                          multi_defconfig
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
i386                 randconfig-a015-20210712
i386                 randconfig-a014-20210712
i386                 randconfig-a011-20210712
i386                 randconfig-a013-20210712
i386                 randconfig-a012-20210712
i386                 randconfig-a016-20210712
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

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
