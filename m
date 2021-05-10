Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBCEA3798F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 May 2021 23:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbhEJVOq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 17:14:46 -0400
Received: from mga03.intel.com ([134.134.136.65]:50043 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231264AbhEJVOq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 17:14:46 -0400
IronPort-SDR: BQ/aBW3tDGfCRX/nUTaL4u5EVpfxMkM8QjZisBR2qVpQtuDLr8P1rpv0huzXG9aABscVhmtc68
 dCy4PK1TvAlw==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199341545"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="199341545"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 14:13:41 -0700
IronPort-SDR: 5k9SpUg2y+fhPbtZzBIamggIWaau5PAogbXXh8veEAtGc5hpcohYJz/yAKufr9cj4J76Q7Wzqj
 ABoHFjVeqU7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="536592780"
Received: from lkp-server01.sh.intel.com (HELO f375d57c4ed4) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 May 2021 14:13:39 -0700
Received: from kbuild by f375d57c4ed4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lgDDe-0000NC-RE; Mon, 10 May 2021 21:13:38 +0000
Date:   Tue, 11 May 2021 05:12:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 dcf2613335bced4d60b8b8e10134d2f9153d298c
Message-ID: <6099a1cb.saq0B/zxdyvXnNZ+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: dcf2613335bced4d60b8b8e10134d2f9153d298c  Merge branch 'renesas-next' into renesas-devel

elapsed time: 731m

configs tested: 117
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arc                     haps_hs_smp_defconfig
mips                      pic32mzda_defconfig
mips                malta_qemu_32r6_defconfig
arm                        mvebu_v5_defconfig
arm                         vf610m4_defconfig
h8300                            alldefconfig
openrisc                  or1klitex_defconfig
ia64                          tiger_defconfig
s390                             alldefconfig
sh                           se7619_defconfig
arm                         nhk8815_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                     decstation_defconfig
mips                        omega2p_defconfig
arm                         mv78xx0_defconfig
ia64                             alldefconfig
sh                          r7780mp_defconfig
arm                      tct_hammer_defconfig
arm                           spitz_defconfig
sh                           sh2007_defconfig
arm                          pxa168_defconfig
powerpc                       maple_defconfig
mips                        workpad_defconfig
sh                               j2_defconfig
sh                         microdev_defconfig
xtensa                           alldefconfig
sh                            hp6xx_defconfig
powerpc                    klondike_defconfig
mips                          rm200_defconfig
arm                           u8500_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                              ul2_defconfig
powerpc                      pmac32_defconfig
powerpc                   motionpro_defconfig
nios2                            alldefconfig
h8300                    h8300h-sim_defconfig
mips                          ath25_defconfig
arm                          ixp4xx_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
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
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
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
