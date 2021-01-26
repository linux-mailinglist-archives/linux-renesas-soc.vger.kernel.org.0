Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B62305534
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jan 2021 09:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234506AbhA0IDu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Jan 2021 03:03:50 -0500
Received: from mga12.intel.com ([192.55.52.136]:45957 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S316561AbhAZXUV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 18:20:21 -0500
IronPort-SDR: 9G8wtJRV2WJxhLip8gB+hDwB+zM1HSmaD9Mm+F0XrLviJnj4gNdMX4Vg3qH/+MtMCEtrMzU4uZ
 2X09KOFtoE8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="159160872"
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; 
   d="scan'208";a="159160872"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 15:16:15 -0800
IronPort-SDR: NxRUESdkkYYDPJzbXlkn7Iqpn18D6DnOMpRB47QNNiszJEZXl43ByCsP/qyJ3E1nUlUokZ7Qy2
 Erhpgsi+Y05w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; 
   d="scan'208";a="393889486"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 26 Jan 2021 15:16:14 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l4XZF-00018E-M4; Tue, 26 Jan 2021 23:16:13 +0000
Date:   Wed, 27 Jan 2021 07:15:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 27061b9ede03072796190d99f00a7fad4f57f184
Message-ID: <6010a29a.tJsDAVL9rT0V9KGj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 27061b9ede03072796190d99f00a7fad4f57f184  Merge branch 'renesas-next' into renesas-devel

elapsed time: 726m

configs tested: 101
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                          gemini_defconfig
arm                      tct_hammer_defconfig
mips                        qi_lb60_defconfig
arm                           omap1_defconfig
arm                       versatile_defconfig
mips                           ip27_defconfig
powerpc                     tqm5200_defconfig
sh                            shmin_defconfig
arm                         s3c2410_defconfig
sh                            migor_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                         vf610m4_defconfig
m68k                            mac_defconfig
powerpc                        cell_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                    adder875_defconfig
ia64                                defconfig
m68k                        mvme16x_defconfig
mips                           ci20_defconfig
riscv                            allyesconfig
arm                             pxa_defconfig
sh                          landisk_defconfig
sh                           se7712_defconfig
sparc                            alldefconfig
powerpc                      bamboo_defconfig
arm                         assabet_defconfig
ia64                             allmodconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210126
i386                 randconfig-a002-20210126
i386                 randconfig-a004-20210126
i386                 randconfig-a006-20210126
i386                 randconfig-a003-20210126
i386                 randconfig-a005-20210126
x86_64               randconfig-a012-20210126
x86_64               randconfig-a016-20210126
x86_64               randconfig-a015-20210126
x86_64               randconfig-a011-20210126
x86_64               randconfig-a013-20210126
x86_64               randconfig-a014-20210126
i386                 randconfig-a013-20210126
i386                 randconfig-a011-20210126
i386                 randconfig-a012-20210126
i386                 randconfig-a015-20210126
i386                 randconfig-a014-20210126
i386                 randconfig-a016-20210126
riscv                    nommu_k210_defconfig
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
x86_64               randconfig-a003-20210126
x86_64               randconfig-a002-20210126
x86_64               randconfig-a001-20210126
x86_64               randconfig-a005-20210126
x86_64               randconfig-a006-20210126
x86_64               randconfig-a004-20210126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
