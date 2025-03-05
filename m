Return-Path: <linux-renesas-soc+bounces-14014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E6EA5037E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 16:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1A297A41A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 15:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2422D2505C2;
	Wed,  5 Mar 2025 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+3szpYO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629DA24EF7D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Mar 2025 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741188615; cv=none; b=Cj9ZKYqwYRX4Sv27iiwcu+Tn7SerHL9O2FuXVmart0pIzw3nPZx0kjez3f5q/ryYxz00a3o+RzMqz8oe5WiTnC2zE2YMp+9II6cAgKgjgmcixz37M3Keo8AJiR/3/tZBJnxp6kf6AsTHSHiHWOh7ZsRXNDMZNWuAT539mTdL9RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741188615; c=relaxed/simple;
	bh=mnY9jonjdWSCAjWdE1ebam44fxeas02C6YcQbXWx59A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FvID0HZ/JYQ7s0ftgMvx5C89Qaz/x4WjhY51yLNSF2CrdNRN4FzpTJYejhfzAakdjTYP+2vrvKn7oX8av2x3CjF5izsaJajRHoSa8TNOfAg8W4jyYbE7d07M4/ZgoEh8MkLBgW+kJ5gPO7JY1FCTSPtUFWthSPnzYaNZiDJVE/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+3szpYO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741188614; x=1772724614;
  h=date:from:to:cc:subject:message-id;
  bh=mnY9jonjdWSCAjWdE1ebam44fxeas02C6YcQbXWx59A=;
  b=N+3szpYOsH2CqRBoEmFWuN8IEFFA3bWF9vJ65IMxRd/O0WJ466IXSrZT
   wKfVE4xT/+NdljxMaW4K/72oXS1tAR2fVG/OFNgSQFGRiKSqe7cxRrdZI
   PSmjnGAezF0SJYR/fTsBZpL+/QsnxKko3QwsWuJhPd94e/Ojj0JWLc0Iz
   N37dZsu8AtAb3GDE2Y/qsZtQCuXUgqmpfCeYr3p0xjzU+08H4Ztq05vgb
   GiGvsvGrL4dWVkufjsOCdBizvcGYSIzIDtE1z7S5A+rmQsn6FzsIhteTw
   nMto0dg4aVbjsEzcY6mksY+P6Dt9fnptk6+RXAUCZBL1pcTIWaTwy8CO1
   w==;
X-CSE-ConnectionGUID: cDdBfTJZStWitYiYBv+/yg==
X-CSE-MsgGUID: cggkcf+2S8yG9J/fJjF/EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42064602"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="42064602"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 07:30:13 -0800
X-CSE-ConnectionGUID: rMgbCoWeSUOlcTLgnKwWew==
X-CSE-MsgGUID: e8mDrLgpQcmHJcP0uKH0UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119640703"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2025 07:30:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpqhF-000L9o-0m;
	Wed, 05 Mar 2025 15:30:09 +0000
Date: Wed, 05 Mar 2025 23:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 5288fe0e2e9d2c147e18c5ce4d03d17f34132dde
Message-ID: <202503052326.oVEiFXYt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 5288fe0e2e9d2c147e18c5ce4d03d17f34132dde  clk: renesas: r7s9210: Distinguish clocks by clock type

elapsed time: 1452m

configs tested: 106
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250305    gcc-13.2.0
arc                   randconfig-002-20250305    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-16
arm                      integrator_defconfig    clang-15
arm                          pxa3xx_defconfig    clang-21
arm                   randconfig-001-20250305    gcc-14.2.0
arm                   randconfig-002-20250305    clang-19
arm                   randconfig-003-20250305    gcc-14.2.0
arm                   randconfig-004-20250305    gcc-14.2.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250305    clang-15
arm64                 randconfig-002-20250305    gcc-14.2.0
arm64                 randconfig-003-20250305    clang-21
arm64                 randconfig-004-20250305    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250305    gcc-14.2.0
csky                  randconfig-002-20250305    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250305    clang-21
hexagon               randconfig-002-20250305    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250304    clang-19
i386        buildonly-randconfig-001-20250305    clang-19
i386        buildonly-randconfig-002-20250304    clang-19
i386        buildonly-randconfig-002-20250305    clang-19
i386        buildonly-randconfig-003-20250304    gcc-12
i386        buildonly-randconfig-003-20250305    clang-19
i386        buildonly-randconfig-004-20250304    gcc-11
i386        buildonly-randconfig-004-20250305    clang-19
i386        buildonly-randconfig-005-20250304    gcc-11
i386        buildonly-randconfig-005-20250305    clang-19
i386        buildonly-randconfig-006-20250304    gcc-12
i386        buildonly-randconfig-006-20250305    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250305    gcc-14.2.0
loongarch             randconfig-002-20250305    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250305    gcc-14.2.0
nios2                 randconfig-002-20250305    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250305    gcc-14.2.0
parisc                randconfig-002-20250305    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250305    clang-17
powerpc               randconfig-002-20250305    gcc-14.2.0
powerpc               randconfig-003-20250305    gcc-14.2.0
powerpc64             randconfig-001-20250305    clang-19
powerpc64             randconfig-002-20250305    clang-17
powerpc64             randconfig-003-20250305    clang-19
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250305    clang-19
riscv                 randconfig-002-20250305    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250305    gcc-14.2.0
s390                  randconfig-002-20250305    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250305    gcc-14.2.0
sh                    randconfig-002-20250305    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250305    gcc-14.2.0
sparc                 randconfig-002-20250305    gcc-14.2.0
sparc64               randconfig-001-20250305    gcc-14.2.0
sparc64               randconfig-002-20250305    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250305    clang-19
um                    randconfig-002-20250305    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250304    clang-19
x86_64      buildonly-randconfig-002-20250304    gcc-12
x86_64      buildonly-randconfig-003-20250304    gcc-12
x86_64      buildonly-randconfig-004-20250304    gcc-12
x86_64      buildonly-randconfig-005-20250304    gcc-12
x86_64      buildonly-randconfig-006-20250304    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250305    gcc-14.2.0
xtensa                randconfig-002-20250305    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

