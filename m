Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAECA4624CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Nov 2021 23:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbhK2W16 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Nov 2021 17:27:58 -0500
Received: from mga02.intel.com ([134.134.136.20]:53884 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232936AbhK2W1m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 17:27:42 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="223316282"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="223316282"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 14:24:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="476887399"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Nov 2021 14:24:22 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mrp4P-000CQA-E8; Mon, 29 Nov 2021 22:24:21 +0000
Date:   Tue, 30 Nov 2021 06:23:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 6a9c878a0d6706f56258f8a8b084df215b5bda0e
Message-ID: <61a552eb.CCfeAV3eE73sEmJH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 6a9c878a0d6706f56258f8a8b084df215b5bda0e  Merge tag 'v5.16-rc3' into renesas-devel

elapsed time: 722m

configs tested: 167
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211128
arm                             mxs_defconfig
arm                         mv78xx0_defconfig
mips                          ath79_defconfig
arm                              alldefconfig
sh                 kfr2r09-romimage_defconfig
arm                     davinci_all_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      cm5200_defconfig
mips                        qi_lb60_defconfig
sh                           se7619_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                        icon_defconfig
mips                         tb0219_defconfig
arm                            qcom_defconfig
mips                           xway_defconfig
parisc                generic-64bit_defconfig
powerpc                      makalu_defconfig
arm                         s3c6400_defconfig
powerpc                         wii_defconfig
xtensa                  nommu_kc705_defconfig
sh                          r7785rp_defconfig
arm                        mvebu_v7_defconfig
x86_64                              defconfig
arm                       versatile_defconfig
microblaze                      mmu_defconfig
arm                         orion5x_defconfig
mips                           ip22_defconfig
s390                       zfcpdump_defconfig
powerpc                    socrates_defconfig
riscv             nommu_k210_sdcard_defconfig
sparc                       sparc32_defconfig
mips                         cobalt_defconfig
sh                           se7722_defconfig
arc                                 defconfig
mips                        omega2p_defconfig
parisc                           allyesconfig
powerpc                 linkstation_defconfig
arm                     am200epdkit_defconfig
powerpc                     ksi8560_defconfig
powerpc                     redwood_defconfig
mips                           gcw0_defconfig
arm                       imx_v6_v7_defconfig
arm                           h5000_defconfig
mips                           rs90_defconfig
openrisc                            defconfig
arm                          pcm027_defconfig
powerpc                        warp_defconfig
mips                 decstation_r4k_defconfig
arm                         axm55xx_defconfig
arc                        vdk_hs38_defconfig
arm                         socfpga_defconfig
ia64                          tiger_defconfig
powerpc64                        alldefconfig
powerpc                       maple_defconfig
openrisc                  or1klitex_defconfig
powerpc                       ebony_defconfig
sparc                            allyesconfig
xtensa                              defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         shannon_defconfig
sh                          rsk7203_defconfig
arm                           u8500_defconfig
arm                        cerfcube_defconfig
m68k                        m5272c3_defconfig
arm                  randconfig-c002-20211128
arm                  randconfig-c002-20211130
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20211129
i386                 randconfig-a002-20211129
i386                 randconfig-a006-20211129
i386                 randconfig-a005-20211129
i386                 randconfig-a004-20211129
i386                 randconfig-a003-20211129
x86_64               randconfig-a011-20211128
x86_64               randconfig-a014-20211128
x86_64               randconfig-a012-20211128
x86_64               randconfig-a016-20211128
x86_64               randconfig-a013-20211128
x86_64               randconfig-a015-20211128
i386                 randconfig-a015-20211128
i386                 randconfig-a016-20211128
i386                 randconfig-a013-20211128
i386                 randconfig-a012-20211128
i386                 randconfig-a014-20211128
i386                 randconfig-a011-20211128
arc                  randconfig-r043-20211129
arc                  randconfig-r043-20211128
s390                 randconfig-r044-20211128
riscv                randconfig-r042-20211128
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20211128
x86_64               randconfig-a003-20211128
x86_64               randconfig-a005-20211128
x86_64               randconfig-a004-20211128
x86_64               randconfig-a002-20211128
x86_64               randconfig-a006-20211128
i386                 randconfig-a001-20211128
i386                 randconfig-a002-20211128
i386                 randconfig-a006-20211128
i386                 randconfig-a005-20211128
i386                 randconfig-a004-20211128
i386                 randconfig-a003-20211128
x86_64               randconfig-a011-20211129
x86_64               randconfig-a014-20211129
x86_64               randconfig-a012-20211129
x86_64               randconfig-a013-20211129
x86_64               randconfig-a015-20211129
x86_64               randconfig-a016-20211129
i386                 randconfig-a015-20211129
i386                 randconfig-a016-20211129
i386                 randconfig-a013-20211129
i386                 randconfig-a012-20211129
i386                 randconfig-a014-20211129
i386                 randconfig-a011-20211129
hexagon              randconfig-r045-20211129
hexagon              randconfig-r041-20211129
s390                 randconfig-r044-20211129
riscv                randconfig-r042-20211129

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
