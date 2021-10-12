Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 294F2429B8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 04:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbhJLCfT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 22:35:19 -0400
Received: from mga05.intel.com ([192.55.52.43]:14689 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230362AbhJLCfS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 22:35:18 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="313214269"
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; 
   d="scan'208";a="313214269"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2021 19:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; 
   d="scan'208";a="441660347"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Oct 2021 19:33:09 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ma7bI-0002yi-Rk; Tue, 12 Oct 2021 02:33:08 +0000
Date:   Tue, 12 Oct 2021 10:32:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.16] BUILD SUCCESS
 34cdc0edfe8f6d660e3c4c47d10f5506d08f09e1
Message-ID: <6164f3c4.7EBK09hYL927P15b%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.16
branch HEAD: 34cdc0edfe8f6d660e3c4c47d10f5506d08f09e1  arm64: dts: renesas: rzg2l-smarc: Enable microSD on SMARC platform

elapsed time: 721m

configs tested: 112
configs skipped: 96

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
i386                 randconfig-c001-20211011
powerpc              randconfig-c003-20211011
powerpc                     mpc5200_defconfig
powerpc                 mpc834x_itx_defconfig
mips                          rm200_defconfig
powerpc                       holly_defconfig
powerpc                    gamecube_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                       omap2plus_defconfig
arm                         mv78xx0_defconfig
arm                         orion5x_defconfig
xtensa                generic_kc705_defconfig
mips                         db1xxx_defconfig
mips                malta_qemu_32r6_defconfig
arm                         lubbock_defconfig
mips                         mpc30x_defconfig
ia64                         bigsur_defconfig
xtensa                    xip_kc705_defconfig
powerpc                 linkstation_defconfig
arc                         haps_hs_defconfig
m68k                       m5249evb_defconfig
mips                        vocore2_defconfig
sh                          rsk7203_defconfig
mips                      fuloong2e_defconfig
powerpc                      ppc64e_defconfig
xtensa                           alldefconfig
powerpc                           allnoconfig
powerpc                      tqm8xx_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                            mmp2_defconfig
arm                        mvebu_v5_defconfig
powerpc                        fsp2_defconfig
um                                  defconfig
m68k                        m5407c3_defconfig
arm                         assabet_defconfig
arm                        neponset_defconfig
sh                         ecovec24_defconfig
arm                  randconfig-c002-20211011
x86_64               randconfig-c001-20211011
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20211011
x86_64               randconfig-a012-20211011
x86_64               randconfig-a016-20211011
x86_64               randconfig-a014-20211011
x86_64               randconfig-a013-20211011
x86_64               randconfig-a011-20211011
i386                 randconfig-a016-20211011
i386                 randconfig-a014-20211011
i386                 randconfig-a011-20211011
i386                 randconfig-a015-20211011
i386                 randconfig-a012-20211011
i386                 randconfig-a013-20211011
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211011
mips                 randconfig-c004-20211011
i386                 randconfig-c001-20211011
s390                 randconfig-c005-20211011
x86_64               randconfig-c007-20211011
powerpc              randconfig-c003-20211011
riscv                randconfig-c006-20211011
i386                 randconfig-a001-20211011
i386                 randconfig-a003-20211011
i386                 randconfig-a004-20211011
i386                 randconfig-a005-20211011
i386                 randconfig-a002-20211011
i386                 randconfig-a006-20211011
x86_64               randconfig-a004-20211011
x86_64               randconfig-a006-20211011
x86_64               randconfig-a001-20211011
x86_64               randconfig-a005-20211011
x86_64               randconfig-a002-20211011
x86_64               randconfig-a003-20211011
hexagon              randconfig-r041-20211011
hexagon              randconfig-r045-20211011

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
