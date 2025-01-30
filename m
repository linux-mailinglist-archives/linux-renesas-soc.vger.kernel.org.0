Return-Path: <linux-renesas-soc+bounces-12725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8495CA22773
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 02:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C933A188622F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 01:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73ED4A35;
	Thu, 30 Jan 2025 01:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0+eZJQW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6C54431
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 01:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738200138; cv=none; b=hsTrTvbcovYk24i92oRHnqHqItD3jGKL1TxrLWbtN1SAQUrWP/oC0+ZhL9t8Y5q5tMRSotvl07H7A0ZNxnbi03lQ0xGc0T8I2vxvn54rWGRdub+K7BByrkMIH3lIkXlBdfj+A7bo24wQ/M8g0s7SalnKhAbHkhWiV09ioEPhFUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738200138; c=relaxed/simple;
	bh=05gNHmzgKbPo+DCDDkz9tOfRu7NEhpJma1v+pgldLS0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BRuhjNsnRwHS5Drul33fDZjlm5hRliim3JPWYfC/9l/x8EUKOigbzPMcQqYc3Wk+u/xLZ85CRLKIi+THxmofCOEnK6qhz2gmjRlepn6NlgqRzamIib1Nt0yeuVTbbcXjfJ1nO6QwCTL7CGdENk7JXaEtav6YqQDiGlreacnAdjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0+eZJQW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738200137; x=1769736137;
  h=date:from:to:cc:subject:message-id;
  bh=05gNHmzgKbPo+DCDDkz9tOfRu7NEhpJma1v+pgldLS0=;
  b=K0+eZJQWf7Sa5EvBy5ue+GbmyT03jujw51kBMaTE0XbQyQBVWrxkp424
   WnZmX0W3lhI9RkQn6u1qdtxeJ8xFuUoh/0HVGyj6qpDTecz2/tCmxM3a7
   aEAkb7kD+2T304dnL7MARtkQrkycNIa4KJKXUUclFKCO4KsHH0PiVPR/k
   EDjqnz+1F+mR5GQ3y2zhtij6w6TkWcOckFHkpKbkxZoyR5XxbGo7hzV0G
   aJS4kJgny2AvQsDp785nOL8bsNo8gHj558H0Jh/zxrNvQu1ABXvHcyZEu
   gIKDvHyKHvRM6p/D724/woQ5aM7IjlFZtam4kjB/uhM9RMowhZx3j3FE/
   g==;
X-CSE-ConnectionGUID: sIzsGyYXS4uJ1nmRxJqXsA==
X-CSE-MsgGUID: BNWLtuJZRjKuAe4jIZ8BOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="61210406"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="61210406"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 17:22:16 -0800
X-CSE-ConnectionGUID: rbffixlqR32BqWQwmZMriQ==
X-CSE-MsgGUID: 6j6BucPhRYSvaNw4OSXAUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="109000324"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jan 2025 17:22:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdJFz-000jXt-2U;
	Thu, 30 Jan 2025 01:22:11 +0000
Date: Thu, 30 Jan 2025 09:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.15] BUILD SUCCESS
 40fc2de8a30547bb3397388ea059ee53efa79f19
Message-ID: <202501300924.cuhhuhW1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.15
branch HEAD: 40fc2de8a30547bb3397388ea059ee53efa79f19  clk: renesas: r9a09g047: Add ICU clock/reset

elapsed time: 821m

configs tested: 129
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250129    gcc-13.2.0
arc                   randconfig-002-20250129    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-20
arm                          gemini_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                   randconfig-001-20250129    gcc-14.2.0
arm                   randconfig-002-20250129    clang-20
arm                   randconfig-003-20250129    gcc-14.2.0
arm                   randconfig-004-20250129    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250129    gcc-14.2.0
arm64                 randconfig-002-20250129    gcc-14.2.0
arm64                 randconfig-003-20250129    gcc-14.2.0
arm64                 randconfig-004-20250129    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250129    gcc-14.2.0
csky                  randconfig-002-20250129    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250129    clang-19
hexagon               randconfig-002-20250129    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250129    clang-19
i386        buildonly-randconfig-002-20250129    gcc-12
i386        buildonly-randconfig-003-20250129    clang-19
i386        buildonly-randconfig-004-20250129    clang-19
i386        buildonly-randconfig-005-20250129    clang-19
i386        buildonly-randconfig-006-20250129    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250129    gcc-14.2.0
loongarch             randconfig-002-20250129    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-16
mips                        qi_lb60_defconfig    clang-18
mips                          rb532_defconfig    clang-17
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250129    gcc-14.2.0
nios2                 randconfig-002-20250129    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250129    gcc-14.2.0
parisc                randconfig-002-20250129    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250129    clang-20
powerpc               randconfig-002-20250129    clang-20
powerpc               randconfig-003-20250129    gcc-14.2.0
powerpc64             randconfig-001-20250129    clang-16
powerpc64             randconfig-002-20250129    clang-18
powerpc64             randconfig-003-20250129    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250129    gcc-14.2.0
riscv                 randconfig-002-20250129    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250129    clang-20
s390                  randconfig-002-20250129    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250129    gcc-14.2.0
sh                    randconfig-002-20250129    gcc-14.2.0
sh                           se7206_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250129    gcc-14.2.0
sparc                 randconfig-002-20250129    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250129    gcc-14.2.0
sparc64               randconfig-002-20250129    gcc-14.2.0
um                               alldefconfig    clang-19
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250129    gcc-12
um                    randconfig-002-20250129    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250129    clang-19
x86_64      buildonly-randconfig-002-20250129    gcc-12
x86_64      buildonly-randconfig-003-20250129    gcc-12
x86_64      buildonly-randconfig-004-20250129    gcc-12
x86_64      buildonly-randconfig-005-20250129    gcc-12
x86_64      buildonly-randconfig-006-20250129    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250129    gcc-14.2.0
xtensa                randconfig-002-20250129    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

