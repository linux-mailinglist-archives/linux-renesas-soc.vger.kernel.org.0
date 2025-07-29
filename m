Return-Path: <linux-renesas-soc+bounces-19725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CE4B14783
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 07:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39F925430EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 05:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6975C72634;
	Tue, 29 Jul 2025 05:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBQ4WVgj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9054D38B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Jul 2025 05:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753766201; cv=none; b=ih/jcdLSIwI6U1PcUE/AiKdB3tPORqhhYAy6TF9lPvF4EUGaY6qmIxd+yOUA+HY7bnrUTPlaM3SYAyxJR7MV1a3TnRa7HjY1hY4NJcgVHecq2+MPCVHyfdzEhFoLV32WfEdT3R6KUTDY98Pj9kyjeM0Q5WOL8LRZIME9SA9DNMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753766201; c=relaxed/simple;
	bh=Y+BdFqwCF8mRPEPILLTpqvkuPUywCvUsYbm/ysjxkfQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d93asNZK0g9tU5IPN+fyFYim1vpvD7OwHND4snP46jX8CkTgVx+kbu6afXBe1NYGS0kRXtW3CEn228iptym9pyiVZAgq3YhP0Ebia+nDyhrLJxo90y17mdkoHXQWK/7BSJKVPKH6O3Yl6On7+CXtC+xKPu54gwBD4u/0CO4cvI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBQ4WVgj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753766200; x=1785302200;
  h=date:from:to:cc:subject:message-id;
  bh=Y+BdFqwCF8mRPEPILLTpqvkuPUywCvUsYbm/ysjxkfQ=;
  b=iBQ4WVgjJYZvIO8RIucS+jLENeRSuI8Qq4+TECB2T7GRNrbF3VeQzjG0
   wS+jHiKMcr2HjvSgEfKxgS87k0YNu5I/dd+/80Khy3/Z5vXdOs8KcRAaT
   rhbdVNfNeyK0cxYceQOUhG4z6ilzIfcOXAdTbggmBuQd8E3ZeszEZT684
   bNAtecvTRmaB+Y8pw+R9EmWO+vF8inGrPP3YMuXW9qfyg3L2YTl6s/O+d
   DiVqzaZMkpyAznzZN2GdyX6alqHEkkaVxKyRN6xDLx/VJ1N6h8V37fIN+
   B7McAPl+SDXxaa8cSR74inM3GOkaFTAdAAnV9GYRMNpywufowzVnfY4r0
   Q==;
X-CSE-ConnectionGUID: ackDZ80zQhGD+Lvi3vi1ZQ==
X-CSE-MsgGUID: m2MXXWyCTy2ilIsddcY9kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="78579802"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="78579802"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 22:16:39 -0700
X-CSE-ConnectionGUID: xEJe16ncSIGgMNEPiVkfCw==
X-CSE-MsgGUID: nWIU2cv/QZ6fbaGIuFM7jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="199745554"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Jul 2025 22:16:38 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugchX-00011L-1q;
	Tue, 29 Jul 2025 05:16:35 +0000
Date: Tue, 29 Jul 2025 13:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 5b70ef83494b93e38d076d84f69a222c932868af
Message-ID: <202507291356.yyKh8Wu2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 5b70ef83494b93e38d076d84f69a222c932868af  Merge tag 'v6.16' into renesas-devel

elapsed time: 1051m

configs tested: 172
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250728    gcc-13.4.0
arc                   randconfig-001-20250729    gcc-10.5.0
arc                   randconfig-002-20250728    gcc-12.5.0
arc                   randconfig-002-20250729    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250728    clang-22
arm                   randconfig-001-20250729    gcc-10.5.0
arm                   randconfig-002-20250728    clang-22
arm                   randconfig-002-20250729    gcc-10.5.0
arm                   randconfig-003-20250728    clang-22
arm                   randconfig-003-20250729    gcc-10.5.0
arm                   randconfig-004-20250728    gcc-8.5.0
arm                   randconfig-004-20250729    gcc-10.5.0
arm                         socfpga_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250728    clang-22
arm64                 randconfig-001-20250729    gcc-10.5.0
arm64                 randconfig-002-20250728    clang-20
arm64                 randconfig-002-20250729    gcc-10.5.0
arm64                 randconfig-003-20250728    gcc-11.5.0
arm64                 randconfig-003-20250729    gcc-10.5.0
arm64                 randconfig-004-20250728    clang-22
arm64                 randconfig-004-20250729    gcc-10.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250728    gcc-10.5.0
csky                  randconfig-002-20250728    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250728    clang-22
hexagon               randconfig-002-20250728    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250728    gcc-12
i386        buildonly-randconfig-001-20250729    gcc-12
i386        buildonly-randconfig-002-20250728    gcc-12
i386        buildonly-randconfig-002-20250729    gcc-12
i386        buildonly-randconfig-003-20250728    gcc-12
i386        buildonly-randconfig-003-20250729    gcc-12
i386        buildonly-randconfig-004-20250728    clang-20
i386        buildonly-randconfig-004-20250729    gcc-12
i386        buildonly-randconfig-005-20250728    gcc-12
i386        buildonly-randconfig-005-20250729    gcc-12
i386        buildonly-randconfig-006-20250728    clang-20
i386        buildonly-randconfig-006-20250729    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-011-20250729    clang-20
i386                  randconfig-012-20250729    clang-20
i386                  randconfig-013-20250729    clang-20
i386                  randconfig-014-20250729    clang-20
i386                  randconfig-015-20250729    clang-20
i386                  randconfig-016-20250729    clang-20
i386                  randconfig-017-20250729    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250728    clang-22
loongarch             randconfig-002-20250728    clang-20
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath79_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250728    gcc-11.5.0
nios2                 randconfig-002-20250728    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250728    gcc-9.5.0
parisc                randconfig-002-20250728    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250728    gcc-10.5.0
powerpc               randconfig-002-20250728    gcc-13.4.0
powerpc               randconfig-003-20250728    gcc-8.5.0
powerpc64             randconfig-001-20250728    clang-22
powerpc64             randconfig-002-20250728    clang-22
powerpc64             randconfig-003-20250728    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250728    clang-22
riscv                 randconfig-002-20250728    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250728    clang-22
s390                  randconfig-002-20250728    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7705_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20250728    gcc-14.3.0
sh                    randconfig-002-20250728    gcc-9.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250728    gcc-8.5.0
sparc                 randconfig-002-20250728    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250728    clang-20
sparc64               randconfig-002-20250728    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250728    clang-22
um                    randconfig-002-20250728    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250728    clang-20
x86_64      buildonly-randconfig-001-20250729    clang-20
x86_64      buildonly-randconfig-002-20250728    clang-20
x86_64      buildonly-randconfig-002-20250729    clang-20
x86_64      buildonly-randconfig-003-20250728    clang-20
x86_64      buildonly-randconfig-003-20250729    clang-20
x86_64      buildonly-randconfig-004-20250728    clang-20
x86_64      buildonly-randconfig-004-20250729    clang-20
x86_64      buildonly-randconfig-005-20250728    clang-20
x86_64      buildonly-randconfig-005-20250729    clang-20
x86_64      buildonly-randconfig-006-20250728    gcc-12
x86_64      buildonly-randconfig-006-20250729    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20250729    gcc-12
x86_64                randconfig-072-20250729    gcc-12
x86_64                randconfig-073-20250729    gcc-12
x86_64                randconfig-074-20250729    gcc-12
x86_64                randconfig-075-20250729    gcc-12
x86_64                randconfig-076-20250729    gcc-12
x86_64                randconfig-077-20250729    gcc-12
x86_64                randconfig-078-20250729    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250728    gcc-8.5.0
xtensa                randconfig-002-20250728    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

