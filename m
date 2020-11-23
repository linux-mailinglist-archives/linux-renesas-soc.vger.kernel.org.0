Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212822C1835
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Nov 2020 23:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730278AbgKWWJB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Nov 2020 17:09:01 -0500
Received: from mga03.intel.com ([134.134.136.65]:5925 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729674AbgKWWJB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Nov 2020 17:09:01 -0500
IronPort-SDR: +BgsKcLvWhzZcz0tHzOY+lvI/ce7FFQkwm4wWRvuDNkKujsiG9M8Cgd9FYEwg50QpIZAAs3bvc
 IEa1U8/x2dSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="171950341"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
   d="scan'208";a="171950341"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 14:09:00 -0800
IronPort-SDR: ww1kJrmDafxGsDEbIJUzK59jFltr50oyE8H2zXdQhVyoNlu+Pherydm0NbeFhi67WRnIy6NRI2
 pmALkavBuxeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
   d="scan'208";a="342950909"
Received: from lkp-server01.sh.intel.com (HELO 1138cb5768e3) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Nov 2020 14:08:59 -0800
Received: from kbuild by 1138cb5768e3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1khK15-0000E5-1H; Mon, 23 Nov 2020 22:08:59 +0000
Date:   Tue, 24 Nov 2020 06:08:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 26f0dd5bcd4db7447dc38ce0203b2da2115a4fb3
Message-ID: <5fbc32f7.KyladswXQRvHr72W%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  renesas-clk
branch HEAD: 26f0dd5bcd4db7447dc38ce0203b2da2115a4fb3  clk: renesas: sh73a0: Stop using __raw_*() I/O accessors

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
m68k                          hp300_defconfig
arm                         bcm2835_defconfig
sh                               alldefconfig
m68k                         apollo_defconfig
sh                ecovec24-romimage_defconfig
powerpc                 mpc832x_mds_defconfig
arm                            zeus_defconfig
powerpc                   bluestone_defconfig
sh                         apsh4a3a_defconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
arm                         nhk8815_defconfig
xtensa                         virt_defconfig
sh                          r7780mp_defconfig
arm                       netwinder_defconfig
xtensa                              defconfig
arm                            u300_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                            pleb_defconfig
x86_64                           allyesconfig
sh                        apsh4ad0a_defconfig
xtensa                          iss_defconfig
powerpc                     skiroot_defconfig
powerpc                      makalu_defconfig
powerpc                        icon_defconfig
arm                         cm_x300_defconfig
arm64                            alldefconfig
mips                         tb0226_defconfig
powerpc                  iss476-smp_defconfig
sh                           se7724_defconfig
csky                             alldefconfig
arm                            dove_defconfig
m68k                           sun3_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     akebono_defconfig
arm                         s3c6400_defconfig
sparc                            alldefconfig
mips                           ip32_defconfig
sh                           se7721_defconfig
powerpc                      ep88xc_defconfig
mips                         bigsur_defconfig
powerpc                     pseries_defconfig
arm                           tegra_defconfig
powerpc                     kmeter1_defconfig
mips                 decstation_r4k_defconfig
c6x                         dsk6455_defconfig
mips                        qi_lb60_defconfig
arc                     nsimosci_hs_defconfig
riscv                            allmodconfig
mips                           gcw0_defconfig
mips                      fuloong2e_defconfig
powerpc                   lite5200b_defconfig
mips                          ath79_defconfig
arm                       mainstone_defconfig
sparc64                          alldefconfig
arm                         assabet_defconfig
arm                  colibri_pxa270_defconfig
powerpc                   motionpro_defconfig
powerpc                      chrp32_defconfig
sh                          rsk7269_defconfig
mips                malta_qemu_32r6_defconfig
arm                             rpc_defconfig
powerpc                     pq2fads_defconfig
powerpc                    socrates_defconfig
nds32                             allnoconfig
mips                         db1xxx_defconfig
i386                                defconfig
arc                              alldefconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201123
i386                 randconfig-a003-20201123
i386                 randconfig-a002-20201123
i386                 randconfig-a005-20201123
i386                 randconfig-a001-20201123
i386                 randconfig-a006-20201123
x86_64               randconfig-a015-20201123
x86_64               randconfig-a011-20201123
x86_64               randconfig-a014-20201123
x86_64               randconfig-a016-20201123
x86_64               randconfig-a012-20201123
x86_64               randconfig-a013-20201123
i386                 randconfig-a012-20201123
i386                 randconfig-a013-20201123
i386                 randconfig-a011-20201123
i386                 randconfig-a016-20201123
i386                 randconfig-a014-20201123
i386                 randconfig-a015-20201123
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20201123
x86_64               randconfig-a003-20201123
x86_64               randconfig-a004-20201123
x86_64               randconfig-a005-20201123
x86_64               randconfig-a002-20201123
x86_64               randconfig-a001-20201123

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
