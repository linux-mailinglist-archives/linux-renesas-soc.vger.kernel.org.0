Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C84825E345
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Sep 2020 23:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbgIDVZj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Sep 2020 17:25:39 -0400
Received: from mga14.intel.com ([192.55.52.115]:60328 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727923AbgIDVZi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 17:25:38 -0400
IronPort-SDR: 4fJlak87cWCgt3eqlxedv6Gx6JI4HsZaRhICvOYv+QScaI76FXwO9IK+Cf5lTdKFCFkV/RoAzU
 OtxihureTnag==
X-IronPort-AV: E=McAfee;i="6000,8403,9734"; a="157083774"
X-IronPort-AV: E=Sophos;i="5.76,391,1592895600"; 
   d="scan'208";a="157083774"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2020 14:25:37 -0700
IronPort-SDR: o4HwWSmZ14gPhMGxeyDZRx1i5mak5zex06EaYV0/Q0eZJBQ5yjyxQF5warofWrhcILFPLU9hB+
 Ds/ONh4+m7gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,391,1592895600"; 
   d="scan'208";a="332292811"
Received: from lkp-server02.sh.intel.com (HELO c089623da072) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 04 Sep 2020 14:25:35 -0700
Received: from kbuild by c089623da072 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kEJDD-00008p-8r; Fri, 04 Sep 2020 21:25:35 +0000
Date:   Sat, 05 Sep 2020 05:25:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.10] BUILD SUCCESS
 e9f0fb53ac88c1ccf3728b47c687838b6054f481
Message-ID: <5f52b0c1.v74OQPjf4wQO2R1h%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.10
branch HEAD: e9f0fb53ac88c1ccf3728b47c687838b6054f481  arm64: dts: renesas: Add HiHope RZ/G2H board with idk-1110wr display

elapsed time: 720m

configs tested: 96
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     powernv_defconfig
powerpc                        cell_defconfig
arm                            zeus_defconfig
powerpc                    mvme5100_defconfig
powerpc                     ep8248e_defconfig
arm                      pxa255-idp_defconfig
riscv                               defconfig
arm                          moxart_defconfig
arm                            lart_defconfig
sh                            shmin_defconfig
ia64                            zx1_defconfig
arc                     nsimosci_hs_defconfig
sh                          kfr2r09_defconfig
arm64                            alldefconfig
sh                        apsh4ad0a_defconfig
mips                  decstation_64_defconfig
powerpc                      mgcoge_defconfig
mips                malta_qemu_32r6_defconfig
arm                           omap1_defconfig
arm                        mini2440_defconfig
mips                           ci20_defconfig
m68k                             alldefconfig
powerpc64                           defconfig
sh                               j2_defconfig
microblaze                          defconfig
s390                                defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20200904
i386                 randconfig-a005-20200904
i386                 randconfig-a006-20200904
i386                 randconfig-a002-20200904
i386                 randconfig-a003-20200904
i386                 randconfig-a001-20200904
x86_64               randconfig-a013-20200904
x86_64               randconfig-a011-20200904
x86_64               randconfig-a016-20200904
x86_64               randconfig-a012-20200904
x86_64               randconfig-a015-20200904
x86_64               randconfig-a014-20200904
i386                 randconfig-a016-20200904
i386                 randconfig-a015-20200904
i386                 randconfig-a011-20200904
i386                 randconfig-a013-20200904
i386                 randconfig-a014-20200904
i386                 randconfig-a012-20200904
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20200904
x86_64               randconfig-a004-20200904
x86_64               randconfig-a003-20200904
x86_64               randconfig-a005-20200904
x86_64               randconfig-a001-20200904
x86_64               randconfig-a002-20200904

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
