Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3376942EAA0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Oct 2021 09:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236315AbhJOHzk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Oct 2021 03:55:40 -0400
Received: from mga01.intel.com ([192.55.52.88]:23391 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236272AbhJOHzd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 03:55:33 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="251315995"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="251315995"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2021 00:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="442446224"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Oct 2021 00:53:22 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mbI1p-0007TI-KG; Fri, 15 Oct 2021 07:53:21 +0000
Date:   Fri, 15 Oct 2021 15:53:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 f9d9ae67a71d1c68b9961af72940aae2685f838b
Message-ID: <6169336b.DbNKH7vAmZfCSY6r%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: f9d9ae67a71d1c68b9961af72940aae2685f838b  Merge branch 'renesas-arm-dt-for-v5.16' into renesas-next

elapsed time: 1351m

configs tested: 126
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
sh                                  defconfig
powerpc                 linkstation_defconfig
powerpc                     mpc83xx_defconfig
ia64                            zx1_defconfig
sh                     sh7710voipgw_defconfig
sh                          polaris_defconfig
powerpc                     rainier_defconfig
arm                             ezx_defconfig
s390                             alldefconfig
mips                 decstation_r4k_defconfig
arm                          collie_defconfig
s390                       zfcpdump_defconfig
mips                        qi_lb60_defconfig
arm                  colibri_pxa270_defconfig
xtensa                         virt_defconfig
mips                         bigsur_defconfig
arc                              alldefconfig
m68k                            q40_defconfig
sh                        edosk7760_defconfig
mips                malta_qemu_32r6_defconfig
arm                         orion5x_defconfig
m68k                             allyesconfig
sh                          rsk7203_defconfig
sparc                            allyesconfig
mips                     loongson1c_defconfig
arm                         lpc32xx_defconfig
powerpc                     redwood_defconfig
powerpc                    klondike_defconfig
sh                          r7785rp_defconfig
powerpc                      katmai_defconfig
powerpc                     tqm8560_defconfig
arm                         nhk8815_defconfig
powerpc                         ps3_defconfig
openrisc                  or1klitex_defconfig
sh                          rsk7269_defconfig
mips                          rm200_defconfig
powerpc                     tqm8541_defconfig
nios2                         3c120_defconfig
mips                      fuloong2e_defconfig
powerpc                   lite5200b_defconfig
powerpc                        warp_defconfig
openrisc                    or1ksim_defconfig
m68k                          hp300_defconfig
powerpc                      arches_defconfig
riscv                          rv32_defconfig
sh                        sh7757lcr_defconfig
arm                  randconfig-c002-20211014
x86_64               randconfig-c001-20211014
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
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
arc                  randconfig-r043-20211014
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

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
