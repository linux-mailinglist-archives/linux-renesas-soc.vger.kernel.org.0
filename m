Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C3936CD59
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Apr 2021 22:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237071AbhD0U4z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Apr 2021 16:56:55 -0400
Received: from mga17.intel.com ([192.55.52.151]:25806 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237072AbhD0U4z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Apr 2021 16:56:55 -0400
IronPort-SDR: VCP/ludKH0dQSsFCvdSryapggmjw/hWKd6ZCPgDmiYvlw6l+hegaOiFW2WMbWw3zmWXkUOUm84
 3qLF/Z75X/CQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="176707592"
X-IronPort-AV: E=Sophos;i="5.82,255,1613462400"; 
   d="scan'208";a="176707592"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2021 13:56:11 -0700
IronPort-SDR: 0tWnDHUcSOtgaAW3mr5WthM5Msa/va41gc3VI0vaxQXlxe21+W6fB3l04+SFe+wpo3ICZsfE7I
 Kt5WSnhLgZqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,255,1613462400"; 
   d="scan'208";a="465626206"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Apr 2021 13:56:08 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lbUkZ-0006eZ-HG; Tue, 27 Apr 2021 20:56:07 +0000
Date:   Wed, 28 Apr 2021 04:55:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.14] BUILD SUCCESS
 6f20125402c75d2d97e096b344e26330cbce4e71
Message-ID: <60887a4d.+/hcA9+btC8iYF1f%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.14
branch HEAD: 6f20125402c75d2d97e096b344e26330cbce4e71  arm64: dts: renesas: condor: Switch eMMC bus to 1V8

elapsed time: 723m

configs tested: 102
configs skipped: 83

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm                       imx_v4_v5_defconfig
mips                         tb0219_defconfig
arm                           u8500_defconfig
m68k                            q40_defconfig
mips                     loongson1c_defconfig
arm                       spear13xx_defconfig
sh                          r7780mp_defconfig
sparc                            alldefconfig
arm                          pxa168_defconfig
mips                       lemote2f_defconfig
xtensa                  cadence_csp_defconfig
sh                           se7206_defconfig
powerpc                    socrates_defconfig
sh                           se7712_defconfig
arm                     am200epdkit_defconfig
powerpc                 mpc834x_mds_defconfig
arm                            lart_defconfig
arm                            xcep_defconfig
xtensa                    xip_kc705_defconfig
arm                        spear6xx_defconfig
powerpc64                           defconfig
mips                             allyesconfig
arm                       cns3420vb_defconfig
powerpc                      katmai_defconfig
powerpc                    sam440ep_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                       holly_defconfig
arm                       netwinder_defconfig
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
mips                             allmodconfig
i386                 randconfig-a005-20210426
i386                 randconfig-a002-20210426
i386                 randconfig-a001-20210426
i386                 randconfig-a006-20210426
i386                 randconfig-a004-20210426
i386                 randconfig-a003-20210426
x86_64               randconfig-a015-20210426
x86_64               randconfig-a016-20210426
x86_64               randconfig-a011-20210426
x86_64               randconfig-a014-20210426
x86_64               randconfig-a012-20210426
x86_64               randconfig-a013-20210426
i386                 randconfig-a014-20210426
i386                 randconfig-a012-20210426
i386                 randconfig-a011-20210426
i386                 randconfig-a013-20210426
i386                 randconfig-a015-20210426
i386                 randconfig-a016-20210426
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210426
x86_64               randconfig-a004-20210426
x86_64               randconfig-a001-20210426
x86_64               randconfig-a006-20210426
x86_64               randconfig-a005-20210426
x86_64               randconfig-a003-20210426

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
