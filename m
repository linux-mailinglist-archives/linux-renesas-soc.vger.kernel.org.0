Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B79BF42EAE2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Oct 2021 10:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236575AbhJOIF3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Oct 2021 04:05:29 -0400
Received: from mga05.intel.com ([192.55.52.43]:14550 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236454AbhJOIDc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 04:03:32 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="314069496"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="314069496"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2021 01:01:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="660379539"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Oct 2021 01:01:22 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mbI9Z-0007Ti-OO; Fri, 15 Oct 2021 08:01:21 +0000
Date:   Fri, 15 Oct 2021 16:01:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.16] BUILD SUCCESS
 12ee3118871f9ddc75e5551e85c5de7fd5c7f86a
Message-ID: <61693545.WNbhhC8mD/VuU/m2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.16
branch HEAD: 12ee3118871f9ddc75e5551e85c5de7fd5c7f86a  arm64: dts: renesas: rcar-gen3e: Add Cortex-A57 2 GHz opps

elapsed time: 1358m

configs tested: 73
configs skipped: 94

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211014
sh                                  defconfig
powerpc                 linkstation_defconfig
powerpc                     mpc83xx_defconfig
ia64                            zx1_defconfig
sh                     sh7710voipgw_defconfig
sh                          rsk7203_defconfig
sparc                            allyesconfig
mips                     loongson1c_defconfig
arm                         lpc32xx_defconfig
powerpc                         ps3_defconfig
openrisc                  or1klitex_defconfig
sh                          rsk7269_defconfig
mips                          rm200_defconfig
arm                  randconfig-c002-20211014
x86_64               randconfig-c001-20211014
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211014
x86_64               randconfig-a004-20211014
x86_64               randconfig-a001-20211014
x86_64               randconfig-a005-20211014
x86_64               randconfig-a002-20211014
x86_64               randconfig-a003-20211014
i386                 randconfig-a003-20211014
i386                 randconfig-a001-20211014
i386                 randconfig-a005-20211014
i386                 randconfig-a004-20211014
i386                 randconfig-a002-20211014
i386                 randconfig-a006-20211014
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20211014
x86_64               randconfig-a015-20211014
x86_64               randconfig-a016-20211014
x86_64               randconfig-a014-20211014
x86_64               randconfig-a011-20211014
x86_64               randconfig-a013-20211014
i386                 randconfig-a016-20211014
i386                 randconfig-a014-20211014
i386                 randconfig-a011-20211014
i386                 randconfig-a015-20211014
i386                 randconfig-a012-20211014
i386                 randconfig-a013-20211014
hexagon              randconfig-r041-20211014
s390                 randconfig-r044-20211014
riscv                randconfig-r042-20211014
hexagon              randconfig-r045-20211014

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
