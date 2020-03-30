Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 207A31985D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2020 22:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbgC3UtY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Mar 2020 16:49:24 -0400
Received: from mga06.intel.com ([134.134.136.31]:40146 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727437AbgC3UtY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Mar 2020 16:49:24 -0400
IronPort-SDR: 4SJjSqXsS+84k/1pGT6IK9c58M1sBs5ggKmpAE4zdsvitpu7h4pag+kGKWrFnEeTac628jJALL
 rwQIZ1pL7Udg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 13:49:23 -0700
IronPort-SDR: gG0tOnYshdgaFqnRVwwDtdqWcVeM3lSYYlMnjJ8kTf/2N9+G+g/ZAZ3BIT6dIj3vavLqDcd+Da
 5kbh2HInRgDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; 
   d="scan'208";a="239917715"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Mar 2020 13:49:22 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jJ1LV-000Han-Ic; Tue, 31 Mar 2020 04:49:21 +0800
Date:   Tue, 31 Mar 2020 04:48:41 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm64-dt-for-v5.8] BUILD SUCCESS
 e27d7b515f70dbd8b220df8e836c811778a6d0c0
Message-ID: <5e825b29.Hqs26ucWwAnz7k0b%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm64-dt-for-v5.8
branch HEAD: e27d7b515f70dbd8b220df8e836c811778a6d0c0  arm64: dts: renesas: r8a77961: Add USB3.0 device nodes

elapsed time: 481m

configs tested: 124
configs skipped: 154

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                             allnoconfig
arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                               defconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
sparc                            allyesconfig
microblaze                    nommu_defconfig
sparc64                             defconfig
mips                              allnoconfig
ia64                              allnoconfig
nios2                         10m50_defconfig
parisc                generic-64bit_defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
x86_64               randconfig-a001-20200330
x86_64               randconfig-a002-20200330
x86_64               randconfig-a003-20200330
i386                 randconfig-a001-20200330
i386                 randconfig-a002-20200330
i386                 randconfig-a003-20200330
alpha                randconfig-a001-20200330
m68k                 randconfig-a001-20200330
mips                 randconfig-a001-20200330
nds32                randconfig-a001-20200330
parisc               randconfig-a001-20200330
riscv                randconfig-a001-20200330
csky                 randconfig-a001-20200330
openrisc             randconfig-a001-20200330
s390                 randconfig-a001-20200330
sh                   randconfig-a001-20200330
xtensa               randconfig-a001-20200330
x86_64               randconfig-b001-20200331
x86_64               randconfig-b002-20200331
x86_64               randconfig-b003-20200331
i386                 randconfig-b001-20200331
i386                 randconfig-b002-20200331
i386                 randconfig-b003-20200331
x86_64               randconfig-c001-20200330
x86_64               randconfig-c002-20200330
x86_64               randconfig-c003-20200330
i386                 randconfig-c001-20200330
i386                 randconfig-c002-20200330
i386                 randconfig-c003-20200330
x86_64               randconfig-d001-20200330
x86_64               randconfig-d002-20200330
x86_64               randconfig-d003-20200330
i386                 randconfig-d001-20200330
i386                 randconfig-d002-20200330
i386                 randconfig-d003-20200330
x86_64               randconfig-e001-20200330
x86_64               randconfig-e002-20200330
x86_64               randconfig-e003-20200330
i386                 randconfig-e001-20200330
i386                 randconfig-e002-20200330
i386                 randconfig-e003-20200330
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
arc                  randconfig-a001-20200330
arm                  randconfig-a001-20200330
arm64                randconfig-a001-20200330
ia64                 randconfig-a001-20200330
powerpc              randconfig-a001-20200330
sparc                randconfig-a001-20200330
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
i386                             allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
i386                             alldefconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
