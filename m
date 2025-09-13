Return-Path: <linux-renesas-soc+bounces-21839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88509B55FFB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Sep 2025 12:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5031817698A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Sep 2025 10:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5491C2777F1;
	Sat, 13 Sep 2025 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYboDWpp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0382765D2
	for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Sep 2025 10:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757757699; cv=none; b=huXqBBAsnjPOH7qFXNAZVZMBsshPKdshg1Ri+AZfW034VFUMrfFcOUoKctcF+m0jmUNCfnmRZd4jrNQCGWHcEciTus3bvAPftJo1AAoMKBS04NXyU6xzXNxleIZGdhjdLIidbLQvSqjddu8+iexp/IHJvH/pBVpg7sVp1ccSVZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757757699; c=relaxed/simple;
	bh=lEfx3kYXytmJz3NT4SRonT1NA504YrQrUMvF/EtLwWs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mImF0shOcOcz4zGLt4zkDZB3ZgWIikreHpGJh3giDQpLd7VBLSNZwYUnI9mrYN1FR2AY/ZHtuOjsqHT9TjAn6ng+l8m6+qkFoL/CMFlzrHNm1W5DDJpgEfEB9qCp5tNHL6fBcCqJKe/9dyZFpR6uUBt77xcA9x7fxUv6IgtT3Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYboDWpp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757757697; x=1789293697;
  h=date:from:to:cc:subject:message-id;
  bh=lEfx3kYXytmJz3NT4SRonT1NA504YrQrUMvF/EtLwWs=;
  b=XYboDWpprHwU3vV6AH4NN+M3mhjaC8USMOM7ZYN11Ut2/tL4UCmwBM84
   tFmIXWh5tXRoCT86pDItB9jV9X2cuQSjFa6bSNf7cX9gaK2O5MX7VrR9K
   wACJwMxasklkl+E+yZhzw39LVLTu5n33sdV9V+r7Z9f1vell1ZaKkbsKR
   jwawXFGP/5AdZ5aCorOduR8eDwoKMRRP9v1yBNULigYmMxQAPjswYkieI
   MZTvdSkIzxOqWTR5FPs6VZ0cRtcn9Ygygrizw39FkYXz0UZdJyrfZXkpJ
   ClLHJHgj4oYij4likIxLaSsulsv9Zw1wSWJaL6Ba57wOhrgxf4J7jRCef
   w==;
X-CSE-ConnectionGUID: zevLb0O4R8WHIzhSMLwSOw==
X-CSE-MsgGUID: t7xYN4NETMO35ueKizy+qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="70711298"
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="70711298"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 03:01:37 -0700
X-CSE-ConnectionGUID: 5w6ht0eMTT2M3dDkqRENJg==
X-CSE-MsgGUID: 24eBremaRoqYOduGZbBwtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="174019453"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 13 Sep 2025 03:01:35 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxN4U-0001SK-1x;
	Sat, 13 Sep 2025 10:01:31 +0000
Date: Sat, 13 Sep 2025 18:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.18] BUILD SUCCESS
 5bf682d9747277a0190e82e5ae6f9e201ce002d9
Message-ID: <202509131810.WJknTv9k-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.18
branch HEAD: 5bf682d9747277a0190e82e5ae6f9e201ce002d9  arm64: dts: renesas: sparrow-hawk-fan-pwm: Rework hwmon comment

elapsed time: 1449m

configs tested: 115
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250912    gcc-10.5.0
arc                   randconfig-002-20250912    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                           h3600_defconfig    gcc-15.1.0
arm                   randconfig-001-20250912    clang-22
arm                   randconfig-002-20250912    gcc-14.3.0
arm                   randconfig-003-20250912    clang-22
arm                   randconfig-004-20250912    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250912    clang-20
arm64                 randconfig-002-20250912    clang-16
arm64                 randconfig-003-20250912    clang-22
arm64                 randconfig-004-20250912    clang-19
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250912    gcc-15.1.0
csky                  randconfig-002-20250912    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250912    clang-22
hexagon               randconfig-002-20250912    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20250912    gcc-14
i386        buildonly-randconfig-002-20250912    clang-20
i386        buildonly-randconfig-003-20250912    gcc-13
i386        buildonly-randconfig-004-20250912    clang-20
i386        buildonly-randconfig-005-20250912    gcc-14
i386        buildonly-randconfig-006-20250912    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250912    gcc-15.1.0
loongarch             randconfig-002-20250912    clang-22
m68k                             alldefconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250912    gcc-11.5.0
nios2                 randconfig-002-20250912    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250912    gcc-14.3.0
parisc                randconfig-002-20250912    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250912    gcc-8.5.0
powerpc               randconfig-002-20250912    clang-22
powerpc               randconfig-003-20250912    clang-17
powerpc                    sam440ep_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250912    gcc-12.5.0
powerpc64             randconfig-002-20250912    clang-22
powerpc64             randconfig-003-20250912    clang-19
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250912    clang-16
riscv                 randconfig-002-20250912    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250912    gcc-10.5.0
s390                  randconfig-002-20250912    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250912    gcc-15.1.0
sh                    randconfig-002-20250912    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250912    gcc-8.5.0
sparc                 randconfig-002-20250912    gcc-13.4.0
sparc64               randconfig-001-20250912    gcc-8.5.0
sparc64               randconfig-002-20250912    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250912    clang-22
um                    randconfig-002-20250912    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250912    gcc-14
x86_64      buildonly-randconfig-002-20250912    gcc-14
x86_64      buildonly-randconfig-003-20250912    clang-20
x86_64      buildonly-randconfig-004-20250912    clang-20
x86_64      buildonly-randconfig-005-20250912    clang-20
x86_64      buildonly-randconfig-006-20250912    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250912    gcc-9.5.0
xtensa                randconfig-002-20250912    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

