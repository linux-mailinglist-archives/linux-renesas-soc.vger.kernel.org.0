Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5656019A401
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2020 05:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731589AbgDADg3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Mar 2020 23:36:29 -0400
Received: from mga01.intel.com ([192.55.52.88]:7442 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731554AbgDADg2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Mar 2020 23:36:28 -0400
IronPort-SDR: XdQnECw20kWeSa2rBPC+hnjkHjtSxFeLWu9H8+LfUJznaTYDD1ZtGWd/GS0CYcUsmq+mTZlH2d
 A7JGbrsudivQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 20:36:28 -0700
IronPort-SDR: UGoTlN0GnNPMNyOuHvHH851zanMjtRDnzqngIrA5Xi0YHP9oMftzXb/8GjH23h0dJAbXzaq/g1
 1PHeg/OXX9Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,330,1580803200"; 
   d="scan'208";a="328296898"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 Mar 2020 20:36:26 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jJUB0-00078r-1w; Wed, 01 Apr 2020 11:36:26 +0800
Date:   Wed, 01 Apr 2020 11:34:53 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD SUCCESS
 464aef1600f17441a5257a2b6018b72500b7cbba
Message-ID: <5e840bdd.NuruMce+rHNvkT+f%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  master
branch HEAD: 464aef1600f17441a5257a2b6018b72500b7cbba  [LOCAL] arm64: defconfig: Update renesas_defconfig

elapsed time: 831m

configs tested: 151
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
sparc                            allyesconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
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
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a003-20200401
i386                 randconfig-a002-20200401
x86_64               randconfig-a002-20200401
x86_64               randconfig-a001-20200401
i386                 randconfig-a003-20200401
i386                 randconfig-a001-20200401
riscv                randconfig-a001-20200331
mips                 randconfig-a001-20200331
m68k                 randconfig-a001-20200331
parisc               randconfig-a001-20200331
alpha                randconfig-a001-20200331
nds32                randconfig-a001-20200331
microblaze           randconfig-a001-20200331
h8300                randconfig-a001-20200331
nios2                randconfig-a001-20200331
c6x                  randconfig-a001-20200331
sparc64              randconfig-a001-20200331
csky                 randconfig-a001-20200331
s390                 randconfig-a001-20200331
xtensa               randconfig-a001-20200331
openrisc             randconfig-a001-20200331
sh                   randconfig-a001-20200331
x86_64               randconfig-b003-20200331
i386                 randconfig-b003-20200331
i386                 randconfig-b002-20200331
i386                 randconfig-b001-20200331
x86_64               randconfig-b002-20200331
x86_64               randconfig-b001-20200331
i386                 randconfig-c001-20200401
i386                 randconfig-c003-20200401
x86_64               randconfig-c003-20200401
i386                 randconfig-c002-20200401
x86_64               randconfig-c001-20200401
i386                 randconfig-d003-20200331
i386                 randconfig-d001-20200331
i386                 randconfig-d002-20200331
x86_64               randconfig-d001-20200331
x86_64               randconfig-d002-20200331
i386                 randconfig-e001-20200401
x86_64               randconfig-e002-20200401
i386                 randconfig-e003-20200401
x86_64               randconfig-e001-20200401
i386                 randconfig-e002-20200401
i386                 randconfig-f001-20200331
i386                 randconfig-f003-20200331
i386                 randconfig-f002-20200331
x86_64               randconfig-f002-20200331
x86_64               randconfig-f003-20200331
x86_64               randconfig-f001-20200331
x86_64               randconfig-g002-20200331
x86_64               randconfig-g003-20200331
i386                 randconfig-g001-20200331
i386                 randconfig-g002-20200331
x86_64               randconfig-g001-20200331
i386                 randconfig-g003-20200331
x86_64               randconfig-h003-20200331
x86_64               randconfig-h002-20200331
x86_64               randconfig-h001-20200331
i386                 randconfig-h003-20200331
i386                 randconfig-h002-20200331
i386                 randconfig-h001-20200331
sparc                randconfig-a001-20200331
arm64                randconfig-a001-20200331
ia64                 randconfig-a001-20200331
arc                  randconfig-a001-20200331
arm                  randconfig-a001-20200331
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
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
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
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
