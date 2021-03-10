Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D721336809
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 00:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233955AbhCJXrP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 18:47:15 -0500
Received: from mga17.intel.com ([192.55.52.151]:63766 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233902AbhCJXqt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 18:46:49 -0500
IronPort-SDR: LiDNoLgdytHyyzHrKWT5JrzXYCqB79J2XwzluEuyyZfarooE20oxsWoZseRHlrCcvmvJOvTUQ5
 6V691IBr3Eww==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="168501880"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; 
   d="scan'208";a="168501880"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 15:46:48 -0800
IronPort-SDR: 7zYw18dDZrxVyNctwptH0QkkxNzKKIrx1jC/Mt1e2Ahn+4rqzPJzqm43eeMOMQexnv5LfNfh4v
 DNyBBVJpRt1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; 
   d="scan'208";a="370371476"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Mar 2021 15:46:47 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lK8XO-0000SI-EQ; Wed, 10 Mar 2021 23:46:46 +0000
Date:   Thu, 11 Mar 2021 07:46:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk-for-v5.13] BUILD SUCCESS
 c66424ea75640a205c34d0ba6986307179516fd4
Message-ID: <60495a58.FRfAOhjoEna3c2iS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.13
branch HEAD: c66424ea75640a205c34d0ba6986307179516fd4  clk: renesas: r8a779a0: Add TSC clock

elapsed time: 727m

configs tested: 139
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sparc                            allyesconfig
mips                         db1xxx_defconfig
powerpc                     tqm8540_defconfig
powerpc                      ppc44x_defconfig
m68k                          hp300_defconfig
powerpc                    adder875_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                      ppc40x_defconfig
mips                      pistachio_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     pq2fads_defconfig
powerpc                      obs600_defconfig
powerpc                       holly_defconfig
powerpc                     kmeter1_defconfig
riscv                          rv32_defconfig
sh                          landisk_defconfig
sh                          rsk7264_defconfig
sh                          r7780mp_defconfig
m68k                        mvme16x_defconfig
powerpc                    mvme5100_defconfig
arm                             pxa_defconfig
powerpc                     tqm8541_defconfig
sh                          polaris_defconfig
powerpc                      ep88xc_defconfig
mips                       rbtx49xx_defconfig
powerpc                     mpc512x_defconfig
sh                                  defconfig
powerpc                 mpc832x_rdb_defconfig
arm                       cns3420vb_defconfig
m68k                       m5275evb_defconfig
h8300                               defconfig
mips                        bcm63xx_defconfig
sh                          urquell_defconfig
arc                    vdk_hs38_smp_defconfig
m68k                       bvme6000_defconfig
x86_64                              defconfig
arm                        spear3xx_defconfig
microblaze                          defconfig
powerpc                 mpc836x_mds_defconfig
sh                          lboxre2_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                            ar7_defconfig
powerpc                     asp8347_defconfig
powerpc                         wii_defconfig
arm                       versatile_defconfig
sh                         ap325rxa_defconfig
mips                           jazz_defconfig
arm                        multi_v5_defconfig
m68k                        m5272c3_defconfig
m68k                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210309
i386                 randconfig-a003-20210309
i386                 randconfig-a002-20210309
i386                 randconfig-a006-20210309
i386                 randconfig-a004-20210309
i386                 randconfig-a001-20210309
x86_64               randconfig-a013-20210309
x86_64               randconfig-a016-20210309
x86_64               randconfig-a015-20210309
x86_64               randconfig-a014-20210309
x86_64               randconfig-a011-20210309
x86_64               randconfig-a012-20210309
x86_64               randconfig-a011-20210310
x86_64               randconfig-a016-20210310
x86_64               randconfig-a013-20210310
x86_64               randconfig-a015-20210310
x86_64               randconfig-a014-20210310
x86_64               randconfig-a012-20210310
i386                 randconfig-a016-20210308
i386                 randconfig-a012-20210308
i386                 randconfig-a014-20210308
i386                 randconfig-a013-20210308
i386                 randconfig-a011-20210308
i386                 randconfig-a015-20210308
i386                 randconfig-a016-20210309
i386                 randconfig-a012-20210309
i386                 randconfig-a014-20210309
i386                 randconfig-a013-20210309
i386                 randconfig-a011-20210309
i386                 randconfig-a015-20210309
x86_64               randconfig-a006-20210308
x86_64               randconfig-a001-20210308
x86_64               randconfig-a004-20210308
x86_64               randconfig-a002-20210308
x86_64               randconfig-a005-20210308
x86_64               randconfig-a003-20210308
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210308
x86_64               randconfig-a016-20210308
x86_64               randconfig-a015-20210308
x86_64               randconfig-a014-20210308
x86_64               randconfig-a011-20210308
x86_64               randconfig-a012-20210308

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
