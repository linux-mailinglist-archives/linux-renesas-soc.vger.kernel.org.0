Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3984808B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Dec 2021 12:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236425AbhL1LIC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Dec 2021 06:08:02 -0500
Received: from mga18.intel.com ([134.134.136.126]:7461 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231721AbhL1LIC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Dec 2021 06:08:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640689682; x=1672225682;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ezzCI9otW+mF3uBb8zP9rycI7dxJ6HeG6C/gSgCo4qs=;
  b=MjMwxY9dD3OaDZuBJo6YosSLomBr1TjzpcCRYSd5JDf1haGtpfjNTGwz
   /K/YVvk+d8TxoR9u3gKdInB6oHrR+o1FXckUsL6DPUC+VMLLgppFO40Oq
   OOPmlE8/AqbM/xQpgzfGZqRv9C76jRknW0e+VuuVN3w+qSEvsXvrUZN9H
   +HO09R8ZNkfeF+AYDX7c3CbJ2fIXQ4MCttcql3gyQT9iE2O42gg0SMDGb
   0rKUjhPzK2zERKb1c3z1l2JXQz/lIzbpmDzUFsjyS533si9BkihVXbQdO
   BYz4JxRJAsQg1qVs2MyIsYfSfLqk05gjmM+VZg6lbseWCTLCIsjgYl/xJ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="228182168"
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; 
   d="scan'208";a="228182168"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2021 03:08:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; 
   d="scan'208";a="510147946"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Dec 2021 03:08:00 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n2AKl-0007VY-S2; Tue, 28 Dec 2021 11:07:59 +0000
Date:   Tue, 28 Dec 2021 19:07:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 70c9b40ad59ce28a6c668a48cc12f21ebf81aeba
Message-ID: <61caeff4.4m1p+Qqmi9DGkPrN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 70c9b40ad59ce28a6c668a48cc12f21ebf81aeba  Merge branch 'topic/renesas-defconfig', tag 'v5.16-rc7' into renesas-devel

elapsed time: 1401m

configs tested: 258
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211228
mips                  cavium_octeon_defconfig
h8300                     edosk2674_defconfig
powerpc                        fsp2_defconfig
riscv                    nommu_virt_defconfig
powerpc                 mpc834x_mds_defconfig
arc                        nsimosci_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      obs600_defconfig
mips                        jmr3927_defconfig
powerpc                   microwatt_defconfig
sh                            shmin_defconfig
powerpc                      chrp32_defconfig
arm64                            alldefconfig
powerpc                        warp_defconfig
powerpc                   currituck_defconfig
arm                         shannon_defconfig
arm                          moxart_defconfig
arc                         haps_hs_defconfig
arm                       netwinder_defconfig
sh                           se7751_defconfig
ia64                          tiger_defconfig
arm                             rpc_defconfig
arm                   milbeaut_m10v_defconfig
sh                        apsh4ad0a_defconfig
powerpc                         ps3_defconfig
nios2                         10m50_defconfig
arm                         lpc32xx_defconfig
riscv                            alldefconfig
h8300                            allyesconfig
powerpc                     ep8248e_defconfig
sparc64                             defconfig
powerpc                       holly_defconfig
powerpc                     skiroot_defconfig
sh                          rsk7203_defconfig
arm                       mainstone_defconfig
arm                           stm32_defconfig
powerpc                     taishan_defconfig
ia64                         bigsur_defconfig
arm                        neponset_defconfig
arm                          imote2_defconfig
ia64                             allmodconfig
sh                         ap325rxa_defconfig
powerpc                    amigaone_defconfig
sparc                               defconfig
arm                           spitz_defconfig
arm                         cm_x300_defconfig
openrisc                  or1klitex_defconfig
arm                         at91_dt_defconfig
powerpc                      cm5200_defconfig
arm                          pcm027_defconfig
mips                       rbtx49xx_defconfig
m68k                           sun3_defconfig
arm                             mxs_defconfig
sparc                            alldefconfig
mips                        bcm47xx_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         palmz72_defconfig
powerpc                    gamecube_defconfig
xtensa                          iss_defconfig
mips                      loongson3_defconfig
powerpc                  iss476-smp_defconfig
nds32                            alldefconfig
sh                 kfr2r09-romimage_defconfig
mips                           ip27_defconfig
arm                           viper_defconfig
arm                           sunxi_defconfig
mips                           ip22_defconfig
xtensa                generic_kc705_defconfig
powerpc                   lite5200b_defconfig
powerpc                 canyonlands_defconfig
arm                        spear3xx_defconfig
arm                            zeus_defconfig
powerpc                     tqm8541_defconfig
arm                           h3600_defconfig
mips                           jazz_defconfig
openrisc                            defconfig
xtensa                           alldefconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     redwood_defconfig
m68k                        m5307c3_defconfig
nds32                             allnoconfig
powerpc                  mpc866_ads_defconfig
s390                             alldefconfig
sh                              ul2_defconfig
ia64                      gensparse_defconfig
sh                            migor_defconfig
xtensa                    xip_kc705_defconfig
m68k                       m5475evb_defconfig
arm                      pxa255-idp_defconfig
arc                          axs103_defconfig
arm                            pleb_defconfig
mips                       capcella_defconfig
m68k                          hp300_defconfig
nios2                            alldefconfig
arm                           u8500_defconfig
sh                                  defconfig
mips                         tb0219_defconfig
powerpc                      walnut_defconfig
powerpc                      arches_defconfig
h8300                               defconfig
powerpc                           allnoconfig
sh                           se7724_defconfig
xtensa                       common_defconfig
ia64                            zx1_defconfig
mips                 decstation_r4k_defconfig
xtensa                  cadence_csp_defconfig
ia64                                defconfig
arm                        magician_defconfig
arm                         s3c2410_defconfig
sh                           se7619_defconfig
powerpc                     ksi8560_defconfig
um                                  defconfig
m68k                       m5208evb_defconfig
sh                   secureedge5410_defconfig
arc                        nsim_700_defconfig
arm                            xcep_defconfig
arm                          pxa168_defconfig
sh                          rsk7269_defconfig
sh                         ecovec24_defconfig
arm                       omap2plus_defconfig
arm                           corgi_defconfig
sh                          rsk7264_defconfig
powerpc                         wii_defconfig
arc                              allyesconfig
powerpc                       ppc64_defconfig
xtensa                  audio_kc705_defconfig
sh                     sh7710voipgw_defconfig
sh                          sdk7780_defconfig
powerpc                      bamboo_defconfig
sh                           sh2007_defconfig
i386                             alldefconfig
powerpc                 linkstation_defconfig
powerpc64                           defconfig
powerpc                        icon_defconfig
arm                         nhk8815_defconfig
powerpc                    ge_imp3a_defconfig
parisc                              defconfig
powerpc                     asp8347_defconfig
arm                        mini2440_defconfig
arm                       multi_v4t_defconfig
mips                            ar7_defconfig
sh                           se7780_defconfig
sh                          landisk_defconfig
arc                            hsdk_defconfig
powerpc                 mpc8272_ads_defconfig
sh                         microdev_defconfig
powerpc                  storcenter_defconfig
arm                      integrator_defconfig
riscv                    nommu_k210_defconfig
sh                               alldefconfig
arm                         vf610m4_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                         mpc30x_defconfig
arm                           h5000_defconfig
sh                        sh7785lcr_defconfig
arm                  randconfig-c002-20211228
arm                  randconfig-c002-20211227
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a005-20211228
x86_64               randconfig-a001-20211228
x86_64               randconfig-a003-20211228
x86_64               randconfig-a006-20211228
x86_64               randconfig-a004-20211228
x86_64               randconfig-a002-20211228
i386                 randconfig-a006-20211228
i386                 randconfig-a004-20211228
i386                 randconfig-a002-20211228
i386                 randconfig-a003-20211228
i386                 randconfig-a001-20211228
i386                 randconfig-a005-20211228
x86_64               randconfig-a013-20211227
x86_64               randconfig-a014-20211227
x86_64               randconfig-a015-20211227
x86_64               randconfig-a011-20211227
x86_64               randconfig-a012-20211227
x86_64               randconfig-a016-20211227
i386                 randconfig-a012-20211227
i386                 randconfig-a011-20211227
i386                 randconfig-a014-20211227
i386                 randconfig-a016-20211227
i386                 randconfig-a015-20211227
i386                 randconfig-a013-20211227
arc                  randconfig-r043-20211227
s390                 randconfig-r044-20211227
riscv                randconfig-r042-20211227
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20211227
x86_64               randconfig-a001-20211227
x86_64               randconfig-a005-20211227
x86_64               randconfig-a006-20211227
x86_64               randconfig-a004-20211227
x86_64               randconfig-a002-20211227
i386                 randconfig-a002-20211227
i386                 randconfig-a001-20211227
i386                 randconfig-a003-20211227
i386                 randconfig-a005-20211227
i386                 randconfig-a006-20211227
i386                 randconfig-a004-20211227
x86_64               randconfig-a015-20211228
x86_64               randconfig-a014-20211228
x86_64               randconfig-a013-20211228
x86_64               randconfig-a012-20211228
x86_64               randconfig-a011-20211228
x86_64               randconfig-a016-20211228
i386                 randconfig-a012-20211228
i386                 randconfig-a011-20211228
i386                 randconfig-a014-20211228
i386                 randconfig-a016-20211228
i386                 randconfig-a013-20211228
i386                 randconfig-a015-20211228
hexagon              randconfig-r041-20211228
riscv                randconfig-r042-20211228
hexagon              randconfig-r045-20211228
s390                 randconfig-r044-20211228

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
