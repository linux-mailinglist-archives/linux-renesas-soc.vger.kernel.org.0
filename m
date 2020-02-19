Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 119A6164C7E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 18:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgBSRur (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 12:50:47 -0500
Received: from mga18.intel.com ([134.134.136.126]:16746 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbgBSRur (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 12:50:47 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Feb 2020 09:50:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; 
   d="scan'208";a="224572359"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Feb 2020 09:50:43 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j4TUg-000530-Q7; Thu, 20 Feb 2020 01:50:42 +0800
Date:   Thu, 20 Feb 2020 01:50:15 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-soc-for-v5.7] BUILD SUCCESS
 92d8495ce9b79185e5fc512fe28768564eb81722
Message-ID: <5e4d7557.sAKsotHRLqqZIfZ4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-soc-for-v5.7
branch HEAD: 92d8495ce9b79185e5fc512fe28768564eb81722  ARM: shmobile: Replace <linux/clk-provider.h> by <linux/of_clk.h>

elapsed time: 2888m

configs tested: 216
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
nios2                         10m50_defconfig
xtensa                          iss_defconfig
h8300                       h8s-sim_defconfig
ia64                              allnoconfig
mips                             allyesconfig
powerpc                             defconfig
sparc64                          allyesconfig
microblaze                    nommu_defconfig
m68k                           sun3_defconfig
sh                            titan_defconfig
sh                               allmodconfig
i386                              allnoconfig
parisc                generic-32bit_defconfig
riscv                    nommu_virt_defconfig
ia64                                defconfig
um                                  defconfig
h8300                    h8300h-sim_defconfig
ia64                             alldefconfig
riscv                          rv32_defconfig
riscv                               defconfig
xtensa                       common_defconfig
sh                                allnoconfig
powerpc                       ppc64_defconfig
s390                                defconfig
c6x                        evmc6678_defconfig
csky                                defconfig
sparc64                             defconfig
s390                             allmodconfig
nds32                               defconfig
parisc                generic-64bit_defconfig
s390                          debug_defconfig
sh                  sh7785lcr_32bit_defconfig
um                           x86_64_defconfig
alpha                               defconfig
mips                              allnoconfig
mips                             allmodconfig
mips                      malta_kvm_defconfig
riscv                             allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
c6x                              allyesconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
nds32                             allnoconfig
h8300                     edosk2674_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                      fuloong2e_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200218
x86_64               randconfig-a002-20200218
x86_64               randconfig-a003-20200218
i386                 randconfig-a001-20200218
i386                 randconfig-a002-20200218
i386                 randconfig-a003-20200218
x86_64               randconfig-a001-20200219
x86_64               randconfig-a002-20200219
x86_64               randconfig-a003-20200219
i386                 randconfig-a001-20200219
i386                 randconfig-a002-20200219
i386                 randconfig-a003-20200219
alpha                randconfig-a001-20200218
m68k                 randconfig-a001-20200218
mips                 randconfig-a001-20200218
nds32                randconfig-a001-20200218
parisc               randconfig-a001-20200218
riscv                randconfig-a001-20200218
alpha                randconfig-a001-20200219
m68k                 randconfig-a001-20200219
nds32                randconfig-a001-20200219
parisc               randconfig-a001-20200219
riscv                randconfig-a001-20200219
c6x                  randconfig-a001-20200219
h8300                randconfig-a001-20200219
microblaze           randconfig-a001-20200219
nios2                randconfig-a001-20200219
sparc64              randconfig-a001-20200219
csky                 randconfig-a001-20200219
openrisc             randconfig-a001-20200219
s390                 randconfig-a001-20200219
xtensa               randconfig-a001-20200219
x86_64               randconfig-b001-20200218
x86_64               randconfig-b002-20200218
x86_64               randconfig-b003-20200218
i386                 randconfig-b001-20200218
i386                 randconfig-b002-20200218
i386                 randconfig-b003-20200218
x86_64               randconfig-b001-20200219
x86_64               randconfig-b002-20200219
x86_64               randconfig-b003-20200219
i386                 randconfig-b001-20200219
i386                 randconfig-b002-20200219
i386                 randconfig-b003-20200219
x86_64               randconfig-c001-20200219
x86_64               randconfig-c002-20200219
x86_64               randconfig-c003-20200219
i386                 randconfig-c001-20200219
i386                 randconfig-c002-20200219
i386                 randconfig-c003-20200219
x86_64               randconfig-c001-20200218
x86_64               randconfig-c002-20200218
x86_64               randconfig-c003-20200218
i386                 randconfig-c001-20200218
i386                 randconfig-c002-20200218
i386                 randconfig-c003-20200218
x86_64               randconfig-d001-20200219
x86_64               randconfig-d002-20200219
x86_64               randconfig-d003-20200219
i386                 randconfig-d001-20200219
i386                 randconfig-d002-20200219
i386                 randconfig-d003-20200219
x86_64               randconfig-d001-20200218
x86_64               randconfig-d002-20200218
x86_64               randconfig-d003-20200218
i386                 randconfig-d001-20200218
i386                 randconfig-d002-20200218
i386                 randconfig-d003-20200218
x86_64               randconfig-e001-20200219
x86_64               randconfig-e002-20200219
x86_64               randconfig-e003-20200219
i386                 randconfig-e001-20200219
i386                 randconfig-e002-20200219
i386                 randconfig-e003-20200219
x86_64               randconfig-f001-20200218
x86_64               randconfig-f002-20200218
x86_64               randconfig-f003-20200218
i386                 randconfig-f001-20200218
i386                 randconfig-f002-20200218
i386                 randconfig-f003-20200218
x86_64               randconfig-f001-20200219
x86_64               randconfig-f002-20200219
x86_64               randconfig-f003-20200219
i386                 randconfig-f001-20200219
i386                 randconfig-f002-20200219
i386                 randconfig-f003-20200219
x86_64               randconfig-g001-20200218
x86_64               randconfig-g002-20200218
x86_64               randconfig-g003-20200218
i386                 randconfig-g001-20200218
i386                 randconfig-g002-20200218
i386                 randconfig-g003-20200218
x86_64               randconfig-g001-20200219
x86_64               randconfig-g002-20200219
x86_64               randconfig-g003-20200219
i386                 randconfig-g001-20200219
i386                 randconfig-g002-20200219
i386                 randconfig-g003-20200219
x86_64               randconfig-h001-20200218
x86_64               randconfig-h002-20200218
x86_64               randconfig-h003-20200218
i386                 randconfig-h001-20200218
i386                 randconfig-h002-20200218
i386                 randconfig-h003-20200218
x86_64               randconfig-h001-20200219
x86_64               randconfig-h002-20200219
x86_64               randconfig-h003-20200219
i386                 randconfig-h001-20200219
i386                 randconfig-h002-20200219
i386                 randconfig-h003-20200219
arc                  randconfig-a001-20200219
arm                  randconfig-a001-20200219
arm64                randconfig-a001-20200219
ia64                 randconfig-a001-20200219
powerpc              randconfig-a001-20200219
sparc                randconfig-a001-20200219
arc                  randconfig-a001-20200218
arm                  randconfig-a001-20200218
arm64                randconfig-a001-20200218
ia64                 randconfig-a001-20200218
powerpc              randconfig-a001-20200218
sparc                randconfig-a001-20200218
riscv                            allmodconfig
riscv                            allyesconfig
s390                             alldefconfig
s390                              allnoconfig
s390                             allyesconfig
s390                       zfcpdump_defconfig
sh                          rsk7269_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
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
