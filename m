Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8951B4618
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2020 15:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgDVNRg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Apr 2020 09:17:36 -0400
Received: from mga11.intel.com ([192.55.52.93]:42931 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbgDVNRf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Apr 2020 09:17:35 -0400
IronPort-SDR: v+kwyFga20tLxsMJ6R4OOl78MyPgScpUgR5qyhcTmTixbgw//3ymSIQ/bIUlSg6hywIaX0QRJT
 t3HkfV11YPmg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 06:17:35 -0700
IronPort-SDR: RcDUNWGmPdZAxGRe/FADCJ0USIRTBnkvL1X3P6RVKxU8RHYigU0dqJQ/bB/K+Im8qcVwBbdm4Q
 mCoW3V9Gqe4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; 
   d="scan'208";a="429908289"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Apr 2020 06:17:34 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jRFFt-0006Ts-EB; Wed, 22 Apr 2020 21:17:33 +0800
Date:   Wed, 22 Apr 2020 21:17:25 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.8] BUILD SUCCESS
 124eb5dc4ca5f4beeef1c0f29f3a053a0d0f5e46
Message-ID: <5ea043e5.upuCeRGVy49aWN4d%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.8
branch HEAD: 124eb5dc4ca5f4beeef1c0f29f3a053a0d0f5e46  ARM: dts: r8a7791: Add PWM device nodes

elapsed time: 2923m

configs tested: 117
configs skipped: 159

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                             allnoconfig
arm                               allnoconfig
arm64                            allmodconfig
arm                              allmodconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
ia64                          tiger_defconfig
ia64                              allnoconfig
i386                              allnoconfig
sparc                               defconfig
s390                             allmodconfig
sh                  sh7785lcr_32bit_defconfig
ia64                        generic_defconfig
parisc                            allnoconfig
mips                       capcella_defconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
ia64                             alldefconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                            ar7_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
parisc                           allmodconfig
parisc               randconfig-a001-20200422
mips                 randconfig-a001-20200422
alpha                randconfig-a001-20200422
m68k                 randconfig-a001-20200422
riscv                randconfig-a001-20200422
nds32                randconfig-a001-20200422
nios2                randconfig-a001-20200422
h8300                randconfig-a001-20200422
c6x                  randconfig-a001-20200422
sparc64              randconfig-a001-20200422
microblaze           randconfig-a001-20200422
x86_64               randconfig-a001-20200420
i386                 randconfig-a003-20200420
x86_64               randconfig-a003-20200420
i386                 randconfig-a002-20200420
i386                 randconfig-a001-20200420
x86_64               randconfig-a002-20200420
x86_64               randconfig-f002-20200422
i386                 randconfig-f002-20200422
x86_64               randconfig-f003-20200422
i386                 randconfig-f003-20200422
i386                 randconfig-f001-20200422
x86_64               randconfig-f001-20200422
i386                 randconfig-g003-20200422
x86_64               randconfig-g001-20200422
i386                 randconfig-g001-20200422
x86_64               randconfig-g002-20200422
i386                 randconfig-g002-20200422
x86_64               randconfig-g003-20200422
i386                 randconfig-h003-20200422
x86_64               randconfig-h001-20200422
x86_64               randconfig-h003-20200422
x86_64               randconfig-h002-20200422
i386                 randconfig-h001-20200422
i386                 randconfig-h002-20200422
sparc                randconfig-a001-20200421
ia64                 randconfig-a001-20200421
powerpc              randconfig-a001-20200421
arm                  randconfig-a001-20200421
arc                  randconfig-a001-20200421
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
s390                             alldefconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                                allnoconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
