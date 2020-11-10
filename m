Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D83A2ACAFB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 03:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730066AbgKJCYf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Nov 2020 21:24:35 -0500
Received: from mga07.intel.com ([134.134.136.100]:16186 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730151AbgKJCYe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 21:24:34 -0500
IronPort-SDR: usrrDM9R4Qi402WUP8DDCmcn9KaS+CU61D4b9dygubB9ueqEJKL6AsQqdMgtzUE7S8eVf8Lui5
 qgRWZJ2Qug6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="234072712"
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
   d="scan'208";a="234072712"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 18:24:33 -0800
IronPort-SDR: afmlPdFlEQ76wwXajyuUFA0mskjE46i4yd3i27IU2peepOPGjqmk97SUEp//3qpJ2k8k0q+Os0
 sLRfq7xMIuGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
   d="scan'208";a="365309695"
Received: from lkp-server01.sh.intel.com (HELO d0be80f1a028) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2020 18:24:32 -0800
Received: from kbuild by d0be80f1a028 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kcJKh-0000bB-JA; Tue, 10 Nov 2020 02:24:31 +0000
Date:   Tue, 10 Nov 2020 10:23:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-defconfig-for-v5.11] BUILD SUCCESS
 c5f883d1a6f3f061eb5d1acbbe2f3cbbe985f6a3
Message-ID: <5fa9f9af.tk954NmNe+h8EOtG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-defconfig-for-v5.11
branch HEAD: c5f883d1a6f3f061eb5d1acbbe2f3cbbe985f6a3  ARM: shmobile: defconfig: Refresh for v5.10-rc1

elapsed time: 726m

configs tested: 128
configs skipped: 84

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                  storcenter_defconfig
ia64                            zx1_defconfig
sh                            migor_defconfig
powerpc                      pmac32_defconfig
powerpc                     mpc5200_defconfig
sh                      rts7751r2d1_defconfig
mips                      malta_kvm_defconfig
sh                ecovec24-romimage_defconfig
parisc                generic-64bit_defconfig
x86_64                              defconfig
m68k                          hp300_defconfig
sh                           se7206_defconfig
arm                          ep93xx_defconfig
arc                        nsimosci_defconfig
sh                          sdk7780_defconfig
mips                          malta_defconfig
powerpc                        cell_defconfig
sh                            hp6xx_defconfig
powerpc                 mpc836x_mds_defconfig
sh                          rsk7201_defconfig
powerpc                      pasemi_defconfig
mips                             allmodconfig
powerpc                     stx_gp3_defconfig
arm                         nhk8815_defconfig
powerpc                     tqm8541_defconfig
arm                       versatile_defconfig
arc                              alldefconfig
arm                        multi_v5_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                   motionpro_defconfig
powerpc                     tqm5200_defconfig
powerpc                      katmai_defconfig
arm                        mvebu_v7_defconfig
m68k                        m5272c3_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                           jazz_defconfig
arm                            mmp2_defconfig
arm                        keystone_defconfig
arm                        cerfcube_defconfig
arm                        oxnas_v6_defconfig
arm                         shannon_defconfig
powerpc                    sam440ep_defconfig
arm                           corgi_defconfig
arm                          gemini_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201109
x86_64               randconfig-a002-20201109
x86_64               randconfig-a003-20201109
x86_64               randconfig-a005-20201109
x86_64               randconfig-a006-20201109
x86_64               randconfig-a001-20201109
i386                 randconfig-a004-20201109
i386                 randconfig-a006-20201109
i386                 randconfig-a005-20201109
i386                 randconfig-a001-20201109
i386                 randconfig-a003-20201109
i386                 randconfig-a002-20201109
x86_64               randconfig-a003-20201110
x86_64               randconfig-a005-20201110
x86_64               randconfig-a004-20201110
x86_64               randconfig-a002-20201110
x86_64               randconfig-a006-20201110
x86_64               randconfig-a001-20201110
i386                 randconfig-a012-20201110
i386                 randconfig-a014-20201110
i386                 randconfig-a016-20201110
i386                 randconfig-a011-20201110
i386                 randconfig-a015-20201110
i386                 randconfig-a013-20201110
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
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20201109
x86_64               randconfig-a015-20201109
x86_64               randconfig-a013-20201109
x86_64               randconfig-a011-20201109
x86_64               randconfig-a014-20201109
x86_64               randconfig-a016-20201109
x86_64               randconfig-a015-20201110
x86_64               randconfig-a011-20201110
x86_64               randconfig-a014-20201110
x86_64               randconfig-a013-20201110
x86_64               randconfig-a016-20201110
x86_64               randconfig-a012-20201110

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
