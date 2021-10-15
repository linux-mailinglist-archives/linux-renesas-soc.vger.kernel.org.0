Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BA542E514
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Oct 2021 02:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbhJOAOY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Oct 2021 20:14:24 -0400
Received: from mga05.intel.com ([192.55.52.43]:64892 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229718AbhJOAOY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 20:14:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="314014328"
X-IronPort-AV: E=Sophos;i="5.85,374,1624345200"; 
   d="scan'208";a="314014328"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2021 17:11:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,374,1624345200"; 
   d="scan'208";a="492248600"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Oct 2021 17:11:54 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mbApF-0006tG-VS; Fri, 15 Oct 2021 00:11:53 +0000
Date:   Fri, 15 Oct 2021 08:11:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 a4201b7c5b9316d0d22476708aea607cdfa47515
Message-ID: <6168c719./RePa03LYkVDYxPu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: a4201b7c5b9316d0d22476708aea607cdfa47515  Merge branches 'renesas-next' and 'topic/renesas-defconfig' into renesas-devel

elapsed time: 889m

configs tested: 107
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211014
mips                  cavium_octeon_defconfig
arm                         socfpga_defconfig
sh                          sdk7786_defconfig
m68k                          sun3x_defconfig
m68k                         amcore_defconfig
powerpc                    mvme5100_defconfig
parisc                generic-64bit_defconfig
powerpc                   microwatt_defconfig
powerpc                        cell_defconfig
mips                        vocore2_defconfig
sh                        sh7757lcr_defconfig
powerpc                         ps3_defconfig
openrisc                  or1klitex_defconfig
sh                          rsk7269_defconfig
mips                          rm200_defconfig
arm                         shannon_defconfig
powerpc                  mpc885_ads_defconfig
microblaze                          defconfig
arm                      jornada720_defconfig
arm                            qcom_defconfig
mips                      fuloong2e_defconfig
arm                       aspeed_g5_defconfig
xtensa                       common_defconfig
powerpc                      ppc44x_defconfig
arm                  randconfig-c002-20211014
x86_64               randconfig-c001-20211014
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
i386                 randconfig-a003-20211014
i386                 randconfig-a001-20211014
i386                 randconfig-a005-20211014
i386                 randconfig-a004-20211014
i386                 randconfig-a002-20211014
i386                 randconfig-a006-20211014
x86_64               randconfig-a006-20211014
x86_64               randconfig-a004-20211014
x86_64               randconfig-a001-20211014
x86_64               randconfig-a005-20211014
x86_64               randconfig-a002-20211014
x86_64               randconfig-a003-20211014
arc                  randconfig-r043-20211014
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
