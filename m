Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD93139E968
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 00:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhFGWRX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 18:17:23 -0400
Received: from mga02.intel.com ([134.134.136.20]:19535 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231160AbhFGWRX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 18:17:23 -0400
IronPort-SDR: mdZzSRvIW90Sfv69k7sjjdAaVHaIo5a2oexE9w+BOaROsifV565FNXllri/qlNxssSEWDCBkmW
 vl493sJD1EQg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="191834341"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; 
   d="scan'208";a="191834341"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 15:15:31 -0700
IronPort-SDR: DMY6deHba1eyx0JVzawSQa1Zb7/Us6ye3sKlzZjl9M/ZPqQe6jUopxJ4HOUhsxB98XXeuqIqB5
 KwuF3mtobWBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; 
   d="scan'208";a="619089556"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 07 Jun 2021 15:15:30 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lqNWr-0008Xj-JP; Mon, 07 Jun 2021 22:15:29 +0000
Date:   Tue, 08 Jun 2021 06:15:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 0dc27258c7ad2021418a2aa43fb14a9dda2dd46d
Message-ID: <60be9a78.4UvLW1YutUOas/w9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 0dc27258c7ad2021418a2aa43fb14a9dda2dd46d  Merge branch 'renesas-next', tag 'v5.13-rc5' into renesas-devel

elapsed time: 730m

configs tested: 137
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7705_defconfig
um                             i386_defconfig
arc                            hsdk_defconfig
arm                          lpd270_defconfig
mips                  cavium_octeon_defconfig
arm                         lpc18xx_defconfig
mips                     decstation_defconfig
arm                          iop32x_defconfig
powerpc                   currituck_defconfig
powerpc                 canyonlands_defconfig
m68k                        m5407c3_defconfig
powerpc                     rainier_defconfig
arm                             rpc_defconfig
arm                            xcep_defconfig
sh                           sh2007_defconfig
h8300                            alldefconfig
arm                     davinci_all_defconfig
mips                      malta_kvm_defconfig
arm                          ep93xx_defconfig
alpha                            allyesconfig
powerpc                mpc7448_hpc2_defconfig
sh                        sh7757lcr_defconfig
powerpc                  mpc866_ads_defconfig
sh                 kfr2r09-romimage_defconfig
x86_64                           allyesconfig
arm                            lart_defconfig
mips                           ip32_defconfig
arm                        realview_defconfig
m68k                            mac_defconfig
powerpc                     tqm8548_defconfig
powerpc                     tqm8540_defconfig
arm                           sunxi_defconfig
x86_64                            allnoconfig
mips                  maltasmvp_eva_defconfig
sh                             espt_defconfig
x86_64                           alldefconfig
sh                        sh7785lcr_defconfig
powerpc                  iss476-smp_defconfig
powerpc                         ps3_defconfig
powerpc                     mpc5200_defconfig
m68k                       m5208evb_defconfig
sparc                       sparc64_defconfig
sh                          lboxre2_defconfig
sh                               alldefconfig
mips                           mtx1_defconfig
mips                           jazz_defconfig
powerpc                          g5_defconfig
arm                         mv78xx0_defconfig
s390                       zfcpdump_defconfig
arm                      footbridge_defconfig
sh                            hp6xx_defconfig
arm                           viper_defconfig
arm                         socfpga_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                        fsp2_defconfig
arm                         s5pv210_defconfig
mips                   sb1250_swarm_defconfig
powerpc                 linkstation_defconfig
ia64                        generic_defconfig
powerpc                     taishan_defconfig
arm                         palmz72_defconfig
arm                         lpc32xx_defconfig
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
i386                 randconfig-a003-20210607
i386                 randconfig-a006-20210607
i386                 randconfig-a004-20210607
i386                 randconfig-a001-20210607
i386                 randconfig-a002-20210607
i386                 randconfig-a005-20210607
x86_64               randconfig-a015-20210607
x86_64               randconfig-a011-20210607
x86_64               randconfig-a014-20210607
x86_64               randconfig-a012-20210607
x86_64               randconfig-a016-20210607
x86_64               randconfig-a013-20210607
i386                 randconfig-a015-20210607
i386                 randconfig-a013-20210607
i386                 randconfig-a011-20210607
i386                 randconfig-a016-20210607
i386                 randconfig-a014-20210607
i386                 randconfig-a012-20210607
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                            kunit_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210607
x86_64               randconfig-a002-20210607
x86_64               randconfig-a004-20210607
x86_64               randconfig-a003-20210607
x86_64               randconfig-a006-20210607
x86_64               randconfig-a005-20210607
x86_64               randconfig-a001-20210607

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
