Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F12841D532
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Sep 2021 10:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348914AbhI3II4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Sep 2021 04:08:56 -0400
Received: from mga03.intel.com ([134.134.136.65]:11659 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349043AbhI3IIq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Sep 2021 04:08:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="225203306"
X-IronPort-AV: E=Sophos;i="5.85,335,1624345200"; 
   d="scan'208";a="225203306"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2021 01:05:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,335,1624345200"; 
   d="scan'208";a="479770169"
Received: from lkp-server02.sh.intel.com (HELO f7acefbbae94) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 30 Sep 2021 01:05:49 -0700
Received: from kbuild by f7acefbbae94 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mVr4f-00042L-8C; Thu, 30 Sep 2021 08:05:49 +0000
Date:   Thu, 30 Sep 2021 16:05:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 3f00f8a6b8301c0c021c503a3cc308ba8195ee7d
Message-ID: <61556fc4.UKzpvExTTUnf1opF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 3f00f8a6b8301c0c021c503a3cc308ba8195ee7d  Merge branch 'renesas-next' into renesas-devel

elapsed time: 811m

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
i386                 randconfig-c001-20210929
sh                      rts7751r2d1_defconfig
nios2                            alldefconfig
arm                         s3c6400_defconfig
mips                        qi_lb60_defconfig
arm                          lpd270_defconfig
arm                            qcom_defconfig
arm                            pleb_defconfig
powerpc                     sequoia_defconfig
xtensa                  audio_kc705_defconfig
sh                          polaris_defconfig
arm                            lart_defconfig
sh                         microdev_defconfig
powerpc                     pseries_defconfig
arm                        spear3xx_defconfig
mips                           ip27_defconfig
sh                           se7724_defconfig
mips                      pic32mzda_defconfig
m68k                       m5249evb_defconfig
mips                           ip32_defconfig
x86_64               randconfig-c001-20210929
arm                  randconfig-c002-20210929
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210929
i386                 randconfig-a005-20210929
i386                 randconfig-a002-20210929
i386                 randconfig-a006-20210929
i386                 randconfig-a004-20210929
i386                 randconfig-a003-20210929
x86_64               randconfig-a002-20210929
x86_64               randconfig-a005-20210929
x86_64               randconfig-a001-20210929
x86_64               randconfig-a006-20210929
x86_64               randconfig-a003-20210929
x86_64               randconfig-a004-20210929
arc                  randconfig-r043-20210929
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210929
x86_64               randconfig-a011-20210929
x86_64               randconfig-a013-20210929
x86_64               randconfig-a015-20210929
x86_64               randconfig-a012-20210929
x86_64               randconfig-a016-20210929
i386                 randconfig-a014-20210929
i386                 randconfig-a013-20210929
i386                 randconfig-a016-20210929
i386                 randconfig-a011-20210929
i386                 randconfig-a015-20210929
i386                 randconfig-a012-20210929
hexagon              randconfig-r045-20210929
riscv                randconfig-r042-20210929
hexagon              randconfig-r041-20210929
s390                 randconfig-r044-20210929

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
