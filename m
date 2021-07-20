Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4423CF447
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 08:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238722AbhGTFcC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 01:32:02 -0400
Received: from mga05.intel.com ([192.55.52.43]:10940 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236061AbhGTFby (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 01:31:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="296746090"
X-IronPort-AV: E=Sophos;i="5.84,254,1620716400"; 
   d="scan'208";a="296746090"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2021 23:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,254,1620716400"; 
   d="scan'208";a="432378609"
Received: from lkp-server02.sh.intel.com (HELO 1b5a72ed9419) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 19 Jul 2021 23:12:22 -0700
Received: from kbuild by 1b5a72ed9419 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m5izN-00001G-NE; Tue, 20 Jul 2021 06:12:21 +0000
Date:   Tue, 20 Jul 2021 11:23:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 1b87d5bba32c1f25a12ba0625546e5375e3f998d
Message-ID: <60f641b5.aULUACzuzaV5Mxps%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 1b87d5bba32c1f25a12ba0625546e5375e3f998d  clk: renesas: r9a07g044: Add clock and reset entries for ADC

elapsed time: 1020m

configs tested: 204
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nios2                            alldefconfig
powerpc                 mpc8540_ads_defconfig
m68k                         amcore_defconfig
powerpc                     sequoia_defconfig
powerpc                      ppc40x_defconfig
mips                        nlm_xlr_defconfig
arm                  colibri_pxa300_defconfig
arm                       netwinder_defconfig
powerpc                    gamecube_defconfig
m68k                           sun3_defconfig
sh                            hp6xx_defconfig
arm                       aspeed_g4_defconfig
arc                           tb10x_defconfig
xtensa                           alldefconfig
powerpc                  iss476-smp_defconfig
arc                          axs103_defconfig
sh                           se7206_defconfig
mips                        jmr3927_defconfig
powerpc                        warp_defconfig
arm                        cerfcube_defconfig
microblaze                          defconfig
powerpc                     rainier_defconfig
x86_64                              defconfig
mips                   sb1250_swarm_defconfig
arm                        shmobile_defconfig
sh                        dreamcast_defconfig
arm                        neponset_defconfig
sh                     sh7710voipgw_defconfig
openrisc                 simple_smp_defconfig
arm                            mps2_defconfig
mips                  maltasmvp_eva_defconfig
sparc64                             defconfig
arm                         mv78xx0_defconfig
arm                         lpc32xx_defconfig
arm                          imote2_defconfig
powerpc                     ep8248e_defconfig
mips                             allmodconfig
sh                           se7343_defconfig
powerpc                     stx_gp3_defconfig
mips                           ci20_defconfig
nds32                            alldefconfig
arm                        clps711x_defconfig
arm                         bcm2835_defconfig
arm                             rpc_defconfig
mips                  decstation_64_defconfig
openrisc                    or1ksim_defconfig
mips                          malta_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                       rbtx49xx_defconfig
powerpc                     mpc83xx_defconfig
mips                     loongson1c_defconfig
powerpc                      bamboo_defconfig
powerpc                      katmai_defconfig
sh                           se7780_defconfig
arm                        mvebu_v5_defconfig
arm                         lubbock_defconfig
arm                   milbeaut_m10v_defconfig
um                               alldefconfig
arm                       imx_v4_v5_defconfig
sh                          polaris_defconfig
m68k                        m5307c3_defconfig
parisc                              defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                   microwatt_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                         axm55xx_defconfig
powerpc                        fsp2_defconfig
powerpc                     pseries_defconfig
powerpc                     tqm8560_defconfig
arm                         at91_dt_defconfig
mips                        bcm63xx_defconfig
powerpc                      ppc44x_defconfig
m68k                             allyesconfig
powerpc                 xes_mpc85xx_defconfig
sh                               j2_defconfig
powerpc                 mpc832x_mds_defconfig
arm                            mmp2_defconfig
sh                           se7722_defconfig
sh                               alldefconfig
sh                          sdk7786_defconfig
arm                      footbridge_defconfig
openrisc                         alldefconfig
arm                          gemini_defconfig
xtensa                    xip_kc705_defconfig
sh                          r7780mp_defconfig
riscv                    nommu_virt_defconfig
arm                           spitz_defconfig
powerpc                     ppa8548_defconfig
sh                     magicpanelr2_defconfig
powerpc                           allnoconfig
powerpc                   motionpro_defconfig
m68k                          atari_defconfig
sh                ecovec24-romimage_defconfig
sh                               allmodconfig
arm                            qcom_defconfig
m68k                       m5275evb_defconfig
arm                          collie_defconfig
arm                    vt8500_v6_v7_defconfig
nds32                             allnoconfig
arm                        trizeps4_defconfig
h8300                            allyesconfig
h8300                     edosk2674_defconfig
powerpc                     tqm8548_defconfig
sh                   rts7751r2dplus_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a005-20210718
x86_64               randconfig-a004-20210718
x86_64               randconfig-a002-20210718
x86_64               randconfig-a003-20210718
x86_64               randconfig-a006-20210718
x86_64               randconfig-a001-20210718
i386                 randconfig-a005-20210720
i386                 randconfig-a003-20210720
i386                 randconfig-a004-20210720
i386                 randconfig-a002-20210720
i386                 randconfig-a001-20210720
i386                 randconfig-a006-20210720
i386                 randconfig-a005-20210719
i386                 randconfig-a004-20210719
i386                 randconfig-a006-20210719
i386                 randconfig-a001-20210719
i386                 randconfig-a003-20210719
i386                 randconfig-a002-20210719
x86_64               randconfig-a015-20210719
x86_64               randconfig-a014-20210719
x86_64               randconfig-a016-20210719
x86_64               randconfig-a013-20210719
x86_64               randconfig-a012-20210719
x86_64               randconfig-a011-20210719
i386                 randconfig-a014-20210719
i386                 randconfig-a015-20210719
i386                 randconfig-a011-20210719
i386                 randconfig-a013-20210719
i386                 randconfig-a016-20210719
i386                 randconfig-a012-20210719
i386                 randconfig-a016-20210720
i386                 randconfig-a013-20210720
i386                 randconfig-a012-20210720
i386                 randconfig-a014-20210720
i386                 randconfig-a011-20210720
i386                 randconfig-a015-20210720
x86_64               randconfig-a003-20210720
x86_64               randconfig-a006-20210720
x86_64               randconfig-a001-20210720
x86_64               randconfig-a005-20210720
x86_64               randconfig-a004-20210720
x86_64               randconfig-a002-20210720
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210720
x86_64               randconfig-b001-20210719
x86_64               randconfig-a005-20210719
x86_64               randconfig-a004-20210719
x86_64               randconfig-a002-20210719
x86_64               randconfig-a003-20210719
x86_64               randconfig-a006-20210719
x86_64               randconfig-a001-20210719
x86_64               randconfig-a011-20210720
x86_64               randconfig-a016-20210720
x86_64               randconfig-a013-20210720
x86_64               randconfig-a014-20210720
x86_64               randconfig-a012-20210720
x86_64               randconfig-a015-20210720

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
