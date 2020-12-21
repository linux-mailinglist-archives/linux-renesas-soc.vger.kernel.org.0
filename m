Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2347C2E0305
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 00:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgLUXtz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 18:49:55 -0500
Received: from mga06.intel.com ([134.134.136.31]:41952 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726128AbgLUXtz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 18:49:55 -0500
IronPort-SDR: uLG8kKpLDHzRKW6vLycX+7AJDSMC0mIEs0o3aJAiJMN2bh7P2hyI98UJpoHRor4Pouuy81kuPW
 +viE/KMQqOXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="237360706"
X-IronPort-AV: E=Sophos;i="5.78,437,1599548400"; 
   d="scan'208";a="237360706"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2020 15:49:13 -0800
IronPort-SDR: D2AMUn4VlnvUN+8ob7w3chne7DdIqOUuBgd8w34JkmHAn5u8i4j1pVKKSmY8z0vnLZ1UMlIdyM
 5JTckmsSU3tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,437,1599548400"; 
   d="scan'208";a="457011066"
Received: from lkp-server01.sh.intel.com (HELO 65587561063d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2020 15:49:11 -0800
Received: from kbuild by 65587561063d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1krUvP-0001AM-4h; Mon, 21 Dec 2020 23:49:11 +0000
Date:   Tue, 22 Dec 2020 07:49:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 a0d9f5cfe680c9afb8a9bb2d57b6a1c707da9c3a
Message-ID: <5fe13475.o2ucXOCkVFnx2Rr0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: a0d9f5cfe680c9afb8a9bb2d57b6a1c707da9c3a  Merge branches 'renesas-arm-dt-for-v5.12' and 'renesas-dt-bindings-for-v5.12' into renesas-devel

elapsed time: 724m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                  mpc866_ads_defconfig
i386                             alldefconfig
parisc                generic-32bit_defconfig
powerpc                     sequoia_defconfig
nds32                             allnoconfig
x86_64                           alldefconfig
sparc                       sparc64_defconfig
m68k                       bvme6000_defconfig
mips                         tb0287_defconfig
openrisc                            defconfig
arm                          ep93xx_defconfig
c6x                              alldefconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                    klondike_defconfig
powerpc                      cm5200_defconfig
arm                  colibri_pxa270_defconfig
xtensa                           alldefconfig
arm                        spear6xx_defconfig
arm                              zx_defconfig
mips                     loongson1c_defconfig
powerpc                      ppc64e_defconfig
arm                         vf610m4_defconfig
sparc                       sparc32_defconfig
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
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
x86_64               randconfig-a001-20201221
x86_64               randconfig-a006-20201221
x86_64               randconfig-a002-20201221
x86_64               randconfig-a004-20201221
x86_64               randconfig-a003-20201221
x86_64               randconfig-a005-20201221
i386                 randconfig-a002-20201221
i386                 randconfig-a005-20201221
i386                 randconfig-a006-20201221
i386                 randconfig-a004-20201221
i386                 randconfig-a003-20201221
i386                 randconfig-a001-20201221
i386                 randconfig-a011-20201221
i386                 randconfig-a016-20201221
i386                 randconfig-a014-20201221
i386                 randconfig-a012-20201221
i386                 randconfig-a015-20201221
i386                 randconfig-a013-20201221
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
x86_64               randconfig-a015-20201221
x86_64               randconfig-a014-20201221
x86_64               randconfig-a016-20201221
x86_64               randconfig-a012-20201221
x86_64               randconfig-a013-20201221
x86_64               randconfig-a011-20201221

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
