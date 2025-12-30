Return-Path: <linux-renesas-soc+bounces-26171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E36CE8774
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 02:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 371733007FF4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 01:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF19B2DAFA5;
	Tue, 30 Dec 2025 01:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMe3Wh0E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF882D9EF3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 01:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767057123; cv=none; b=LtdlMk0Z+B9sEiJcN33masFEjJOCV5yhHGJAh+Q5a/7G0Us4EYV2CjaHGZ1QhLOo9sFtqKYbk1HucTXMoNNLTmLOq+tQHJmFI/Sa7tkavRqfdy08RpCd08ZDa+GgNr+B45v9ga0RkRuvKoJYcBvIpnaJNyzJy+AHvtG7muYyFcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767057123; c=relaxed/simple;
	bh=CrTSNnYsjUhE+7N1U0u+B0gGuhdQETFR55ugPgfywO4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TTTV6J2FUpxpWdcHsWgSWulJJfOoAPAAVrx3P2onncKthZT1BFwZxGnljs4zmeCAliYvuQNMv+ynjBl0Fg+uGmjEEvN899NfwG0TBqOHmObOAH+/6FItuj61fuRUlubwTZK1/ocI+wE1pbSQUYeUGdaxUtSycyP1VDR+5dMRa+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PMe3Wh0E; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767057121; x=1798593121;
  h=date:from:to:cc:subject:message-id;
  bh=CrTSNnYsjUhE+7N1U0u+B0gGuhdQETFR55ugPgfywO4=;
  b=PMe3Wh0Ejj649ITV78qtQDnLG0xfAa12KPBL17/bcM1MNa9ina5J0rUI
   EHRIeU3ZqCAufY9NTeb2xLJSPAuDZ5ehlApbITU43PNOrEU5QklgE8ZLU
   E+70AAcfKpZlQxIjhAwTYcQt5dsRTIGbwmIliZUStjhLrYlAFaD+SjxGY
   YHQpCtqq6IfvNMOHQTPMMQd5zWcbiPokU3w+X3+Bb7DowNFL2nriyhXni
   LyKsznBQs3bkeLDoDWYaHujkqaKn5G6dQshtGbg/p3PtIhAO/o+hX38fQ
   9GGTSG9L3LY5zGx8oOuUZguR9Hi1e3w4VjHpcVLIyOHTmP0yCHBhLnQrk
   Q==;
X-CSE-ConnectionGUID: zCxM87uATu2sbkK8C5nMnw==
X-CSE-MsgGUID: Qdnx1lW5Qz+9xNos6o+Zpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="91311225"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="91311225"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 17:12:01 -0800
X-CSE-ConnectionGUID: P2300F4fTVKvbaW34ZjPMA==
X-CSE-MsgGUID: WqVZeDJzRq2aiXH+rSU00w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="205954799"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Dec 2025 17:11:59 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaOHF-000000008Ah-2wYY;
	Tue, 30 Dec 2025 01:11:57 +0000
Date: Tue, 30 Dec 2025 09:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 f37b5349f345d2a9861d2d0fd3f992c9922dff42
Message-ID: <202512300903.hnyJOrQi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: f37b5349f345d2a9861d2d0fd3f992c9922dff42  Merge branches 'renesas-arm-defconfig-for-v6.20' and 'renesas-dts-for-v6.20' into renesas-next

elapsed time: 826m

configs tested: 156
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
arc                   randconfig-002-20251229    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20251229    gcc-15.1.0
arm                   randconfig-002-20251229    gcc-12.5.0
arm                   randconfig-003-20251229    clang-22
arm                   randconfig-004-20251229    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251230    gcc-15.1.0
arm64                 randconfig-002-20251230    gcc-14.3.0
arm64                 randconfig-003-20251230    clang-22
arm64                 randconfig-004-20251230    clang-20
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251230    gcc-15.1.0
csky                  randconfig-002-20251230    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251229    clang-22
hexagon               randconfig-002-20251229    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251229    clang-20
i386        buildonly-randconfig-002-20251229    gcc-14
i386        buildonly-randconfig-003-20251229    gcc-13
i386        buildonly-randconfig-004-20251229    clang-20
i386        buildonly-randconfig-005-20251229    gcc-14
i386        buildonly-randconfig-006-20251229    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-011-20251229    gcc-14
i386                  randconfig-012-20251229    gcc-14
i386                  randconfig-013-20251229    gcc-14
i386                  randconfig-014-20251229    gcc-14
i386                  randconfig-015-20251229    gcc-14
i386                  randconfig-016-20251229    gcc-14
i386                  randconfig-017-20251229    gcc-14
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
mips                         cobalt_defconfig    gcc-15.1.0
mips                          malta_defconfig    gcc-15.1.0
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
powerpc               randconfig-001-20251229    gcc-12.5.0
powerpc               randconfig-002-20251229    clang-18
powerpc64             randconfig-001-20251229    clang-20
powerpc64             randconfig-002-20251229    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                    nommu_virt_defconfig    clang-22
riscv                 randconfig-001-20251229    gcc-15.1.0
riscv                 randconfig-002-20251229    clang-20
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251229    clang-22
s390                  randconfig-002-20251229    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251229    gcc-10.5.0
sh                    randconfig-002-20251229    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251229    gcc-13.4.0
sparc                 randconfig-002-20251229    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251229    clang-20
sparc64               randconfig-002-20251229    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251229    gcc-14
um                    randconfig-002-20251229    clang-22
um                           x86_64_defconfig    clang-22
x86_64                           alldefconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251229    clang-20
x86_64      buildonly-randconfig-002-20251229    clang-20
x86_64      buildonly-randconfig-003-20251229    gcc-14
x86_64      buildonly-randconfig-004-20251229    clang-20
x86_64      buildonly-randconfig-005-20251229    gcc-14
x86_64      buildonly-randconfig-006-20251229    gcc-13
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251229    gcc-14
x86_64                randconfig-002-20251229    clang-20
x86_64                randconfig-003-20251229    gcc-14
x86_64                randconfig-004-20251229    clang-20
x86_64                randconfig-005-20251229    gcc-14
x86_64                randconfig-006-20251229    gcc-14
x86_64                randconfig-011-20251229    clang-20
x86_64                randconfig-012-20251229    gcc-14
x86_64                randconfig-013-20251229    clang-20
x86_64                randconfig-014-20251229    clang-20
x86_64                randconfig-015-20251229    clang-20
x86_64                randconfig-016-20251229    gcc-14
x86_64                randconfig-071-20251229    clang-20
x86_64                randconfig-072-20251229    gcc-14
x86_64                randconfig-073-20251229    gcc-13
x86_64                randconfig-074-20251229    clang-20
x86_64                randconfig-075-20251229    clang-20
x86_64                randconfig-076-20251229    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251229    gcc-8.5.0
xtensa                randconfig-002-20251229    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

