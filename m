Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 953E646A92C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 22:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350159AbhLFVNu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 16:13:50 -0500
Received: from mga07.intel.com ([134.134.136.100]:1499 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350153AbhLFVNu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 16:13:50 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="300791364"
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; 
   d="scan'208";a="300791364"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2021 13:10:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; 
   d="scan'208";a="611381064"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 06 Dec 2021 13:10:19 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1muLFb-000LkU-4o; Mon, 06 Dec 2021 21:10:19 +0000
Date:   Tue, 07 Dec 2021 05:10:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 8feef3cda1f4673737514cb20366eeeb69cc0be2
Message-ID: <61ae7c2a.udNjkDxOBufPb8S7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 8feef3cda1f4673737514cb20366eeeb69cc0be2  Merge tag 'v5.16-rc4' into renesas-devel

elapsed time: 722m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
arc                              alldefconfig
arm                       multi_v4t_defconfig
arm                             ezx_defconfig
ia64                         bigsur_defconfig
sh                          r7780mp_defconfig
powerpc                     tqm5200_defconfig
powerpc                     asp8347_defconfig
arm                            xcep_defconfig
mips                         rt305x_defconfig
mips                         tb0287_defconfig
arm                         socfpga_defconfig
sh                         microdev_defconfig
arm                         lpc32xx_defconfig
arm                       cns3420vb_defconfig
sparc64                             defconfig
m68k                            mac_defconfig
arm                        multi_v5_defconfig
arm                          ixp4xx_defconfig
m68k                        m5307c3_defconfig
arm                       aspeed_g5_defconfig
microblaze                          defconfig
mips                         cobalt_defconfig
sh                           se7780_defconfig
mips                             allmodconfig
arm                       imx_v4_v5_defconfig
arm                           sama7_defconfig
arm                            zeus_defconfig
sh                               alldefconfig
arm                         vf610m4_defconfig
arm                      integrator_defconfig
arm                        multi_v7_defconfig
nds32                               defconfig
ia64                        generic_defconfig
powerpc                     tqm8548_defconfig
h8300                            alldefconfig
sh                      rts7751r2d1_defconfig
sh                           se7705_defconfig
um                           x86_64_defconfig
arm                            mps2_defconfig
arm                  randconfig-c002-20211206
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20211206
x86_64               randconfig-a013-20211206
x86_64               randconfig-a014-20211206
x86_64               randconfig-a012-20211206
x86_64               randconfig-a015-20211206
x86_64               randconfig-a016-20211206
i386                 randconfig-a016-20211206
i386                 randconfig-a013-20211206
i386                 randconfig-a011-20211206
i386                 randconfig-a014-20211206
i386                 randconfig-a012-20211206
i386                 randconfig-a015-20211206
arc                  randconfig-r043-20211206
s390                 randconfig-r044-20211206
riscv                randconfig-r042-20211206
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-c007-20211206
arm                  randconfig-c002-20211206
mips                 randconfig-c004-20211206
i386                 randconfig-c001-20211206
powerpc              randconfig-c003-20211206
s390                 randconfig-c005-20211206
riscv                randconfig-c006-20211206
x86_64               randconfig-a006-20211206
x86_64               randconfig-a005-20211206
x86_64               randconfig-a001-20211206
x86_64               randconfig-a002-20211206
x86_64               randconfig-a004-20211206
x86_64               randconfig-a003-20211206
i386                 randconfig-a001-20211206
i386                 randconfig-a005-20211206
i386                 randconfig-a002-20211206
i386                 randconfig-a003-20211206
i386                 randconfig-a006-20211206
i386                 randconfig-a004-20211206
hexagon              randconfig-r045-20211206
hexagon              randconfig-r041-20211206

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
