Return-Path: <linux-renesas-soc+bounces-56-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6337F3AFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 02:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 094601C20A6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 01:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6A615A0;
	Wed, 22 Nov 2023 01:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmaBEYJJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B151197
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 17:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700615267; x=1732151267;
  h=date:from:to:cc:subject:message-id;
  bh=hLjlUsyycKpYKdhO2bGCcCLRq1RzC2JwHPWvmmD7oIE=;
  b=cmaBEYJJg6Cj9rvXf7kP1Cdlo7/sR1sp7QXI5JheYxHxarq2JN4JIUro
   5vyWST/UV05ohWmP+Uel2n+18pI0+dchZ0QCUAcVOdHQYhlvFjCAMQeCf
   BrOaw5SkClhKFqKvHeJHvV5MEAonW6rxMfd98JA8PGilTAEILROwM/lB2
   NRwln7NPTPVgo1y0W1bcH9ae78qN0IDykbJv8RetKSIFf5oBSQOJH7d9/
   t+k3PIaK/QDzD6vFksZDy2jTIlwWFEj1HC79U+WEyv5a3yxoDg4GCaVaC
   +LY7R5nEV6RDvUU+cZATtHHiMw8e1Y6wcdlwdJlYVAdZhUNHCPigAjlff
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5154641"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="5154641"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 17:07:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="801726601"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="801726601"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Nov 2023 17:07:43 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5biO-0008TU-1f;
	Wed, 22 Nov 2023 01:07:40 +0000
Date: Wed, 22 Nov 2023 09:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 5ab16198b431ca4885dbcc3433527fdf5b66be3c
Message-ID: <202311220900.Ge4rcfXH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 5ab16198b431ca4885dbcc3433527fdf5b66be3c  clk: renesas: r8a779g0: Add PCIe clocks

elapsed time: 2367m

configs tested: 283
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20231120   gcc  
arc                   randconfig-001-20231121   gcc  
arc                   randconfig-002-20231120   gcc  
arc                   randconfig-002-20231121   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                         lpc18xx_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                   randconfig-001-20231120   clang
arm                   randconfig-001-20231121   gcc  
arm                   randconfig-002-20231120   clang
arm                   randconfig-002-20231121   gcc  
arm                   randconfig-003-20231120   clang
arm                   randconfig-003-20231121   gcc  
arm                   randconfig-004-20231120   clang
arm                   randconfig-004-20231121   gcc  
arm                             rpc_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231120   clang
arm64                 randconfig-001-20231121   gcc  
arm64                 randconfig-002-20231120   clang
arm64                 randconfig-002-20231121   gcc  
arm64                 randconfig-003-20231120   clang
arm64                 randconfig-003-20231121   gcc  
arm64                 randconfig-004-20231120   clang
arm64                 randconfig-004-20231121   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231120   gcc  
csky                  randconfig-001-20231121   gcc  
csky                  randconfig-002-20231120   gcc  
csky                  randconfig-002-20231121   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231120   clang
hexagon               randconfig-001-20231121   clang
hexagon               randconfig-002-20231120   clang
hexagon               randconfig-002-20231121   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231120   clang
i386         buildonly-randconfig-002-20231120   clang
i386         buildonly-randconfig-003-20231120   clang
i386         buildonly-randconfig-004-20231120   clang
i386         buildonly-randconfig-005-20231120   clang
i386         buildonly-randconfig-006-20231120   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231120   clang
i386                  randconfig-002-20231120   clang
i386                  randconfig-003-20231120   clang
i386                  randconfig-004-20231120   clang
i386                  randconfig-005-20231120   clang
i386                  randconfig-006-20231120   clang
i386                  randconfig-011-20231120   gcc  
i386                  randconfig-011-20231121   clang
i386                  randconfig-011-20231122   gcc  
i386                  randconfig-012-20231120   gcc  
i386                  randconfig-012-20231121   clang
i386                  randconfig-012-20231122   gcc  
i386                  randconfig-013-20231120   gcc  
i386                  randconfig-013-20231121   clang
i386                  randconfig-013-20231122   gcc  
i386                  randconfig-014-20231120   gcc  
i386                  randconfig-014-20231121   clang
i386                  randconfig-014-20231122   gcc  
i386                  randconfig-015-20231120   gcc  
i386                  randconfig-015-20231121   clang
i386                  randconfig-015-20231122   gcc  
i386                  randconfig-016-20231120   gcc  
i386                  randconfig-016-20231121   clang
i386                  randconfig-016-20231122   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231120   gcc  
loongarch             randconfig-001-20231121   gcc  
loongarch             randconfig-002-20231120   gcc  
loongarch             randconfig-002-20231121   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                           jazz_defconfig   gcc  
mips                         rt305x_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231120   gcc  
nios2                 randconfig-001-20231121   gcc  
nios2                 randconfig-002-20231120   gcc  
nios2                 randconfig-002-20231121   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231120   gcc  
parisc                randconfig-001-20231121   gcc  
parisc                randconfig-002-20231120   gcc  
parisc                randconfig-002-20231121   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      chrp32_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc               randconfig-001-20231120   clang
powerpc               randconfig-001-20231121   gcc  
powerpc               randconfig-002-20231120   clang
powerpc               randconfig-002-20231121   gcc  
powerpc               randconfig-003-20231120   clang
powerpc               randconfig-003-20231121   gcc  
powerpc64             randconfig-001-20231120   clang
powerpc64             randconfig-001-20231121   gcc  
powerpc64             randconfig-002-20231120   clang
powerpc64             randconfig-002-20231121   gcc  
powerpc64             randconfig-003-20231120   clang
powerpc64             randconfig-003-20231121   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20231120   clang
riscv                 randconfig-001-20231121   gcc  
riscv                 randconfig-002-20231120   clang
riscv                 randconfig-002-20231121   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231120   gcc  
s390                  randconfig-001-20231121   clang
s390                  randconfig-002-20231120   gcc  
s390                  randconfig-002-20231121   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                    randconfig-001-20231120   gcc  
sh                    randconfig-001-20231121   gcc  
sh                    randconfig-002-20231120   gcc  
sh                    randconfig-002-20231121   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231120   gcc  
sparc64               randconfig-001-20231121   gcc  
sparc64               randconfig-002-20231120   gcc  
sparc64               randconfig-002-20231121   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231120   clang
um                    randconfig-001-20231121   gcc  
um                    randconfig-002-20231120   clang
um                    randconfig-002-20231121   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231120   clang
x86_64       buildonly-randconfig-001-20231121   gcc  
x86_64       buildonly-randconfig-001-20231122   clang
x86_64       buildonly-randconfig-002-20231120   clang
x86_64       buildonly-randconfig-002-20231121   gcc  
x86_64       buildonly-randconfig-002-20231122   clang
x86_64       buildonly-randconfig-003-20231120   clang
x86_64       buildonly-randconfig-003-20231121   gcc  
x86_64       buildonly-randconfig-003-20231122   clang
x86_64       buildonly-randconfig-004-20231120   clang
x86_64       buildonly-randconfig-004-20231121   gcc  
x86_64       buildonly-randconfig-004-20231122   clang
x86_64       buildonly-randconfig-005-20231120   clang
x86_64       buildonly-randconfig-005-20231121   gcc  
x86_64       buildonly-randconfig-005-20231122   clang
x86_64       buildonly-randconfig-006-20231120   clang
x86_64       buildonly-randconfig-006-20231121   gcc  
x86_64       buildonly-randconfig-006-20231122   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231120   gcc  
x86_64                randconfig-002-20231120   gcc  
x86_64                randconfig-003-20231120   gcc  
x86_64                randconfig-004-20231120   gcc  
x86_64                randconfig-005-20231120   gcc  
x86_64                randconfig-006-20231120   gcc  
x86_64                randconfig-011-20231120   clang
x86_64                randconfig-011-20231121   gcc  
x86_64                randconfig-011-20231122   clang
x86_64                randconfig-012-20231120   clang
x86_64                randconfig-012-20231121   gcc  
x86_64                randconfig-012-20231122   clang
x86_64                randconfig-013-20231120   clang
x86_64                randconfig-013-20231121   gcc  
x86_64                randconfig-013-20231122   clang
x86_64                randconfig-014-20231120   clang
x86_64                randconfig-014-20231121   gcc  
x86_64                randconfig-014-20231122   clang
x86_64                randconfig-015-20231120   clang
x86_64                randconfig-015-20231121   gcc  
x86_64                randconfig-015-20231122   clang
x86_64                randconfig-016-20231120   clang
x86_64                randconfig-016-20231121   gcc  
x86_64                randconfig-016-20231122   clang
x86_64                randconfig-071-20231120   clang
x86_64                randconfig-071-20231121   gcc  
x86_64                randconfig-071-20231122   clang
x86_64                randconfig-072-20231120   clang
x86_64                randconfig-072-20231121   gcc  
x86_64                randconfig-072-20231122   clang
x86_64                randconfig-073-20231120   clang
x86_64                randconfig-073-20231121   gcc  
x86_64                randconfig-073-20231122   clang
x86_64                randconfig-074-20231120   clang
x86_64                randconfig-074-20231121   gcc  
x86_64                randconfig-074-20231122   clang
x86_64                randconfig-075-20231120   clang
x86_64                randconfig-075-20231121   gcc  
x86_64                randconfig-075-20231122   clang
x86_64                randconfig-076-20231120   clang
x86_64                randconfig-076-20231121   gcc  
x86_64                randconfig-076-20231122   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20231120   gcc  
xtensa                randconfig-001-20231121   gcc  
xtensa                randconfig-002-20231120   gcc  
xtensa                randconfig-002-20231121   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

