Return-Path: <linux-renesas-soc+bounces-26564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3204FD0D5F7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Jan 2026 13:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3EBB3010AA7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Jan 2026 12:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CA62701D1;
	Sat, 10 Jan 2026 12:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nK3Z35ul"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0E32673A5
	for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Jan 2026 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768047418; cv=none; b=pT4WmWPtzvwAWKTGxBLJWvLGDTYwz12IJyjB9IEoYjXTHvPBV8HWrfjtQiGuFsK9BGYgoapjRQbbBG71mJ2au2w1AbensJTLL3mmMGfFLJfgxx0bT+wR1qBIfxn/7JTZf1g5rbfLIVBMpr2jDezvksOWzKLmWeeQs7KEc4IgavQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768047418; c=relaxed/simple;
	bh=Q+VTkcqI7Zs1lRd17vig4X/JoAPrnlKN0n77FNHeG5I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XsPui91segABmQ3v+MfGldLA7vBzoFinh2hAalasZbyjyaKSnq+UgdJCE3p3gse2dbe236qYIfoLmU1tRUEen9UTpYIACSqvDgOZbHQAPx3gr4S/P4EKuerAMGwTpkun1cxQsITMGh7Dx41P3noBJW4l1bhoxAefWSe6Msu1oHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nK3Z35ul; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768047416; x=1799583416;
  h=date:from:to:cc:subject:message-id;
  bh=Q+VTkcqI7Zs1lRd17vig4X/JoAPrnlKN0n77FNHeG5I=;
  b=nK3Z35ulqMYryrnNcvzOvOJo4BOYrqAAYOidji7M4lnO/PohFvvIXi7/
   fvnxIrUwHfEWuUjYEtjBe01QqWFD+wY8R85ZTtP086GqzcpU2lK594R6N
   gq1Zra/FJmXG94x1fd8Tm9pF3xkSyPMlMtiDaYRu2GSr2ruH4YmSx6G5S
   5VJR5sCc1cRbJY6HttKm/mIm5AILj/LF2pcFpau8NgU8uOXW/zZO03f4y
   P1xemjEZUq2AOx+4TAd2x7Kq9a1WkRD5GI+j5oJhjt7vY/lIbmmpSqn8j
   KcBGwFft0iH2V6Yf9KD+1w+16wuow3fLHuB+FEIQM7bwfyuFfmU15shxm
   Q==;
X-CSE-ConnectionGUID: M1+ExUPMTu2CIxAp5I3kvg==
X-CSE-MsgGUID: HRWkPEleTg6Cbi9CHuKA7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="94877729"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="94877729"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 04:16:55 -0800
X-CSE-ConnectionGUID: au13crWBTra8dTe2OrVeNA==
X-CSE-MsgGUID: WOEbyu8RRjCa/kUbkBD3Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203764955"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Jan 2026 04:16:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veXtj-000000008dU-2yhP;
	Sat, 10 Jan 2026 12:16:51 +0000
Date: Sat, 10 Jan 2026 20:16:46 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.20] BUILD SUCCESS
 879e9fc8f689cbd890f2f79b9da098697746316d
Message-ID: <202601102041.0yvfo28c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.20
branch HEAD: 879e9fc8f689cbd890f2f79b9da098697746316d  clk: renesas: rzv2h: Deassert reset on assert timeout

elapsed time: 1479m

configs tested: 299
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
arc                 nsimosci_hs_smp_defconfig    clang-22
arc                   randconfig-001-20260109    gcc-13.4.0
arc                   randconfig-001-20260110    clang-22
arc                   randconfig-002-20260109    gcc-9.5.0
arc                   randconfig-002-20260110    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                     am200epdkit_defconfig    gcc-15.2.0
arm                         assabet_defconfig    clang-18
arm                         bcm2835_defconfig    clang-22
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    clang-22
arm                         lpc32xx_defconfig    clang-17
arm                         orion5x_defconfig    clang-22
arm                   randconfig-001-20260109    gcc-10.5.0
arm                   randconfig-001-20260110    clang-22
arm                   randconfig-002-20260109    gcc-15.2.0
arm                   randconfig-002-20260110    clang-22
arm                   randconfig-003-20260109    gcc-8.5.0
arm                   randconfig-003-20260110    clang-22
arm                   randconfig-004-20260109    gcc-11.5.0
arm                   randconfig-004-20260110    clang-22
arm                        spear3xx_defconfig    clang-17
arm                           tegra_defconfig    gcc-15.2.0
arm                        vexpress_defconfig    gcc-15.2.0
arm64                            alldefconfig    gcc-15.2.0
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
i386                  randconfig-001-20260110    gcc-12
i386                  randconfig-001-20260110    gcc-14
i386                  randconfig-002-20260109    gcc-14
i386                  randconfig-002-20260110    gcc-14
i386                  randconfig-003-20260109    gcc-12
i386                  randconfig-003-20260110    gcc-12
i386                  randconfig-003-20260110    gcc-14
i386                  randconfig-004-20260109    gcc-14
i386                  randconfig-004-20260110    clang-20
i386                  randconfig-004-20260110    gcc-14
i386                  randconfig-005-20260109    gcc-14
i386                  randconfig-005-20260110    gcc-14
i386                  randconfig-006-20260109    clang-20
i386                  randconfig-006-20260110    clang-20
i386                  randconfig-006-20260110    gcc-14
i386                  randconfig-007-20260109    gcc-14
i386                  randconfig-007-20260110    gcc-14
i386                  randconfig-011-20260109    clang-20
i386                  randconfig-011-20260110    gcc-14
i386                  randconfig-012-20260109    gcc-14
i386                  randconfig-012-20260110    gcc-14
i386                  randconfig-013-20260109    clang-20
i386                  randconfig-013-20260110    gcc-14
i386                  randconfig-014-20260109    gcc-14
i386                  randconfig-014-20260110    gcc-14
i386                  randconfig-015-20260109    clang-20
i386                  randconfig-015-20260110    gcc-14
i386                  randconfig-016-20260109    clang-20
i386                  randconfig-016-20260110    gcc-14
i386                  randconfig-017-20260109    clang-20
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
m68k                       bvme6000_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                       m5475evb_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          eyeq6_defconfig    gcc-15.2.0
mips                malta_qemu_32r6_defconfig    gcc-15.2.0
mips                        maltaup_defconfig    clang-22
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
parisc                generic-64bit_defconfig    clang-22
parisc                generic-64bit_defconfig    gcc-15.2.0
parisc                randconfig-001-20260109    gcc-12.5.0
parisc                randconfig-001-20260110    gcc-14.3.0
parisc                randconfig-002-20260109    gcc-15.2.0
parisc                randconfig-002-20260110    gcc-14.3.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                      cm5200_defconfig    clang-22
powerpc                    gamecube_defconfig    clang-22
powerpc                      katmai_defconfig    clang-22
powerpc                 mpc8313_rdb_defconfig    gcc-15.2.0
powerpc                      pcm030_defconfig    clang-22
powerpc               randconfig-001-20260109    clang-22
powerpc               randconfig-001-20260110    gcc-14.3.0
powerpc               randconfig-002-20260109    clang-22
powerpc               randconfig-002-20260110    gcc-14.3.0
powerpc                     taishan_defconfig    gcc-15.2.0
powerpc                     tqm8548_defconfig    clang-22
powerpc64             randconfig-001-20260109    gcc-15.2.0
powerpc64             randconfig-001-20260110    gcc-14.3.0
powerpc64             randconfig-002-20260109    gcc-8.5.0
powerpc64             randconfig-002-20260110    gcc-14.3.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260109    gcc-14.3.0
riscv                 randconfig-001-20260110    gcc-15.2.0
riscv                 randconfig-002-20260109    gcc-8.5.0
riscv                 randconfig-002-20260110    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260109    clang-22
s390                  randconfig-001-20260110    gcc-15.2.0
s390                  randconfig-002-20260109    clang-22
s390                  randconfig-002-20260110    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260109    gcc-14.3.0
sh                    randconfig-001-20260110    gcc-15.2.0
sh                    randconfig-002-20260109    gcc-13.4.0
sh                    randconfig-002-20260110    gcc-15.2.0
sh                   rts7751r2dplus_defconfig    clang-22
sh                          sdk7786_defconfig    gcc-15.2.0
sh                           se7343_defconfig    gcc-15.2.0
sh                           sh2007_defconfig    gcc-15.2.0
sh                        sh7785lcr_defconfig    gcc-15.2.0
sh                            titan_defconfig    clang-22
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
xtensa                  nommu_kc705_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260109    gcc-12.5.0
xtensa                randconfig-001-20260110    clang-22
xtensa                randconfig-002-20260109    gcc-14.3.0
xtensa                randconfig-002-20260110    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

