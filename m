Return-Path: <linux-renesas-soc+bounces-21879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5455CB586F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 23:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA1081B24C99
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 21:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669211D618A;
	Mon, 15 Sep 2025 21:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jT+PyswU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B74214A4F9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 21:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757973211; cv=none; b=Fg0q7vkD/Tx3V/PZpriFXW5BIl1lJXvua/pP7EKcoI09ISp1gPxMLU9JPg0rbGOwaMtqGhGopKgi3u9cziHPm4ltHUaXoEVnhu7I/4zS/MJvy8Eh809sDJlhk4s0GAlWbYZiwzUsHWJ1t8F0AN3bVtNbo722nbRPsUnllZ9z0i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757973211; c=relaxed/simple;
	bh=1HP7NiBAeFCSn959WrgDajdLzSF9FPSgionvpoxhues=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DWoZmB1KH6XFP4ADM/VZEpZuJti0qK3boyyZU35Qz4nZJVg+vCyRAHCmdbLjY+J70lCFPF+7aqkPyCo0W4cv90qc5JT2RHKawi/Zz1bPsEjAiU6dG1wYmidVE7/sXZzyLDE+GaCGMuS3msSoY+xWBX0SL8wE4eMUhgBR4dwoVAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jT+PyswU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757973210; x=1789509210;
  h=date:from:to:cc:subject:message-id;
  bh=1HP7NiBAeFCSn959WrgDajdLzSF9FPSgionvpoxhues=;
  b=jT+PyswUhRYUfrm5RsKmMb7ZZQBlcKm3NrOyIyayqQL7L6GTXkQYIiUl
   LmYUlpe6T6XCUsRjSxnptQ4wpilvh7G4shi5TC50OXsN1ZjOMwX7IAYk4
   OZ76t8TsjEiyDqvgiHJW8bhjkwIKPAj16h5yPx4AIZU9L/kr6jEXxvsKY
   cOPgihWKNjdfuOHDyF0hvVtI+Af23VVvwxq36CgTEWxC2sAsW3nmnL7kq
   uPtUaMhd4LMKPMsgAxStXUKrSZAM/IZ8SJOx6As/x8EemVBUEUlvKgEwF
   sT1aEHak83feYCpYH+CC17YlgUVu4OmPfIlaCfKtbjLo+a4jYTz6vymZq
   A==;
X-CSE-ConnectionGUID: 38OX1N3RRbWl4y1Ta7QxcA==
X-CSE-MsgGUID: Vqvz30VIT8yQHA/2NDTx/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="71670066"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="71670066"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 14:53:30 -0700
X-CSE-ConnectionGUID: Lmg5lm6HQYWuz3PtG3faTQ==
X-CSE-MsgGUID: LX7+1wDWQDeMhEgpSTaBvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="175180073"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Sep 2025 14:53:28 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyH8X-0000ip-2h;
	Mon, 15 Sep 2025 21:53:25 +0000
Date: Tue, 16 Sep 2025 05:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 4b9046077455ca513f24261d21243b820d224542
Message-ID: <202509160517.UVkY1Hto-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 4b9046077455ca513f24261d21243b820d224542  Merge branch 'renesas-next', tag 'v6.17-rc6' into renesas-devel

elapsed time: 733m

configs tested: 128
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250915    gcc-9.5.0
arc                   randconfig-002-20250915    gcc-9.5.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                   randconfig-001-20250915    gcc-13.4.0
arm                   randconfig-002-20250915    clang-20
arm                   randconfig-003-20250915    gcc-8.5.0
arm                   randconfig-004-20250915    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250915    clang-22
arm64                 randconfig-002-20250915    clang-22
arm64                 randconfig-003-20250915    gcc-8.5.0
arm64                 randconfig-004-20250915    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250915    gcc-15.1.0
csky                  randconfig-002-20250915    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250915    clang-22
hexagon               randconfig-002-20250915    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250915    clang-20
i386        buildonly-randconfig-002-20250915    gcc-14
i386        buildonly-randconfig-003-20250915    gcc-14
i386        buildonly-randconfig-004-20250915    gcc-14
i386        buildonly-randconfig-005-20250915    gcc-14
i386        buildonly-randconfig-006-20250915    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250915    clang-22
loongarch             randconfig-002-20250915    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250915    gcc-11.5.0
nios2                 randconfig-002-20250915    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250915    gcc-9.5.0
parisc                randconfig-002-20250915    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                   motionpro_defconfig    clang-22
powerpc                     mpc512x_defconfig    clang-22
powerpc               randconfig-001-20250915    gcc-14.3.0
powerpc               randconfig-002-20250915    gcc-8.5.0
powerpc               randconfig-003-20250915    clang-22
powerpc64             randconfig-001-20250915    clang-20
powerpc64             randconfig-002-20250915    clang-22
powerpc64             randconfig-003-20250915    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250915    gcc-8.5.0
riscv                 randconfig-002-20250915    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250915    clang-22
s390                  randconfig-002-20250915    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250915    gcc-15.1.0
sh                    randconfig-002-20250915    gcc-13.4.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250915    gcc-8.5.0
sparc                 randconfig-002-20250915    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250915    gcc-13.4.0
sparc64               randconfig-002-20250915    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250915    gcc-14
um                    randconfig-002-20250915    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250915    clang-20
x86_64      buildonly-randconfig-002-20250915    gcc-12
x86_64      buildonly-randconfig-003-20250915    gcc-14
x86_64      buildonly-randconfig-004-20250915    clang-20
x86_64      buildonly-randconfig-005-20250915    clang-20
x86_64      buildonly-randconfig-006-20250915    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250915    gcc-9.5.0
xtensa                randconfig-002-20250915    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

