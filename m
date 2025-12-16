Return-Path: <linux-renesas-soc+bounces-25798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0DACC2FC5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 13:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38A8030038ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 12:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E36733A9CF;
	Tue, 16 Dec 2025 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4LSJt7q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8666B33A9C3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 12:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889840; cv=none; b=bc7gE7PjrCUsln6MNpW1TfV5vLja0UJLzaBP1CAuLDwu1MTz5S9ltvUQOtJoux3CammklYMOwKQaPiQfEGVrLzCtSqxUzJ5qwxOMtXaURcEXc0/PoiiNtL17JJt1yRfjNuE6iG24E+b5YBmHXOtDskfBbBDH6k32+fxrM8Bt3Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889840; c=relaxed/simple;
	bh=TzydY3wswn4c0+vKsldd/XPnwUJXpVvH/Sthmp2eIYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E4YOuZSFiC1Np4r3YthyQ80cp6DnyOSCy5bGzuIGjPTTprnOVrYL4QX849rtWqWs8MxHGtdTA9gc4tsSC74WDysh5CW4L2TbvTNNwe+FWLkL13Fp94Kg/jW7SuQgpr1tKZBOISAYaboTR9jzuqBx164D6A7E7e5rAyS4qoYwX5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4LSJt7q; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765889839; x=1797425839;
  h=date:from:to:cc:subject:message-id;
  bh=TzydY3wswn4c0+vKsldd/XPnwUJXpVvH/Sthmp2eIYE=;
  b=P4LSJt7qh6CNC4FmK4PSMVD6CJStFv3ibGxUbUqZ4Crb+qXxfYhjEs4M
   aCbmZ/RhrfND3/z35QVC4EIFEl7P1wLy1/kvbIomCs5KmixWLSMdpedGK
   Hpi6xbsfkjIfHUAy0i3P59jM0sWADSGcreKyllYkk7z5KsnZRWzJurrjn
   MSDpmz5VnnPupoyZpW1iKL1uFqVPIp6skmj5SkJgZEtbTvFFB3ehd56FB
   A03z4qEfwq9DOn34Kck5Z9QsG9CtuIW4YTtsN91WRMehoTr2EPvPa1Jlr
   SCWGTTeauzfKt1ZDUYJ+sdEuYEowxTLZJY8JssgZo8whKaL5XupEmytO7
   g==;
X-CSE-ConnectionGUID: /kXJmKyBT8Spr1xzSr/gVg==
X-CSE-MsgGUID: Mxm9cs9nSXqRFSmaZIJl9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67841854"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67841854"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 04:57:19 -0800
X-CSE-ConnectionGUID: A9euEfVCQYqgNePdMHEXmw==
X-CSE-MsgGUID: aUqTZAETT0W2fbyFWZSBNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197991660"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 04:57:17 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVUc6-0000000036K-3NON;
	Tue, 16 Dec 2025 12:57:14 +0000
Date: Tue, 16 Dec 2025 20:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.20] BUILD
 SUCCESS ebb482270819c755d2cd212b7567eb57fa3604b2
Message-ID: <202512162025.J4tOskQW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.20
branch HEAD: ebb482270819c755d2cd212b7567eb57fa3604b2  arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC

elapsed time: 1414m

configs tested: 178
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                     nsimosci_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20251216    gcc-8.5.0
arc                   randconfig-002-20251216    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                          collie_defconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20251216    gcc-8.5.0
arm                   randconfig-002-20251216    gcc-8.5.0
arm                   randconfig-003-20251216    gcc-8.5.0
arm                   randconfig-004-20251216    gcc-8.5.0
arm                             rpc_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251216    clang-16
arm64                 randconfig-001-20251216    gcc-10.5.0
arm64                 randconfig-002-20251216    gcc-10.5.0
arm64                 randconfig-002-20251216    gcc-8.5.0
arm64                 randconfig-003-20251216    gcc-10.5.0
arm64                 randconfig-004-20251216    gcc-10.5.0
arm64                 randconfig-004-20251216    gcc-14.3.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251216    gcc-10.5.0
csky                  randconfig-002-20251216    gcc-10.5.0
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251216    gcc-8.5.0
hexagon               randconfig-002-20251216    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251216    gcc-14
i386        buildonly-randconfig-002-20251216    gcc-14
i386        buildonly-randconfig-003-20251216    gcc-14
i386        buildonly-randconfig-004-20251216    gcc-14
i386        buildonly-randconfig-005-20251216    gcc-14
i386        buildonly-randconfig-006-20251216    gcc-14
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251216    gcc-14
i386                  randconfig-002-20251216    gcc-14
i386                  randconfig-003-20251216    gcc-14
i386                  randconfig-004-20251216    gcc-14
i386                  randconfig-005-20251216    gcc-14
i386                  randconfig-006-20251216    gcc-14
i386                  randconfig-007-20251216    gcc-14
i386                  randconfig-011-20251216    gcc-13
i386                  randconfig-012-20251216    gcc-13
i386                  randconfig-013-20251216    gcc-13
i386                  randconfig-014-20251216    gcc-13
i386                  randconfig-015-20251216    gcc-13
i386                  randconfig-016-20251216    gcc-13
i386                  randconfig-017-20251216    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch                loongson32_defconfig    gcc-15.1.0
loongarch             randconfig-001-20251216    gcc-8.5.0
loongarch             randconfig-002-20251216    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                          multi_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                           ip32_defconfig    gcc-15.1.0
mips                        omega2p_defconfig    gcc-15.1.0
mips                           xway_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251216    gcc-8.5.0
nios2                 randconfig-002-20251216    gcc-8.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251216    clang-22
parisc                randconfig-002-20251216    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251216    clang-22
powerpc               randconfig-002-20251216    clang-22
powerpc                     sequoia_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251216    clang-22
powerpc64             randconfig-002-20251216    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251216    clang-17
riscv                 randconfig-002-20251216    clang-17
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251216    clang-17
s390                  randconfig-002-20251216    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251216    clang-17
sh                    randconfig-002-20251216    clang-17
sh                           se7722_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251216    gcc-8.5.0
sparc                 randconfig-002-20251216    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251216    gcc-8.5.0
sparc64               randconfig-002-20251216    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251216    gcc-8.5.0
um                    randconfig-002-20251216    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251216    clang-20
x86_64      buildonly-randconfig-002-20251216    clang-20
x86_64      buildonly-randconfig-003-20251216    clang-20
x86_64      buildonly-randconfig-004-20251216    clang-20
x86_64      buildonly-randconfig-005-20251216    clang-20
x86_64      buildonly-randconfig-006-20251216    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-011-20251216    clang-20
x86_64                randconfig-012-20251216    clang-20
x86_64                randconfig-013-20251216    clang-20
x86_64                randconfig-014-20251216    clang-20
x86_64                randconfig-015-20251216    clang-20
x86_64                randconfig-016-20251216    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251216    gcc-8.5.0
xtensa                randconfig-002-20251216    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

