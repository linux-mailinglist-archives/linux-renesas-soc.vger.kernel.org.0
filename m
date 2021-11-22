Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6759245984C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 00:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhKVXPS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 18:15:18 -0500
Received: from mga05.intel.com ([192.55.52.43]:54924 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229617AbhKVXPR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 18:15:17 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="321134706"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; 
   d="scan'208";a="321134706"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 15:12:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; 
   d="scan'208";a="606599084"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Nov 2021 15:12:09 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mpITo-0000pO-D4; Mon, 22 Nov 2021 23:12:08 +0000
Date:   Tue, 23 Nov 2021 07:11:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 76e8eb89ce81234e80daca68c8ea9523696bf0d5
Message-ID: <619c23a1.CeG5FN5TYgoTBd8m%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 76e8eb89ce81234e80daca68c8ea9523696bf0d5  Merge tag 'v5.16-rc2' into renesas-devel

elapsed time: 787m

configs tested: 106
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211122
powerpc                   bluestone_defconfig
arm                         at91_dt_defconfig
arm                           stm32_defconfig
parisc                generic-32bit_defconfig
powerpc                     mpc5200_defconfig
arm                          lpd270_defconfig
arm                         orion5x_defconfig
xtensa                         virt_defconfig
powerpc               mpc834x_itxgp_defconfig
ia64                             alldefconfig
arm                    vt8500_v6_v7_defconfig
mips                       rbtx49xx_defconfig
ia64                      gensparse_defconfig
powerpc                 mpc837x_rdb_defconfig
arc                                 defconfig
m68k                       m5475evb_defconfig
powerpc                      mgcoge_defconfig
powerpc                     tqm8548_defconfig
sh                   rts7751r2dplus_defconfig
m68k                        mvme16x_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                           alldefconfig
powerpc                 mpc836x_rdk_defconfig
arm                  randconfig-c002-20211122
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a014-20211122
x86_64               randconfig-a011-20211122
x86_64               randconfig-a012-20211122
x86_64               randconfig-a016-20211122
x86_64               randconfig-a013-20211122
x86_64               randconfig-a015-20211122
i386                 randconfig-a015-20211122
i386                 randconfig-a012-20211122
i386                 randconfig-a013-20211122
i386                 randconfig-a014-20211122
i386                 randconfig-a011-20211122
i386                 randconfig-a016-20211122
arc                  randconfig-r043-20211122
s390                 randconfig-r044-20211122
riscv                randconfig-r042-20211122
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a001-20211122
x86_64               randconfig-a003-20211122
x86_64               randconfig-a006-20211122
x86_64               randconfig-a004-20211122
x86_64               randconfig-a005-20211122
x86_64               randconfig-a002-20211122
i386                 randconfig-a001-20211122
i386                 randconfig-a002-20211122
i386                 randconfig-a005-20211122
i386                 randconfig-a006-20211122
i386                 randconfig-a004-20211122
i386                 randconfig-a003-20211122
hexagon              randconfig-r041-20211122
hexagon              randconfig-r045-20211122

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
