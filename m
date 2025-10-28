Return-Path: <linux-renesas-soc+bounces-23740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ADAC14887
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 13:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA4AD1A64D18
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 12:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7902232862B;
	Tue, 28 Oct 2025 12:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRb6JKhG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD36B316912
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 12:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653354; cv=none; b=jWmQiV+r8vTJX2mTwpxhIeTR/kIAcR807iT2r4JDWxO0trZXlZkvEz3qjzaOZDyZGEFfHSkpgFtkQwKBU003P8nA0lsItiujTyCK3LnaNk4AOBpxWMPpPnm8XD9L+inpLWKRxaqLPOiT57azP7zmPMbs3V2F9Uvz/qi4tUEPeI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653354; c=relaxed/simple;
	bh=gt3NGjwmOVPI82HAhclA69v2kiUOf+v3DNr4BtYnjrs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ihVo9wfx8DzGXkZwRWAl9VLPwRJ4tJ8Q/D2FvdQ7yERBM+qlg0bV6+LGxjf0j/1aFWxGEcoivzqdMnd6Cu+qD9MMRVQBwfOqGKEwrlLt3FLI+X0r1M9hpCEn899HFmsZlc3TkWfYvChF23EYtAv6tvqj1ARwpP4OyOECZ/7QMcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRb6JKhG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761653353; x=1793189353;
  h=date:from:to:cc:subject:message-id;
  bh=gt3NGjwmOVPI82HAhclA69v2kiUOf+v3DNr4BtYnjrs=;
  b=BRb6JKhGovBQ/fcnusmSQ4lStnMjlYzNI+xaFe5DXDG+LQNlaChh9biB
   sEQZpDV+kRLyhnM0AfVVo/VZMplOOdEcGuhb8j5InQTAOrRVl5X9fMmSc
   He/Toy1ZRG3dbIae0nBOwYUHj5USIy6iDqvbOuqEg4+hgptM5dUsgHcsj
   riobhVRm6B/ehVcJlf6T5aflM0p1yWfLpIUGlDWsGqjt1ia3MpBp37pBf
   6qn7gn2WOLFmyzvYCqKT00UlEhREu4qx0Ce3Kv+EcOARuI7TGUTopsyc4
   HmB7yI0V7ZvfRoCKfER8onglukJAFzKwcX2nfqHa3Y94e1Jbuqs66eyYi
   Q==;
X-CSE-ConnectionGUID: lHbv+hQ2Tj692PWg3PJ/tQ==
X-CSE-MsgGUID: jXWutQ6LQ0Kqut1249maYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63787969"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63787969"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 05:09:12 -0700
X-CSE-ConnectionGUID: OWnswNFjShGSrowv1V4CYQ==
X-CSE-MsgGUID: rnwXmBP9Qjql523taYlrRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185247724"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 Oct 2025 05:09:11 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDiVg-000J7B-29;
	Tue, 28 Oct 2025 12:09:08 +0000
Date: Tue, 28 Oct 2025 20:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:clk-renesas-rzv2h-plldsi] BUILD
 SUCCESS f864e4b721e386be132cc973eadefe5d52cdfd94
Message-ID: <202510282037.KGN4m0Zj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git clk-renesas-rzv2h-plldsi
branch HEAD: f864e4b721e386be132cc973eadefe5d52cdfd94  clk: renesas: rzv2h: Add support for DSI clocks

elapsed time: 1464m

configs tested: 244
configs skipped: 7

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
arc                   randconfig-001-20251027    gcc-8.5.0
arc                   randconfig-001-20251028    gcc-8.5.0
arc                   randconfig-002-20251027    gcc-8.5.0
arc                   randconfig-002-20251028    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          exynos_defconfig    gcc-15.1.0
arm                   randconfig-001-20251027    clang-22
arm                   randconfig-001-20251028    gcc-8.5.0
arm                   randconfig-002-20251027    clang-22
arm                   randconfig-002-20251028    gcc-8.5.0
arm                   randconfig-003-20251027    gcc-8.5.0
arm                   randconfig-003-20251028    gcc-8.5.0
arm                   randconfig-004-20251027    clang-22
arm                   randconfig-004-20251028    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251027    clang-22
arm64                 randconfig-001-20251028    gcc-8.5.0
arm64                 randconfig-002-20251027    gcc-12.5.0
arm64                 randconfig-002-20251028    gcc-8.5.0
arm64                 randconfig-003-20251027    gcc-9.5.0
arm64                 randconfig-003-20251028    gcc-8.5.0
arm64                 randconfig-004-20251027    clang-22
arm64                 randconfig-004-20251028    gcc-8.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251027    gcc-14.3.0
csky                  randconfig-001-20251028    gcc-13.4.0
csky                  randconfig-002-20251027    gcc-13.4.0
csky                  randconfig-002-20251028    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251027    clang-22
hexagon               randconfig-001-20251028    gcc-13.4.0
hexagon               randconfig-002-20251027    clang-17
hexagon               randconfig-002-20251028    gcc-13.4.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251027    gcc-13
i386        buildonly-randconfig-001-20251028    gcc-14
i386        buildonly-randconfig-002-20251027    clang-20
i386        buildonly-randconfig-002-20251028    gcc-14
i386        buildonly-randconfig-003-20251027    clang-20
i386        buildonly-randconfig-003-20251028    gcc-14
i386        buildonly-randconfig-004-20251027    gcc-14
i386        buildonly-randconfig-004-20251028    gcc-14
i386        buildonly-randconfig-005-20251027    clang-20
i386        buildonly-randconfig-005-20251028    gcc-14
i386        buildonly-randconfig-006-20251027    clang-20
i386        buildonly-randconfig-006-20251028    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251028    clang-20
i386                  randconfig-002-20251028    clang-20
i386                  randconfig-003-20251028    clang-20
i386                  randconfig-004-20251028    clang-20
i386                  randconfig-005-20251028    clang-20
i386                  randconfig-006-20251028    clang-20
i386                  randconfig-007-20251028    clang-20
i386                  randconfig-011-20251028    gcc-14
i386                  randconfig-012-20251028    gcc-14
i386                  randconfig-013-20251028    gcc-14
i386                  randconfig-014-20251028    gcc-14
i386                  randconfig-015-20251028    gcc-14
i386                  randconfig-016-20251028    gcc-14
i386                  randconfig-017-20251028    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                        allyesconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251027    gcc-15.1.0
loongarch             randconfig-001-20251028    gcc-13.4.0
loongarch             randconfig-002-20251027    gcc-13.4.0
loongarch             randconfig-002-20251028    gcc-13.4.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                           virt_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                            allyesconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251027    gcc-8.5.0
nios2                 randconfig-001-20251028    gcc-13.4.0
nios2                 randconfig-002-20251027    gcc-8.5.0
nios2                 randconfig-002-20251028    gcc-13.4.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251027    gcc-8.5.0
parisc                randconfig-001-20251028    gcc-13.4.0
parisc                randconfig-002-20251027    gcc-12.5.0
parisc                randconfig-002-20251028    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251027    clang-22
powerpc               randconfig-001-20251028    gcc-13.4.0
powerpc               randconfig-002-20251027    clang-22
powerpc               randconfig-002-20251028    gcc-13.4.0
powerpc               randconfig-003-20251027    gcc-8.5.0
powerpc               randconfig-003-20251028    gcc-13.4.0
powerpc64             randconfig-001-20251027    gcc-8.5.0
powerpc64             randconfig-001-20251028    gcc-13.4.0
powerpc64             randconfig-002-20251027    gcc-10.5.0
powerpc64             randconfig-002-20251028    gcc-13.4.0
powerpc64             randconfig-003-20251027    gcc-10.5.0
powerpc64             randconfig-003-20251028    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-002-20251028    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251028    clang-22
s390                  randconfig-002-20251028    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20251028    gcc-15.1.0
sh                    randconfig-002-20251028    gcc-13.4.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251028    gcc-8.5.0
sparc                 randconfig-002-20251028    gcc-12.5.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251028    clang-22
sparc64               randconfig-002-20251028    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251028    gcc-14
um                    randconfig-002-20251028    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251027    gcc-14
x86_64      buildonly-randconfig-001-20251028    clang-20
x86_64      buildonly-randconfig-002-20251027    gcc-14
x86_64      buildonly-randconfig-002-20251028    clang-20
x86_64      buildonly-randconfig-003-20251027    gcc-14
x86_64      buildonly-randconfig-003-20251028    clang-20
x86_64      buildonly-randconfig-004-20251027    gcc-14
x86_64      buildonly-randconfig-004-20251028    clang-20
x86_64      buildonly-randconfig-005-20251027    gcc-14
x86_64      buildonly-randconfig-005-20251028    clang-20
x86_64      buildonly-randconfig-006-20251027    gcc-14
x86_64      buildonly-randconfig-006-20251028    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251028    clang-20
x86_64                randconfig-002-20251028    clang-20
x86_64                randconfig-003-20251028    clang-20
x86_64                randconfig-004-20251028    clang-20
x86_64                randconfig-005-20251028    clang-20
x86_64                randconfig-006-20251028    clang-20
x86_64                randconfig-007-20251028    clang-20
x86_64                randconfig-008-20251028    clang-20
x86_64                randconfig-071-20251028    clang-20
x86_64                randconfig-072-20251028    clang-20
x86_64                randconfig-073-20251028    clang-20
x86_64                randconfig-074-20251028    clang-20
x86_64                randconfig-075-20251028    clang-20
x86_64                randconfig-076-20251028    clang-20
x86_64                randconfig-077-20251028    clang-20
x86_64                randconfig-078-20251028    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                       common_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251028    gcc-15.1.0
xtensa                randconfig-002-20251028    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

