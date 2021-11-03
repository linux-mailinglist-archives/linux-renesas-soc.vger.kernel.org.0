Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F197D443BA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Nov 2021 04:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhKCDDm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Nov 2021 23:03:42 -0400
Received: from mga14.intel.com ([192.55.52.115]:23117 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229462AbhKCDDm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 23:03:42 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="231673584"
X-IronPort-AV: E=Sophos;i="5.87,204,1631602800"; 
   d="scan'208";a="231673584"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 20:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,204,1631602800"; 
   d="scan'208";a="667361457"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Nov 2021 20:01:04 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mi6WM-00058u-T5; Wed, 03 Nov 2021 03:01:02 +0000
Date:   Wed, 03 Nov 2021 11:00:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 02973f48c8a362e36239fdea0d3b06f1f564a46a
Message-ID: <6181fb5c.GQMFA6p0Hk3yKFL+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 02973f48c8a362e36239fdea0d3b06f1f564a46a  [LOCAL] arm64: defconfig: Update renesas_defconfig

elapsed time: 721m

configs tested: 114
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
arc                        vdk_hs38_defconfig
mips                          rb532_defconfig
sh                   sh7724_generic_defconfig
sh                          rsk7269_defconfig
mips                      fuloong2e_defconfig
sh                             sh03_defconfig
sh                        apsh4ad0a_defconfig
sh                         microdev_defconfig
arc                    vdk_hs38_smp_defconfig
m68k                          multi_defconfig
powerpc                      pcm030_defconfig
arm                       versatile_defconfig
arm                           tegra_defconfig
mips                            ar7_defconfig
powerpc                          g5_defconfig
mips                        maltaup_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                 mpc832x_mds_defconfig
arm                         s3c2410_defconfig
sh                        dreamcast_defconfig
mips                 decstation_r4k_defconfig
mips                        bcm63xx_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                   secureedge5410_defconfig
ia64                          tiger_defconfig
arm                          collie_defconfig
powerpc                      obs600_defconfig
arm                       cns3420vb_defconfig
sparc                       sparc64_defconfig
sparc                       sparc32_defconfig
mips                           ip22_defconfig
arm                  randconfig-c002-20211101
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                              debian-10.3
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211101
x86_64               randconfig-a016-20211101
x86_64               randconfig-a012-20211101
x86_64               randconfig-a013-20211101
x86_64               randconfig-a011-20211101
x86_64               randconfig-a014-20211101
i386                 randconfig-a014-20211101
i386                 randconfig-a013-20211101
i386                 randconfig-a011-20211101
i386                 randconfig-a012-20211101
i386                 randconfig-a016-20211101
i386                 randconfig-a015-20211101
arc                  randconfig-r043-20211101
riscv                randconfig-r042-20211101
s390                 randconfig-r044-20211101
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20211101
i386                 randconfig-a005-20211101
i386                 randconfig-a006-20211101
i386                 randconfig-a001-20211101
i386                 randconfig-a003-20211101
i386                 randconfig-a004-20211101
i386                 randconfig-a002-20211101
x86_64               randconfig-a004-20211101
x86_64               randconfig-a001-20211101
x86_64               randconfig-a002-20211101
x86_64               randconfig-a003-20211101
x86_64               randconfig-a005-20211101
hexagon              randconfig-r041-20211101
hexagon              randconfig-r045-20211101

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
