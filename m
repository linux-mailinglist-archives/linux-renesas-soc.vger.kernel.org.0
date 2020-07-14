Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B91A521EE01
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2020 12:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgGNKcA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jul 2020 06:32:00 -0400
Received: from mga06.intel.com ([134.134.136.31]:35558 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726856AbgGNKcA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jul 2020 06:32:00 -0400
IronPort-SDR: 3VNrb5PihZxPpUroeGIVOq3tIztH3QCEEmKc9s0xCrZwv2YQqUdSBr+mBHilATazaUdi2y0mc+
 US4elu1GNkFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="210394944"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="210394944"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2020 03:31:57 -0700
IronPort-SDR: PHCJqIfjl4aLOY4HVwRAqscbbdQVv2ZAAiRQEt/+vUf7CPTkIcIut3mcmBybqdA8JOT2pU0g5t
 OtsoJfWPDnFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="285712507"
Received: from lkp-server02.sh.intel.com (HELO 393d9bdf0d5c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Jul 2020 03:31:56 -0700
Received: from kbuild by 393d9bdf0d5c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jvIE7-00003q-Sg; Tue, 14 Jul 2020 10:31:55 +0000
Date:   Tue, 14 Jul 2020 18:30:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:clk-renesas] BUILD SUCCESS
 c8a53fa1d211936ddcabf82ff991c18672b3d63a
Message-ID: <5f0d8958.oM4nGmF/CljFvstj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  clk-renesas
branch HEAD: c8a53fa1d211936ddcabf82ff991c18672b3d63a  clk: renesas: cpg-mssr: Add r8a774e1 support

elapsed time: 1306m

configs tested: 147
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
mips                         tb0287_defconfig
arm64                            alldefconfig
arm                        mini2440_defconfig
arm                            hisi_defconfig
powerpc                      ppc40x_defconfig
arm                         axm55xx_defconfig
arm                           sama5_defconfig
sh                         apsh4a3a_defconfig
riscv                    nommu_virt_defconfig
m68k                                defconfig
m68k                            mac_defconfig
mips                            gpr_defconfig
sh                          rsk7201_defconfig
arm                         hackkit_defconfig
arm                          gemini_defconfig
sparc                       sparc32_defconfig
openrisc                 simple_smp_defconfig
mips                         tb0219_defconfig
powerpc                     pq2fads_defconfig
arm                         bcm2835_defconfig
sh                             espt_defconfig
ia64                        generic_defconfig
sh                                  defconfig
sh                           se7712_defconfig
xtensa                          iss_defconfig
sparc64                          allmodconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     mpc5200_defconfig
mips                              allnoconfig
sh                        apsh4ad0a_defconfig
parisc                           alldefconfig
ia64                      gensparse_defconfig
sh                           se7721_defconfig
mips                         bigsur_defconfig
mips                           mtx1_defconfig
sh                          sdk7786_defconfig
xtensa                generic_kc705_defconfig
sh                          rsk7203_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200713
i386                 randconfig-a005-20200713
i386                 randconfig-a006-20200713
i386                 randconfig-a002-20200713
i386                 randconfig-a003-20200713
i386                 randconfig-a004-20200713
i386                 randconfig-a001-20200714
i386                 randconfig-a005-20200714
i386                 randconfig-a002-20200714
i386                 randconfig-a006-20200714
i386                 randconfig-a003-20200714
i386                 randconfig-a004-20200714
x86_64               randconfig-a005-20200713
x86_64               randconfig-a002-20200713
x86_64               randconfig-a006-20200713
x86_64               randconfig-a001-20200713
x86_64               randconfig-a003-20200713
x86_64               randconfig-a004-20200713
x86_64               randconfig-a012-20200714
x86_64               randconfig-a011-20200714
x86_64               randconfig-a016-20200714
x86_64               randconfig-a014-20200714
x86_64               randconfig-a013-20200714
x86_64               randconfig-a015-20200714
i386                 randconfig-a016-20200713
i386                 randconfig-a015-20200713
i386                 randconfig-a011-20200713
i386                 randconfig-a012-20200713
i386                 randconfig-a013-20200713
i386                 randconfig-a014-20200713
i386                 randconfig-a016-20200714
i386                 randconfig-a011-20200714
i386                 randconfig-a015-20200714
i386                 randconfig-a012-20200714
i386                 randconfig-a013-20200714
i386                 randconfig-a014-20200714
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
