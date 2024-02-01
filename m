Return-Path: <linux-renesas-soc+bounces-2189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E848450AA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 06:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 534391F2969B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 05:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232713C469;
	Thu,  1 Feb 2024 05:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cz1xoVWM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DAB39AF6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 05:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706764867; cv=none; b=ipY2hBfMraaVc8mVnxyZ0gvddLjTiOYj4g58I24YeHxhAJfz94z2iYkfPBAMuMfZOZjJlfQBzplb/FD9z5dkLyzpjdd0sto9maauQLs8XOFh0B9716BC9MANMokU/JE6vXs3QcgQ9fR5eA7D/vx+s2juu2f2wuTC1Kr6vrN/Cco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706764867; c=relaxed/simple;
	bh=hQCEg4wByia6Fc5ooHabuib3oUBNbzdnjWlveZabK9w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZlDzystryDHHSNwxh8Apzav5rRx0POYllnc2rXeexJmeZ+tO49Yfj7meHX5fXfmZWlVZjdsGStqY9hgmkanGricj+foLEAt1Fgv68mJ7lpKd/ErUkMXDrkPiUjHPtfXwwUgde6JTegYJGvBX0BCgxUEehN/q/iw4q5T+iwa0cq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cz1xoVWM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706764865; x=1738300865;
  h=date:from:to:cc:subject:message-id;
  bh=hQCEg4wByia6Fc5ooHabuib3oUBNbzdnjWlveZabK9w=;
  b=Cz1xoVWMEMoFi4CeT2UZ3N/CgSDXDBUi+tS01mg+ewSRwp0kPlFiY1dK
   8WEvjX5U4oEYQ5W8LC5dwAe6p16K/bGH0BWRzTvIbipBgigvXNbqIO96a
   WoCPgZI471zgHTYWTizjdKYdVm4C7ALRzPA9EhZ5epoiYbbI12dUKw9Dw
   eX0BBPwaqulvos/Li3B2NkHCoqfLREUQoXeYbmg6J4nSI76VyR0Ik/ZvE
   1Kg9d+qsGGwxSksSk5Z5kciaGzdqXMG/sUQo/PQXVQQtHZeYSYU/reFd8
   OMBtLuFwqgPLeoeJPDc1aIZKsc2f/XE5p6K2r2mu2QHDDQYAMwmzpd/gT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10913622"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="10913622"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 21:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4312221"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jan 2024 21:21:02 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVPVU-0002OQ-1J;
	Thu, 01 Feb 2024 05:21:00 +0000
Date: Thu, 01 Feb 2024 13:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.9] BUILD SUCCESS
 096311157d2a6bb8f06e28e1143e2a5de6a0183b
Message-ID: <202402011348.WZD1PmfN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.9
branch HEAD: 096311157d2a6bb8f06e28e1143e2a5de6a0183b  clk: renesas: r8a779g0: Fix PCIe clock name

elapsed time: 827m

configs tested: 181
configs skipped: 4

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
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240201   gcc  
arc                   randconfig-002-20240201   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240201   gcc  
arm                   randconfig-002-20240201   gcc  
arm                   randconfig-003-20240201   gcc  
arm                   randconfig-004-20240201   gcc  
arm                           sama5_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240201   gcc  
arm64                 randconfig-002-20240201   gcc  
arm64                 randconfig-003-20240201   gcc  
arm64                 randconfig-004-20240201   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240201   gcc  
csky                  randconfig-002-20240201   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240201   gcc  
i386         buildonly-randconfig-002-20240201   gcc  
i386         buildonly-randconfig-003-20240201   gcc  
i386         buildonly-randconfig-004-20240201   gcc  
i386         buildonly-randconfig-005-20240201   gcc  
i386         buildonly-randconfig-006-20240201   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240201   gcc  
i386                  randconfig-002-20240201   gcc  
i386                  randconfig-003-20240201   gcc  
i386                  randconfig-004-20240201   gcc  
i386                  randconfig-005-20240201   gcc  
i386                  randconfig-006-20240201   gcc  
i386                  randconfig-011-20240201   clang
i386                  randconfig-012-20240201   clang
i386                  randconfig-013-20240201   clang
i386                  randconfig-014-20240201   clang
i386                  randconfig-015-20240201   clang
i386                  randconfig-016-20240201   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240201   gcc  
loongarch             randconfig-002-20240201   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240201   gcc  
nios2                 randconfig-002-20240201   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240201   gcc  
parisc                randconfig-002-20240201   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                     ksi8560_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc               randconfig-001-20240201   gcc  
powerpc               randconfig-002-20240201   gcc  
powerpc               randconfig-003-20240201   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240201   gcc  
powerpc64             randconfig-002-20240201   gcc  
powerpc64             randconfig-003-20240201   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240201   gcc  
riscv                 randconfig-002-20240201   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20240201   gcc  
sh                    randconfig-002-20240201   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240201   gcc  
sparc64               randconfig-002-20240201   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240201   gcc  
um                    randconfig-002-20240201   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240201   gcc  
x86_64       buildonly-randconfig-002-20240201   gcc  
x86_64       buildonly-randconfig-003-20240201   gcc  
x86_64       buildonly-randconfig-004-20240201   gcc  
x86_64       buildonly-randconfig-005-20240201   gcc  
x86_64       buildonly-randconfig-006-20240201   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240201   gcc  
x86_64                randconfig-012-20240201   gcc  
x86_64                randconfig-013-20240201   gcc  
x86_64                randconfig-014-20240201   gcc  
x86_64                randconfig-015-20240201   gcc  
x86_64                randconfig-016-20240201   gcc  
x86_64                randconfig-071-20240201   gcc  
x86_64                randconfig-072-20240201   gcc  
x86_64                randconfig-073-20240201   gcc  
x86_64                randconfig-074-20240201   gcc  
x86_64                randconfig-075-20240201   gcc  
x86_64                randconfig-076-20240201   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240201   gcc  
xtensa                randconfig-002-20240201   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

