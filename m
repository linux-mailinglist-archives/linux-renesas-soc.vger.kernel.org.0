Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE7C1982A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2020 19:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgC3Rqy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Mar 2020 13:46:54 -0400
Received: from mga01.intel.com ([192.55.52.88]:19144 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728075AbgC3Rqy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Mar 2020 13:46:54 -0400
IronPort-SDR: vkNn77n/HACeBAYiUl96oJc/j0EgAOlLsvs6YbJimSaNE5uudvkOYjDBCTnBARQFodRg0RHw6G
 cCmyK48Df2vQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 10:46:53 -0700
IronPort-SDR: EbQqPnqW6x8K2q/kbDSItvVpfpnGA0Xek9NvbmQ3hOg8FkcK5b51YGr/XYjEGYT1kzinuT4IQA
 Gm2vL27YKyWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; 
   d="scan'208";a="248777033"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Mar 2020 10:46:51 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jIyUs-000Iqz-UM; Tue, 31 Mar 2020 01:46:50 +0800
Date:   Tue, 31 Mar 2020 01:46:36 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:clk-renesas] BUILD SUCCESS
 99cbbd136c6df9c762dc951ea556bd7b8b68ae2f
Message-ID: <5e82307c.ZbcrP3zTps/KcpRn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  clk-renesas
branch HEAD: 99cbbd136c6df9c762dc951ea556bd7b8b68ae2f  dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add r8a77961 support

elapsed time: 484m

configs tested: 163
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
ia64                             allmodconfig
sh                                allnoconfig
ia64                                defconfig
powerpc                             defconfig
riscv                               defconfig
ia64                              allnoconfig
nios2                         10m50_defconfig
c6x                              allyesconfig
parisc                generic-64bit_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allyesconfig
c6x                        evmc6678_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
m68k                       m5475evb_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
x86_64               randconfig-a001-20200330
x86_64               randconfig-a002-20200330
x86_64               randconfig-a003-20200330
i386                 randconfig-a001-20200330
i386                 randconfig-a002-20200330
i386                 randconfig-a003-20200330
alpha                randconfig-a001-20200330
m68k                 randconfig-a001-20200330
nds32                randconfig-a001-20200330
parisc               randconfig-a001-20200330
riscv                randconfig-a001-20200330
microblaze           randconfig-a001-20200330
h8300                randconfig-a001-20200330
nios2                randconfig-a001-20200330
c6x                  randconfig-a001-20200330
sparc64              randconfig-a001-20200330
csky                 randconfig-a001-20200330
openrisc             randconfig-a001-20200330
s390                 randconfig-a001-20200330
sh                   randconfig-a001-20200330
xtensa               randconfig-a001-20200330
x86_64               randconfig-b001-20200330
x86_64               randconfig-b002-20200330
x86_64               randconfig-b003-20200330
i386                 randconfig-b001-20200330
i386                 randconfig-b002-20200330
i386                 randconfig-b003-20200330
i386                 randconfig-c003-20200330
x86_64               randconfig-c003-20200330
x86_64               randconfig-c002-20200330
i386                 randconfig-c002-20200330
x86_64               randconfig-c001-20200330
i386                 randconfig-c001-20200330
x86_64               randconfig-d001-20200330
x86_64               randconfig-d002-20200330
x86_64               randconfig-d003-20200330
i386                 randconfig-d001-20200330
i386                 randconfig-d002-20200330
i386                 randconfig-d003-20200330
x86_64               randconfig-e001-20200330
i386                 randconfig-e002-20200330
x86_64               randconfig-e003-20200330
i386                 randconfig-e003-20200330
x86_64               randconfig-e002-20200330
i386                 randconfig-e001-20200330
x86_64               randconfig-f001-20200330
x86_64               randconfig-f002-20200330
x86_64               randconfig-f003-20200330
i386                 randconfig-f001-20200330
i386                 randconfig-f002-20200330
i386                 randconfig-f003-20200330
x86_64               randconfig-g001-20200330
x86_64               randconfig-g002-20200330
x86_64               randconfig-g003-20200330
i386                 randconfig-g001-20200330
i386                 randconfig-g002-20200330
i386                 randconfig-g003-20200330
x86_64               randconfig-h001-20200330
x86_64               randconfig-h002-20200330
x86_64               randconfig-h003-20200330
i386                 randconfig-h001-20200330
i386                 randconfig-h002-20200330
i386                 randconfig-h003-20200330
sparc                randconfig-a001-20200330
arm64                randconfig-a001-20200330
ia64                 randconfig-a001-20200330
arc                  randconfig-a001-20200330
arm                  randconfig-a001-20200330
powerpc              randconfig-a001-20200330
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                            titan_defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                  sh7785lcr_32bit_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
