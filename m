Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03C71C4C5A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2020 04:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgEECt1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 May 2020 22:49:27 -0400
Received: from mga05.intel.com ([192.55.52.43]:58071 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbgEECt1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 May 2020 22:49:27 -0400
IronPort-SDR: dgoNMCwXHN/c4Ai+vxqmp8aeYgaCI61lLXeLwaHOHZT9NKdimgr1J4WjOWspCpzrfvT/zc4W5Z
 Yk77hsRlFM6g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 19:49:25 -0700
IronPort-SDR: GI3HaVQUp865iA1C1rR73L7XUqaPv8Fek9+dhqkaGuUL2k6I4x5WVjd11tl6VAPGxFt8khEjYX
 Oka6SY+C5ejw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; 
   d="scan'208";a="295688409"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 May 2020 19:49:22 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jVne6-0005dF-5h; Tue, 05 May 2020 10:49:22 +0800
Date:   Tue, 05 May 2020 10:48:33 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.8] BUILD REGRESSION
 727f9cb4eb753ff60fe94da26603f677663430ca
Message-ID: <5eb0d401./otDBy8Dle966Moh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.8
branch HEAD: 727f9cb4eb753ff60fe94da26603f677663430ca  ARM: dts: r8a7742-iwg21d-q7: Add iWave G21D-Q7 board based on RZ/G1H

Error/Warning in current branch:

arch/arm/boot/dts/r8a7742.dtsi:8:10: fatal error: dt-bindings/clock/r8a7742-cpg-mssr.h: No such file or directory

Error/Warning ids grouped by kconfigs:

recent_errors
`-- arm-shmobile_defconfig
    `-- arch-arm-boot-dts-r8a7742.dtsi:fatal-error:dt-bindings-clock-r8a7742-cpg-mssr.h:No-such-file-or-directory

elapsed time: 510m

configs tested: 176
configs skipped: 196

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
mips                            ar7_defconfig
csky                                defconfig
alpha                               defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                        generic_defconfig
ia64                          tiger_defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
ia64                             alldefconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
m68k                       bvme6000_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nds32                             allnoconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
mips                malta_kvm_guest_defconfig
mips                         tb0287_defconfig
mips                       capcella_defconfig
mips                           ip32_defconfig
mips                  decstation_64_defconfig
mips                      loongson3_defconfig
mips                          ath79_defconfig
mips                        bcm63xx_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                      chrp32_defconfig
powerpc                             defconfig
powerpc                       holly_defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
powerpc                           allnoconfig
powerpc                  mpc866_ads_defconfig
powerpc                    amigaone_defconfig
powerpc                    adder875_defconfig
powerpc                     ep8248e_defconfig
powerpc                          g5_defconfig
powerpc                     mpc512x_defconfig
m68k                 randconfig-a001-20200505
mips                 randconfig-a001-20200505
nds32                randconfig-a001-20200505
parisc               randconfig-a001-20200505
alpha                randconfig-a001-20200505
riscv                randconfig-a001-20200505
h8300                randconfig-a001-20200503
nios2                randconfig-a001-20200503
microblaze           randconfig-a001-20200503
c6x                  randconfig-a001-20200503
sparc64              randconfig-a001-20200503
s390                 randconfig-a001-20200505
xtensa               randconfig-a001-20200505
sh                   randconfig-a001-20200505
openrisc             randconfig-a001-20200505
csky                 randconfig-a001-20200505
i386                 randconfig-b003-20200503
x86_64               randconfig-b002-20200503
i386                 randconfig-b001-20200503
x86_64               randconfig-b003-20200503
x86_64               randconfig-b001-20200503
i386                 randconfig-b002-20200503
i386                 randconfig-b003-20200502
i386                 randconfig-b001-20200502
x86_64               randconfig-b003-20200502
x86_64               randconfig-b001-20200502
i386                 randconfig-b002-20200502
x86_64               randconfig-d001-20200505
i386                 randconfig-d003-20200505
i386                 randconfig-d001-20200505
x86_64               randconfig-d003-20200505
x86_64               randconfig-d002-20200505
i386                 randconfig-d002-20200505
x86_64               randconfig-d001-20200503
i386                 randconfig-d003-20200503
x86_64               randconfig-d003-20200503
i386                 randconfig-d001-20200503
x86_64               randconfig-d002-20200503
i386                 randconfig-d002-20200503
x86_64               randconfig-e003-20200503
x86_64               randconfig-e002-20200503
i386                 randconfig-e003-20200503
x86_64               randconfig-e001-20200503
i386                 randconfig-e002-20200503
i386                 randconfig-e001-20200503
i386                 randconfig-e003-20200505
x86_64               randconfig-e002-20200505
x86_64               randconfig-e003-20200505
x86_64               randconfig-e001-20200505
i386                 randconfig-e002-20200505
i386                 randconfig-e001-20200505
i386                 randconfig-f003-20200503
x86_64               randconfig-f002-20200503
i386                 randconfig-f001-20200503
i386                 randconfig-f002-20200503
x86_64               randconfig-a003-20200505
x86_64               randconfig-a001-20200505
i386                 randconfig-a001-20200505
i386                 randconfig-a003-20200505
i386                 randconfig-a002-20200505
i386                 randconfig-g003-20200505
i386                 randconfig-g002-20200505
i386                 randconfig-g001-20200505
x86_64               randconfig-g002-20200505
i386                 randconfig-h002-20200505
i386                 randconfig-h001-20200505
i386                 randconfig-h003-20200505
x86_64               randconfig-h003-20200505
x86_64               randconfig-h001-20200505
arm                  randconfig-a001-20200505
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
sparc                            allyesconfig
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
