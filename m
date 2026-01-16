Return-Path: <linux-renesas-soc+bounces-26939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 216A9D3892C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 23:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99BAE3010517
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 22:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1A22D7810;
	Fri, 16 Jan 2026 22:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAG44u9f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8746930FF3B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 22:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768602268; cv=none; b=b6rkZu4bamS2k5j/31fpmzgDbdC4CoTF+prDNGM081DHjSL+JgIO3mBuxhoQ9xPuAFs9Hy2i2ZYeaXwabE3/PHAWk+UVTe2ePGAUx8DfVbVu4BimTtXhYbym+zHhSJfdnGyM+T86WcTePn1n2fOZiKinbXqvDV+74Ew2rhUAOVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768602268; c=relaxed/simple;
	bh=7XslJQBp0z7L9Yvxi9ZI00hFUJvyCA05nld6X54xfzM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=peUBG5fgwhUeXOqchE6M/1wRy3mi5azQsIkuITGFYmGhLU52QJ5bHGGpt7dYqJvJeV3/OAHHK4KcDp16eB43z9cXQ1GaNjgGcMCwsof9JDnTN5+l/+GyYtIIYcILcrYG4yH1veNL7u2ELstcJLjPAr3jnmnWyO7hKGnvPOL70mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAG44u9f; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768602266; x=1800138266;
  h=date:from:to:cc:subject:message-id;
  bh=7XslJQBp0z7L9Yvxi9ZI00hFUJvyCA05nld6X54xfzM=;
  b=CAG44u9f6fZHru5AQ93+dPLEUoVRBz0CXyI/q4NjQOGMzdyopn2Iz/64
   g0vgwJwJpQJNC3aV9YtmMyGQx7SSnbERKHfOcNnK8G2ttSZlv5bn6fQWt
   5gvfXm1TWG0+7vvd6vJ0whozbin5xITeDXDkVNzQkvZHzAkbdIFOgwKiE
   d56j4+JGOKOCLoDXx8nAMcfGrGOYMF0DfBSDZ1C4aqWge07kwVuAGgvKc
   bJR62aEEgJJriKxH1udK2cB5lCWYSNeEzTyYsfE0Hr+/bpbHrfnatzNeM
   ExmMlgnvlQsipsbahD1FGFJYshr9KlW9l9ANal20A1n5CfQyPv6HnJJW3
   Q==;
X-CSE-ConnectionGUID: ZfkHwDYFStuDTVD4Vc/tzA==
X-CSE-MsgGUID: Z+tNMA47Ri6IMxFKkg///g==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87495091"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="87495091"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 14:24:26 -0800
X-CSE-ConnectionGUID: BdQmbXerRUuuN8nas//8hw==
X-CSE-MsgGUID: 9SkRsPQeRqGQdYqmTg0hOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="204583215"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jan 2026 14:24:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgsEv-00000000LJK-2isl;
	Fri, 16 Jan 2026 22:24:21 +0000
Date: Sat, 17 Jan 2026 06:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 39f861fc84d7fc7230da73c36000bcde538e58de
Message-ID: <202601170630.wrg1tmhH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 39f861fc84d7fc7230da73c36000bcde538e58de  Merge branch 'renesas-next' into renesas-devel

elapsed time: 723m

configs tested: 232
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                         haps_hs_defconfig    gcc-15.2.0
arc                            hsdk_defconfig    gcc-15.2.0
arc                   randconfig-001-20260116    gcc-8.5.0
arc                   randconfig-001-20260117    gcc-12.5.0
arc                   randconfig-002-20260116    gcc-8.5.0
arc                   randconfig-002-20260117    gcc-12.5.0
arm                              alldefconfig    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                             mxs_defconfig    gcc-15.2.0
arm                   randconfig-001-20260116    gcc-8.5.0
arm                   randconfig-001-20260117    gcc-12.5.0
arm                   randconfig-002-20260116    gcc-8.5.0
arm                   randconfig-002-20260117    gcc-12.5.0
arm                   randconfig-003-20260116    gcc-8.5.0
arm                   randconfig-003-20260117    gcc-12.5.0
arm                   randconfig-004-20260116    gcc-8.5.0
arm                   randconfig-004-20260117    gcc-12.5.0
arm                        spear3xx_defconfig    gcc-15.2.0
arm                           stm32_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260116    clang-20
hexagon               randconfig-001-20260117    clang-22
hexagon               randconfig-002-20260116    clang-20
hexagon               randconfig-002-20260117    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260116    gcc-12
i386        buildonly-randconfig-001-20260117    gcc-13
i386        buildonly-randconfig-002-20260116    gcc-12
i386        buildonly-randconfig-002-20260117    gcc-13
i386        buildonly-randconfig-003-20260116    gcc-12
i386        buildonly-randconfig-003-20260117    gcc-13
i386        buildonly-randconfig-004-20260116    gcc-12
i386        buildonly-randconfig-004-20260117    gcc-13
i386        buildonly-randconfig-005-20260116    gcc-12
i386        buildonly-randconfig-005-20260117    gcc-13
i386        buildonly-randconfig-006-20260116    gcc-12
i386        buildonly-randconfig-006-20260117    gcc-13
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260116    clang-20
i386                  randconfig-002-20260116    clang-20
i386                  randconfig-003-20260116    clang-20
i386                  randconfig-004-20260116    clang-20
i386                  randconfig-005-20260116    clang-20
i386                  randconfig-006-20260116    clang-20
i386                  randconfig-007-20260116    clang-20
i386                  randconfig-011-20260116    clang-20
i386                  randconfig-011-20260117    gcc-14
i386                  randconfig-012-20260116    clang-20
i386                  randconfig-012-20260117    gcc-14
i386                  randconfig-013-20260116    clang-20
i386                  randconfig-013-20260117    gcc-14
i386                  randconfig-014-20260116    clang-20
i386                  randconfig-014-20260117    gcc-14
i386                  randconfig-015-20260116    clang-20
i386                  randconfig-015-20260117    gcc-14
i386                  randconfig-016-20260116    clang-20
i386                  randconfig-016-20260117    gcc-14
i386                  randconfig-017-20260116    clang-20
i386                  randconfig-017-20260117    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260116    clang-20
loongarch             randconfig-001-20260117    clang-22
loongarch             randconfig-002-20260116    clang-20
loongarch             randconfig-002-20260117    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         amcore_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                           virt_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                         bigsur_defconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    gcc-15.2.0
mips                      loongson3_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260116    clang-20
nios2                 randconfig-001-20260117    clang-22
nios2                 randconfig-002-20260116    clang-20
nios2                 randconfig-002-20260117    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260116    clang-22
parisc                randconfig-001-20260117    clang-22
parisc                randconfig-002-20260116    clang-22
parisc                randconfig-002-20260117    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                    amigaone_defconfig    gcc-15.2.0
powerpc                      bamboo_defconfig    gcc-15.2.0
powerpc                    ge_imp3a_defconfig    gcc-15.2.0
powerpc                  mpc885_ads_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260116    clang-22
powerpc               randconfig-001-20260117    clang-22
powerpc               randconfig-002-20260116    clang-22
powerpc               randconfig-002-20260117    clang-22
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260116    clang-22
powerpc64             randconfig-001-20260117    clang-22
powerpc64             randconfig-002-20260116    clang-22
powerpc64             randconfig-002-20260117    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260116    gcc-15.2.0
riscv                 randconfig-001-20260117    gcc-10.5.0
riscv                 randconfig-002-20260116    gcc-15.2.0
riscv                 randconfig-002-20260117    gcc-10.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260116    gcc-15.2.0
s390                  randconfig-001-20260117    gcc-10.5.0
s390                  randconfig-002-20260116    gcc-15.2.0
s390                  randconfig-002-20260117    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260116    gcc-15.2.0
sh                    randconfig-001-20260117    gcc-10.5.0
sh                    randconfig-002-20260116    gcc-15.2.0
sh                    randconfig-002-20260117    gcc-10.5.0
sh                           se7750_defconfig    gcc-15.2.0
sh                        sh7785lcr_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260116    gcc-10.5.0
sparc                 randconfig-001-20260117    gcc-14.3.0
sparc                 randconfig-002-20260116    gcc-10.5.0
sparc                 randconfig-002-20260117    gcc-14.3.0
sparc64                          alldefconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260116    gcc-10.5.0
sparc64               randconfig-001-20260117    gcc-14.3.0
sparc64               randconfig-002-20260116    gcc-10.5.0
sparc64               randconfig-002-20260117    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260116    gcc-10.5.0
um                    randconfig-001-20260117    gcc-14.3.0
um                    randconfig-002-20260116    gcc-10.5.0
um                    randconfig-002-20260117    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260116    gcc-14
x86_64      buildonly-randconfig-002-20260116    gcc-14
x86_64      buildonly-randconfig-003-20260116    gcc-14
x86_64      buildonly-randconfig-004-20260116    gcc-14
x86_64      buildonly-randconfig-005-20260116    gcc-14
x86_64      buildonly-randconfig-006-20260116    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260116    clang-20
x86_64                randconfig-002-20260116    clang-20
x86_64                randconfig-003-20260116    clang-20
x86_64                randconfig-004-20260116    clang-20
x86_64                randconfig-005-20260116    clang-20
x86_64                randconfig-006-20260116    clang-20
x86_64                randconfig-011-20260116    clang-20
x86_64                randconfig-012-20260116    clang-20
x86_64                randconfig-013-20260116    clang-20
x86_64                randconfig-014-20260116    clang-20
x86_64                randconfig-015-20260116    clang-20
x86_64                randconfig-016-20260116    clang-20
x86_64                randconfig-071-20260116    clang-20
x86_64                randconfig-071-20260117    clang-20
x86_64                randconfig-072-20260116    clang-20
x86_64                randconfig-072-20260117    clang-20
x86_64                randconfig-073-20260116    clang-20
x86_64                randconfig-073-20260117    clang-20
x86_64                randconfig-074-20260116    clang-20
x86_64                randconfig-074-20260117    clang-20
x86_64                randconfig-075-20260116    clang-20
x86_64                randconfig-075-20260117    clang-20
x86_64                randconfig-076-20260116    clang-20
x86_64                randconfig-076-20260117    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260116    gcc-10.5.0
xtensa                randconfig-001-20260117    gcc-14.3.0
xtensa                randconfig-002-20260116    gcc-10.5.0
xtensa                randconfig-002-20260117    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

