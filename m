Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB80616F042
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2020 21:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbgBYUlC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Feb 2020 15:41:02 -0500
Received: from mga04.intel.com ([192.55.52.120]:23225 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726764AbgBYUlB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 15:41:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 12:41:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; 
   d="scan'208";a="271456356"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2020 12:40:59 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j6h0k-0005d2-RI; Wed, 26 Feb 2020 04:40:58 +0800
Date:   Wed, 26 Feb 2020 04:40:36 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 953ba160f7d31ad7369614614e0e012e7ddc8dd1
Message-ID: <5e558644.ots8UdvNUR+ffjiw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 953ba160f7d31ad7369614614e0e012e7ddc8dd1  Merge branch 'renesas-next', tag 'v5.6-rc3' into renesas-devel

elapsed time: 1768m

configs tested: 217
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
sh                  sh7785lcr_32bit_defconfig
h8300                     edosk2674_defconfig
i386                             alldefconfig
parisc                generic-32bit_defconfig
powerpc                             defconfig
riscv                               defconfig
sh                          rsk7269_defconfig
sparc64                          allyesconfig
arc                              allyesconfig
riscv                    nommu_virt_defconfig
powerpc                       ppc64_defconfig
ia64                             allyesconfig
um                             i386_defconfig
i386                             allyesconfig
s390                          debug_defconfig
m68k                       m5475evb_defconfig
parisc                generic-64bit_defconfig
parisc                            allnoconfig
microblaze                    nommu_defconfig
s390                       zfcpdump_defconfig
csky                                defconfig
h8300                       h8s-sim_defconfig
s390                             alldefconfig
mips                              allnoconfig
sh                               allmodconfig
arc                                 defconfig
ia64                                defconfig
nds32                             allnoconfig
sparc64                          allmodconfig
riscv                             allnoconfig
i386                                defconfig
i386                              allnoconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
nds32                               defconfig
h8300                    h8300h-sim_defconfig
m68k                             allmodconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200225
x86_64               randconfig-a002-20200225
x86_64               randconfig-a003-20200225
i386                 randconfig-a001-20200225
i386                 randconfig-a002-20200225
i386                 randconfig-a003-20200225
x86_64               randconfig-a001-20200224
x86_64               randconfig-a002-20200224
x86_64               randconfig-a003-20200224
i386                 randconfig-a002-20200224
i386                 randconfig-a001-20200224
i386                 randconfig-a003-20200224
alpha                randconfig-a001-20200225
m68k                 randconfig-a001-20200225
mips                 randconfig-a001-20200225
nds32                randconfig-a001-20200225
parisc               randconfig-a001-20200225
riscv                randconfig-a001-20200225
alpha                randconfig-a001-20200226
m68k                 randconfig-a001-20200226
mips                 randconfig-a001-20200226
nds32                randconfig-a001-20200226
parisc               randconfig-a001-20200226
riscv                randconfig-a001-20200226
c6x                  randconfig-a001-20200225
h8300                randconfig-a001-20200225
microblaze           randconfig-a001-20200225
nios2                randconfig-a001-20200225
sparc64              randconfig-a001-20200225
openrisc             randconfig-a001-20200224
sh                   randconfig-a001-20200224
s390                 randconfig-a001-20200224
xtensa               randconfig-a001-20200224
csky                 randconfig-a001-20200224
csky                 randconfig-a001-20200225
openrisc             randconfig-a001-20200225
s390                 randconfig-a001-20200225
sh                   randconfig-a001-20200225
xtensa               randconfig-a001-20200225
csky                 randconfig-a001-20200226
openrisc             randconfig-a001-20200226
s390                 randconfig-a001-20200226
sh                   randconfig-a001-20200226
xtensa               randconfig-a001-20200226
x86_64               randconfig-b001-20200225
x86_64               randconfig-b002-20200225
x86_64               randconfig-b003-20200225
i386                 randconfig-b001-20200225
i386                 randconfig-b002-20200225
i386                 randconfig-b003-20200225
x86_64               randconfig-b001-20200224
x86_64               randconfig-b002-20200224
x86_64               randconfig-b003-20200224
i386                 randconfig-b001-20200224
i386                 randconfig-b002-20200224
i386                 randconfig-b003-20200224
x86_64               randconfig-b001-20200226
x86_64               randconfig-b002-20200226
x86_64               randconfig-b003-20200226
i386                 randconfig-b001-20200226
i386                 randconfig-b002-20200226
i386                 randconfig-b003-20200226
x86_64               randconfig-c001-20200225
x86_64               randconfig-c002-20200225
x86_64               randconfig-c003-20200225
i386                 randconfig-c001-20200225
i386                 randconfig-c002-20200225
i386                 randconfig-c003-20200225
x86_64               randconfig-d001-20200225
x86_64               randconfig-d002-20200225
x86_64               randconfig-d003-20200225
i386                 randconfig-d001-20200225
i386                 randconfig-d002-20200225
i386                 randconfig-d003-20200225
x86_64               randconfig-e001-20200225
x86_64               randconfig-e002-20200225
x86_64               randconfig-e003-20200225
i386                 randconfig-e001-20200225
i386                 randconfig-e002-20200225
i386                 randconfig-e003-20200225
x86_64               randconfig-e002-20200224
i386                 randconfig-e001-20200224
x86_64               randconfig-e003-20200224
x86_64               randconfig-f001-20200225
x86_64               randconfig-f002-20200225
x86_64               randconfig-f003-20200225
i386                 randconfig-f001-20200225
i386                 randconfig-f002-20200225
i386                 randconfig-f003-20200225
x86_64               randconfig-f001-20200224
x86_64               randconfig-f002-20200224
x86_64               randconfig-f003-20200224
i386                 randconfig-f001-20200224
i386                 randconfig-f002-20200224
i386                 randconfig-f003-20200224
x86_64               randconfig-g001-20200225
x86_64               randconfig-g002-20200225
x86_64               randconfig-g003-20200225
i386                 randconfig-g001-20200225
i386                 randconfig-g002-20200225
i386                 randconfig-g003-20200225
x86_64               randconfig-h001-20200225
x86_64               randconfig-h002-20200225
x86_64               randconfig-h003-20200225
i386                 randconfig-h001-20200225
i386                 randconfig-h002-20200225
i386                 randconfig-h003-20200225
arc                  randconfig-a001-20200225
arm                  randconfig-a001-20200225
arm64                randconfig-a001-20200225
ia64                 randconfig-a001-20200225
powerpc              randconfig-a001-20200225
sparc                randconfig-a001-20200225
arc                  randconfig-a001-20200224
arm                  randconfig-a001-20200224
arm64                randconfig-a001-20200224
ia64                 randconfig-a001-20200224
powerpc              randconfig-a001-20200224
sparc                randconfig-a001-20200224
arm                  randconfig-a001-20200226
arm64                randconfig-a001-20200226
ia64                 randconfig-a001-20200226
powerpc              randconfig-a001-20200226
riscv                            allmodconfig
riscv                            allyesconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                                defconfig
sh                                allnoconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                             defconfig
um                                  defconfig
um                           x86_64_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
