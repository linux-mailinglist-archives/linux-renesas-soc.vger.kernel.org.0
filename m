Return-Path: <linux-renesas-soc+bounces-22531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3BABB14C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 18:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43D582A32B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 16:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087A737160;
	Wed,  1 Oct 2025 16:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsjfsUXz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34131373
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 16:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759337607; cv=none; b=ONhCBPea0XwaiUAemjmTBAR7lk2Ov6x2MRqqwxiWu9ZRTnpORrg75xekVf5LaNEKrpLDKgN+xohEVHGJR/y2uEYrw1QfH7lePltSQ7AsE+D5EPQ4jSUmGMmjcQJqSsTUyBJGbx0wyLqyHPIEO+XFUCnOmf+2Hse2UQTng+RTOIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759337607; c=relaxed/simple;
	bh=nmKBv6w9V0JfmHFtZtImyQbumniDp/6+/PSiBr2h3Pw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pWD2zlo5+9c8a6U/WaHj/qXyJVz10AR82Q2hMuSUd1Oq6KejqIHrlXSsIoTN4xMLLDX0dE5ws8bbrYbBU+FsHF2z5Yu/FVzGEoQgoPzH0+kNquaDZO5Sqioimap2qseOvnWMJgoZikuDnDWuQSuuOVgfxkyY+VIkn1wEAnGoTlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsjfsUXz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759337606; x=1790873606;
  h=date:from:to:cc:subject:message-id;
  bh=nmKBv6w9V0JfmHFtZtImyQbumniDp/6+/PSiBr2h3Pw=;
  b=BsjfsUXzobaU5hRrKYn9dmZx4pq1E9WTFkZCzDwbw/UwuVPb7Vs92Zj6
   GJ5gvCV+T5Rm4o0gGCzMtcbmBgh2TWNS2EIaG2sfPzck1zTpjknXkykMx
   u3B+61eZJDArZQksmnOz3TWCiekut8A8RfI3wCY6yqH7Yerhr2hZIulnr
   p2T8PBEAzDl5LZ2ak1UXYkJaPqAq11u1UD6SzCu9E5yqfrSqBl0hReM0d
   kTFfja9eo3CGQgsaKO1HL83g98AQ/L5lV+lclmtkbT7DhRPVmOl6BjNok
   nk+gR+FpyX+7bEwEaWOJfuPpNBb7eMVAy21kuyAtIwa5BOIOpgpD8WNNH
   Q==;
X-CSE-ConnectionGUID: o45FYM3gRPaAOAoBZqQCqA==
X-CSE-MsgGUID: MEGy53Z3TxCp1PZytpaZpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="79039202"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="79039202"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 09:53:25 -0700
X-CSE-ConnectionGUID: 4fAUAttWQy2UwLW3neTftA==
X-CSE-MsgGUID: nQwEk7pwSh2a/6z2KSpt/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="184114100"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Oct 2025 09:53:23 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v404v-0003C7-1D;
	Wed, 01 Oct 2025 16:53:21 +0000
Date: Thu, 02 Oct 2025 00:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.19] BUILD SUCCESS
 59436fa63e1864ea876a3fd82ecf4b606e0777c3
Message-ID: <202510020054.cKWoZ1pD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.19
branch HEAD: 59436fa63e1864ea876a3fd82ecf4b606e0777c3  clk: renesas: cpg-mssr: Read back reset registers to assure values latched

elapsed time: 1420m

configs tested: 242
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251001    gcc-14.3.0
arc                   randconfig-001-20251001    gcc-8.5.0
arc                   randconfig-002-20251001    gcc-14.3.0
arc                   randconfig-002-20251001    gcc-8.5.0
arm                              alldefconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   randconfig-001-20251001    gcc-14.3.0
arm                   randconfig-002-20251001    clang-22
arm                   randconfig-002-20251001    gcc-14.3.0
arm                   randconfig-003-20251001    gcc-12.5.0
arm                   randconfig-003-20251001    gcc-14.3.0
arm                   randconfig-004-20251001    gcc-14.3.0
arm                   randconfig-004-20251001    gcc-8.5.0
arm                         socfpga_defconfig    gcc-15.1.0
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251001    clang-22
arm64                 randconfig-001-20251001    gcc-14.3.0
arm64                 randconfig-002-20251001    gcc-14.3.0
arm64                 randconfig-002-20251001    gcc-9.5.0
arm64                 randconfig-003-20251001    gcc-14.3.0
arm64                 randconfig-003-20251001    gcc-8.5.0
arm64                 randconfig-004-20251001    gcc-14.3.0
arm64                 randconfig-004-20251001    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251001    clang-22
csky                  randconfig-001-20251001    gcc-13.4.0
csky                  randconfig-002-20251001    clang-22
csky                  randconfig-002-20251001    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251001    clang-22
hexagon               randconfig-002-20251001    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251001    clang-20
i386        buildonly-randconfig-002-20251001    clang-20
i386        buildonly-randconfig-003-20251001    clang-20
i386        buildonly-randconfig-003-20251001    gcc-14
i386        buildonly-randconfig-004-20251001    clang-20
i386        buildonly-randconfig-005-20251001    clang-20
i386        buildonly-randconfig-006-20251001    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251001    gcc-14
i386                  randconfig-002-20251001    gcc-14
i386                  randconfig-003-20251001    gcc-14
i386                  randconfig-004-20251001    gcc-14
i386                  randconfig-005-20251001    gcc-14
i386                  randconfig-006-20251001    gcc-14
i386                  randconfig-007-20251001    gcc-14
i386                  randconfig-011-20251001    clang-20
i386                  randconfig-012-20251001    clang-20
i386                  randconfig-013-20251001    clang-20
i386                  randconfig-014-20251001    clang-20
i386                  randconfig-015-20251001    clang-20
i386                  randconfig-016-20251001    clang-20
i386                  randconfig-017-20251001    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251001    clang-22
loongarch             randconfig-001-20251001    gcc-13.4.0
loongarch             randconfig-002-20251001    clang-22
loongarch             randconfig-002-20251001    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251001    clang-22
nios2                 randconfig-001-20251001    gcc-11.5.0
nios2                 randconfig-002-20251001    clang-22
nios2                 randconfig-002-20251001    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251001    clang-22
parisc                randconfig-001-20251001    gcc-8.5.0
parisc                randconfig-002-20251001    clang-22
parisc                randconfig-002-20251001    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20251001    clang-22
powerpc               randconfig-001-20251001    gcc-8.5.0
powerpc               randconfig-002-20251001    clang-22
powerpc               randconfig-003-20251001    clang-22
powerpc64             randconfig-001-20251001    clang-22
powerpc64             randconfig-001-20251001    gcc-8.5.0
powerpc64             randconfig-002-20251001    clang-22
powerpc64             randconfig-003-20251001    clang-22
powerpc64             randconfig-003-20251001    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251001    clang-22
riscv                 randconfig-001-20251001    gcc-8.5.0
riscv                 randconfig-002-20251001    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-14
s390                  randconfig-001-20251001    clang-22
s390                  randconfig-001-20251001    gcc-8.5.0
s390                  randconfig-002-20251001    gcc-12.5.0
s390                  randconfig-002-20251001    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                          landisk_defconfig    gcc-15.1.0
sh                    randconfig-001-20251001    gcc-13.4.0
sh                    randconfig-001-20251001    gcc-8.5.0
sh                    randconfig-002-20251001    gcc-11.5.0
sh                    randconfig-002-20251001    gcc-8.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251001    gcc-15.1.0
sparc                 randconfig-001-20251001    gcc-8.5.0
sparc                 randconfig-002-20251001    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251001    gcc-8.5.0
sparc64               randconfig-002-20251001    clang-20
sparc64               randconfig-002-20251001    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251001    gcc-14
um                    randconfig-001-20251001    gcc-8.5.0
um                    randconfig-002-20251001    gcc-14
um                    randconfig-002-20251001    gcc-8.5.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251001    clang-20
x86_64      buildonly-randconfig-002-20251001    clang-20
x86_64      buildonly-randconfig-003-20251001    clang-20
x86_64      buildonly-randconfig-004-20251001    clang-20
x86_64      buildonly-randconfig-005-20251001    clang-20
x86_64      buildonly-randconfig-006-20251001    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251001    clang-20
x86_64                randconfig-002-20251001    clang-20
x86_64                randconfig-003-20251001    clang-20
x86_64                randconfig-004-20251001    clang-20
x86_64                randconfig-005-20251001    clang-20
x86_64                randconfig-006-20251001    clang-20
x86_64                randconfig-007-20251001    clang-20
x86_64                randconfig-008-20251001    clang-20
x86_64                randconfig-071-20251001    gcc-14
x86_64                randconfig-072-20251001    gcc-14
x86_64                randconfig-073-20251001    gcc-14
x86_64                randconfig-074-20251001    gcc-14
x86_64                randconfig-075-20251001    gcc-14
x86_64                randconfig-076-20251001    gcc-14
x86_64                randconfig-077-20251001    gcc-14
x86_64                randconfig-078-20251001    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251001    gcc-15.1.0
xtensa                randconfig-001-20251001    gcc-8.5.0
xtensa                randconfig-002-20251001    gcc-10.5.0
xtensa                randconfig-002-20251001    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

