Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0D537F1C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 May 2021 05:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhEMDwR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 May 2021 23:52:17 -0400
Received: from mga18.intel.com ([134.134.136.126]:53341 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230104AbhEMDwQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 May 2021 23:52:16 -0400
IronPort-SDR: xfDMi4RucS754xjB9OCjv+/7ri4IdiNg3qsHCoTQZOu83Eq0aV3jVPlcVuOUmcnR/YonvUloZR
 I4InBuaQPPYQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="187285203"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
   d="scan'208";a="187285203"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 20:51:06 -0700
IronPort-SDR: /QeiZhUwXvHovxtogsd62UiAnEvfAvMAHPc1LLdznaoMOir1yIqzf0YJZ/z1kYfkL+du1QxtTd
 CCUydtJcCH4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
   d="scan'208";a="469748455"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 May 2021 20:51:04 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lh2NM-00005b-1S; Thu, 13 May 2021 03:51:04 +0000
Date:   Thu, 13 May 2021 11:50:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-pinctrl-for-v5.14] BUILD SUCCESS
 904ec4bebc1df908a943bf3178f6c633672ce47b
Message-ID: <609ca219.WfzGCFCzWSG8ZzhG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v5.14
branch HEAD: 904ec4bebc1df908a943bf3178f6c633672ce47b  pinctrl: renesas: r8a779{51,6,65}: Reduce non-functional differences

elapsed time: 2294m

configs tested: 191
configs skipped: 2

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
riscv                            allyesconfig
i386                             allyesconfig
openrisc                  or1klitex_defconfig
m68k                          amiga_defconfig
mips                           xway_defconfig
sh                           se7712_defconfig
arm                          collie_defconfig
powerpc                     ppa8548_defconfig
arm                           h3600_defconfig
mips                         db1xxx_defconfig
arm                        multi_v5_defconfig
powerpc                     kmeter1_defconfig
sh                           se7780_defconfig
arm                        spear3xx_defconfig
powerpc                      obs600_defconfig
mips                     decstation_defconfig
mips                             allyesconfig
arm                           sunxi_defconfig
h8300                     edosk2674_defconfig
powerpc                        fsp2_defconfig
xtensa                           alldefconfig
powerpc                     tqm8560_defconfig
arm                        multi_v7_defconfig
arm                        clps711x_defconfig
powerpc                  storcenter_defconfig
powerpc                     stx_gp3_defconfig
xtensa                  cadence_csp_defconfig
sh                           se7721_defconfig
sh                          polaris_defconfig
mips                           ip27_defconfig
sh                           se7751_defconfig
arm                            pleb_defconfig
powerpc                     pseries_defconfig
arm                       aspeed_g4_defconfig
mips                      malta_kvm_defconfig
parisc                generic-32bit_defconfig
powerpc                     sequoia_defconfig
sh                           se7619_defconfig
mips                        workpad_defconfig
arm                         bcm2835_defconfig
arm                        spear6xx_defconfig
arc                          axs101_defconfig
powerpc                      ep88xc_defconfig
mips                        jmr3927_defconfig
um                            kunit_defconfig
powerpc                 mpc8315_rdb_defconfig
openrisc                            defconfig
sparc64                             defconfig
arm                        neponset_defconfig
powerpc                  mpc866_ads_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      bamboo_defconfig
riscv                             allnoconfig
s390                                defconfig
m68k                       m5475evb_defconfig
mips                      bmips_stb_defconfig
arm                          ep93xx_defconfig
mips                        nlm_xlr_defconfig
riscv                               defconfig
nios2                         3c120_defconfig
xtensa                    xip_kc705_defconfig
powerpc                    socrates_defconfig
powerpc                    mvme5100_defconfig
mips                            e55_defconfig
riscv                    nommu_k210_defconfig
sh                          rsk7264_defconfig
powerpc                       holly_defconfig
mips                         mpc30x_defconfig
mips                  decstation_64_defconfig
powerpc                 mpc834x_itx_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                        keystone_defconfig
powerpc                 mpc836x_mds_defconfig
ia64                                defconfig
powerpc                      tqm8xx_defconfig
arm                            xcep_defconfig
arm                        vexpress_defconfig
sh                         ecovec24_defconfig
arm                       imx_v4_v5_defconfig
sh                                  defconfig
arm                           tegra_defconfig
mips                     cu1830-neo_defconfig
sh                           se7722_defconfig
riscv                    nommu_virt_defconfig
mips                             allmodconfig
powerpc                     pq2fads_defconfig
arm                           sama5_defconfig
powerpc                   lite5200b_defconfig
mips                     loongson1c_defconfig
mips                          malta_defconfig
m68k                          sun3x_defconfig
powerpc64                        alldefconfig
arm                         lpc18xx_defconfig
arm                       mainstone_defconfig
powerpc                     tqm8555_defconfig
sh                            hp6xx_defconfig
mips                malta_qemu_32r6_defconfig
xtensa                       common_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210512
x86_64               randconfig-a004-20210512
x86_64               randconfig-a001-20210512
x86_64               randconfig-a005-20210512
x86_64               randconfig-a002-20210512
x86_64               randconfig-a006-20210512
i386                 randconfig-a003-20210512
i386                 randconfig-a001-20210512
i386                 randconfig-a005-20210512
i386                 randconfig-a004-20210512
i386                 randconfig-a002-20210512
i386                 randconfig-a006-20210512
i386                 randconfig-a003-20210511
i386                 randconfig-a001-20210511
i386                 randconfig-a002-20210511
i386                 randconfig-a006-20210511
i386                 randconfig-a005-20210511
i386                 randconfig-a004-20210511
x86_64               randconfig-a012-20210511
x86_64               randconfig-a015-20210511
x86_64               randconfig-a011-20210511
x86_64               randconfig-a013-20210511
x86_64               randconfig-a016-20210511
x86_64               randconfig-a014-20210511
i386                 randconfig-a016-20210511
i386                 randconfig-a014-20210511
i386                 randconfig-a011-20210511
i386                 randconfig-a015-20210511
i386                 randconfig-a012-20210511
i386                 randconfig-a013-20210511
i386                 randconfig-a016-20210512
i386                 randconfig-a014-20210512
i386                 randconfig-a011-20210512
i386                 randconfig-a015-20210512
i386                 randconfig-a012-20210512
i386                 randconfig-a013-20210512
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin

clang tested configs:
x86_64               randconfig-a003-20210511
x86_64               randconfig-a004-20210511
x86_64               randconfig-a001-20210511
x86_64               randconfig-a005-20210511
x86_64               randconfig-a002-20210511
x86_64               randconfig-a006-20210511
x86_64               randconfig-a015-20210512
x86_64               randconfig-a012-20210512
x86_64               randconfig-a011-20210512
x86_64               randconfig-a013-20210512
x86_64               randconfig-a016-20210512
x86_64               randconfig-a014-20210512

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
