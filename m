Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25853E51F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 06:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbhHJEUi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Aug 2021 00:20:38 -0400
Received: from mga03.intel.com ([134.134.136.65]:28089 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231705AbhHJEU2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 00:20:28 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="214859536"
X-IronPort-AV: E=Sophos;i="5.84,309,1620716400"; 
   d="scan'208";a="214859536"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 21:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,309,1620716400"; 
   d="scan'208";a="505994456"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Aug 2021 21:20:05 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mDJFE-000KCw-Hz; Tue, 10 Aug 2021 04:20:04 +0000
Date:   Tue, 10 Aug 2021 12:19:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 57ec7ff3f83a19aa366c58bd0f6a47a8844ac3fe
Message-ID: <6111fe5b.Z9nVrQ1NBToc9VUR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 57ec7ff3f83a19aa366c58bd0f6a47a8844ac3fe  Merge branch 'renesas-arm-dt-for-v5.15' into renesas-next

elapsed time: 722m

configs tested: 158
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7750_defconfig
powerpc                       ebony_defconfig
m68k                        m5407c3_defconfig
mips                             allyesconfig
arm                         at91_dt_defconfig
sh                               allmodconfig
arm                          iop32x_defconfig
powerpc                      mgcoge_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                               j2_defconfig
arm                            xcep_defconfig
ia64                      gensparse_defconfig
powerpc                 mpc85xx_cds_defconfig
arc                            hsdk_defconfig
arm                        realview_defconfig
arm                           spitz_defconfig
powerpc                   currituck_defconfig
arm                           viper_defconfig
powerpc                 mpc834x_mds_defconfig
arm                    vt8500_v6_v7_defconfig
arc                                 defconfig
arm                           corgi_defconfig
mips                           rs90_defconfig
powerpc                      acadia_defconfig
mips                            gpr_defconfig
mips                     cu1830-neo_defconfig
sh                         ap325rxa_defconfig
arm                       multi_v4t_defconfig
sh                              ul2_defconfig
powerpc64                        alldefconfig
sh                          polaris_defconfig
alpha                            alldefconfig
xtensa                    smp_lx200_defconfig
parisc                generic-32bit_defconfig
arm                          imote2_defconfig
mips                           ip28_defconfig
powerpc                     tqm8541_defconfig
i386                             alldefconfig
powerpc                      bamboo_defconfig
arm                          pxa910_defconfig
xtensa                         virt_defconfig
arm                         bcm2835_defconfig
sparc64                             defconfig
powerpc                      ppc40x_defconfig
mips                        nlm_xlp_defconfig
mips                         tb0219_defconfig
arm                        neponset_defconfig
powerpc                      tqm8xx_defconfig
arm                       omap2plus_defconfig
mips                         cobalt_defconfig
powerpc                     mpc5200_defconfig
arm                         shannon_defconfig
arc                     haps_hs_smp_defconfig
mips                        omega2p_defconfig
mips                      maltasmvp_defconfig
h8300                            allyesconfig
arm                       imx_v6_v7_defconfig
arm                       aspeed_g5_defconfig
powerpc                     rainier_defconfig
arm                          pcm027_defconfig
arm                         lubbock_defconfig
powerpc                     tqm5200_defconfig
sh                            titan_defconfig
powerpc                     taishan_defconfig
arm                            hisi_defconfig
x86_64                            allnoconfig
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
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210809
x86_64               randconfig-a004-20210809
x86_64               randconfig-a006-20210809
x86_64               randconfig-a003-20210809
x86_64               randconfig-a001-20210809
x86_64               randconfig-a005-20210809
i386                 randconfig-a004-20210809
i386                 randconfig-a005-20210809
i386                 randconfig-a006-20210809
i386                 randconfig-a002-20210809
i386                 randconfig-a001-20210809
i386                 randconfig-a003-20210809
i386                 randconfig-a004-20210808
i386                 randconfig-a005-20210808
i386                 randconfig-a006-20210808
i386                 randconfig-a002-20210808
i386                 randconfig-a001-20210808
i386                 randconfig-a003-20210808
x86_64               randconfig-a016-20210808
x86_64               randconfig-a012-20210808
x86_64               randconfig-a013-20210808
x86_64               randconfig-a011-20210808
x86_64               randconfig-a014-20210808
x86_64               randconfig-a015-20210808
i386                 randconfig-a012-20210809
i386                 randconfig-a015-20210809
i386                 randconfig-a011-20210809
i386                 randconfig-a013-20210809
i386                 randconfig-a014-20210809
i386                 randconfig-a016-20210809
i386                 randconfig-a012-20210808
i386                 randconfig-a015-20210808
i386                 randconfig-a011-20210808
i386                 randconfig-a013-20210808
i386                 randconfig-a014-20210808
i386                 randconfig-a016-20210808
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
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-c001-20210810
x86_64               randconfig-c001-20210809
x86_64               randconfig-c001-20210808
x86_64               randconfig-a016-20210809
x86_64               randconfig-a012-20210809
x86_64               randconfig-a013-20210809
x86_64               randconfig-a011-20210809
x86_64               randconfig-a014-20210809
x86_64               randconfig-a015-20210809

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
