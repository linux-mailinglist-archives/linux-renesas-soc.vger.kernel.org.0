Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6AFA25E3E6
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Sep 2020 00:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgIDWyK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Sep 2020 18:54:10 -0400
Received: from mga03.intel.com ([134.134.136.65]:21434 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728120AbgIDWyJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 18:54:09 -0400
IronPort-SDR: a00a3oeoaX33D5uLiOraRwpofFkhf8ubW04GzC7cDeGbGzlLZfkmFCRAq8qwh4HPUJp993BSjj
 rGcygkrp8qEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9734"; a="157831977"
X-IronPort-AV: E=Sophos;i="5.76,391,1592895600"; 
   d="scan'208";a="157831977"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2020 15:54:08 -0700
IronPort-SDR: OLgG71URVD9JwEPY8dun+9FdEPCO1v/5d5H6VuSj4nuzMqk/rocA4ShAyoY5pmnOx3TFj/KIhT
 S0jF01hGHLiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,391,1592895600"; 
   d="scan'208";a="342352466"
Received: from lkp-server02.sh.intel.com (HELO c089623da072) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Sep 2020 15:54:07 -0700
Received: from kbuild by c089623da072 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kEKas-00009v-ID; Fri, 04 Sep 2020 22:54:06 +0000
Date:   Sat, 05 Sep 2020 06:53:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:sh-pfc] BUILD SUCCESS
 b9d7f1448846a98d49a5567536febbef297b20b2
Message-ID: <5f52c577.SjfRGVk0I/uJVmMz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  sh-pfc
branch HEAD: b9d7f1448846a98d49a5567536febbef297b20b2  pinctrl: rza1: Switch to using "output-enable"

elapsed time: 722m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     mpc5200_defconfig
arm                         hackkit_defconfig
mips                            ar7_defconfig
arm                           h5000_defconfig
mips                 decstation_r4k_defconfig
i386                             alldefconfig
powerpc                      pasemi_defconfig
powerpc                       ppc64_defconfig
parisc                generic-32bit_defconfig
arm                         assabet_defconfig
powerpc                  mpc866_ads_defconfig
nds32                             allnoconfig
parisc                generic-64bit_defconfig
arm                         lpc32xx_defconfig
arm                          moxart_defconfig
arm                            lart_defconfig
sh                            shmin_defconfig
ia64                            zx1_defconfig
arc                     nsimosci_hs_defconfig
arm                           h3600_defconfig
h8300                               defconfig
arm                       spear13xx_defconfig
arm                         orion5x_defconfig
arm                              alldefconfig
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
riscv                               defconfig
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
