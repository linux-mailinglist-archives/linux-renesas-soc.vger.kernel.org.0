Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96AAC1BB2A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2020 02:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgD1ASv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Apr 2020 20:18:51 -0400
Received: from mga12.intel.com ([192.55.52.136]:46009 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726016AbgD1ASv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Apr 2020 20:18:51 -0400
IronPort-SDR: kNN9yKm8J7E8GEvpibcm7iH8veeMEYMjT04QZurj1oyS7EoaIQ+tRjv3g44YUutWynpgannw4l
 bQBlt7vXkWig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2020 17:18:50 -0700
IronPort-SDR: WAmvAROF+xHb0h+5sSlKiZT+hep5Kp57zpBuhBHmRqtJRGHKJMy1XMG74bN+jRt3yelGeH/zwO
 SbsETQXZJ4Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,325,1583222400"; 
   d="scan'208";a="431979872"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2020 17:18:48 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jTDxY-0009UE-7v; Tue, 28 Apr 2020 08:18:48 +0800
Date:   Tue, 28 Apr 2020 08:18:23 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 3b00933301fc465d966fa1f83274dff95e82046a
Message-ID: <5ea7764f.0rKOIQlvc/fyK4Zr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  next
branch HEAD: 3b00933301fc465d966fa1f83274dff95e82046a  Merge branch 'renesas-arm-dt-for-v5.8' into renesas-next

elapsed time: 783m

configs tested: 150
configs skipped: 159

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                             allnoconfig
sparc                            allyesconfig
powerpc                             defconfig
ia64                                defconfig
i386                             alldefconfig
h8300                    h8300h-sim_defconfig
mips                              allnoconfig
riscv                             allnoconfig
i386                                defconfig
nios2                         3c120_defconfig
ia64                         bigsur_defconfig
i386                              allnoconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                              allnoconfig
ia64                        generic_defconfig
ia64                          tiger_defconfig
ia64                             allyesconfig
ia64                             alldefconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
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
