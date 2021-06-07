Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B4939E969
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 00:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbhFGWRY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 18:17:24 -0400
Received: from mga18.intel.com ([134.134.136.126]:6320 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231184AbhFGWRX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 18:17:23 -0400
IronPort-SDR: 3rApL6YiNHjRwqlc4hb7kup1cdMwq5gcFHmN5U+FPU9fM08tG3qfb1pOHui2QXfWmn/xQHPC4d
 U4EsN/HD1Scw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="192052069"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; 
   d="scan'208";a="192052069"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 15:15:31 -0700
IronPort-SDR: QoBJKYG3l5zTaGvcSguXNjQba410SA+2Y9P+GN0O1lByp5lX+5/P5ibtYPb/OQ8t93ATUXF0+O
 5lZ6WmKkSjqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; 
   d="scan'208";a="481700133"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 07 Jun 2021 15:15:30 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lqNWr-0008Xa-Hp; Mon, 07 Jun 2021 22:15:29 +0000
Date:   Tue, 08 Jun 2021 06:15:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 e1833059a1c5dac43b9e7352890ec727247341e0
Message-ID: <60be9a7e.L13CgtSbiPpM7zar%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: e1833059a1c5dac43b9e7352890ec727247341e0  Merge branch 'renesas-arm-dt-for-v5.14' into renesas-next

elapsed time: 730m

configs tested: 225
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7705_defconfig
um                             i386_defconfig
arc                            hsdk_defconfig
arm                          lpd270_defconfig
mips                  cavium_octeon_defconfig
arm                         lpc18xx_defconfig
mips                     decstation_defconfig
arm                          iop32x_defconfig
powerpc                   currituck_defconfig
powerpc                 canyonlands_defconfig
m68k                        m5407c3_defconfig
powerpc                     rainier_defconfig
arm                             rpc_defconfig
arm                            xcep_defconfig
sh                           sh2007_defconfig
h8300                            alldefconfig
powerpc                     akebono_defconfig
openrisc                  or1klitex_defconfig
powerpc                       ppc64_defconfig
arm                        multi_v7_defconfig
powerpc                    sam440ep_defconfig
m68k                         amcore_defconfig
arm                           viper_defconfig
sh                     sh7710voipgw_defconfig
s390                          debug_defconfig
mips                             allyesconfig
mips                            e55_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                         tb0219_defconfig
sh                ecovec24-romimage_defconfig
arm                            mmp2_defconfig
arm                           tegra_defconfig
xtensa                           alldefconfig
powerpc                      makalu_defconfig
mips                     loongson2k_defconfig
mips                          rm200_defconfig
powerpc                 mpc8560_ads_defconfig
arm                           omap1_defconfig
sh                             sh03_defconfig
sh                          sdk7780_defconfig
sparc64                          alldefconfig
h8300                    h8300h-sim_defconfig
powerpc                     ksi8560_defconfig
s390                                defconfig
arm                           stm32_defconfig
ia64                         bigsur_defconfig
mips                            gpr_defconfig
xtensa                              defconfig
sh                        sh7785lcr_defconfig
openrisc                         alldefconfig
powerpc                    mvme5100_defconfig
mips                  decstation_64_defconfig
mips                          ath79_defconfig
powerpc                      ppc44x_defconfig
m68k                            q40_defconfig
powerpc                 mpc8272_ads_defconfig
arm                             ezx_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                           se7343_defconfig
arc                     nsimosci_hs_defconfig
powerpc                     powernv_defconfig
mips                           rs90_defconfig
arm                         mv78xx0_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          simpad_defconfig
arm                        mvebu_v7_defconfig
mips                       rbtx49xx_defconfig
microblaze                      mmu_defconfig
sh                   sh7724_generic_defconfig
powerpc64                           defconfig
mips                       capcella_defconfig
mips                           ip32_defconfig
powerpc                     skiroot_defconfig
arm                     davinci_all_defconfig
mips                      malta_kvm_defconfig
arm                          ep93xx_defconfig
alpha                            allyesconfig
powerpc                mpc7448_hpc2_defconfig
sh                        sh7757lcr_defconfig
powerpc                  mpc866_ads_defconfig
sh                 kfr2r09-romimage_defconfig
x86_64                           allyesconfig
arm                            lart_defconfig
riscv                          rv32_defconfig
powerpc                   motionpro_defconfig
arm                      jornada720_defconfig
arm                        realview_defconfig
m68k                            mac_defconfig
x86_64                            allnoconfig
powerpc                     tqm8548_defconfig
powerpc                     tqm8540_defconfig
arm                           sunxi_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                    adder875_defconfig
x86_64                           alldefconfig
arm                            hisi_defconfig
powerpc64                        alldefconfig
xtensa                           allyesconfig
mips                       bmips_be_defconfig
arc                          axs103_defconfig
powerpc                      pasemi_defconfig
sh                          r7780mp_defconfig
mips                           ci20_defconfig
riscv                    nommu_k210_defconfig
sh                          rsk7264_defconfig
arm                             mxs_defconfig
powerpc                      ppc6xx_defconfig
h8300                     edosk2674_defconfig
mips                      pic32mzda_defconfig
nds32                             allnoconfig
mips                           jazz_defconfig
arm                        mvebu_v5_defconfig
arc                        nsimosci_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                         ps3_defconfig
powerpc                     mpc5200_defconfig
m68k                       m5208evb_defconfig
sparc                       sparc64_defconfig
sh                          lboxre2_defconfig
sh                               alldefconfig
mips                           mtx1_defconfig
powerpc                          g5_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                           ip28_defconfig
powerpc                      ep88xc_defconfig
mips                        maltaup_defconfig
arm                        vexpress_defconfig
sh                           se7619_defconfig
mips                        jmr3927_defconfig
arm                         assabet_defconfig
sh                              ul2_defconfig
mips                          rb532_defconfig
mips                         tb0226_defconfig
powerpc                     ppa8548_defconfig
arc                      axs103_smp_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                   lite5200b_defconfig
mips                       lemote2f_defconfig
s390                       zfcpdump_defconfig
arm                      footbridge_defconfig
sh                            hp6xx_defconfig
arc                        vdk_hs38_defconfig
nios2                         10m50_defconfig
parisc                              defconfig
sh                         microdev_defconfig
sh                     magicpanelr2_defconfig
powerpc                 linkstation_defconfig
ia64                        generic_defconfig
powerpc                     taishan_defconfig
arm                         palmz72_defconfig
arm                         lpc32xx_defconfig
powerpc                          allmodconfig
powerpc                 xes_mpc85xx_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                        fsp2_defconfig
arc                           tb10x_defconfig
x86_64                              defconfig
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
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210607
i386                 randconfig-a006-20210607
i386                 randconfig-a004-20210607
i386                 randconfig-a001-20210607
i386                 randconfig-a002-20210607
i386                 randconfig-a005-20210607
x86_64               randconfig-a015-20210607
x86_64               randconfig-a011-20210607
x86_64               randconfig-a014-20210607
x86_64               randconfig-a012-20210607
x86_64               randconfig-a016-20210607
x86_64               randconfig-a013-20210607
i386                 randconfig-a015-20210607
i386                 randconfig-a013-20210607
i386                 randconfig-a011-20210607
i386                 randconfig-a016-20210607
i386                 randconfig-a014-20210607
i386                 randconfig-a012-20210607
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                            kunit_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210607
x86_64               randconfig-a002-20210607
x86_64               randconfig-a004-20210607
x86_64               randconfig-a003-20210607
x86_64               randconfig-a006-20210607
x86_64               randconfig-a005-20210607
x86_64               randconfig-a001-20210607

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
