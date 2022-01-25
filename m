Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61DF49BE59
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 23:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233679AbiAYWTw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 17:19:52 -0500
Received: from mga12.intel.com ([192.55.52.136]:9488 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233719AbiAYWTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 17:19:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643149173; x=1674685173;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CgE5ZKXiXIw6xWMJEnNCsRLHJYiLoyWwyDogC3dJM9Y=;
  b=mwWi1YRGLFM8rJQffQob8fYtkgH4eHTtixx1coQDebqXf61Al6/qXKFO
   6FQvu1NUlKb81QFdYFZQt3YFM1OPLQ5gvWhJgjM1rKsxzfjiydSsba364
   oEXJT834veeCnWazvVPlDnwb1n8tsZCWXH6INEN1G1jbLwr9lyAStSHlm
   X1E1FY8a0/BPdGL/nVO84ubS7XN0A9zX/tZ7C3CFRmB+rJ3fKU2d/Hk0R
   koP5nGNDWIcb+CPx7etorYV3fsKsAaGyMvqvXsRRvw6iCDuInqIvhMtEi
   qWoDX7CXYnSBV1EVMY/FjWZAmnTY50jKyTrNYUlid0I/e3kYLnlOd2N/W
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="226405320"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="226405320"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 14:19:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="563208965"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Jan 2022 14:19:23 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nCU9r-000KUz-7s; Tue, 25 Jan 2022 22:19:23 +0000
Date:   Wed, 26 Jan 2022 06:19:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 ac6604366d67f174f4ba9d29aab00854ab78cb61
Message-ID: <61f07763.Ve+JGnVP2XglnQIP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: ac6604366d67f174f4ba9d29aab00854ab78cb61  Merge branch 'renesas-next' into renesas-devel

elapsed time: 729m

configs tested: 148
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220124
i386                          randconfig-c001
powerpc              randconfig-c003-20220124
sh                           se7206_defconfig
powerpc                     redwood_defconfig
arm                        spear6xx_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                          polaris_defconfig
mips                         rt305x_defconfig
arm                        mini2440_defconfig
ia64                             alldefconfig
arc                        nsimosci_defconfig
alpha                            alldefconfig
xtensa                          iss_defconfig
sh                           se7619_defconfig
mips                           gcw0_defconfig
xtensa                    smp_lx200_defconfig
sh                          r7780mp_defconfig
sh                             shx3_defconfig
sh                           se7724_defconfig
powerpc                     ep8248e_defconfig
sh                             espt_defconfig
powerpc                        warp_defconfig
sh                         ap325rxa_defconfig
mips                      fuloong2e_defconfig
riscv             nommu_k210_sdcard_defconfig
m68k                        m5272c3_defconfig
arc                          axs103_defconfig
openrisc                  or1klitex_defconfig
mips                  maltasmvp_eva_defconfig
mips                            ar7_defconfig
arm                       aspeed_g5_defconfig
powerpc                 mpc834x_itx_defconfig
xtensa                    xip_kc705_defconfig
sh                          lboxre2_defconfig
arm                  randconfig-c002-20220124
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a001-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arc                  randconfig-r043-20220124
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
s390                 randconfig-c005-20220124
riscv                randconfig-c006-20220124
powerpc                      katmai_defconfig
arm                           omap1_defconfig
arm                       mainstone_defconfig
mips                     cu1000-neo_defconfig
mips                  cavium_octeon_defconfig
mips                        omega2p_defconfig
mips                           mtx1_defconfig
powerpc                   lite5200b_defconfig
arm                   milbeaut_m10v_defconfig
mips                          malta_defconfig
powerpc                     mpc512x_defconfig
powerpc                     kmeter1_defconfig
arm                          imote2_defconfig
powerpc                        fsp2_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220125
hexagon              randconfig-r045-20220124
hexagon              randconfig-r041-20220125
hexagon              randconfig-r041-20220124
s390                 randconfig-r044-20220124

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
