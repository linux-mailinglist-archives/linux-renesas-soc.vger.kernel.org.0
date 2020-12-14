Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792222DA24C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 22:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503606AbgLNVIF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 16:08:05 -0500
Received: from mga12.intel.com ([192.55.52.136]:22344 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503036AbgLNVIC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 16:08:02 -0500
IronPort-SDR: 7BLJ4IP6CeBUo7+cRx+fKOgEbJnlaVOGVR4TSXh8sApbE66vnajJxEdKupztRp9YPG0qOY+eUK
 lh3FzD9b+ExQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="154012061"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="154012061"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 13:06:57 -0800
IronPort-SDR: EQ70JfzXoYBX/FjKnRxwyJOsY8OMjP7URVdxR8irhmE+qkWnVzp+duvYv+gxMkuUim4udUFW2c
 B8i6Zz7YdAEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="341209201"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Dec 2020 13:06:56 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kov3X-0000TO-KK; Mon, 14 Dec 2020 21:06:55 +0000
Date:   Tue, 15 Dec 2020 05:05:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 c308f63de590dadc2c668e9d347da00b0fa76ade
Message-ID: <5fd7d3b3.PNxCuabVywlSU6CQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: c308f63de590dadc2c668e9d347da00b0fa76ade  Merge branch 'renesas-arm-dt-for-v5.12' into renesas-devel

elapsed time: 722m

configs tested: 109
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5249evb_defconfig
powerpc                mpc7448_hpc2_defconfig
microblaze                      mmu_defconfig
powerpc                   bluestone_defconfig
sh                   secureedge5410_defconfig
c6x                         dsk6455_defconfig
xtensa                    smp_lx200_defconfig
mips                          malta_defconfig
sh                      rts7751r2d1_defconfig
arm                         hackkit_defconfig
parisc                              defconfig
mips                         bigsur_defconfig
m68k                       m5275evb_defconfig
arc                      axs103_smp_defconfig
mips                          rm200_defconfig
arm                       spear13xx_defconfig
arm                        clps711x_defconfig
mips                        jmr3927_defconfig
i386                                defconfig
arm                  colibri_pxa270_defconfig
powerpc                     mpc512x_defconfig
powerpc                     akebono_defconfig
powerpc                    adder875_defconfig
m68k                          amiga_defconfig
powerpc                       holly_defconfig
mips                      maltaaprp_defconfig
sh                         ap325rxa_defconfig
powerpc                     tqm5200_defconfig
csky                             alldefconfig
mips                      pistachio_defconfig
xtensa                    xip_kc705_defconfig
m68k                       m5475evb_defconfig
arc                            hsdk_defconfig
mips                        bcm47xx_defconfig
powerpc                     ppa8548_defconfig
m68k                          multi_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20201214
i386                 randconfig-a004-20201214
i386                 randconfig-a003-20201214
i386                 randconfig-a002-20201214
i386                 randconfig-a006-20201214
i386                 randconfig-a005-20201214
x86_64               randconfig-a016-20201214
x86_64               randconfig-a012-20201214
x86_64               randconfig-a013-20201214
x86_64               randconfig-a015-20201214
x86_64               randconfig-a014-20201214
x86_64               randconfig-a011-20201214
i386                 randconfig-a014-20201214
i386                 randconfig-a013-20201214
i386                 randconfig-a012-20201214
i386                 randconfig-a011-20201214
i386                 randconfig-a015-20201214
i386                 randconfig-a016-20201214
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201214
x86_64               randconfig-a006-20201214
x86_64               randconfig-a002-20201214
x86_64               randconfig-a005-20201214
x86_64               randconfig-a004-20201214
x86_64               randconfig-a001-20201214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
