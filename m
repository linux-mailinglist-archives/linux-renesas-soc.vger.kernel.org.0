Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6F62E0307
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 00:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgLUXu4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 18:50:56 -0500
Received: from mga01.intel.com ([192.55.52.88]:29954 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726016AbgLUXu4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 18:50:56 -0500
IronPort-SDR: oQCRsGzkdPFWW7i8m2yAsg+V/SOpTqGdqGqWUO3IF5k1ACjLjbmNH5KFWQhqT6zy9lzMMZu0e6
 yY/QJuJVpRkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="194230466"
X-IronPort-AV: E=Sophos;i="5.78,437,1599548400"; 
   d="scan'208";a="194230466"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2020 15:50:14 -0800
IronPort-SDR: trs8rEqN5yzIVpQeiTu8jOMxVrPpEaeg3t9ffjjDiqo0gSAijujM8OBNcDdI60ZCc/YXZ9CDf+
 xUQaN937DTDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,437,1599548400"; 
   d="scan'208";a="560543880"
Received: from lkp-server01.sh.intel.com (HELO 65587561063d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Dec 2020 15:50:12 -0800
Received: from kbuild by 65587561063d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1krUwN-0001AV-MS; Mon, 21 Dec 2020 23:50:11 +0000
Date:   Tue, 22 Dec 2020 07:49:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.12] BUILD SUCCESS
 a979b5e3e587ee26db64eeda644febe7544b0d1f
Message-ID: <5fe1347a.yU5GH7xOz+xMOKa0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.12
branch HEAD: a979b5e3e587ee26db64eeda644febe7544b0d1f  arm64: dts: renesas: beacon: Correct I2C bus speeds

elapsed time: 724m

configs tested: 104
configs skipped: 56

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
i386                 randconfig-a005-20201222
i386                 randconfig-a002-20201222
i386                 randconfig-a006-20201222
i386                 randconfig-a004-20201222
i386                 randconfig-a003-20201222
i386                 randconfig-a001-20201222
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
