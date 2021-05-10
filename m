Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44B153798F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 May 2021 23:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbhEJVOr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 17:14:47 -0400
Received: from mga14.intel.com ([192.55.52.115]:45377 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229810AbhEJVOq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 17:14:46 -0400
IronPort-SDR: XAEXHGRVYMHsY++IfFozakx7KDhxW8I6YpFgupaaDKhz5CQLXLlO2mcFSX2Hqm3DEFwO4jJyqI
 E7dSUoMM7q+g==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="198967085"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="198967085"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 14:13:40 -0700
IronPort-SDR: 8KrICFJnOBUVUn/vEtq3y+uR1wMD4z2uYnbX77i65f7+6AH4Gbw64hm2yPwCWA5wtJNlKXJtwX
 0s/Am9ZC8+AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="433984695"
Received: from lkp-server01.sh.intel.com (HELO f375d57c4ed4) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 May 2021 14:13:39 -0700
Received: from kbuild by f375d57c4ed4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lgDDe-0000NA-Qb; Mon, 10 May 2021 21:13:38 +0000
Date:   Tue, 11 May 2021 05:12:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.14] BUILD SUCCESS
 7e5928d3ce2b7937aa2fc6d83a0557ecb8911b78
Message-ID: <6099a1d4.QWYvrnXS3WPponOi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.14
branch HEAD: 7e5928d3ce2b7937aa2fc6d83a0557ecb8911b78  arm64: dts: renesas: v3msk: Fix memory size

elapsed time: 731m

configs tested: 189
configs skipped: 76

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm                           spitz_defconfig
h8300                            alldefconfig
sh                          lboxre2_defconfig
nds32                               defconfig
m68k                                defconfig
sh                          urquell_defconfig
arm                         at91_dt_defconfig
arc                         haps_hs_defconfig
mips                       capcella_defconfig
powerpc                 mpc8272_ads_defconfig
mips                malta_qemu_32r6_defconfig
sh                     sh7710voipgw_defconfig
arm                          simpad_defconfig
powerpc                 mpc836x_mds_defconfig
arm                         shannon_defconfig
mips                         tb0219_defconfig
s390                             alldefconfig
arm                            dove_defconfig
sh                        sh7785lcr_defconfig
openrisc                  or1klitex_defconfig
ia64                          tiger_defconfig
sh                           se7619_defconfig
arm                         nhk8815_defconfig
arm                       aspeed_g4_defconfig
mips                        workpad_defconfig
arm                       aspeed_g5_defconfig
arm                           u8500_defconfig
arm                          iop32x_defconfig
mips                          ath25_defconfig
mips                  cavium_octeon_defconfig
arm                          gemini_defconfig
m68k                        m5307c3_defconfig
arm                           h3600_defconfig
arm                       spear13xx_defconfig
arm                          pxa910_defconfig
sh                           se7343_defconfig
openrisc                    or1ksim_defconfig
xtensa                  nommu_kc705_defconfig
riscv                    nommu_k210_defconfig
mips                     cu1830-neo_defconfig
ia64                        generic_defconfig
sh                   sh7770_generic_defconfig
mips                       lemote2f_defconfig
sh                               alldefconfig
arm                            lart_defconfig
openrisc                            defconfig
arm                            pleb_defconfig
powerpc                     tqm8555_defconfig
powerpc                 mpc837x_mds_defconfig
nios2                            alldefconfig
powerpc64                           defconfig
mips                        omega2p_defconfig
arm                         lpc32xx_defconfig
sparc                       sparc32_defconfig
arm                          pxa3xx_defconfig
sh                           se7751_defconfig
mips                            ar7_defconfig
mips                          rm200_defconfig
arm                             ezx_defconfig
powerpc                 mpc834x_mds_defconfig
mips                        bcm63xx_defconfig
mips                      maltaaprp_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                    gamecube_defconfig
arm                        trizeps4_defconfig
mips                         rt305x_defconfig
arm                     eseries_pxa_defconfig
powerpc                    amigaone_defconfig
mips                      pic32mzda_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                     decstation_defconfig
arm                         mv78xx0_defconfig
ia64                             alldefconfig
arc                          axs101_defconfig
sh                      rts7751r2d1_defconfig
sh                   secureedge5410_defconfig
ia64                             allyesconfig
powerpc                      chrp32_defconfig
powerpc                    klondike_defconfig
sh                              ul2_defconfig
powerpc                      pmac32_defconfig
arm                         cm_x300_defconfig
arm                       imx_v6_v7_defconfig
mips                         tb0287_defconfig
sh                          sdk7786_defconfig
arm                        mvebu_v5_defconfig
mips                        qi_lb60_defconfig
sh                          rsk7269_defconfig
powerpc                     skiroot_defconfig
mips                         cobalt_defconfig
arc                          axs103_defconfig
sh                           se7724_defconfig
mips                        maltaup_defconfig
powerpc                        icon_defconfig
arm                        multi_v7_defconfig
sh                               j2_defconfig
powerpc                   currituck_defconfig
mips                            gpr_defconfig
arm                          ixp4xx_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                 linkstation_defconfig
mips                      bmips_stb_defconfig
arm                            mmp2_defconfig
m68k                         amcore_defconfig
powerpc                 canyonlands_defconfig
mips                 decstation_r4k_defconfig
sh                          rsk7201_defconfig
powerpc                   motionpro_defconfig
x86_64                              defconfig
h8300                    h8300h-sim_defconfig
riscv                            alldefconfig
powerpc                     rainier_defconfig
xtensa                       common_defconfig
m68k                        stmark2_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210510
x86_64               randconfig-a004-20210510
x86_64               randconfig-a001-20210510
x86_64               randconfig-a005-20210510
x86_64               randconfig-a002-20210510
x86_64               randconfig-a006-20210510
i386                 randconfig-a003-20210510
i386                 randconfig-a001-20210510
i386                 randconfig-a005-20210510
i386                 randconfig-a004-20210510
i386                 randconfig-a002-20210510
i386                 randconfig-a006-20210510
i386                 randconfig-a016-20210510
i386                 randconfig-a014-20210510
i386                 randconfig-a011-20210510
i386                 randconfig-a015-20210510
i386                 randconfig-a012-20210510
i386                 randconfig-a013-20210510
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210510
x86_64               randconfig-a012-20210510
x86_64               randconfig-a011-20210510
x86_64               randconfig-a013-20210510
x86_64               randconfig-a016-20210510
x86_64               randconfig-a014-20210510

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
