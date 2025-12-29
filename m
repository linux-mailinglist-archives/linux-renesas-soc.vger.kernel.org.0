Return-Path: <linux-renesas-soc+bounces-26166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F759CE853C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 00:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 434393012BF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Dec 2025 23:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508C6285041;
	Mon, 29 Dec 2025 23:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrAhjXwL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA1A262FFC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Dec 2025 23:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767050941; cv=none; b=GIUgYRDeFMnFiOcoKTA0y62sAl+bH5V+Ft1tqf+jVnNL6LuFsD1K8tcbiAoQhhU8zmOrMiuiFV+qCBJOuLQeTY5RdiWBx4zzBSozUYyYi7NKcUe3vwvvHJDRDiBcgG0sRfQbgJEILrbbRslJAhr1Am3xmYMKxGko0DaBdqzJCXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767050941; c=relaxed/simple;
	bh=0eNPnXG1SKu0kK0bSU9k6BeWjtz6SZcGYhKObDP/8aI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dloIw6p/Fma+9JJbjnAme95TYPsaE7wkNtYlHs3Jkl+D3eIavzYAL8BSjQkj5TIOSVJpey9T6uEXdZE4tsabFqwwWZJN96cCRXQ8RYEJ3ihXmCQqLAiM559gJ/xUmmkX114O+40VVrqeDCKJX4ZsEMevXoPSwmIBRMBYoVVPTdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrAhjXwL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767050939; x=1798586939;
  h=date:from:to:cc:subject:message-id;
  bh=0eNPnXG1SKu0kK0bSU9k6BeWjtz6SZcGYhKObDP/8aI=;
  b=nrAhjXwLLun4kFN+fgwkdILHBsR0Ze8N254NgHfkB14/0TLknw8rQRA8
   GPbvPuRAxjzV4LqX1/3seaWeGNfx5zJNf72wN8B+C6rbAe6sgooiqjQm7
   N3TY6sBaI1MNzWDqJkcBKLwtAAhtkukcBb36HNdmm12Jrv6W0S+2SMMP8
   P4AgXStu2M8v6EAuIb2qsOXT5LwsReTdoDgWAWdmqbnnO/MYQUKi/0vaG
   me0+AQSgi97bly+aCb3h7Zi0V99mOQFkG3wOIhNQ7X73BklzTorGjjCGG
   J3gQJGHbA2gj/lpU6HowACkwgzgJ/oDciKi5oQgJNkRpp4MbGxEPYzCAP
   A==;
X-CSE-ConnectionGUID: JcTE5ea8RQuALywqcW6LPg==
X-CSE-MsgGUID: Z5aV8qahSBetdHszPvhOuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68591957"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68591957"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 15:28:58 -0800
X-CSE-ConnectionGUID: CJBFNetOR0+jkGtZYs143w==
X-CSE-MsgGUID: AQJoCyrEROqMhBsEXokScQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="224538984"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Dec 2025 15:28:57 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaMfW-0000000087d-2L4m;
	Mon, 29 Dec 2025 23:28:54 +0000
Date: Tue, 30 Dec 2025 07:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.20] BUILD SUCCESS
 ebb3acf4d7c95b52265084168b59a565bf972883
Message-ID: <202512300711.cUh6V9ER-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.20
branch HEAD: ebb3acf4d7c95b52265084168b59a565bf972883  clk: renesas: r9a09g056: Add clock and reset entries for TSU

elapsed time: 723m

configs tested: 226
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251229    gcc-13.4.0
arc                   randconfig-001-20251230    gcc-12.5.0
arc                   randconfig-002-20251229    gcc-8.5.0
arc                   randconfig-002-20251230    gcc-9.5.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                          moxart_defconfig    gcc-15.1.0
arm                   randconfig-001-20251229    gcc-15.1.0
arm                   randconfig-001-20251230    gcc-8.5.0
arm                   randconfig-002-20251229    gcc-12.5.0
arm                   randconfig-002-20251230    gcc-8.5.0
arm                   randconfig-003-20251229    clang-22
arm                   randconfig-003-20251230    gcc-10.5.0
arm                   randconfig-004-20251229    gcc-15.1.0
arm                   randconfig-004-20251230    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251229    clang-22
arm64                 randconfig-001-20251230    gcc-15.1.0
arm64                 randconfig-002-20251229    clang-22
arm64                 randconfig-002-20251230    gcc-14.3.0
arm64                 randconfig-003-20251229    gcc-10.5.0
arm64                 randconfig-003-20251230    clang-22
arm64                 randconfig-004-20251229    gcc-9.5.0
arm64                 randconfig-004-20251230    clang-20
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251229    gcc-15.1.0
csky                  randconfig-001-20251230    gcc-15.1.0
csky                  randconfig-002-20251229    gcc-15.1.0
csky                  randconfig-002-20251230    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251229    clang-22
hexagon               randconfig-002-20251229    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251229    clang-20
i386        buildonly-randconfig-001-20251230    gcc-14
i386        buildonly-randconfig-002-20251229    gcc-14
i386        buildonly-randconfig-002-20251230    clang-20
i386        buildonly-randconfig-003-20251229    gcc-13
i386        buildonly-randconfig-003-20251230    clang-20
i386        buildonly-randconfig-004-20251229    clang-20
i386        buildonly-randconfig-004-20251230    clang-20
i386        buildonly-randconfig-005-20251229    gcc-14
i386        buildonly-randconfig-005-20251230    clang-20
i386        buildonly-randconfig-006-20251229    gcc-14
i386        buildonly-randconfig-006-20251230    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251229    gcc-14
i386                  randconfig-002-20251229    clang-20
i386                  randconfig-003-20251229    clang-20
i386                  randconfig-004-20251229    clang-20
i386                  randconfig-005-20251229    clang-20
i386                  randconfig-006-20251229    clang-20
i386                  randconfig-007-20251229    clang-20
i386                  randconfig-011-20251229    gcc-14
i386                  randconfig-011-20251230    gcc-14
i386                  randconfig-012-20251229    gcc-14
i386                  randconfig-012-20251230    gcc-14
i386                  randconfig-013-20251229    gcc-14
i386                  randconfig-013-20251230    clang-20
i386                  randconfig-014-20251229    gcc-14
i386                  randconfig-014-20251230    gcc-12
i386                  randconfig-015-20251229    gcc-14
i386                  randconfig-015-20251230    gcc-14
i386                  randconfig-016-20251229    gcc-14
i386                  randconfig-016-20251230    gcc-14
i386                  randconfig-017-20251229    gcc-14
i386                  randconfig-017-20251230    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251229    clang-18
loongarch             randconfig-002-20251229    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251229    gcc-11.5.0
nios2                 randconfig-002-20251229    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251229    gcc-13.4.0
parisc                randconfig-002-20251229    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       ebony_defconfig    clang-22
powerpc                       holly_defconfig    clang-22
powerpc                     mpc512x_defconfig    clang-22
powerpc                  mpc866_ads_defconfig    clang-22
powerpc               randconfig-001-20251229    gcc-12.5.0
powerpc               randconfig-002-20251229    clang-18
powerpc                     redwood_defconfig    clang-22
powerpc64             randconfig-001-20251229    clang-20
powerpc64             randconfig-002-20251229    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251229    gcc-15.1.0
riscv                 randconfig-001-20251230    gcc-15.1.0
riscv                 randconfig-002-20251229    clang-20
riscv                 randconfig-002-20251230    gcc-15.1.0
s390                             alldefconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251229    clang-22
s390                  randconfig-001-20251230    gcc-14.3.0
s390                  randconfig-002-20251229    gcc-12.5.0
s390                  randconfig-002-20251230    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7705_defconfig    gcc-15.1.0
sh                    randconfig-001-20251229    gcc-10.5.0
sh                    randconfig-001-20251230    gcc-13.4.0
sh                    randconfig-002-20251229    gcc-15.1.0
sh                    randconfig-002-20251230    gcc-12.5.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sh                            shmin_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251229    gcc-13.4.0
sparc                 randconfig-001-20251230    gcc-8.5.0
sparc                 randconfig-002-20251229    gcc-15.1.0
sparc                 randconfig-002-20251230    gcc-11.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251229    clang-20
sparc64               randconfig-001-20251230    clang-22
sparc64               randconfig-002-20251229    gcc-8.5.0
sparc64               randconfig-002-20251230    clang-20
um                               alldefconfig    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251229    gcc-14
um                    randconfig-001-20251230    gcc-13
um                    randconfig-002-20251229    clang-22
um                    randconfig-002-20251230    clang-18
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251229    clang-20
x86_64      buildonly-randconfig-001-20251230    gcc-14
x86_64      buildonly-randconfig-002-20251229    clang-20
x86_64      buildonly-randconfig-002-20251230    gcc-14
x86_64      buildonly-randconfig-003-20251229    gcc-14
x86_64      buildonly-randconfig-003-20251230    clang-20
x86_64      buildonly-randconfig-004-20251229    clang-20
x86_64      buildonly-randconfig-004-20251230    clang-20
x86_64      buildonly-randconfig-005-20251229    gcc-14
x86_64      buildonly-randconfig-005-20251230    clang-20
x86_64      buildonly-randconfig-006-20251229    gcc-13
x86_64      buildonly-randconfig-006-20251230    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251230    gcc-14
x86_64                randconfig-002-20251230    clang-20
x86_64                randconfig-003-20251230    clang-20
x86_64                randconfig-004-20251230    clang-20
x86_64                randconfig-005-20251230    clang-20
x86_64                randconfig-006-20251230    gcc-14
x86_64                randconfig-011-20251229    clang-20
x86_64                randconfig-011-20251230    gcc-14
x86_64                randconfig-012-20251229    gcc-14
x86_64                randconfig-012-20251230    gcc-14
x86_64                randconfig-013-20251229    clang-20
x86_64                randconfig-013-20251230    gcc-14
x86_64                randconfig-014-20251229    clang-20
x86_64                randconfig-014-20251230    clang-20
x86_64                randconfig-015-20251229    clang-20
x86_64                randconfig-015-20251230    clang-20
x86_64                randconfig-016-20251229    gcc-14
x86_64                randconfig-071-20251230    clang-20
x86_64                randconfig-072-20251230    clang-20
x86_64                randconfig-073-20251230    gcc-14
x86_64                randconfig-074-20251230    clang-20
x86_64                randconfig-075-20251230    clang-20
x86_64                randconfig-076-20251230    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251229    gcc-8.5.0
xtensa                randconfig-001-20251230    gcc-8.5.0
xtensa                randconfig-002-20251229    gcc-15.1.0
xtensa                randconfig-002-20251230    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

