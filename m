Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E881C024D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2020 18:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgD3QUU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Apr 2020 12:20:20 -0400
Received: from mga17.intel.com ([192.55.52.151]:33447 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727838AbgD3QUT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Apr 2020 12:20:19 -0400
IronPort-SDR: UVQBo87hKtV0Bt04hsZGDxLaVQxU+aLh36vMQqM+YLp5CMW2OqbBkkZYI64S3vEnydPd7OFdP4
 oYxnW3CsYbGA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2020 09:20:19 -0700
IronPort-SDR: k1FE7bEktxDwtLXn5WDuicYNweNmW+3gZlsDQ1VqQOJBaSCVWxp+1DjqCe2zfgldt/A86A9OWt
 7lAPl6RaDzbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,336,1583222400"; 
   d="scan'208";a="405457766"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Apr 2020 09:20:16 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jUBv5-0009kZ-LU; Fri, 01 May 2020 00:20:15 +0800
Date:   Fri, 01 May 2020 00:19:38 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:clk-renesas] BUILD SUCCESS
 e2f022c10ed3b50ba1d2bb1f037b0e7a84cb1c3e
Message-ID: <5eaafa9a.cOVixagMFnHzuyu2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  clk-renesas
branch HEAD: e2f022c10ed3b50ba1d2bb1f037b0e7a84cb1c3e  clk: renesas: rcar-gen2: Remove superfluous CLK_RENESAS_DIV6 selects

elapsed time: 480m

configs tested: 163
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
sparc                            allyesconfig
sh                               allmodconfig
ia64                             allmodconfig
mips                       capcella_defconfig
xtensa                       common_defconfig
parisc                generic-64bit_defconfig
ia64                          tiger_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              debian-10.3
ia64                                defconfig
ia64                              allnoconfig
ia64                        generic_defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
ia64                             alldefconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
m68k                       bvme6000_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
xtensa                          iss_defconfig
h8300                    h8300h-sim_defconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                            ar7_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
mips                malta_kvm_guest_defconfig
mips                         tb0287_defconfig
mips                           ip32_defconfig
mips                  decstation_64_defconfig
mips                      loongson3_defconfig
mips                          ath79_defconfig
mips                        bcm63xx_defconfig
parisc                            allnoconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                      chrp32_defconfig
powerpc                             defconfig
powerpc                       holly_defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
powerpc                           allnoconfig
powerpc                  mpc866_ads_defconfig
powerpc                    amigaone_defconfig
powerpc                    adder875_defconfig
powerpc                     ep8248e_defconfig
powerpc                          g5_defconfig
powerpc                     mpc512x_defconfig
parisc               randconfig-a001-20200430
mips                 randconfig-a001-20200430
m68k                 randconfig-a001-20200430
riscv                randconfig-a001-20200430
alpha                randconfig-a001-20200430
nds32                randconfig-a001-20200430
microblaze           randconfig-a001-20200430
nios2                randconfig-a001-20200430
h8300                randconfig-a001-20200430
c6x                  randconfig-a001-20200430
sparc64              randconfig-a001-20200430
s390                 randconfig-a001-20200430
xtensa               randconfig-a001-20200430
csky                 randconfig-a001-20200430
openrisc             randconfig-a001-20200430
sh                   randconfig-a001-20200430
i386                 randconfig-b001-20200430
i386                 randconfig-b002-20200430
x86_64               randconfig-b001-20200430
i386                 randconfig-b003-20200430
x86_64               randconfig-b002-20200430
x86_64               randconfig-b003-20200430
x86_64               randconfig-c001-20200430
i386                 randconfig-c001-20200430
i386                 randconfig-c002-20200430
x86_64               randconfig-c002-20200430
x86_64               randconfig-c003-20200430
i386                 randconfig-c003-20200430
x86_64               randconfig-d002-20200430
x86_64               randconfig-d001-20200430
i386                 randconfig-d001-20200430
i386                 randconfig-d003-20200430
i386                 randconfig-d002-20200430
x86_64               randconfig-d003-20200430
x86_64               randconfig-e002-20200430
i386                 randconfig-e003-20200430
x86_64               randconfig-e003-20200430
i386                 randconfig-e002-20200430
x86_64               randconfig-e001-20200430
i386                 randconfig-e001-20200430
i386                 randconfig-h002-20200430
i386                 randconfig-h003-20200430
x86_64               randconfig-h001-20200430
x86_64               randconfig-h003-20200430
i386                 randconfig-h001-20200430
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
