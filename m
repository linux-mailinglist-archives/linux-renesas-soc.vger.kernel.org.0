Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F8B3080C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Jan 2021 22:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhA1Vwb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Jan 2021 16:52:31 -0500
Received: from mga09.intel.com ([134.134.136.24]:33440 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229692AbhA1VwS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Jan 2021 16:52:18 -0500
IronPort-SDR: F1XSN1kobgrzy1T6tYsviRW1jmvcQ07Nz6IZrvN9tK1Pr1rxIeAKNkFGbmGWFmPdGzZJOrFN4a
 nn6iZv8qTemA==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="180461522"
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; 
   d="scan'208";a="180461522"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 13:51:36 -0800
IronPort-SDR: C59rbbWuSJVxG/XHhJ6EVF+33w67dM26fdUepn2K0KNOORyapw/O71miLgK/PAS87FHyOZBw9T
 MOzPzXgmyffA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; 
   d="scan'208";a="430723929"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Jan 2021 13:51:35 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l5FCQ-0003B8-LB; Thu, 28 Jan 2021 21:51:34 +0000
Date:   Fri, 29 Jan 2021 05:50:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 24ece96554a963d5eab597be7d65a1812d854d10
Message-ID: <601331c1.6JPcCS3J74koa3xA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 24ece96554a963d5eab597be7d65a1812d854d10  clk: renesas: cpg-mssr: Fix formatting issues for 'smstpcr_saved's documentation

elapsed time: 727m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                  colibri_pxa300_defconfig
powerpc                   bluestone_defconfig
nios2                         3c120_defconfig
arc                        vdk_hs38_defconfig
sh                           se7724_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      mgcoge_defconfig
powerpc                          g5_defconfig
mips                malta_kvm_guest_defconfig
nds32                               defconfig
arm                       imx_v6_v7_defconfig
powerpc                     pseries_defconfig
sparc64                             defconfig
powerpc                     tqm8540_defconfig
m68k                        m5407c3_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                  colibri_pxa270_defconfig
arm                       multi_v4t_defconfig
sh                        sh7785lcr_defconfig
arm                        oxnas_v6_defconfig
arm                        clps711x_defconfig
arm                            qcom_defconfig
mips                      malta_kvm_defconfig
arm                        vexpress_defconfig
mips                           ip28_defconfig
powerpc                    ge_imp3a_defconfig
mips                     cu1830-neo_defconfig
sh                          polaris_defconfig
mips                  decstation_64_defconfig
sh                          kfr2r09_defconfig
ia64                                defconfig
mips                       bmips_be_defconfig
powerpc                 mpc837x_mds_defconfig
mips                      maltasmvp_defconfig
arm                          simpad_defconfig
xtensa                         virt_defconfig
mips                       capcella_defconfig
parisc                generic-32bit_defconfig
microblaze                      mmu_defconfig
c6x                        evmc6474_defconfig
arm                       imx_v4_v5_defconfig
sh                             sh03_defconfig
powerpc                      arches_defconfig
arc                    vdk_hs38_smp_defconfig
mips                        maltaup_defconfig
arm                         socfpga_defconfig
nios2                            allyesconfig
arm                        keystone_defconfig
arm                        magician_defconfig
c6x                        evmc6678_defconfig
m68k                        mvme16x_defconfig
arc                         haps_hs_defconfig
sparc64                          alldefconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
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
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210128
i386                 randconfig-a002-20210128
i386                 randconfig-a004-20210128
i386                 randconfig-a005-20210128
i386                 randconfig-a003-20210128
i386                 randconfig-a006-20210128
x86_64               randconfig-a012-20210128
x86_64               randconfig-a015-20210128
x86_64               randconfig-a016-20210128
x86_64               randconfig-a011-20210128
x86_64               randconfig-a013-20210128
x86_64               randconfig-a014-20210128
i386                 randconfig-a013-20210128
i386                 randconfig-a011-20210128
i386                 randconfig-a012-20210128
i386                 randconfig-a016-20210128
i386                 randconfig-a014-20210128
i386                 randconfig-a015-20210128
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210128
x86_64               randconfig-a003-20210128
x86_64               randconfig-a001-20210128
x86_64               randconfig-a005-20210128
x86_64               randconfig-a006-20210128
x86_64               randconfig-a004-20210128

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
