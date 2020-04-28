Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB771BB3AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2020 04:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgD1CBy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Apr 2020 22:01:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:61272 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726233AbgD1CBx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Apr 2020 22:01:53 -0400
IronPort-SDR: ILg2PfNbXe9BZ1+3jfUi4UIKllTL+tMMTNqV9vVaNUk94GIvy2lIVXSQ5P6vCqD81Kp+q3d3pZ
 1KP/ypNOuZuA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2020 19:01:52 -0700
IronPort-SDR: OycYZOcrFFZstYz/kgARO+TOyMSHABWO68vg9zkIM8pMUNJ1J7DvWiDlU7MSYNvzCISJE5Jte9
 mUIGsm7h1mtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,326,1583222400"; 
   d="scan'208";a="302573925"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2020 19:01:51 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jTFZH-0003vC-2W; Tue, 28 Apr 2020 10:01:51 +0800
Date:   Tue, 28 Apr 2020 10:01:16 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.8] BUILD SUCCESS
 cf8ae446bbcbf5c48214eb7ddaa6ac6e12f4633d
Message-ID: <5ea78e6c.P+DdEBe53QwcHbRs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.8
branch HEAD: cf8ae446bbcbf5c48214eb7ddaa6ac6e12f4633d  arm64: dts: renesas: Fix IOMMU device node names

elapsed time: 885m

configs tested: 158
configs skipped: 159

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
powerpc                             defconfig
ia64                                defconfig
i386                             alldefconfig
h8300                    h8300h-sim_defconfig
mips                              allnoconfig
riscv                             allnoconfig
i386                                defconfig
i386                              allnoconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                              allnoconfig
ia64                        generic_defconfig
ia64                          tiger_defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
ia64                             alldefconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
mips                malta_kvm_guest_defconfig
mips                         tb0287_defconfig
mips                       capcella_defconfig
mips                           ip32_defconfig
mips                  decstation_64_defconfig
mips                      loongson3_defconfig
mips                          ath79_defconfig
mips                        bcm63xx_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                            ar7_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
parisc                           allmodconfig
parisc               randconfig-a001-20200427
alpha                randconfig-a001-20200427
mips                 randconfig-a001-20200427
m68k                 randconfig-a001-20200427
riscv                randconfig-a001-20200427
nds32                randconfig-a001-20200427
nios2                randconfig-a001-20200427
c6x                  randconfig-a001-20200427
h8300                randconfig-a001-20200427
sparc64              randconfig-a001-20200427
microblaze           randconfig-a001-20200427
nios2                randconfig-a001-20200428
h8300                randconfig-a001-20200428
c6x                  randconfig-a001-20200428
sparc64              randconfig-a001-20200428
microblaze           randconfig-a001-20200428
sh                   randconfig-a001-20200427
csky                 randconfig-a001-20200427
xtensa               randconfig-a001-20200427
openrisc             randconfig-a001-20200427
i386                 randconfig-a003-20200427
i386                 randconfig-a001-20200427
i386                 randconfig-a002-20200427
x86_64               randconfig-a002-20200427
i386                 randconfig-b002-20200427
x86_64               randconfig-b001-20200427
i386                 randconfig-b001-20200427
i386                 randconfig-b003-20200427
x86_64               randconfig-b002-20200427
x86_64               randconfig-b003-20200427
i386                 randconfig-c002-20200427
i386                 randconfig-c001-20200427
x86_64               randconfig-c002-20200427
x86_64               randconfig-c001-20200427
i386                 randconfig-c003-20200427
x86_64               randconfig-c003-20200427
x86_64               randconfig-d001-20200427
x86_64               randconfig-d002-20200427
i386                 randconfig-d002-20200427
i386                 randconfig-d001-20200427
x86_64               randconfig-d003-20200427
i386                 randconfig-d003-20200427
i386                 randconfig-e003-20200427
x86_64               randconfig-e002-20200427
x86_64               randconfig-e003-20200427
i386                 randconfig-e002-20200427
i386                 randconfig-e001-20200427
x86_64               randconfig-e001-20200427
i386                 randconfig-g003-20200427
i386                 randconfig-g001-20200427
x86_64               randconfig-g001-20200427
i386                 randconfig-g002-20200427
x86_64               randconfig-g003-20200427
i386                 randconfig-h003-20200427
x86_64               randconfig-h002-20200427
i386                 randconfig-h002-20200427
i386                 randconfig-h001-20200427
sparc                randconfig-a001-20200427
ia64                 randconfig-a001-20200427
arm                  randconfig-a001-20200427
arm64                randconfig-a001-20200427
arc                  randconfig-a001-20200427
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
i386                             allyesconfig
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
