Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 533961405D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2020 10:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgAQJIP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jan 2020 04:08:15 -0500
Received: from mga02.intel.com ([134.134.136.20]:35459 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726908AbgAQJIP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jan 2020 04:08:15 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jan 2020 01:08:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,329,1574150400"; 
   d="scan'208";a="218849116"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Jan 2020 01:08:14 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1isNbx-0007Jn-NJ; Fri, 17 Jan 2020 17:08:13 +0800
Date:   Fri, 17 Jan 2020 17:07:22 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD INCOMPLETE
 0dff3f3064be4c92c2d52f9be4210936a324c779
Message-ID: <5e21794a.zr95PlgCftVfjG51%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 0dff3f3064be4c92c2d52f9be4210936a324c779  Merge branch 'renesas-next', tag 'v5.5-rc6' into renesas-devel

TIMEOUT after 2895m


Sorry we cannot finish the testset for your branch within a reasonable time.
It's our fault -- either some build server is down or some build worker is busy
doing bisects for _other_ trees. The branch will get more complete coverage and
possible error reports when our build infrastructure is restored or catches up.
There will be no more build success notification for this branch head, but you
can expect reasonably good test coverage after waiting for 1 day.

configs timed out: 12

i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
mips                         64r6el_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig

configs tested: 121
configs skipped: 0

c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
m68k                          multi_defconfig
m68k                       m5475evb_defconfig
h8300                    h8300h-sim_defconfig
h8300                     edosk2674_defconfig
m68k                           sun3_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
sh                               allmodconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sh                            titan_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
arc                  randconfig-a001-20200116
arm                  randconfig-a001-20200116
arm64                randconfig-a001-20200116
ia64                 randconfig-a001-20200116
powerpc              randconfig-a001-20200116
sparc                randconfig-a001-20200116
riscv                randconfig-a001-20200117
parisc               randconfig-a001-20200117
m68k                 randconfig-a001-20200117
alpha                randconfig-a001-20200117
nds32                randconfig-a001-20200117
x86_64               randconfig-b001-20200116
x86_64               randconfig-b002-20200116
x86_64               randconfig-b003-20200116
i386                 randconfig-b001-20200116
i386                 randconfig-b002-20200116
i386                 randconfig-b003-20200116
x86_64               randconfig-g001-20200116
x86_64               randconfig-g002-20200116
x86_64               randconfig-g003-20200116
i386                 randconfig-g001-20200116
i386                 randconfig-g002-20200116
i386                 randconfig-g003-20200116
c6x                  randconfig-a001-20200116
h8300                randconfig-a001-20200116
microblaze           randconfig-a001-20200116
nios2                randconfig-a001-20200116
sparc64              randconfig-a001-20200116
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
s390                              allnoconfig
s390                             alldefconfig
s390                          debug_defconfig
s390                             allmodconfig
s390                                defconfig
s390                       zfcpdump_defconfig
s390                             allyesconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                 randconfig-a001-20200117
csky                 randconfig-a001-20200117
sh                   randconfig-a001-20200117
xtensa               randconfig-a001-20200117
openrisc             randconfig-a001-20200117
x86_64               randconfig-d001-20200116
x86_64               randconfig-d002-20200116
x86_64               randconfig-d003-20200116
i386                 randconfig-d001-20200116
i386                 randconfig-d002-20200116
i386                 randconfig-d003-20200116
mips                             allmodconfig
mips                           32r2_defconfig
mips                             allyesconfig
mips                              allnoconfig

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
