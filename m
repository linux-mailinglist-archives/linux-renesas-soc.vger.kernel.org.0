Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 990A02B5691
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 03:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgKQCIh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Nov 2020 21:08:37 -0500
Received: from mga07.intel.com ([134.134.136.100]:38754 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgKQCIh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 21:08:37 -0500
IronPort-SDR: tJVgECZkFqgqihA84Wfdpb3OO815y0RU87vUxobNP/gfQc1X7NcZOMzpcXDYPwpZsvqAOf+4Mk
 g7Y3/+VfEslA==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="234998628"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
   d="scan'208";a="234998628"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 18:08:31 -0800
IronPort-SDR: 6wDmXiuENruk+52eoig4ZAy0Y4VpLOu8mnP1XRm1Mrt2llolfWUiTyEtkcj9PFpMDGpzP25RrO
 DkYpOt8gJH/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
   d="scan'208";a="358695708"
Received: from lkp-server01.sh.intel.com (HELO 5abab2bd15ab) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Nov 2020 18:08:28 -0800
Received: from kbuild by 5abab2bd15ab with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1keqQ0-00001W-4z; Tue, 17 Nov 2020 02:08:28 +0000
Date:   Tue, 17 Nov 2020 10:07:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 2a323cdab73739ab28725e19129d440c6db35fc4
Message-ID: <5fb33078.r5+oCBUBRTI+Y2N8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 2a323cdab73739ab28725e19129d440c6db35fc4  Merge tag 'v5.10-rc4' into renesas-devel

elapsed time: 723m

configs tested: 167
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     tqm8541_defconfig
arm                            qcom_defconfig
ia64                        generic_defconfig
m68k                         amcore_defconfig
arm                      footbridge_defconfig
mips                     cu1830-neo_defconfig
arm                         socfpga_defconfig
nios2                         10m50_defconfig
powerpc                 mpc8315_rdb_defconfig
xtensa                  nommu_kc705_defconfig
sh                          rsk7203_defconfig
arm                       netwinder_defconfig
arm                     am200epdkit_defconfig
m68k                            q40_defconfig
m68k                       m5475evb_defconfig
arm                       cns3420vb_defconfig
arm                        mini2440_defconfig
arm                        vexpress_defconfig
mips                  decstation_64_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                         bigsur_defconfig
sh                           sh2007_defconfig
mips                        bcm63xx_defconfig
arc                                 defconfig
nios2                         3c120_defconfig
sh                          landisk_defconfig
arm                          ep93xx_defconfig
arm                         lpc32xx_defconfig
arm                  colibri_pxa270_defconfig
arm                              alldefconfig
arm                        shmobile_defconfig
openrisc                            defconfig
sh                         microdev_defconfig
sh                             espt_defconfig
powerpc                     tqm8555_defconfig
mips                         tb0219_defconfig
arc                      axs103_smp_defconfig
mips                        qi_lb60_defconfig
m68k                            mac_defconfig
mips                          ath79_defconfig
sh                         ecovec24_defconfig
mips                           xway_defconfig
riscv                             allnoconfig
powerpc                     mpc512x_defconfig
m68k                          hp300_defconfig
arm                          gemini_defconfig
arm                      tct_hammer_defconfig
mips                        bcm47xx_defconfig
arm                            zeus_defconfig
arm                     eseries_pxa_defconfig
sh                               alldefconfig
arm                           h3600_defconfig
arm                        neponset_defconfig
mips                        jmr3927_defconfig
powerpc                       holly_defconfig
xtensa                          iss_defconfig
powerpc                     mpc83xx_defconfig
mips                      bmips_stb_defconfig
powerpc                   lite5200b_defconfig
sh                        apsh4ad0a_defconfig
s390                             alldefconfig
arm                           sunxi_defconfig
powerpc                  mpc885_ads_defconfig
arm                           h5000_defconfig
arm                          simpad_defconfig
powerpc                     ppa8548_defconfig
sh                          rsk7264_defconfig
powerpc                     tqm5200_defconfig
mips                            e55_defconfig
powerpc                     tqm8560_defconfig
sh                     sh7710voipgw_defconfig
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
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20201116
x86_64               randconfig-a005-20201116
x86_64               randconfig-a004-20201116
x86_64               randconfig-a002-20201116
x86_64               randconfig-a001-20201116
x86_64               randconfig-a006-20201116
i386                 randconfig-a006-20201116
i386                 randconfig-a005-20201116
i386                 randconfig-a001-20201116
i386                 randconfig-a002-20201116
i386                 randconfig-a004-20201116
i386                 randconfig-a003-20201116
i386                 randconfig-a006-20201115
i386                 randconfig-a005-20201115
i386                 randconfig-a001-20201115
i386                 randconfig-a002-20201115
i386                 randconfig-a004-20201115
i386                 randconfig-a003-20201115
x86_64               randconfig-a015-20201115
x86_64               randconfig-a011-20201115
x86_64               randconfig-a016-20201115
x86_64               randconfig-a012-20201115
x86_64               randconfig-a014-20201115
x86_64               randconfig-a013-20201115
i386                 randconfig-a012-20201116
i386                 randconfig-a014-20201116
i386                 randconfig-a016-20201116
i386                 randconfig-a011-20201116
i386                 randconfig-a015-20201116
i386                 randconfig-a013-20201116
i386                 randconfig-a012-20201115
i386                 randconfig-a014-20201115
i386                 randconfig-a016-20201115
i386                 randconfig-a011-20201115
i386                 randconfig-a015-20201115
i386                 randconfig-a013-20201115
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
x86_64               randconfig-a003-20201115
x86_64               randconfig-a005-20201115
x86_64               randconfig-a004-20201115
x86_64               randconfig-a002-20201115
x86_64               randconfig-a001-20201115
x86_64               randconfig-a006-20201115
x86_64               randconfig-a015-20201116
x86_64               randconfig-a011-20201116
x86_64               randconfig-a014-20201116
x86_64               randconfig-a013-20201116
x86_64               randconfig-a016-20201116
x86_64               randconfig-a012-20201116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
