Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A188C414144
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 07:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhIVFeL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 01:34:11 -0400
Received: from mga12.intel.com ([192.55.52.136]:30510 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231908AbhIVFeK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 01:34:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="203014150"
X-IronPort-AV: E=Sophos;i="5.85,312,1624345200"; 
   d="scan'208";a="203014150"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 22:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,312,1624345200"; 
   d="scan'208";a="533567348"
Received: from lkp-server01.sh.intel.com (HELO 3f19c3f57f1d) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Sep 2021 22:32:40 -0700
Received: from kbuild by 3f19c3f57f1d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mSus3-00006Y-Bp; Wed, 22 Sep 2021 05:32:39 +0000
Date:   Wed, 22 Sep 2021 13:31:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 4a7c76d8d5a91d210d64552d5e29fd02a115fce7
Message-ID: <614abfcf.u1I94i9nf0kYNHMz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 4a7c76d8d5a91d210d64552d5e29fd02a115fce7  Merge branch 'renesas-next' into renesas-devel

elapsed time: 2417m

configs tested: 102
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      ep88xc_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                           jazz_defconfig
powerpc                      acadia_defconfig
h8300                            alldefconfig
arm                         socfpga_defconfig
arm                            pleb_defconfig
m68k                       bvme6000_defconfig
arm                        oxnas_v6_defconfig
xtensa                  nommu_kc705_defconfig
arm                       mainstone_defconfig
powerpc                      obs600_defconfig
powerpc                 linkstation_defconfig
arm                             rpc_defconfig
arm                        multi_v7_defconfig
arm                       aspeed_g4_defconfig
m68k                        mvme16x_defconfig
um                               alldefconfig
arm                          imote2_defconfig
x86_64               randconfig-c001-20210920
arm                  randconfig-c002-20210920
i386                 randconfig-c001-20210920
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
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
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a014-20210920
x86_64               randconfig-a011-20210920
x86_64               randconfig-a013-20210920
x86_64               randconfig-a012-20210920
x86_64               randconfig-a015-20210920
x86_64               randconfig-a016-20210920
i386                 randconfig-a014-20210920
i386                 randconfig-a013-20210920
i386                 randconfig-a016-20210920
i386                 randconfig-a012-20210920
i386                 randconfig-a011-20210920
i386                 randconfig-a015-20210920
arc                  randconfig-r043-20210920
riscv                randconfig-r042-20210920
s390                 randconfig-r044-20210920
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a002-20210920
x86_64               randconfig-a006-20210920
x86_64               randconfig-a005-20210920
x86_64               randconfig-a001-20210920
x86_64               randconfig-a004-20210920
x86_64               randconfig-a003-20210920
i386                 randconfig-a001-20210920
i386                 randconfig-a005-20210920
i386                 randconfig-a002-20210920
i386                 randconfig-a006-20210920
i386                 randconfig-a003-20210920
i386                 randconfig-a004-20210920
hexagon              randconfig-r045-20210920
hexagon              randconfig-r041-20210920

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
