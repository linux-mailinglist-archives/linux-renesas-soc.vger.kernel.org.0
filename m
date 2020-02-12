Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A81515AC8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2020 17:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgBLQAm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Feb 2020 11:00:42 -0500
Received: from mga18.intel.com ([134.134.136.126]:57467 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727960AbgBLQAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Feb 2020 11:00:42 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Feb 2020 08:00:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,433,1574150400"; 
   d="scan'208";a="266714615"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Feb 2020 08:00:27 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j1uRA-00053h-3S; Thu, 13 Feb 2020 00:00:28 +0800
Date:   Wed, 12 Feb 2020 23:59:59 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-soc-for-v5.7] BUILD SUCCESS
 408324a3c5383716939eea8096a0f999a0665f7e
Message-ID: <5e4420ff.lXp8PST57g2wjVLm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-soc-for-v5.7
branch HEAD: 408324a3c5383716939eea8096a0f999a0665f7e  ARM: shmobile: Enable ARM_GLOBAL_TIMER on Cortex-A9 MPCore SoCs

elapsed time: 2880m

configs tested: 257
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
sparc                            allyesconfig
nds32                             allnoconfig
riscv                               defconfig
s390                          debug_defconfig
riscv                          rv32_defconfig
m68k                           sun3_defconfig
s390                             allyesconfig
arc                                 defconfig
sparc64                             defconfig
sh                          rsk7269_defconfig
sh                            titan_defconfig
alpha                               defconfig
i386                                defconfig
openrisc                 simple_smp_defconfig
parisc                            allnoconfig
m68k                       m5475evb_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
microblaze                      mmu_defconfig
s390                                defconfig
ia64                             allyesconfig
ia64                                defconfig
xtensa                          iss_defconfig
s390                             alldefconfig
nds32                               defconfig
sparc64                          allmodconfig
i386                             alldefconfig
m68k                          multi_defconfig
um                                  defconfig
parisc                              defconfig
s390                              allnoconfig
sparc                               defconfig
sh                               allmodconfig
h8300                       h8s-sim_defconfig
mips                              allnoconfig
powerpc                             defconfig
riscv                            allyesconfig
ia64                             alldefconfig
m68k                             allmodconfig
s390                       zfcpdump_defconfig
mips                      malta_kvm_defconfig
nios2                         10m50_defconfig
riscv                             allnoconfig
i386                              allnoconfig
i386                             allyesconfig
ia64                             allmodconfig
ia64                              allnoconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
xtensa                       common_defconfig
csky                                defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
arc                              allyesconfig
microblaze                    nommu_defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
parisc                           allyesconfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
x86_64               randconfig-a001-20200212
x86_64               randconfig-a002-20200212
x86_64               randconfig-a003-20200212
i386                 randconfig-a001-20200212
i386                 randconfig-a002-20200212
i386                 randconfig-a003-20200212
x86_64               randconfig-a001-20200211
x86_64               randconfig-a002-20200211
x86_64               randconfig-a003-20200211
i386                 randconfig-a001-20200211
i386                 randconfig-a002-20200211
i386                 randconfig-a003-20200211
alpha                randconfig-a001-20200210
m68k                 randconfig-a001-20200210
mips                 randconfig-a001-20200210
nds32                randconfig-a001-20200210
parisc               randconfig-a001-20200210
riscv                randconfig-a001-20200210
alpha                randconfig-a001-20200212
m68k                 randconfig-a001-20200212
nds32                randconfig-a001-20200212
parisc               randconfig-a001-20200212
riscv                randconfig-a001-20200212
alpha                randconfig-a001-20200211
m68k                 randconfig-a001-20200211
mips                 randconfig-a001-20200211
nds32                randconfig-a001-20200211
parisc               randconfig-a001-20200211
riscv                randconfig-a001-20200211
h8300                randconfig-a001-20200210
nios2                randconfig-a001-20200210
microblaze           randconfig-a001-20200210
sparc64              randconfig-a001-20200210
c6x                  randconfig-a001-20200210
c6x                  randconfig-a001-20200211
h8300                randconfig-a001-20200211
microblaze           randconfig-a001-20200211
nios2                randconfig-a001-20200211
sparc64              randconfig-a001-20200211
c6x                  randconfig-a001-20200212
h8300                randconfig-a001-20200212
microblaze           randconfig-a001-20200212
nios2                randconfig-a001-20200212
sparc64              randconfig-a001-20200212
csky                 randconfig-a001-20200211
openrisc             randconfig-a001-20200211
s390                 randconfig-a001-20200211
sh                   randconfig-a001-20200211
xtensa               randconfig-a001-20200211
csky                 randconfig-a001-20200212
openrisc             randconfig-a001-20200212
s390                 randconfig-a001-20200212
sh                   randconfig-a001-20200212
xtensa               randconfig-a001-20200212
x86_64               randconfig-b001-20200211
x86_64               randconfig-b002-20200211
x86_64               randconfig-b003-20200211
i386                 randconfig-b001-20200211
i386                 randconfig-b002-20200211
i386                 randconfig-b003-20200211
x86_64               randconfig-b001-20200212
x86_64               randconfig-b002-20200212
x86_64               randconfig-b003-20200212
i386                 randconfig-b001-20200212
i386                 randconfig-b002-20200212
i386                 randconfig-b003-20200212
x86_64               randconfig-c001-20200211
x86_64               randconfig-c002-20200211
x86_64               randconfig-c003-20200211
i386                 randconfig-c001-20200211
i386                 randconfig-c002-20200211
i386                 randconfig-c003-20200211
x86_64               randconfig-c001-20200212
x86_64               randconfig-c002-20200212
x86_64               randconfig-c003-20200212
i386                 randconfig-c001-20200212
i386                 randconfig-c002-20200212
i386                 randconfig-c003-20200212
x86_64               randconfig-c001-20200210
x86_64               randconfig-c002-20200210
x86_64               randconfig-c003-20200210
i386                 randconfig-c001-20200210
i386                 randconfig-c002-20200210
i386                 randconfig-c003-20200210
x86_64               randconfig-d001-20200211
x86_64               randconfig-d002-20200211
x86_64               randconfig-d003-20200211
i386                 randconfig-d001-20200211
i386                 randconfig-d002-20200211
i386                 randconfig-d003-20200211
x86_64               randconfig-d001-20200212
x86_64               randconfig-d002-20200212
x86_64               randconfig-d003-20200212
i386                 randconfig-d001-20200212
i386                 randconfig-d002-20200212
i386                 randconfig-d003-20200212
i386                 randconfig-e003-20200211
x86_64               randconfig-e001-20200211
x86_64               randconfig-e002-20200211
x86_64               randconfig-e003-20200211
i386                 randconfig-e001-20200211
i386                 randconfig-e002-20200211
x86_64               randconfig-e001-20200212
x86_64               randconfig-e002-20200212
x86_64               randconfig-e003-20200212
i386                 randconfig-e001-20200212
i386                 randconfig-e002-20200212
i386                 randconfig-e003-20200212
x86_64               randconfig-f001-20200212
x86_64               randconfig-f002-20200212
x86_64               randconfig-f003-20200212
i386                 randconfig-f001-20200212
i386                 randconfig-f002-20200212
i386                 randconfig-f003-20200212
x86_64               randconfig-f001-20200211
x86_64               randconfig-f002-20200211
x86_64               randconfig-f003-20200211
i386                 randconfig-f001-20200211
i386                 randconfig-f002-20200211
i386                 randconfig-f003-20200211
x86_64               randconfig-g001-20200211
x86_64               randconfig-g002-20200211
x86_64               randconfig-g003-20200211
i386                 randconfig-g001-20200211
i386                 randconfig-g002-20200211
i386                 randconfig-g003-20200211
x86_64               randconfig-g001-20200212
x86_64               randconfig-g002-20200212
x86_64               randconfig-g003-20200212
i386                 randconfig-g001-20200212
i386                 randconfig-g002-20200212
i386                 randconfig-g003-20200212
i386                 randconfig-h002-20200211
x86_64               randconfig-h002-20200211
i386                 randconfig-h001-20200211
x86_64               randconfig-h001-20200211
i386                 randconfig-h003-20200211
x86_64               randconfig-h003-20200211
x86_64               randconfig-h001-20200212
x86_64               randconfig-h002-20200212
x86_64               randconfig-h003-20200212
i386                 randconfig-h001-20200212
i386                 randconfig-h002-20200212
i386                 randconfig-h003-20200212
arc                  randconfig-a001-20200211
arm                  randconfig-a001-20200211
arm64                randconfig-a001-20200211
ia64                 randconfig-a001-20200211
powerpc              randconfig-a001-20200211
sparc                randconfig-a001-20200211
arc                  randconfig-a001-20200212
arm                  randconfig-a001-20200212
arm64                randconfig-a001-20200212
ia64                 randconfig-a001-20200212
powerpc              randconfig-a001-20200212
sparc                randconfig-a001-20200212
arc                  randconfig-a001-20200210
arm                  randconfig-a001-20200210
arm64                randconfig-a001-20200210
ia64                 randconfig-a001-20200210
powerpc              randconfig-a001-20200210
sparc                randconfig-a001-20200210
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
s390                             allmodconfig
sh                                allnoconfig
sh                  sh7785lcr_32bit_defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
um                             i386_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
