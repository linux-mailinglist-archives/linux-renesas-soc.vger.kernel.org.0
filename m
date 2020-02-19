Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04F68164C7C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 18:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgBSRup (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 12:50:45 -0500
Received: from mga17.intel.com ([192.55.52.151]:23961 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbgBSRup (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 12:50:45 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Feb 2020 09:50:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; 
   d="scan'208";a="254173129"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Feb 2020 09:50:42 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j4TUg-0004zN-7T; Thu, 20 Feb 2020 01:50:42 +0800
Date:   Thu, 20 Feb 2020 01:50:23 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 c3f5f82f4dfcc32be7b2e7f9b593dad143e96d75
Message-ID: <5e4d755f.FFOsy2/vwJs5UXyO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  next
branch HEAD: c3f5f82f4dfcc32be7b2e7f9b593dad143e96d75  Merge branches 'renesas-arm-soc-for-v5.7' and 'renesas-drivers-for-v5.7' into renesas-next

elapsed time: 2888m

configs tested: 222
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
s390                       zfcpdump_defconfig
h8300                       h8s-sim_defconfig
riscv                            allyesconfig
mips                             allyesconfig
powerpc                             defconfig
sparc64                          allyesconfig
sh                            titan_defconfig
csky                                defconfig
nios2                         3c120_defconfig
riscv                               defconfig
ia64                                defconfig
um                                  defconfig
ia64                             allmodconfig
nds32                               defconfig
h8300                    h8300h-sim_defconfig
riscv                          rv32_defconfig
sh                               allmodconfig
sh                                allnoconfig
powerpc                       ppc64_defconfig
c6x                        evmc6678_defconfig
m68k                           sun3_defconfig
sparc64                             defconfig
s390                             allmodconfig
um                           x86_64_defconfig
alpha                               defconfig
ia64                              allnoconfig
powerpc                           allnoconfig
s390                              allnoconfig
i386                              allnoconfig
mips                             allmodconfig
riscv                             allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allyesconfig
c6x                              allyesconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
nds32                             allnoconfig
h8300                     edosk2674_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
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
alpha                randconfig-a001-20200219
m68k                 randconfig-a001-20200219
nds32                randconfig-a001-20200219
parisc               randconfig-a001-20200219
riscv                randconfig-a001-20200219
alpha                randconfig-a001-20200218
m68k                 randconfig-a001-20200218
mips                 randconfig-a001-20200218
nds32                randconfig-a001-20200218
parisc               randconfig-a001-20200218
riscv                randconfig-a001-20200218
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
x86_64               randconfig-e001-20200218
x86_64               randconfig-e002-20200218
x86_64               randconfig-e003-20200218
i386                 randconfig-e001-20200218
i386                 randconfig-e002-20200218
i386                 randconfig-e003-20200218
x86_64               randconfig-f001-20200219
x86_64               randconfig-f002-20200219
x86_64               randconfig-f003-20200219
i386                 randconfig-f001-20200219
i386                 randconfig-f002-20200219
i386                 randconfig-f003-20200219
x86_64               randconfig-f001-20200218
x86_64               randconfig-f002-20200218
x86_64               randconfig-f003-20200218
i386                 randconfig-f001-20200218
i386                 randconfig-f002-20200218
i386                 randconfig-f003-20200218
x86_64               randconfig-g001-20200219
x86_64               randconfig-g002-20200219
x86_64               randconfig-g003-20200219
i386                 randconfig-g001-20200219
i386                 randconfig-g002-20200219
i386                 randconfig-g003-20200219
x86_64               randconfig-g001-20200218
x86_64               randconfig-g002-20200218
x86_64               randconfig-g003-20200218
i386                 randconfig-g001-20200218
i386                 randconfig-g002-20200218
i386                 randconfig-g003-20200218
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
riscv                    nommu_virt_defconfig
s390                             alldefconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
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
