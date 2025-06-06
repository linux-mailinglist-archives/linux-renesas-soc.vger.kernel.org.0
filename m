Return-Path: <linux-renesas-soc+bounces-17883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E2AACFC2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 07:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 664E3188B5FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 05:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E741DDC23;
	Fri,  6 Jun 2025 05:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZiXhYuY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BCB1DF26A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Jun 2025 05:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749187463; cv=none; b=G2Ch7olku1vHtSIhSAQ+cNgPNnFwV2Nke8CrOcwYQKfT7HG1C9NxSu7PuLRBa82tAHp4ePFhp7umF8NRIjXsT0KIHQyeo8ihpZZwwWj3bEmQZkwbh63/CI/SuuulgwNIUDQl8lIFP4H4JDNzXDOnEhAILYa7ZhDPw3ivciYqcQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749187463; c=relaxed/simple;
	bh=X3DNDlk7/vblZN5WVr6QQc0LimxjRld/Zr1zHySppsM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QtXo9b8h+Io9beYOtsRwQUU97prsDVcgwJjbSeMQa1k+UTONx+Z+rQkBpBO+Yg3joRQPyPReXoixnyw7Nb1f372Y+sDvY2y9nZwovRLipLlIATBft2noVOIJwJ0cBfLXnrVRgtNqmyaO2OjRbhJWQEKStEWKWb9nJZBDDabqMBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZiXhYuY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749187462; x=1780723462;
  h=date:from:to:cc:subject:message-id;
  bh=X3DNDlk7/vblZN5WVr6QQc0LimxjRld/Zr1zHySppsM=;
  b=LZiXhYuYT7hNMygAbb+Jq2GcDkuFoXR3gUPyIf4YBUgKtdu7OAhOuCE+
   UbfwLUpX076dPXfcvQU5TqGcduABooZMdcasvoiuAX7sHV3nzcUIkGNmL
   eqw0OYix9p2A6PMMeKyKgcA6ynP0xvfq0NQe3SdlaW6kZngn0AVwO/qEL
   da6mBtjVLq/OlQCY3pv5OAYJqHgr5DHtC1AktrayhxT37UzbXsNphF9+G
   0IeElujZTYYTb9Ti4dCQQyEChu65EQ/tMvWR568Tsm4UFFxcydoiXwIWV
   YVoFGdun4TCfYXUzSlmqTRScqPoi+7HsW0EuxSFHmvCMdDegHES8SlTy9
   Q==;
X-CSE-ConnectionGUID: uXE5pIesQ7+k22z069eDdA==
X-CSE-MsgGUID: IlanlvoPQaqRV+Nn8TviaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="76727486"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="76727486"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 22:24:13 -0700
X-CSE-ConnectionGUID: 8b63X+oPTZ6ikB6dVtfSlA==
X-CSE-MsgGUID: eOFVlq++SWSGQ00Ymqs5cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="146084216"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2025 22:24:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNPYn-0004lD-24;
	Fri, 06 Jun 2025 05:24:09 +0000
Date: Fri, 06 Jun 2025 13:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.17] BUILD SUCCESS
 d0eec9367208f86916b0e708906af6ca5dd33879
Message-ID: <202506061344.ENUFe8u0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.17
branch HEAD: d0eec9367208f86916b0e708906af6ca5dd33879  Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells = <1> for RZ/G3S"

elapsed time: 1125m

configs tested: 137
configs skipped: 8

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
arc                   randconfig-001-20250605    gcc-15.1.0
arc                   randconfig-002-20250605    gcc-15.1.0
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g4_defconfig    clang-21
arm                                 defconfig    clang-21
arm                        keystone_defconfig    gcc-15.1.0
arm                   randconfig-001-20250605    clang-21
arm                   randconfig-002-20250605    clang-17
arm                   randconfig-003-20250605    clang-21
arm                   randconfig-004-20250605    clang-21
arm                         s5pv210_defconfig    gcc-15.1.0
arm                           sama5_defconfig    gcc-15.1.0
arm                        spear6xx_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250605    clang-21
arm64                 randconfig-002-20250605    clang-21
arm64                 randconfig-003-20250605    clang-21
arm64                 randconfig-004-20250605    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250605    gcc-10.5.0
csky                  randconfig-002-20250605    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250605    clang-21
hexagon               randconfig-002-20250605    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250605    gcc-12
i386        buildonly-randconfig-002-20250605    clang-20
i386        buildonly-randconfig-003-20250605    gcc-12
i386        buildonly-randconfig-004-20250605    clang-20
i386        buildonly-randconfig-005-20250605    clang-20
i386        buildonly-randconfig-006-20250605    gcc-11
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250605    gcc-12.4.0
loongarch             randconfig-002-20250605    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-21
mips                      bmips_stb_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250605    gcc-14.2.0
nios2                 randconfig-002-20250605    gcc-11.5.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250605    gcc-9.3.0
parisc                randconfig-002-20250605    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc                      cm5200_defconfig    clang-21
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250605    clang-21
powerpc               randconfig-002-20250605    clang-21
powerpc               randconfig-003-20250605    clang-21
powerpc64             randconfig-001-20250605    clang-18
powerpc64             randconfig-002-20250605    clang-21
powerpc64             randconfig-003-20250605    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250605    clang-21
riscv                 randconfig-002-20250605    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250605    clang-21
s390                  randconfig-002-20250605    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250605    gcc-12.4.0
sh                    randconfig-002-20250605    gcc-12.4.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250605    gcc-11.5.0
sparc                 randconfig-002-20250605    gcc-7.5.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250605    gcc-12.4.0
sparc64               randconfig-002-20250605    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250605    clang-21
um                    randconfig-002-20250605    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250605    clang-20
x86_64      buildonly-randconfig-002-20250605    gcc-12
x86_64      buildonly-randconfig-003-20250605    clang-20
x86_64      buildonly-randconfig-004-20250605    clang-20
x86_64      buildonly-randconfig-005-20250605    gcc-12
x86_64      buildonly-randconfig-006-20250605    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250605    gcc-7.5.0
xtensa                randconfig-002-20250605    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

