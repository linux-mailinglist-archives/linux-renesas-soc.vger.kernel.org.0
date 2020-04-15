Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B2C1A8FC5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 02:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392424AbgDOAhh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Apr 2020 20:37:37 -0400
Received: from mga03.intel.com ([134.134.136.65]:63569 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733058AbgDOAhf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 20:37:35 -0400
IronPort-SDR: 0AjwKJ71QSTHjRhVR1xeWNSRsxnnWnGjDIJlZNc+RLzts+NgpxUtIVDs8pyrmDoF7xqaDxcPSo
 L8KjWN3jTzGA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 17:37:32 -0700
IronPort-SDR: ks1s9zp5kniaKn3TQV4ClLHjZPcPNhKJA8bQg5dU6Q8MqDD6ssuu0oK8NIPV0zUZ06hQpuniq8
 mkN0b83HWljA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,384,1580803200"; 
   d="scan'208";a="427253100"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Apr 2020 17:37:31 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jOW3W-000IZ8-DG; Wed, 15 Apr 2020 08:37:30 +0800
Date:   Wed, 15 Apr 2020 08:36:45 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 a710158e9fa209a4187d46ecfba49d4c1664cb0f
Message-ID: <5e96571d.mjrGGbvEu0kgB726%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  next
branch HEAD: a710158e9fa209a4187d46ecfba49d4c1664cb0f  Merge branch 'renesas-arm-dt-for-v5.8' into renesas-next

elapsed time: 746m

configs tested: 197
configs skipped: 141

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
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
arm                          exynos_defconfig
sparc                            allyesconfig
ia64                             allyesconfig
mips                      malta_kvm_defconfig
sparc64                           allnoconfig
mips                      fuloong2e_defconfig
riscv                               defconfig
s390                             alldefconfig
mips                              allnoconfig
s390                             allyesconfig
s390                              allnoconfig
um                                  defconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                                defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                             allyesconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200414
x86_64               randconfig-a002-20200414
x86_64               randconfig-a003-20200414
i386                 randconfig-a001-20200414
i386                 randconfig-a002-20200414
i386                 randconfig-a003-20200414
alpha                randconfig-a001-20200414
m68k                 randconfig-a001-20200414
nds32                randconfig-a001-20200414
parisc               randconfig-a001-20200414
riscv                randconfig-a001-20200414
alpha                randconfig-a001-20200415
m68k                 randconfig-a001-20200415
nds32                randconfig-a001-20200415
riscv                randconfig-a001-20200415
c6x                  randconfig-a001-20200414
h8300                randconfig-a001-20200414
microblaze           randconfig-a001-20200414
nios2                randconfig-a001-20200414
sparc64              randconfig-a001-20200414
c6x                  randconfig-a001-20200415
h8300                randconfig-a001-20200415
microblaze           randconfig-a001-20200415
nios2                randconfig-a001-20200415
sparc64              randconfig-a001-20200415
csky                 randconfig-a001-20200414
openrisc             randconfig-a001-20200414
s390                 randconfig-a001-20200414
sh                   randconfig-a001-20200414
xtensa               randconfig-a001-20200414
csky                 randconfig-a001-20200415
openrisc             randconfig-a001-20200415
s390                 randconfig-a001-20200415
sh                   randconfig-a001-20200415
xtensa               randconfig-a001-20200415
x86_64               randconfig-b003-20200415
i386                 randconfig-b001-20200415
i386                 randconfig-b003-20200415
x86_64               randconfig-b001-20200414
x86_64               randconfig-b002-20200414
x86_64               randconfig-b003-20200414
i386                 randconfig-b001-20200414
i386                 randconfig-b002-20200414
i386                 randconfig-b003-20200414
x86_64               randconfig-c001-20200414
x86_64               randconfig-c002-20200414
x86_64               randconfig-c003-20200414
i386                 randconfig-c001-20200414
i386                 randconfig-c002-20200414
i386                 randconfig-c003-20200414
x86_64               randconfig-d001-20200414
x86_64               randconfig-d002-20200414
x86_64               randconfig-d003-20200414
i386                 randconfig-d001-20200414
i386                 randconfig-d002-20200414
i386                 randconfig-d003-20200414
x86_64               randconfig-d001-20200415
x86_64               randconfig-d002-20200415
i386                 randconfig-d001-20200415
i386                 randconfig-d002-20200415
i386                 randconfig-d003-20200415
x86_64               randconfig-f001-20200414
x86_64               randconfig-f002-20200414
x86_64               randconfig-f003-20200414
i386                 randconfig-f001-20200414
i386                 randconfig-f002-20200414
i386                 randconfig-f003-20200414
x86_64               randconfig-g001-20200414
x86_64               randconfig-g002-20200414
x86_64               randconfig-g003-20200414
i386                 randconfig-g001-20200414
i386                 randconfig-g002-20200414
i386                 randconfig-g003-20200414
x86_64               randconfig-g001-20200415
x86_64               randconfig-g003-20200415
i386                 randconfig-g001-20200415
i386                 randconfig-g002-20200415
i386                 randconfig-g003-20200415
x86_64               randconfig-h001-20200415
x86_64               randconfig-h002-20200415
x86_64               randconfig-h003-20200415
i386                 randconfig-h001-20200415
i386                 randconfig-h002-20200415
i386                 randconfig-h003-20200415
x86_64               randconfig-h001-20200414
x86_64               randconfig-h002-20200414
x86_64               randconfig-h003-20200414
i386                 randconfig-h001-20200414
i386                 randconfig-h002-20200414
i386                 randconfig-h003-20200414
arc                  randconfig-a001-20200414
arm                  randconfig-a001-20200414
arm64                randconfig-a001-20200414
ia64                 randconfig-a001-20200414
powerpc              randconfig-a001-20200414
sparc                randconfig-a001-20200414
arc                  randconfig-a001-20200415
arm64                randconfig-a001-20200415
ia64                 randconfig-a001-20200415
powerpc              randconfig-a001-20200415
sparc                randconfig-a001-20200415
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
