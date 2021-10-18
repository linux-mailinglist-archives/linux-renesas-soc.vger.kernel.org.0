Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3920F4329AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Oct 2021 00:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhJRWT6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Oct 2021 18:19:58 -0400
Received: from mga03.intel.com ([134.134.136.65]:35808 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229790AbhJRWT5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Oct 2021 18:19:57 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="228325916"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="228325916"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 15:17:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="482964253"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Oct 2021 15:17:44 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mcawx-000Bnm-QO; Mon, 18 Oct 2021 22:17:43 +0000
Date:   Tue, 19 Oct 2021 06:17:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 525a6b4bd53f32db8b94e94f802cfa91466d92f9
Message-ID: <616df283.y/nsnU/yGv3e1GFg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 525a6b4bd53f32db8b94e94f802cfa91466d92f9  Merge branch 'renesas-arm-dt-for-v5.16' into renesas-next

elapsed time: 724m

configs tested: 249
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allmodconfig
i386                 randconfig-c001-20211019
mips                         tb0287_defconfig
s390                          debug_defconfig
mips                      bmips_stb_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                    adder875_defconfig
powerpc                      walnut_defconfig
arc                        nsim_700_defconfig
sparc                       sparc64_defconfig
powerpc                     tqm8548_defconfig
mips                           ip28_defconfig
i386                             alldefconfig
mips                         mpc30x_defconfig
arm                             ezx_defconfig
powerpc                     pseries_defconfig
xtensa                       common_defconfig
mips                            gpr_defconfig
arm                       imx_v4_v5_defconfig
sh                          rsk7264_defconfig
arm                            mmp2_defconfig
m68k                         amcore_defconfig
sparc64                          alldefconfig
xtensa                  nommu_kc705_defconfig
xtensa                         virt_defconfig
powerpc                      obs600_defconfig
mips                        qi_lb60_defconfig
mips                    maltaup_xpa_defconfig
mips                      maltasmvp_defconfig
powerpc                     powernv_defconfig
openrisc                            defconfig
sh                   secureedge5410_defconfig
powerpc                       ppc64_defconfig
arm                         palmz72_defconfig
arm                         nhk8815_defconfig
arm                       omap2plus_defconfig
powerpc                      pasemi_defconfig
mips                         db1xxx_defconfig
powerpc                 mpc8560_ads_defconfig
sh                          urquell_defconfig
sh                          sdk7780_defconfig
x86_64                              defconfig
openrisc                    or1ksim_defconfig
arm                        spear3xx_defconfig
arm                            qcom_defconfig
mips                       capcella_defconfig
arm                         assabet_defconfig
powerpc                     kilauea_defconfig
m68k                          atari_defconfig
arm                         vf610m4_defconfig
m68k                        mvme147_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            dove_defconfig
sh                     magicpanelr2_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                         orion5x_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                          imote2_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                         hackkit_defconfig
mips                     cu1000-neo_defconfig
m68k                           sun3_defconfig
mips                            e55_defconfig
powerpc                      makalu_defconfig
powerpc                         ps3_defconfig
arm                    vt8500_v6_v7_defconfig
sh                         apsh4a3a_defconfig
nios2                         3c120_defconfig
mips                malta_qemu_32r6_defconfig
arc                    vdk_hs38_smp_defconfig
arm                            hisi_defconfig
arc                           tb10x_defconfig
s390                       zfcpdump_defconfig
arc                        vdk_hs38_defconfig
m68k                            q40_defconfig
powerpc                 linkstation_defconfig
arm                        keystone_defconfig
powerpc                      pcm030_defconfig
powerpc                   microwatt_defconfig
sh                            shmin_defconfig
sh                         ap325rxa_defconfig
sh                          r7780mp_defconfig
m68k                          sun3x_defconfig
powerpc                          g5_defconfig
powerpc                        fsp2_defconfig
mips                         tb0226_defconfig
sh                        dreamcast_defconfig
powerpc                      mgcoge_defconfig
arm                           u8500_defconfig
powerpc64                        alldefconfig
mips                     loongson2k_defconfig
mips                      malta_kvm_defconfig
arm                           stm32_defconfig
mips                           rs90_defconfig
h8300                            alldefconfig
powerpc                     mpc5200_defconfig
arm                         cm_x300_defconfig
powerpc                   currituck_defconfig
powerpc                        icon_defconfig
powerpc                      acadia_defconfig
ia64                            zx1_defconfig
sh                         microdev_defconfig
powerpc                     taishan_defconfig
powerpc                     mpc512x_defconfig
powerpc                 mpc834x_mds_defconfig
sh                        sh7757lcr_defconfig
powerpc                      ep88xc_defconfig
arm                           corgi_defconfig
arm                        realview_defconfig
powerpc                  storcenter_defconfig
m68k                       bvme6000_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                      tqm8xx_defconfig
arm                       mainstone_defconfig
sh                          r7785rp_defconfig
powerpc                     kmeter1_defconfig
arm                        clps711x_defconfig
arm                          gemini_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                            titan_defconfig
arm                  randconfig-c002-20211018
i386                 randconfig-c001-20211018
x86_64               randconfig-c001-20211018
arm                  randconfig-c002-20211017
i386                 randconfig-c001-20211017
x86_64               randconfig-c001-20211017
arm                  randconfig-c002-20211019
x86_64               randconfig-c001-20211019
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
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20211018
x86_64               randconfig-a006-20211018
x86_64               randconfig-a005-20211018
x86_64               randconfig-a001-20211018
x86_64               randconfig-a002-20211018
x86_64               randconfig-a003-20211018
i386                 randconfig-a001-20211018
i386                 randconfig-a003-20211018
i386                 randconfig-a004-20211018
i386                 randconfig-a005-20211018
i386                 randconfig-a002-20211018
i386                 randconfig-a006-20211018
x86_64               randconfig-a015-20211019
x86_64               randconfig-a012-20211019
x86_64               randconfig-a016-20211019
x86_64               randconfig-a014-20211019
x86_64               randconfig-a013-20211019
x86_64               randconfig-a011-20211019
i386                 randconfig-a016-20211017
i386                 randconfig-a014-20211017
i386                 randconfig-a011-20211017
i386                 randconfig-a015-20211017
i386                 randconfig-a012-20211017
i386                 randconfig-a013-20211017
i386                 randconfig-a014-20211019
i386                 randconfig-a016-20211019
i386                 randconfig-a011-20211019
i386                 randconfig-a015-20211019
i386                 randconfig-a012-20211019
i386                 randconfig-a013-20211019
arc                  randconfig-r043-20211018
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
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
arm                  randconfig-c002-20211019
mips                 randconfig-c004-20211019
i386                 randconfig-c001-20211019
s390                 randconfig-c005-20211019
x86_64               randconfig-c007-20211019
riscv                randconfig-c006-20211019
powerpc              randconfig-c003-20211019
x86_64               randconfig-a004-20211019
x86_64               randconfig-a006-20211019
x86_64               randconfig-a005-20211019
x86_64               randconfig-a001-20211019
x86_64               randconfig-a002-20211019
x86_64               randconfig-a003-20211019
i386                 randconfig-a001-20211019
i386                 randconfig-a003-20211019
i386                 randconfig-a004-20211019
i386                 randconfig-a005-20211019
i386                 randconfig-a002-20211019
i386                 randconfig-a006-20211019
i386                 randconfig-a003-20211017
i386                 randconfig-a001-20211017
i386                 randconfig-a005-20211017
i386                 randconfig-a004-20211017
i386                 randconfig-a002-20211017
i386                 randconfig-a006-20211017
x86_64               randconfig-a015-20211018
x86_64               randconfig-a012-20211018
x86_64               randconfig-a016-20211018
x86_64               randconfig-a014-20211018
x86_64               randconfig-a013-20211018
x86_64               randconfig-a011-20211018
i386                 randconfig-a014-20211018
i386                 randconfig-a016-20211018
i386                 randconfig-a011-20211018
i386                 randconfig-a015-20211018
i386                 randconfig-a012-20211018
i386                 randconfig-a013-20211018
hexagon              randconfig-r041-20211018
s390                 randconfig-r044-20211018
riscv                randconfig-r042-20211018
hexagon              randconfig-r045-20211018
hexagon              randconfig-r041-20211019
hexagon              randconfig-r045-20211019

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
