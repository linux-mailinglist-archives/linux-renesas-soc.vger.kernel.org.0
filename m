Return-Path: <linux-renesas-soc+bounces-3063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E98685EC19
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 23:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A02311F24627
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 22:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8FF45C10;
	Wed, 21 Feb 2024 22:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtkR49qE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CF05232
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2024 22:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708556346; cv=none; b=dZoeHgg8P0NjGTec1YQ0yyEKHNdsIaRnT//17BSf5jn9Eobb6ISa3NR4OieiUDwrMDAiMKaUOlEZ+5+SqWIsrFO7QVpFT1/XD0EIFwv0V4aLjjom5HQNrF/A7bvjtcVBpzflMljUy1GxXC2ylYgWhFdzNG5YIbzX5ZkZUdtSpaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708556346; c=relaxed/simple;
	bh=VdNDvLxj8Fs9nTBDhgj4HUHlX7VxsMK3MU+o5FPgFpo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P+ya+ETnbNVleBdgKNT5UPEfJG8LLyozQOxKNJ7ki7gF9Mh974PTEyeviSXrAcKEjmaZZ7fQuVDgaay/51tTscwp6mYLCDdpmuW/7PC19bMRzQ/yHAoowqUFarMBFMgp0Q1iWDzf66wQyQR3xuUYhBUNtLHrJZJQoKKBm/EYshg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtkR49qE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708556344; x=1740092344;
  h=date:from:to:cc:subject:message-id;
  bh=VdNDvLxj8Fs9nTBDhgj4HUHlX7VxsMK3MU+o5FPgFpo=;
  b=QtkR49qEUa443qH4Nkc4JwIy2CQVcWV1pR8kaJR1gAyS7mauFFwQ0XjQ
   /9qJjXVVT0mhtqmfdtLmW+Liurh06z5ExTVYuUknpuc79tXSueTEKk+aY
   IVdktIQr4tEiUkyU5mq49l8lzTkRrrpsuWN7g6ek+YBN/S5lYm335zOPc
   c5d+uw3y2L7EZYZ0KKfFYR+G2cAjiQ3Ax8DhNlhERSPQUkdSIFSp6TwgN
   QlO4FXAIWPVPA2qd7YYwy1zUUWeaNvuOrsVQHMb6lrbUVdf3t216p9Z8G
   Y6jYS65aWb0v97PHYKzKfoT6KxIvLCTBpayG91fA3YUl6l0ULoX/pFrRF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2898457"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2898457"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 14:59:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5183689"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Feb 2024 14:59:01 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcvYI-0005lt-0M;
	Wed, 21 Feb 2024 22:58:58 +0000
Date: Thu, 22 Feb 2024 06:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.9] BUILD SUCCESS
 81a7a88a98062ffcd8d7d5ac3b540a96dbff5490
Message-ID: <202402220604.i7TCE8wS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.9
branch HEAD: 81a7a88a98062ffcd8d7d5ac3b540a96dbff5490  clk: renesas: r8a779h0: Add RPC-IF clock

elapsed time: 1460m

configs tested: 200
configs skipped: 3

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
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20240221   gcc  
arc                   randconfig-002-20240221   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                        neponset_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240221   clang
arm                   randconfig-002-20240221   clang
arm                   randconfig-003-20240221   gcc  
arm                   randconfig-004-20240221   clang
arm                           stm32_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240221   gcc  
arm64                 randconfig-002-20240221   gcc  
arm64                 randconfig-003-20240221   gcc  
arm64                 randconfig-004-20240221   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240221   gcc  
csky                  randconfig-002-20240221   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240221   clang
hexagon               randconfig-002-20240221   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240221   gcc  
i386         buildonly-randconfig-002-20240221   clang
i386         buildonly-randconfig-003-20240221   gcc  
i386         buildonly-randconfig-004-20240221   gcc  
i386         buildonly-randconfig-005-20240221   gcc  
i386         buildonly-randconfig-006-20240221   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240221   gcc  
i386                  randconfig-002-20240221   clang
i386                  randconfig-003-20240221   clang
i386                  randconfig-004-20240221   gcc  
i386                  randconfig-005-20240221   gcc  
i386                  randconfig-006-20240221   clang
i386                  randconfig-011-20240221   gcc  
i386                  randconfig-012-20240221   clang
i386                  randconfig-013-20240221   gcc  
i386                  randconfig-014-20240221   clang
i386                  randconfig-015-20240221   gcc  
i386                  randconfig-016-20240221   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240221   gcc  
loongarch             randconfig-002-20240221   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       lemote2f_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                      pic32mzda_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240221   gcc  
nios2                 randconfig-002-20240221   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240221   gcc  
parisc                randconfig-002-20240221   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240221   gcc  
powerpc               randconfig-002-20240221   gcc  
powerpc               randconfig-003-20240221   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240221   gcc  
powerpc64             randconfig-002-20240221   gcc  
powerpc64             randconfig-003-20240221   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240221   clang
riscv                 randconfig-002-20240221   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240221   clang
s390                  randconfig-002-20240221   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240221   gcc  
sh                    randconfig-002-20240221   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240221   gcc  
sparc64               randconfig-002-20240221   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240221   gcc  
um                    randconfig-002-20240221   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240221   clang
x86_64       buildonly-randconfig-002-20240221   gcc  
x86_64       buildonly-randconfig-003-20240221   gcc  
x86_64       buildonly-randconfig-003-20240222   gcc  
x86_64       buildonly-randconfig-004-20240221   clang
x86_64       buildonly-randconfig-005-20240221   clang
x86_64       buildonly-randconfig-005-20240222   gcc  
x86_64       buildonly-randconfig-006-20240221   clang
x86_64       buildonly-randconfig-006-20240222   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240221   gcc  
x86_64                randconfig-002-20240221   gcc  
x86_64                randconfig-003-20240221   gcc  
x86_64                randconfig-004-20240221   gcc  
x86_64                randconfig-005-20240221   gcc  
x86_64                randconfig-005-20240222   gcc  
x86_64                randconfig-006-20240221   gcc  
x86_64                randconfig-006-20240222   gcc  
x86_64                randconfig-011-20240221   clang
x86_64                randconfig-012-20240221   gcc  
x86_64                randconfig-012-20240222   gcc  
x86_64                randconfig-013-20240221   clang
x86_64                randconfig-014-20240221   gcc  
x86_64                randconfig-014-20240222   gcc  
x86_64                randconfig-015-20240221   gcc  
x86_64                randconfig-016-20240221   gcc  
x86_64                randconfig-071-20240221   gcc  
x86_64                randconfig-072-20240221   gcc  
x86_64                randconfig-073-20240221   gcc  
x86_64                randconfig-074-20240221   gcc  
x86_64                randconfig-074-20240222   gcc  
x86_64                randconfig-075-20240221   clang
x86_64                randconfig-075-20240222   gcc  
x86_64                randconfig-076-20240221   gcc  
x86_64                randconfig-076-20240222   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240221   gcc  
xtensa                randconfig-002-20240221   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

