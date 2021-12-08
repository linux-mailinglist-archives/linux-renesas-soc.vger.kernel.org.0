Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48F5746D8A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 17:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbhLHQl3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Dec 2021 11:41:29 -0500
Received: from mga07.intel.com ([134.134.136.100]:27158 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230099AbhLHQl2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 11:41:28 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="301249111"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; 
   d="scan'208";a="301249111"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 08:37:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; 
   d="scan'208";a="612144264"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Dec 2021 08:37:50 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1muzwz-0000no-Ln; Wed, 08 Dec 2021 16:37:49 +0000
Date:   Thu, 09 Dec 2021 00:37:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 9f95ae4ce1f163e55c94e37d23681c1d0dc0c3da
Message-ID: <61b0df47.pb2rz6U+9KMDIwaM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 9f95ae4ce1f163e55c94e37d23681c1d0dc0c3da  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1416m

configs tested: 103
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
i386                 randconfig-c001-20211207
m68k                             alldefconfig
arc                           tb10x_defconfig
arm                           tegra_defconfig
powerpc                 mpc837x_rdb_defconfig
h8300                     edosk2674_defconfig
mips                      maltasmvp_defconfig
mips                           rs90_defconfig
h8300                            allyesconfig
h8300                       h8s-sim_defconfig
ia64                          tiger_defconfig
arm                         assabet_defconfig
mips                           ip32_defconfig
powerpc                      ppc6xx_defconfig
arc                      axs103_smp_defconfig
mips                     cu1000-neo_defconfig
arm                        cerfcube_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     ppa8548_defconfig
powerpc                     powernv_defconfig
arm                  randconfig-c002-20211207
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
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
sparc                            allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a006-20211207
x86_64               randconfig-a005-20211207
x86_64               randconfig-a001-20211207
x86_64               randconfig-a002-20211207
x86_64               randconfig-a004-20211207
x86_64               randconfig-a003-20211207
i386                 randconfig-a001-20211207
i386                 randconfig-a005-20211207
i386                 randconfig-a002-20211207
i386                 randconfig-a003-20211207
i386                 randconfig-a006-20211207
i386                 randconfig-a004-20211207
arc                  randconfig-r043-20211207
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a011-20211207
x86_64               randconfig-a013-20211207
x86_64               randconfig-a014-20211207
x86_64               randconfig-a012-20211207
x86_64               randconfig-a016-20211207
x86_64               randconfig-a015-20211207
i386                 randconfig-a016-20211207
i386                 randconfig-a013-20211207
i386                 randconfig-a011-20211207
i386                 randconfig-a014-20211207
i386                 randconfig-a012-20211207
i386                 randconfig-a015-20211207
hexagon              randconfig-r045-20211207
s390                 randconfig-r044-20211207
riscv                randconfig-r042-20211207
hexagon              randconfig-r041-20211207

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
