Return-Path: <linux-renesas-soc+bounces-26566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B03AD0D67B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Jan 2026 14:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 644C7300768B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Jan 2026 13:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67151E3DDE;
	Sat, 10 Jan 2026 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dhnYLFa1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE2F1A0728
	for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Jan 2026 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768052460; cv=none; b=MuFEfEyvzrsXzxUsuedFUdRwYTIK3Amt/wimF5f9G6yu0FBrL9FSOgSs1cNxqFZx3Qb1z/6QxRYt6aWkuIBdRClsbUqqfIo6Ie9nf3LTNkYmYymDVk7V2Vr4Xl+9fOnJouZnzLJ62MDfb6bpEq7EMEW8Rd65RjYHxE5nbDYBbfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768052460; c=relaxed/simple;
	bh=lGYssXcpvHZqNRmn/hztSvFgyvnqFkMR+bX9lTKJDvc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZqUWX+hna7b5L2gb/dlyj7gSwiAIOsqLss/lb7sw1dJtameaj4wPC0Tv4TJ61UkVojKe7HTHxdvJ6C5H+TdlaWTWk+yYSFamRp15pEQQ2dISxEi7NLouxUTgHyYzMOgjVyAJitHBWUFiW2wQNAzxCTP45BHgDPpgNCBJ9H4lGUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dhnYLFa1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768052458; x=1799588458;
  h=date:from:to:cc:subject:message-id;
  bh=lGYssXcpvHZqNRmn/hztSvFgyvnqFkMR+bX9lTKJDvc=;
  b=dhnYLFa168dT+4o6Fv3A+ubwZ+YdSUa5cKt1vMHrog/FWpEH0531Uo44
   bpV8hKcwvP5C224aBQb1jcu9CPk3vi9fUExct0YmAzZxJdSFfxLR2lzK6
   6yTZjxCvNQezAU+IwQF6OzYtkgfbpJA38I73V7rbxMA/rRwgT7+U9RgA4
   VI+F4CCQ9pEFMazsrwwcGlCOJaEE20sR6fPFzvUTVJZpkpIpqWeyEMmoZ
   K8bWPFRTUuEBovxggwdqGAQ0Dmh7XcwGOsPShEpl05gt7czEd19LUtEXY
   cuHdpxlmdevr1gJ3pdxblT3pzXk9sr3Yra+LavhPHBRVJH5K+Ht60AYuB
   Q==;
X-CSE-ConnectionGUID: OwZP3XL8Tli9bJ03ctyMrA==
X-CSE-MsgGUID: EtJBQ4SHTEatpdyIZi98tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80044940"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="80044940"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 05:40:57 -0800
X-CSE-ConnectionGUID: 5GpmPwrQREeVv0cUNqpRrA==
X-CSE-MsgGUID: 0EsUWqnwR42w846t97H2eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203712373"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jan 2026 05:40:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veZD3-000000008gO-3VG0;
	Sat, 10 Jan 2026 13:40:53 +0000
Date: Sat, 10 Jan 2026 21:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.20] BUILD SUCCESS
 a1b1ee0348f889ec262482e16e9ff670617db7b0
Message-ID: <202601102142.llroV6VI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.20
branch HEAD: a1b1ee0348f889ec262482e16e9ff670617db7b0  arm64: dts: renesas: rzt2h-n2h-evk-common: Use GPIO for SD0 write protect

elapsed time: 1562m

configs tested: 275
configs skipped: 3

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
arc                        nsimosci_defconfig    gcc-15.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.2.0
arc                   randconfig-001-20260109    gcc-13.4.0
arc                   randconfig-001-20260110    clang-22
arc                   randconfig-002-20260109    gcc-9.5.0
arc                   randconfig-002-20260110    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                         bcm2835_defconfig    clang-22
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    gcc-15.2.0
arm                         orion5x_defconfig    clang-22
arm                   randconfig-001-20260109    gcc-10.5.0
arm                   randconfig-001-20260110    clang-22
arm                   randconfig-002-20260109    gcc-15.2.0
arm                   randconfig-002-20260110    clang-22
arm                   randconfig-003-20260109    gcc-8.5.0
arm                   randconfig-003-20260110    clang-22
arm                   randconfig-004-20260109    gcc-11.5.0
arm                   randconfig-004-20260110    clang-22
arm                        vexpress_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260109    clang-22
arm64                 randconfig-001-20260110    gcc-10.5.0
arm64                 randconfig-002-20260109    clang-22
arm64                 randconfig-002-20260110    gcc-10.5.0
arm64                 randconfig-003-20260109    gcc-11.5.0
arm64                 randconfig-003-20260110    gcc-10.5.0
arm64                 randconfig-004-20260109    gcc-8.5.0
arm64                 randconfig-004-20260110    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260109    gcc-9.5.0
csky                  randconfig-001-20260110    gcc-10.5.0
csky                  randconfig-002-20260109    gcc-15.2.0
csky                  randconfig-002-20260110    gcc-10.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260109    clang-22
hexagon               randconfig-001-20260110    clang-22
hexagon               randconfig-002-20260109    clang-17
hexagon               randconfig-002-20260110    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260109    clang-20
i386        buildonly-randconfig-001-20260110    gcc-14
i386        buildonly-randconfig-002-20260109    gcc-14
i386        buildonly-randconfig-002-20260110    gcc-14
i386        buildonly-randconfig-003-20260109    gcc-14
i386        buildonly-randconfig-003-20260110    gcc-14
i386        buildonly-randconfig-004-20260109    clang-20
i386        buildonly-randconfig-004-20260110    gcc-14
i386        buildonly-randconfig-005-20260109    gcc-12
i386        buildonly-randconfig-005-20260110    gcc-14
i386        buildonly-randconfig-006-20260109    clang-20
i386        buildonly-randconfig-006-20260110    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260109    gcc-14
i386                  randconfig-001-20260110    gcc-14
i386                  randconfig-002-20260109    gcc-14
i386                  randconfig-002-20260110    gcc-14
i386                  randconfig-003-20260109    gcc-12
i386                  randconfig-003-20260110    gcc-14
i386                  randconfig-004-20260109    gcc-14
i386                  randconfig-004-20260110    gcc-14
i386                  randconfig-005-20260109    gcc-14
i386                  randconfig-005-20260110    gcc-14
i386                  randconfig-006-20260109    clang-20
i386                  randconfig-006-20260110    gcc-14
i386                  randconfig-007-20260109    gcc-14
i386                  randconfig-007-20260110    gcc-14
i386                  randconfig-011-20260110    clang-20
i386                  randconfig-011-20260110    gcc-14
i386                  randconfig-012-20260110    gcc-14
i386                  randconfig-013-20260110    gcc-14
i386                  randconfig-014-20260110    clang-20
i386                  randconfig-014-20260110    gcc-14
i386                  randconfig-015-20260110    clang-20
i386                  randconfig-015-20260110    gcc-14
i386                  randconfig-016-20260110    clang-20
i386                  randconfig-016-20260110    gcc-14
i386                  randconfig-017-20260110    clang-20
i386                  randconfig-017-20260110    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260109    clang-22
loongarch             randconfig-001-20260110    clang-22
loongarch             randconfig-002-20260109    gcc-15.2.0
loongarch             randconfig-002-20260110    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          eyeq6_defconfig    gcc-15.2.0
mips                malta_qemu_32r6_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260109    gcc-8.5.0
nios2                 randconfig-001-20260110    clang-22
nios2                 randconfig-002-20260109    gcc-8.5.0
nios2                 randconfig-002-20260110    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                generic-64bit_defconfig    gcc-15.2.0
parisc                randconfig-001-20260109    gcc-12.5.0
parisc                randconfig-001-20260110    gcc-14.3.0
parisc                randconfig-002-20260109    gcc-15.2.0
parisc                randconfig-002-20260110    gcc-14.3.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                      katmai_defconfig    clang-22
powerpc               randconfig-001-20260109    clang-22
powerpc               randconfig-001-20260110    gcc-14.3.0
powerpc               randconfig-002-20260109    clang-22
powerpc               randconfig-002-20260110    gcc-14.3.0
powerpc                     taishan_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260109    gcc-15.2.0
powerpc64             randconfig-001-20260110    gcc-14.3.0
powerpc64             randconfig-002-20260109    gcc-8.5.0
powerpc64             randconfig-002-20260110    gcc-14.3.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260110    clang-22
riscv                 randconfig-001-20260110    gcc-15.2.0
riscv                 randconfig-002-20260110    clang-22
riscv                 randconfig-002-20260110    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260110    gcc-15.2.0
s390                  randconfig-001-20260110    gcc-9.5.0
s390                  randconfig-002-20260110    clang-22
s390                  randconfig-002-20260110    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260110    gcc-15.2.0
sh                    randconfig-002-20260110    gcc-12.5.0
sh                    randconfig-002-20260110    gcc-15.2.0
sh                   rts7751r2dplus_defconfig    gcc-15.2.0
sh                          sdk7786_defconfig    gcc-15.2.0
sh                           sh2007_defconfig    gcc-15.2.0
sh                        sh7785lcr_defconfig    gcc-15.2.0
sh                            titan_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260109    gcc-8.5.0
sparc                 randconfig-001-20260110    clang-22
sparc                 randconfig-002-20260109    gcc-13.4.0
sparc                 randconfig-002-20260110    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260109    gcc-8.5.0
sparc64               randconfig-001-20260110    clang-22
sparc64               randconfig-002-20260109    clang-20
sparc64               randconfig-002-20260110    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260109    gcc-14
um                    randconfig-001-20260110    clang-22
um                    randconfig-002-20260109    gcc-14
um                    randconfig-002-20260110    clang-22
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260109    clang-20
x86_64      buildonly-randconfig-001-20260110    gcc-14
x86_64      buildonly-randconfig-002-20260109    gcc-14
x86_64      buildonly-randconfig-002-20260110    gcc-14
x86_64      buildonly-randconfig-003-20260109    gcc-14
x86_64      buildonly-randconfig-003-20260110    gcc-14
x86_64      buildonly-randconfig-004-20260109    gcc-14
x86_64      buildonly-randconfig-004-20260110    gcc-14
x86_64      buildonly-randconfig-005-20260109    gcc-14
x86_64      buildonly-randconfig-005-20260110    gcc-14
x86_64      buildonly-randconfig-006-20260109    gcc-14
x86_64      buildonly-randconfig-006-20260110    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260109    clang-20
x86_64                randconfig-001-20260110    clang-20
x86_64                randconfig-002-20260109    clang-20
x86_64                randconfig-002-20260110    clang-20
x86_64                randconfig-003-20260109    gcc-14
x86_64                randconfig-003-20260110    clang-20
x86_64                randconfig-004-20260109    clang-20
x86_64                randconfig-004-20260110    clang-20
x86_64                randconfig-005-20260109    clang-20
x86_64                randconfig-005-20260110    clang-20
x86_64                randconfig-006-20260109    gcc-14
x86_64                randconfig-006-20260110    clang-20
x86_64                randconfig-011-20260109    gcc-12
x86_64                randconfig-011-20260110    clang-20
x86_64                randconfig-012-20260109    clang-20
x86_64                randconfig-012-20260110    clang-20
x86_64                randconfig-013-20260109    gcc-14
x86_64                randconfig-013-20260110    clang-20
x86_64                randconfig-014-20260109    gcc-14
x86_64                randconfig-014-20260110    clang-20
x86_64                randconfig-015-20260109    gcc-12
x86_64                randconfig-015-20260110    clang-20
x86_64                randconfig-016-20260109    gcc-14
x86_64                randconfig-016-20260110    clang-20
x86_64                randconfig-071-20260109    gcc-14
x86_64                randconfig-071-20260110    clang-20
x86_64                randconfig-072-20260109    clang-20
x86_64                randconfig-072-20260110    clang-20
x86_64                randconfig-073-20260109    gcc-14
x86_64                randconfig-073-20260110    clang-20
x86_64                randconfig-074-20260109    gcc-14
x86_64                randconfig-074-20260110    clang-20
x86_64                randconfig-075-20260109    gcc-14
x86_64                randconfig-075-20260110    clang-20
x86_64                randconfig-076-20260109    gcc-12
x86_64                randconfig-076-20260110    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260109    gcc-12.5.0
xtensa                randconfig-001-20260110    clang-22
xtensa                randconfig-002-20260109    gcc-14.3.0
xtensa                randconfig-002-20260110    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

