Return-Path: <linux-renesas-soc+bounces-389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E53A7FD262
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 10:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3A4AB20CBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 09:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627FA13AFF;
	Wed, 29 Nov 2023 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTw4DX1o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0C81707
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Nov 2023 01:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701249849; x=1732785849;
  h=date:from:to:cc:subject:message-id;
  bh=ZDvFSojtnbuLJkEUjW1ZD5v3HHmaC5EghtQMOtzCT38=;
  b=FTw4DX1o7ib4pX3jcdRcp/8wwZyaOWDF8sq/TDeA9YF34UpAMlqkX8xg
   /bqxFGqoP//TXC10ZWvawxO2s2JrXSjCuDlKzxQEu1YYoSpsfj7qI6vLr
   0wvXREMp/CNQrST6N0b0HFg9YKWzOUwdyKirTigZEBmsoYe1rPKBzFmAf
   X9dMC4/U4EL3ue+1lXLwY0Y4dYt/1NtLVMZNXdNCTkHJiIbPeGfCPPzEB
   0hsKT7SOJ7gnyiV4WWnQ/IW7T93i/RdbzRUUG4AWjc6U699ZtRx3HSwg6
   686WM1DFdjr37ZLr0u5qrdfOqTXLUvehsyzg1uSK81BkNMfi5+vgxG/sQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="479332281"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="479332281"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 01:24:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="942251986"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="942251986"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Nov 2023 01:24:07 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Gnd-0008qe-0Z;
	Wed, 29 Nov 2023 09:24:05 +0000
Date: Wed, 29 Nov 2023 17:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.8] BUILD SUCCESS
 95d516f3eb96bac466a6bfec28a1e55b8ed5160b
Message-ID: <202311291741.BYy28XcF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.8
branch HEAD: 95d516f3eb96bac466a6bfec28a1e55b8ed5160b  ARM: dts: renesas: r9a06g032: Add missing space in compatible

elapsed time: 1349m

configs tested: 230
configs skipped: 79

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231128   gcc  
arc                   randconfig-001-20231129   gcc  
arc                   randconfig-002-20231128   gcc  
arc                   randconfig-002-20231129   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   clang
arm                          exynos_defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                            hisi_defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                         nhk8815_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                   randconfig-001-20231129   gcc  
arm                   randconfig-002-20231129   gcc  
arm                   randconfig-003-20231129   gcc  
arm                   randconfig-004-20231129   gcc  
arm                             rpc_defconfig   gcc  
arm                       spear13xx_defconfig   clang
arm                        spear6xx_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231129   gcc  
arm64                 randconfig-002-20231129   gcc  
arm64                 randconfig-003-20231129   gcc  
arm64                 randconfig-004-20231129   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231128   gcc  
csky                  randconfig-001-20231129   gcc  
csky                  randconfig-002-20231128   gcc  
csky                  randconfig-002-20231129   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-011-20231128   gcc  
i386                  randconfig-011-20231129   clang
i386                  randconfig-012-20231128   gcc  
i386                  randconfig-012-20231129   clang
i386                  randconfig-013-20231128   gcc  
i386                  randconfig-013-20231129   clang
i386                  randconfig-014-20231128   gcc  
i386                  randconfig-014-20231129   clang
i386                  randconfig-015-20231128   gcc  
i386                  randconfig-015-20231129   clang
i386                  randconfig-016-20231128   gcc  
i386                  randconfig-016-20231129   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231128   gcc  
loongarch             randconfig-001-20231129   gcc  
loongarch             randconfig-002-20231128   gcc  
loongarch             randconfig-002-20231129   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                     loongson1c_defconfig   clang
mips                           rs90_defconfig   clang
mips                        vocore2_defconfig   gcc  
mips                           xway_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231128   gcc  
nios2                 randconfig-001-20231129   gcc  
nios2                 randconfig-002-20231128   gcc  
nios2                 randconfig-002-20231129   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20231128   gcc  
parisc                randconfig-001-20231129   gcc  
parisc                randconfig-002-20231128   gcc  
parisc                randconfig-002-20231129   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                     powernv_defconfig   clang
powerpc               randconfig-001-20231129   gcc  
powerpc               randconfig-002-20231129   gcc  
powerpc               randconfig-003-20231129   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc64             randconfig-001-20231129   gcc  
powerpc64             randconfig-002-20231129   gcc  
powerpc64             randconfig-003-20231129   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231129   gcc  
riscv                 randconfig-002-20231129   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231128   gcc  
s390                  randconfig-002-20231128   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20231128   gcc  
sh                    randconfig-001-20231129   gcc  
sh                    randconfig-002-20231128   gcc  
sh                    randconfig-002-20231129   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231128   gcc  
sparc64               randconfig-001-20231129   gcc  
sparc64               randconfig-002-20231128   gcc  
sparc64               randconfig-002-20231129   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231129   gcc  
um                    randconfig-002-20231129   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231129   gcc  
x86_64       buildonly-randconfig-002-20231129   gcc  
x86_64       buildonly-randconfig-003-20231129   gcc  
x86_64       buildonly-randconfig-004-20231129   gcc  
x86_64       buildonly-randconfig-005-20231129   gcc  
x86_64       buildonly-randconfig-006-20231129   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20231129   gcc  
x86_64                randconfig-012-20231129   gcc  
x86_64                randconfig-013-20231129   gcc  
x86_64                randconfig-014-20231129   gcc  
x86_64                randconfig-015-20231129   gcc  
x86_64                randconfig-016-20231129   gcc  
x86_64                randconfig-071-20231129   gcc  
x86_64                randconfig-072-20231129   gcc  
x86_64                randconfig-073-20231129   gcc  
x86_64                randconfig-074-20231129   gcc  
x86_64                randconfig-075-20231129   gcc  
x86_64                randconfig-076-20231129   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20231128   gcc  
xtensa                randconfig-001-20231129   gcc  
xtensa                randconfig-002-20231128   gcc  
xtensa                randconfig-002-20231129   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

