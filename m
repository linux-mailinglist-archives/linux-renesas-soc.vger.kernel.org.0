Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A014B3C6803
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 03:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhGMBY4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 21:24:56 -0400
Received: from mga12.intel.com ([192.55.52.136]:23013 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230247AbhGMBY4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 21:24:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="189763226"
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; 
   d="scan'208";a="189763226"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 18:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; 
   d="scan'208";a="464963998"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 Jul 2021 18:22:06 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m377d-000HOS-KW; Tue, 13 Jul 2021 01:22:05 +0000
Date:   Tue, 13 Jul 2021 09:21:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-fixes-for-v5.14] BUILD SUCCESS
 c3e67ad6f5a2c698a055fb297c6f9962f5145edd
Message-ID: <60ecea7f.s6T6hositfYSDMcp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-fixes-for-v5.14
branch HEAD: c3e67ad6f5a2c698a055fb297c6f9962f5145edd  dt-bindings: clock: r9a07g044-cpg: Update clock/reset definitions

elapsed time: 721m

configs tested: 172
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     pq2fads_defconfig
arc                        nsim_700_defconfig
sh                            shmin_defconfig
arm                          simpad_defconfig
sh                           se7721_defconfig
sparc                               defconfig
powerpc                        fsp2_defconfig
arm                            hisi_defconfig
mips                       rbtx49xx_defconfig
mips                        nlm_xlr_defconfig
sh                     sh7710voipgw_defconfig
arm                       aspeed_g4_defconfig
m68k                         amcore_defconfig
riscv                    nommu_virt_defconfig
sh                        sh7757lcr_defconfig
i386                             alldefconfig
sparc                       sparc32_defconfig
mips                  decstation_64_defconfig
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
powerpc                     tqm5200_defconfig
sh                ecovec24-romimage_defconfig
arm                     am200epdkit_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                           ip32_defconfig
powerpc                      tqm8xx_defconfig
sh                         apsh4a3a_defconfig
alpha                            allyesconfig
powerpc                     ppa8548_defconfig
powerpc                     akebono_defconfig
arc                     haps_hs_smp_defconfig
m68k                          atari_defconfig
powerpc                       ppc64_defconfig
powerpc                      pmac32_defconfig
arm                          pxa168_defconfig
arm                    vt8500_v6_v7_defconfig
xtensa                generic_kc705_defconfig
xtensa                    smp_lx200_defconfig
m68k                        mvme147_defconfig
um                               alldefconfig
xtensa                           allyesconfig
powerpc                 mpc836x_rdk_defconfig
openrisc                            defconfig
xtensa                  audio_kc705_defconfig
mips                          rb532_defconfig
powerpc                     kilauea_defconfig
sh                          kfr2r09_defconfig
sh                           se7712_defconfig
sh                            hp6xx_defconfig
sh                   rts7751r2dplus_defconfig
mips                         tb0287_defconfig
powerpc                   motionpro_defconfig
powerpc                  storcenter_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                     taishan_defconfig
arm                        cerfcube_defconfig
nios2                         10m50_defconfig
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
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
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
