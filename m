Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09EB4144C50
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2020 08:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbgAVHDf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jan 2020 02:03:35 -0500
Received: from mga11.intel.com ([192.55.52.93]:53827 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729075AbgAVHDf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jan 2020 02:03:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 23:03:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,348,1574150400"; 
   d="scan'208";a="215808716"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Jan 2020 23:03:33 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iuA32-0009h2-M7; Wed, 22 Jan 2020 15:03:32 +0800
Date:   Wed, 22 Jan 2020 15:02:46 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 4f250c3116b8f16de9df0ce2bcdfe8dc4e508145
Message-ID: <5e27f396.0eBPP7YjV6isvF/J%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 4f250c3116b8f16de9df0ce2bcdfe8dc4e508145  Merge tag 'v5.5-rc7' into renesas-devel

elapsed time: 2431m

configs tested: 116
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

alpha                randconfig-a001-20200121
m68k                 randconfig-a001-20200121
mips                 randconfig-a001-20200121
nds32                randconfig-a001-20200121
parisc               randconfig-a001-20200121
riscv                randconfig-a001-20200121
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
ia64                                defconfig
powerpc                             defconfig
i386                 randconfig-d003-20200121
i386                 randconfig-d002-20200121
x86_64               randconfig-d001-20200121
x86_64               randconfig-d003-20200121
x86_64               randconfig-d002-20200121
i386                 randconfig-d001-20200121
i386                              allnoconfig
i386                                defconfig
i386                             allyesconfig
i386                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
arc                              allyesconfig
microblaze                    nommu_defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
arc                                 defconfig
powerpc                           allnoconfig
parisc                        c3000_defconfig
parisc                         b180_defconfig
parisc                              defconfig
parisc                            allnoconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
openrisc             randconfig-a001-20200120
xtensa               randconfig-a001-20200120
csky                 randconfig-a001-20200120
sh                   randconfig-a001-20200120
s390                 randconfig-a001-20200120
mips                             allmodconfig
mips                           32r2_defconfig
mips                             allyesconfig
mips                              allnoconfig
sh                               allmodconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sh                            titan_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
sparc64                          allmodconfig
sparc                            allyesconfig
sparc64                          allyesconfig
sparc64                           allnoconfig
sparc64                             defconfig
s390                              allnoconfig
s390                             alldefconfig
s390                          debug_defconfig
s390                             allmodconfig
s390                                defconfig
s390                       zfcpdump_defconfig
s390                             allyesconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
arm64                randconfig-a001-20200122
ia64                 randconfig-a001-20200122
arm                  randconfig-a001-20200122
arc                  randconfig-a001-20200122
sparc                randconfig-a001-20200122
h8300                randconfig-a001-20200121
nios2                randconfig-a001-20200121
c6x                  randconfig-a001-20200121
microblaze           randconfig-a001-20200121
sparc64              randconfig-a001-20200121
arm                              allmodconfig
arm                         at91_dt_defconfig
arm64                               defconfig
arm                        multi_v5_defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                           sunxi_defconfig
arm64                             allnoconfig
arm64                            allmodconfig
arm                          exynos_defconfig
arm                        shmobile_defconfig
arm                        multi_v7_defconfig

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
