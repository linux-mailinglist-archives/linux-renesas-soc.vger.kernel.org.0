Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAC928C21A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Oct 2020 22:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgJLUNU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Oct 2020 16:13:20 -0400
Received: from mga07.intel.com ([134.134.136.100]:53950 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727298AbgJLUNT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Oct 2020 16:13:19 -0400
IronPort-SDR: +LLzZJyCpK9L85zHv3N80LYp1rxJRqFDHAfzCkHGeqAcY/d/9ieBUic0gKawrUTR0fjKIX35pW
 5ApONZ5F7Hmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="229978386"
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="229978386"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 13:13:17 -0700
IronPort-SDR: Dj54qygZNH8lX/bBZiUrB3XHVgyH5GEvo6Q5TKyOau+PMI2GGo7JjOE+555E5jKola/ICIqxdb
 IF/nphtaH79g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="318046944"
Received: from lkp-server01.sh.intel.com (HELO aa1d92d39b27) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Oct 2020 13:13:16 -0700
Received: from kbuild by aa1d92d39b27 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kS4C3-00008O-Tt; Mon, 12 Oct 2020 20:13:15 +0000
Date:   Tue, 13 Oct 2020 04:12:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.11] BUILD SUCCESS
 2e8cc12c636df269e22227014e4f9784403cb103
Message-ID: <5f84b8b1.n/uuslv2ribvXWuJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.11
branch HEAD: 2e8cc12c636df269e22227014e4f9784403cb103  arm64: dts: renesas: r8a77961: Add MSIOF nodes

elapsed time: 723m

configs tested: 170
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                       h8s-sim_defconfig
arm                     davinci_all_defconfig
m68k                       m5475evb_defconfig
powerpc                       holly_defconfig
arm                          ep93xx_defconfig
arm                        magician_defconfig
arm                       cns3420vb_defconfig
mips                        maltaup_defconfig
powerpc                       ppc64_defconfig
powerpc                        cell_defconfig
sh                         ecovec24_defconfig
arc                          axs101_defconfig
arm                      tct_hammer_defconfig
m68k                        mvme16x_defconfig
mips                          rm200_defconfig
mips                           jazz_defconfig
sh                   sh7770_generic_defconfig
powerpc                    sam440ep_defconfig
sh                          rsk7264_defconfig
powerpc                       ebony_defconfig
arm                            mmp2_defconfig
arm                           spitz_defconfig
powerpc                  iss476-smp_defconfig
powerpc                    ge_imp3a_defconfig
sh                          r7780mp_defconfig
c6x                         dsk6455_defconfig
xtensa                          iss_defconfig
arm                           sunxi_defconfig
arm                       mainstone_defconfig
openrisc                 simple_smp_defconfig
riscv                    nommu_k210_defconfig
arm                           stm32_defconfig
mips                       bmips_be_defconfig
arm                          badge4_defconfig
c6x                        evmc6474_defconfig
arm                              alldefconfig
powerpc                 mpc832x_mds_defconfig
powerpc                     asp8347_defconfig
arm                  colibri_pxa270_defconfig
mips                      loongson3_defconfig
powerpc                     kilauea_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                         palmz72_defconfig
arm                      integrator_defconfig
arm                        multi_v7_defconfig
arc                        vdk_hs38_defconfig
powerpc                    amigaone_defconfig
riscv                            allyesconfig
powerpc                    mvme5100_defconfig
sh                              ul2_defconfig
x86_64                           allyesconfig
mips                      fuloong2e_defconfig
mips                           xway_defconfig
arm                            xcep_defconfig
powerpc                     tqm8548_defconfig
powerpc                 mpc8540_ads_defconfig
sparc                       sparc32_defconfig
arm                        multi_v5_defconfig
sh                           sh2007_defconfig
arm                          simpad_defconfig
openrisc                    or1ksim_defconfig
arc                              allyesconfig
powerpc                 mpc8313_rdb_defconfig
openrisc                            defconfig
ia64                         bigsur_defconfig
powerpc                 mpc836x_mds_defconfig
i386                             alldefconfig
powerpc                   bluestone_defconfig
m68k                        m5307c3_defconfig
powerpc                 canyonlands_defconfig
s390                                defconfig
powerpc                 mpc836x_rdk_defconfig
arm                       omap2plus_defconfig
arm                        realview_defconfig
mips                       lemote2f_defconfig
mips                         cobalt_defconfig
xtensa                  cadence_csp_defconfig
arm                           corgi_defconfig
sh                          sdk7780_defconfig
um                            kunit_defconfig
sh                          rsk7201_defconfig
arm                      jornada720_defconfig
h8300                     edosk2674_defconfig
powerpc                      pcm030_defconfig
arm64                            alldefconfig
arm                             rpc_defconfig
powerpc                     tqm8555_defconfig
arm                       multi_v4t_defconfig
arm                        vexpress_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     ppa8548_defconfig
arm                              zx_defconfig
sh                           se7343_defconfig
powerpc                  mpc885_ads_defconfig
arc                           tb10x_defconfig
mips                          ath25_defconfig
parisc                           allyesconfig
sh                     sh7710voipgw_defconfig
mips                     cu1830-neo_defconfig
m68k                            q40_defconfig
um                             i386_defconfig
sh                            migor_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20201012
i386                 randconfig-a006-20201012
i386                 randconfig-a001-20201012
i386                 randconfig-a003-20201012
i386                 randconfig-a004-20201012
i386                 randconfig-a002-20201012
x86_64               randconfig-a016-20201012
x86_64               randconfig-a015-20201012
x86_64               randconfig-a012-20201012
x86_64               randconfig-a013-20201012
x86_64               randconfig-a014-20201012
x86_64               randconfig-a011-20201012
i386                 randconfig-a016-20201012
i386                 randconfig-a015-20201012
i386                 randconfig-a013-20201012
i386                 randconfig-a012-20201012
i386                 randconfig-a011-20201012
i386                 randconfig-a014-20201012
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201012
x86_64               randconfig-a002-20201012
x86_64               randconfig-a006-20201012
x86_64               randconfig-a001-20201012
x86_64               randconfig-a003-20201012
x86_64               randconfig-a005-20201012

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
