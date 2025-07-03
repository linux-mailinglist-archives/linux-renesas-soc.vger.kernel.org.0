Return-Path: <linux-renesas-soc+bounces-19079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB38AF6FAE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 12:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25875188AF11
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 10:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068C22E2EEF;
	Thu,  3 Jul 2025 10:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1Prf2I9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7321E2E2674
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Jul 2025 10:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537171; cv=none; b=suMu+2GoVRnj0x+zzvi39V3kPPhZt3sAlRBilJHNPc4aLHMmTAMT+dw8wC8SBDUWLUDFOxp5UJJ8H6jlC5f8pYa5UeASpj4o7w8Pv8isuR7M0wdkgBx/V0BzfRh/GV5/ItJ2tRpnjlbWHk08Z9293bBzwjm5Px/lXobDy2PNcLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537171; c=relaxed/simple;
	bh=s1fCSq182DfpAze2T7K9ohH8I+J5b/u+9hu1+ESv1pA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uqooB2ffdEkj8LPcJ7GvO8tYRbRbQTgW3JtitvC2vews3/xcDd9zpFx6/mfkZYZmpzDxCmMS4gQuUznHPfm872nJlPqBfpf+fopBL7CZi8iftjQpzw2aoZBEls5Vpef/eO7hdkupB9oWIGnN+CPyOuSZwhh6joYzmCZ9F2601fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1Prf2I9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751537169; x=1783073169;
  h=date:from:to:cc:subject:message-id;
  bh=s1fCSq182DfpAze2T7K9ohH8I+J5b/u+9hu1+ESv1pA=;
  b=Q1Prf2I9mfGDsO5NgLJjshIq6UQ+7wZshOTpVbyIOlHEgUMEu3l6NVS5
   NTakIfTtfGRJ7pwGO9ktOYFwQdeFA7nzFcCsFtBYX9Q8P2Tt79oG+RSdC
   yCoqa3nurXGL9hmjc7n/9vecfs8dbodMl135Pzf64EINCTXeR+E1A6izU
   0ohoKtwEewshSFfW6jhzPHXlHychWuXwlClPJAkBQb9d+cx8rAjyoR7Me
   Kb34VDCqNqfWLOsDKfW4GqTim970P7FRWTjLDDlyBtfYnbJua6TFIhKWq
   DMtKlu7Yw2pAzpeQsDjSbK02P/IxdY4gGkF37k//Dl1TpyPdRO3ygeaTk
   w==;
X-CSE-ConnectionGUID: ZxA2XUnQT5uQYIcXbg8ZSQ==
X-CSE-MsgGUID: Y4wiOzOkR8CuqBIT3pvCTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53574819"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53574819"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 03:06:09 -0700
X-CSE-ConnectionGUID: awULibbgTBypL6++LWjs8g==
X-CSE-MsgGUID: WOmKCKHfTIGOMTCmc5jB4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="153746306"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Jul 2025 03:06:07 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXGpQ-0001hT-1l;
	Thu, 03 Jul 2025 10:06:04 +0000
Date: Thu, 03 Jul 2025 18:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.17] BUILD
 SUCCESS 537bcdf25e8c408e6cb881bbc6cad936f345f1f1
Message-ID: <202507031812.GMGusMh5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.17
branch HEAD: 537bcdf25e8c408e6cb881bbc6cad936f345f1f1  soc: renesas: sort Renesas Kconfig configs

elapsed time: 798m

configs tested: 225
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250703    gcc-11.5.0
arc                   randconfig-001-20250703    gcc-8.5.0
arc                   randconfig-002-20250703    gcc-12.4.0
arc                   randconfig-002-20250703    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                          gemini_defconfig    gcc-15.1.0
arm                   randconfig-001-20250703    clang-21
arm                   randconfig-001-20250703    gcc-8.5.0
arm                   randconfig-002-20250703    gcc-8.5.0
arm                   randconfig-003-20250703    clang-17
arm                   randconfig-003-20250703    gcc-8.5.0
arm                   randconfig-004-20250703    clang-21
arm                   randconfig-004-20250703    gcc-8.5.0
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250703    clang-21
arm64                 randconfig-001-20250703    gcc-8.5.0
arm64                 randconfig-002-20250703    gcc-14.3.0
arm64                 randconfig-002-20250703    gcc-8.5.0
arm64                 randconfig-003-20250703    clang-21
arm64                 randconfig-003-20250703    gcc-8.5.0
arm64                 randconfig-004-20250703    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250703    gcc-14.3.0
csky                  randconfig-001-20250703    gcc-8.5.0
csky                  randconfig-002-20250703    gcc-12.4.0
csky                  randconfig-002-20250703    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250703    clang-21
hexagon               randconfig-001-20250703    gcc-8.5.0
hexagon               randconfig-002-20250703    clang-21
hexagon               randconfig-002-20250703    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250703    clang-20
i386        buildonly-randconfig-001-20250703    gcc-12
i386        buildonly-randconfig-002-20250703    gcc-12
i386        buildonly-randconfig-003-20250703    gcc-12
i386        buildonly-randconfig-004-20250703    clang-20
i386        buildonly-randconfig-004-20250703    gcc-12
i386        buildonly-randconfig-005-20250703    gcc-12
i386        buildonly-randconfig-006-20250703    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250703    clang-20
i386                  randconfig-002-20250703    clang-20
i386                  randconfig-003-20250703    clang-20
i386                  randconfig-004-20250703    clang-20
i386                  randconfig-005-20250703    clang-20
i386                  randconfig-006-20250703    clang-20
i386                  randconfig-007-20250703    clang-20
i386                  randconfig-011-20250703    clang-20
i386                  randconfig-012-20250703    clang-20
i386                  randconfig-013-20250703    clang-20
i386                  randconfig-014-20250703    clang-20
i386                  randconfig-015-20250703    clang-20
i386                  randconfig-016-20250703    clang-20
i386                  randconfig-017-20250703    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250703    gcc-15.1.0
loongarch             randconfig-001-20250703    gcc-8.5.0
loongarch             randconfig-002-20250703    gcc-15.1.0
loongarch             randconfig-002-20250703    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                           ip32_defconfig    gcc-15.1.0
mips                       rbtx49xx_defconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                            allyesconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250703    gcc-8.5.0
nios2                 randconfig-002-20250703    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250703    gcc-8.5.0
parisc                randconfig-002-20250703    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    gcc-15.1.0
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250703    gcc-10.5.0
powerpc               randconfig-001-20250703    gcc-8.5.0
powerpc               randconfig-002-20250703    clang-21
powerpc               randconfig-002-20250703    gcc-8.5.0
powerpc               randconfig-003-20250703    gcc-8.5.0
powerpc64             randconfig-001-20250703    clang-18
powerpc64             randconfig-001-20250703    gcc-8.5.0
powerpc64             randconfig-002-20250703    clang-21
powerpc64             randconfig-002-20250703    gcc-8.5.0
powerpc64             randconfig-003-20250703    gcc-14.3.0
powerpc64             randconfig-003-20250703    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250703    gcc-12
riscv                 randconfig-001-20250703    gcc-13.3.0
riscv                 randconfig-002-20250703    gcc-12
riscv                 randconfig-002-20250703    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250703    gcc-12
s390                  randconfig-001-20250703    gcc-12.4.0
s390                  randconfig-002-20250703    clang-21
s390                  randconfig-002-20250703    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20250703    gcc-12
sh                    randconfig-001-20250703    gcc-9.3.0
sh                    randconfig-002-20250703    gcc-12
sh                    randconfig-002-20250703    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    gcc-15.1.0
sparc                 randconfig-001-20250703    gcc-12
sparc                 randconfig-001-20250703    gcc-8.5.0
sparc                 randconfig-002-20250703    gcc-12
sparc                 randconfig-002-20250703    gcc-13.3.0
sparc64                          allmodconfig    gcc-15.1.0
sparc64                          allyesconfig    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250703    gcc-12
sparc64               randconfig-001-20250703    gcc-8.5.0
sparc64               randconfig-002-20250703    gcc-12
sparc64               randconfig-002-20250703    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250703    gcc-12
um                    randconfig-002-20250703    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250703    gcc-11
x86_64      buildonly-randconfig-001-20250703    gcc-12
x86_64      buildonly-randconfig-002-20250703    gcc-12
x86_64      buildonly-randconfig-003-20250703    clang-20
x86_64      buildonly-randconfig-003-20250703    gcc-12
x86_64      buildonly-randconfig-004-20250703    clang-20
x86_64      buildonly-randconfig-004-20250703    gcc-12
x86_64      buildonly-randconfig-005-20250703    gcc-12
x86_64      buildonly-randconfig-006-20250703    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250703    clang-20
x86_64                randconfig-002-20250703    clang-20
x86_64                randconfig-003-20250703    clang-20
x86_64                randconfig-004-20250703    clang-20
x86_64                randconfig-005-20250703    clang-20
x86_64                randconfig-006-20250703    clang-20
x86_64                randconfig-007-20250703    clang-20
x86_64                randconfig-008-20250703    clang-20
x86_64                randconfig-071-20250703    gcc-12
x86_64                randconfig-072-20250703    gcc-12
x86_64                randconfig-073-20250703    gcc-12
x86_64                randconfig-074-20250703    gcc-12
x86_64                randconfig-075-20250703    gcc-12
x86_64                randconfig-076-20250703    gcc-12
x86_64                randconfig-077-20250703    gcc-12
x86_64                randconfig-078-20250703    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20250703    gcc-12
xtensa                randconfig-001-20250703    gcc-14.3.0
xtensa                randconfig-002-20250703    gcc-12
xtensa                randconfig-002-20250703    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

