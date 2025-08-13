Return-Path: <linux-renesas-soc+bounces-20464-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC648B24CA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 16:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70D5F174766
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 14:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4692EA756;
	Wed, 13 Aug 2025 14:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsJE5BQd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223A41D54D8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 14:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755096936; cv=none; b=EwV5fuj5+YO7S5IhtVLkMeavbfKHrJcOKy2fyX1HPqik4c7cd6DiZA7Npsi5RBjFOXlB96JRnNBPGiuOltP2+9SeDTiiY3VWhd09m6k3Fmneh+683C6AnIsT3nsymYbjA+FwKKbysihennZSvyfe11Hao5hzmI7XMQI9pnIKW9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755096936; c=relaxed/simple;
	bh=WvwLcD8yiyF+BOsoszYOAkX6AUb4bK5oKZLYhke7bkc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PtYWnvDcvkJmpB+d8WhuBapbdB8qgsOND96v7FOd0taO0z2/G6+Gdy70BEmkGytnl4OTU+Qj/y9OC/UNCIjntsBtb0BGeenhjGRlnZi35F48vUl8evSGaFMThAmka4DeTu3LpuezT8TBG7ovpWGPneynHmWlkin/67xCD62n/Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsJE5BQd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755096936; x=1786632936;
  h=date:from:to:cc:subject:message-id;
  bh=WvwLcD8yiyF+BOsoszYOAkX6AUb4bK5oKZLYhke7bkc=;
  b=DsJE5BQdcvwcaoyfPgrMoPQk84ZWGjzELlinGc/isxdUoTjLYjLxPbFo
   8ZAVddDnpK8nurNc/SEEmzAf6Ez4Tkp0JbieaPpAUMvpkWbDLree0wGKb
   RvX1wXwJi2l3cxMgl2NPwbCWROAEc53IELr1szEsV1K4xoMzdxBGm927N
   46W37EEd3/I/LdPL1SG9qb8VPdAtbT9GMeyTj1kuHpzaRPtvGbLx2pGiP
   g6roNHcaXDFMlYK90ljOhA53/oC5dtUW2zECFxgVnIWXUYbSfIm06KxN7
   BwJmSP8Rq33Z4YxZAnb4sPHv9RSKoLwxD89Mt3S1DYCtYzJvRVuV59bRl
   Q==;
X-CSE-ConnectionGUID: By9FoMzvSiyChpwxpsp+lg==
X-CSE-MsgGUID: Bba5MunWQb2dPLoXExCxlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74842965"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="74842965"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 07:55:35 -0700
X-CSE-ConnectionGUID: g9OJeb3ASuS96/aiP6opuw==
X-CSE-MsgGUID: YY7r0VvRS7OSLQg6ue3qLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="170700980"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Aug 2025 07:55:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umCsE-000A0Y-1f;
	Wed, 13 Aug 2025 14:54:55 +0000
Date: Wed, 13 Aug 2025 22:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 b56511f54cc9ef4d26dd494d71499bd3f8c3c95f
Message-ID: <202508132212.PeEAKgT2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: b56511f54cc9ef4d26dd494d71499bd3f8c3c95f  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

elapsed time: 1459m

configs tested: 243
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250813    clang-22
arc                   randconfig-001-20250813    gcc-11.5.0
arc                   randconfig-002-20250813    clang-22
arc                   randconfig-002-20250813    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         assabet_defconfig    clang-22
arm                                 defconfig    clang-19
arm                            mps2_defconfig    clang-22
arm                       multi_v4t_defconfig    clang-22
arm                   randconfig-001-20250813    clang-22
arm                   randconfig-002-20250813    clang-22
arm                   randconfig-002-20250813    gcc-8.5.0
arm                   randconfig-003-20250813    clang-22
arm                   randconfig-004-20250813    clang-22
arm                   randconfig-004-20250813    gcc-8.5.0
arm                    vt8500_v6_v7_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250813    clang-22
arm64                 randconfig-002-20250813    clang-22
arm64                 randconfig-002-20250813    gcc-12.5.0
arm64                 randconfig-003-20250813    clang-22
arm64                 randconfig-004-20250813    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250813    clang-20
csky                  randconfig-001-20250813    gcc-14.3.0
csky                  randconfig-002-20250813    clang-20
csky                  randconfig-002-20250813    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250813    clang-20
hexagon               randconfig-001-20250813    clang-22
hexagon               randconfig-002-20250813    clang-20
hexagon               randconfig-002-20250813    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250812    gcc-12
i386        buildonly-randconfig-001-20250813    gcc-11
i386        buildonly-randconfig-002-20250812    gcc-12
i386        buildonly-randconfig-002-20250813    gcc-11
i386        buildonly-randconfig-003-20250812    gcc-12
i386        buildonly-randconfig-003-20250813    gcc-11
i386        buildonly-randconfig-004-20250812    clang-20
i386        buildonly-randconfig-004-20250813    gcc-11
i386        buildonly-randconfig-005-20250812    clang-20
i386        buildonly-randconfig-005-20250813    gcc-11
i386        buildonly-randconfig-006-20250812    gcc-12
i386        buildonly-randconfig-006-20250813    gcc-11
i386                                defconfig    clang-20
i386                  randconfig-001-20250813    clang-20
i386                  randconfig-002-20250813    clang-20
i386                  randconfig-003-20250813    clang-20
i386                  randconfig-004-20250813    clang-20
i386                  randconfig-005-20250813    clang-20
i386                  randconfig-006-20250813    clang-20
i386                  randconfig-007-20250813    clang-20
i386                  randconfig-011-20250813    gcc-11
i386                  randconfig-012-20250813    gcc-11
i386                  randconfig-013-20250813    gcc-11
i386                  randconfig-014-20250813    gcc-11
i386                  randconfig-015-20250813    gcc-11
i386                  randconfig-016-20250813    gcc-11
i386                  randconfig-017-20250813    gcc-11
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250813    clang-19
loongarch             randconfig-001-20250813    clang-20
loongarch             randconfig-002-20250813    clang-20
loongarch             randconfig-002-20250813    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                          multi_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                           ci20_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250813    clang-20
nios2                 randconfig-001-20250813    gcc-11.5.0
nios2                 randconfig-002-20250813    clang-20
nios2                 randconfig-002-20250813    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250813    clang-20
parisc                randconfig-001-20250813    gcc-14.3.0
parisc                randconfig-002-20250813    clang-20
parisc                randconfig-002-20250813    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250813    clang-18
powerpc               randconfig-001-20250813    clang-20
powerpc               randconfig-002-20250813    clang-20
powerpc               randconfig-002-20250813    clang-22
powerpc               randconfig-003-20250813    clang-20
powerpc                     tqm8540_defconfig    clang-22
powerpc                     tqm8555_defconfig    clang-22
powerpc                         wii_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250813    clang-20
powerpc64             randconfig-001-20250813    clang-22
powerpc64             randconfig-002-20250813    clang-20
powerpc64             randconfig-002-20250813    gcc-8.5.0
powerpc64             randconfig-003-20250813    clang-17
powerpc64             randconfig-003-20250813    clang-20
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250813    clang-22
riscv                 randconfig-002-20250813    clang-22
riscv                 randconfig-002-20250813    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250813    clang-22
s390                  randconfig-002-20250813    clang-18
s390                  randconfig-002-20250813    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250813    clang-22
sh                    randconfig-001-20250813    gcc-9.5.0
sh                    randconfig-002-20250813    clang-22
sh                    randconfig-002-20250813    gcc-9.5.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250813    clang-22
sparc                 randconfig-001-20250813    gcc-8.5.0
sparc                 randconfig-002-20250813    clang-22
sparc                 randconfig-002-20250813    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250813    clang-22
sparc64               randconfig-001-20250813    gcc-8.5.0
sparc64               randconfig-002-20250813    clang-20
sparc64               randconfig-002-20250813    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250813    clang-22
um                    randconfig-001-20250813    gcc-12
um                    randconfig-002-20250813    clang-22
um                    randconfig-002-20250813    gcc-11
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250812    clang-20
x86_64      buildonly-randconfig-001-20250813    clang-20
x86_64      buildonly-randconfig-002-20250812    gcc-12
x86_64      buildonly-randconfig-002-20250813    clang-20
x86_64      buildonly-randconfig-003-20250812    gcc-12
x86_64      buildonly-randconfig-003-20250813    clang-20
x86_64      buildonly-randconfig-004-20250812    gcc-12
x86_64      buildonly-randconfig-004-20250813    clang-20
x86_64      buildonly-randconfig-005-20250812    clang-20
x86_64      buildonly-randconfig-005-20250813    clang-20
x86_64      buildonly-randconfig-006-20250812    gcc-12
x86_64      buildonly-randconfig-006-20250813    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250813    gcc-12
x86_64                randconfig-002-20250813    gcc-12
x86_64                randconfig-003-20250813    gcc-12
x86_64                randconfig-004-20250813    gcc-12
x86_64                randconfig-005-20250813    gcc-12
x86_64                randconfig-006-20250813    gcc-12
x86_64                randconfig-007-20250813    gcc-12
x86_64                randconfig-008-20250813    gcc-12
x86_64                randconfig-071-20250813    clang-20
x86_64                randconfig-072-20250813    clang-20
x86_64                randconfig-073-20250813    clang-20
x86_64                randconfig-074-20250813    clang-20
x86_64                randconfig-075-20250813    clang-20
x86_64                randconfig-076-20250813    clang-20
x86_64                randconfig-077-20250813    clang-20
x86_64                randconfig-078-20250813    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250813    clang-22
xtensa                randconfig-001-20250813    gcc-10.5.0
xtensa                randconfig-002-20250813    clang-22
xtensa                randconfig-002-20250813    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

