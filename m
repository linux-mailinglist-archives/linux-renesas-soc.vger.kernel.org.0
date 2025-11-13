Return-Path: <linux-renesas-soc+bounces-24583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 569A7C5903A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 18:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 41C824F25EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 16:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E170E34FF79;
	Thu, 13 Nov 2025 16:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhJl8/a+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AFD346763
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763052520; cv=none; b=tGdLjCY4IV9Wxv/bqBcgB1j/AEGg/oClVOf9AhfYcxeOsyvOsVG9YKQisVvhzm+bcN7pHYs1x45NJxC72soLhn4S6CW0jdzA8jkZxJxthOt7pFqgMgwHYtUuHJz29LdmFm4qg1F4fVCVGY8ZTOBGyobJ49+BAKg5liHBB/7so2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763052520; c=relaxed/simple;
	bh=gTdDWZB6sSgKgfpfukf8sp6ClDx6iNx9tOAW5PInTPM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pw1s9otQO01vW2L/Ha+D41EzI3RbQOTnOcvGJymU4dWFRmE3SENg+cCWKwk9JemzSjcRqcZLhZbrPY7gTQDl1v648rq1Y4Nsn16ViCSIfdTUaipcYFIfeCROJDA86eeUGm+fzDROsBfZNPrFyZUPrXqwbB8qqqJyzZXojuAQrWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhJl8/a+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763052519; x=1794588519;
  h=date:from:to:cc:subject:message-id;
  bh=gTdDWZB6sSgKgfpfukf8sp6ClDx6iNx9tOAW5PInTPM=;
  b=LhJl8/a+/vg2uwBa9ZBi+euaC3Hjf3CRSc+3t2OYD8a277gdztvcgpjj
   yJ3r0JGGxLU4PUosr2rnqrew6SR//V3uE9D9xrlwYxw3Kqv0iMDuWVtl3
   gpWuRX/a10r64Nlan5bxd6Bh3y0v/FGKMvKxKAPI5Qqauq3ejYN0DcSw4
   o1QFfL96mjAdJyvtnkNzctIsTz1X/AGti1wNkZ33nBZJBUS9kVFf40P8h
   g32rsT3jF/N0BGgvqvHgXM6HIPWkr3ImTticpM7XFOYPKeYYVx3L6LI9S
   Rd4v4pQmQq2vowt+Z2n8WXu6vHqr7rcAgqEUWPkoIZ4KjoBM0kPSv+c8c
   g==;
X-CSE-ConnectionGUID: 9FgQs9rkTg2aNqjU317nfA==
X-CSE-MsgGUID: zwmmgErwTAypIwjjC0WB+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65178490"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="65178490"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 08:48:39 -0800
X-CSE-ConnectionGUID: mlu4meVdRTSw9MWY9cm/Aw==
X-CSE-MsgGUID: lTtm+MQNTRufcJQQyKIDjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="194537226"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2025 08:48:37 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJaUt-0005ad-2N;
	Thu, 13 Nov 2025 16:48:35 +0000
Date: Fri, 14 Nov 2025 00:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 f8def051bbcf8677f64701e9699bf6d11e2780cd
Message-ID: <202511140053.tOkjNruu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: f8def051bbcf8677f64701e9699bf6d11e2780cd  clk: renesas: r9a06g032: Fix memory leak in error path

elapsed time: 1748m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251113    gcc-8.5.0
arc                   randconfig-002-20251113    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                         lpc18xx_defconfig    clang-22
arm                         orion5x_defconfig    clang-22
arm                   randconfig-001-20251113    gcc-10.5.0
arm                   randconfig-002-20251113    clang-22
arm                   randconfig-003-20251113    clang-22
arm                   randconfig-004-20251113    clang-22
arm                        spear6xx_defconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251113    clang-16
arm64                 randconfig-002-20251113    clang-22
arm64                 randconfig-003-20251113    gcc-8.5.0
arm64                 randconfig-004-20251113    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251113    gcc-9.5.0
csky                  randconfig-002-20251113    gcc-14.3.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251113    clang-22
hexagon               randconfig-002-20251113    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251113    clang-20
i386        buildonly-randconfig-002-20251113    gcc-14
i386        buildonly-randconfig-003-20251113    gcc-14
i386        buildonly-randconfig-004-20251113    gcc-12
i386        buildonly-randconfig-005-20251113    gcc-14
i386        buildonly-randconfig-006-20251113    clang-20
i386                  randconfig-001-20251113    gcc-14
i386                  randconfig-002-20251113    clang-20
i386                  randconfig-003-20251113    clang-20
i386                  randconfig-004-20251113    gcc-14
i386                  randconfig-005-20251113    clang-20
i386                  randconfig-006-20251113    clang-20
i386                  randconfig-007-20251113    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251113    gcc-15.1.0
loongarch             randconfig-002-20251113    clang-22
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
microblaze                      mmu_defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251113    gcc-8.5.0
nios2                 randconfig-002-20251113    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251113    gcc-8.5.0
parisc                randconfig-002-20251113    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      pmac32_defconfig    clang-22
powerpc               randconfig-001-20251113    clang-22
powerpc               randconfig-002-20251113    clang-22
powerpc64             randconfig-001-20251113    clang-22
powerpc64             randconfig-002-20251113    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251113    gcc-8.5.0
riscv                 randconfig-002-20251113    gcc-11.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251113    clang-22
s390                  randconfig-002-20251113    clang-17
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251113    gcc-15.1.0
sh                    randconfig-002-20251113    gcc-11.5.0
sh                        sh7763rdp_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251113    gcc-8.5.0
sparc                 randconfig-002-20251113    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251113    clang-20
sparc64               randconfig-002-20251113    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251113    gcc-14
um                    randconfig-002-20251113    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251113    gcc-14
x86_64      buildonly-randconfig-002-20251113    clang-20
x86_64      buildonly-randconfig-003-20251113    clang-20
x86_64      buildonly-randconfig-004-20251113    gcc-14
x86_64      buildonly-randconfig-005-20251113    gcc-12
x86_64      buildonly-randconfig-006-20251113    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20251113    gcc-14
x86_64                randconfig-072-20251113    gcc-12
x86_64                randconfig-073-20251113    gcc-12
x86_64                randconfig-074-20251113    gcc-14
x86_64                randconfig-075-20251113    gcc-14
x86_64                randconfig-076-20251113    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251113    gcc-15.1.0
xtensa                randconfig-002-20251113    gcc-13.4.0
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

