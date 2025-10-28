Return-Path: <linux-renesas-soc+bounces-23741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5063C148DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 13:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1A874234FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 12:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9507C32A3E1;
	Tue, 28 Oct 2025 12:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S79Bn+se"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06043B2A0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 12:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653474; cv=none; b=kSTV/J+ncXszdPGEp400E/c2YeQGjWe1JkqgeAnwj89QUOxQCoEGeo11jKIXoeTOrE5W5TXCGN7PLfF53SmU4pZRDtYeCmem9J0HfVdLHFwLMFeQlKQumR0wgEJ5LLIoA58wHDLXQ5w5U2MFg9YABnvrFF4qVjbwbWkRDlgkZms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653474; c=relaxed/simple;
	bh=hgLAIP+FVrEmv/80wxaTfcQhZ0wzNnxBn/Whw9l6TCg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XOQiUBY/Vmqm2ejOtYn7Ytj0eQCps7uXIUSElw+N8QFtpnAtDGgNJb/IxsmiLe3t62rj+Kb4biyvulPAD6rHjTosQcd7IEgLQyGlyzK6kKOmY6YBBDTX22xHLebgSgx43afAWtIak90Wl0wB6lNzJyRkiBbR0KDVHVlLr/3cOVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S79Bn+se; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761653473; x=1793189473;
  h=date:from:to:cc:subject:message-id;
  bh=hgLAIP+FVrEmv/80wxaTfcQhZ0wzNnxBn/Whw9l6TCg=;
  b=S79Bn+seiLhjVCx4dAtoMyjhZLxzy+jwVu66ohCnB18gcHym2rbHvBaC
   tJk0+U/F81VvC76L23gKy17Grffn+a3MvhjTJ19vPBaBImYrGzKP20Qqh
   UFO7XF2ZJ8zOWBRxsHPKV8IUm/xiXj3UvsWYrB7H4KyKez76w6IHH5epd
   T56Bq0UNAZwkyFn43mA2iJ1U4pRq2hy3aKlhAqQ6ARvXH8Tb6NkBBwOH5
   iFfwjgdeRveEcxP8DCOOAYY4pWAyMIbyO9m/AM66NGgyOzqhuC3ezD/V8
   asnKXBQNJNVOQksWthVtpZJ5YBj9Hy8Jcc1WmGXJ1g8KayYAARQLaHbyd
   A==;
X-CSE-ConnectionGUID: gh5R0I0gSreVJgMTcrzJGA==
X-CSE-MsgGUID: Z/5GihkMQNu9Th8r3qBh0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63657794"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63657794"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 05:11:12 -0700
X-CSE-ConnectionGUID: BuYl8w41TZGmAjUBnEqYJw==
X-CSE-MsgGUID: toHdbI+sQZyn4WPDyLQM7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="189384429"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Oct 2025 05:11:11 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDiXc-000J7N-2j;
	Tue, 28 Oct 2025 12:11:08 +0000
Date: Tue, 28 Oct 2025 20:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 07525a693a5ff6592668a0fd647153e4b4933cae
Message-ID: <202510282017.wwRTesDm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 07525a693a5ff6592668a0fd647153e4b4933cae  clk: renesas: r9a09g056: Add clock and reset entries for ISP

elapsed time: 1466m

configs tested: 145
configs skipped: 4

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
arc                   randconfig-001-20251027    gcc-8.5.0
arc                   randconfig-002-20251027    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                                 defconfig    clang-22
arm                            dove_defconfig    gcc-15.1.0
arm                   randconfig-001-20251027    clang-22
arm                   randconfig-002-20251027    clang-22
arm                   randconfig-003-20251027    gcc-8.5.0
arm                   randconfig-004-20251027    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                            allyesconfig    clang-22
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251027    clang-22
arm64                 randconfig-002-20251027    gcc-12.5.0
arm64                 randconfig-003-20251027    gcc-9.5.0
arm64                 randconfig-004-20251027    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251027    gcc-14.3.0
csky                  randconfig-002-20251027    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251027    clang-22
hexagon               randconfig-002-20251027    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251027    gcc-13
i386        buildonly-randconfig-002-20251027    clang-20
i386        buildonly-randconfig-003-20251027    clang-20
i386        buildonly-randconfig-004-20251027    gcc-14
i386        buildonly-randconfig-005-20251027    clang-20
i386        buildonly-randconfig-006-20251027    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                        allyesconfig    clang-22
loongarch             randconfig-001-20251027    gcc-15.1.0
loongarch             randconfig-002-20251027    gcc-13.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-11.5.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251027    gcc-8.5.0
nios2                 randconfig-002-20251027    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251027    gcc-8.5.0
parisc                randconfig-002-20251027    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                     asp8347_defconfig    clang-22
powerpc                   motionpro_defconfig    clang-22
powerpc               randconfig-001-20251027    clang-22
powerpc               randconfig-002-20251027    clang-22
powerpc               randconfig-003-20251027    gcc-8.5.0
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251027    gcc-8.5.0
powerpc64             randconfig-002-20251027    gcc-10.5.0
powerpc64             randconfig-003-20251027    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20251028    clang-22
riscv                 randconfig-002-20251028    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251028    clang-22
s390                  randconfig-002-20251028    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                               j2_defconfig    gcc-15.1.0
sh                    randconfig-001-20251028    gcc-15.1.0
sh                    randconfig-002-20251028    gcc-13.4.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251028    gcc-8.5.0
sparc                 randconfig-002-20251028    gcc-12.5.0
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251028    clang-22
sparc64               randconfig-002-20251028    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251028    gcc-14
um                    randconfig-002-20251028    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251027    gcc-14
x86_64      buildonly-randconfig-002-20251027    gcc-14
x86_64      buildonly-randconfig-003-20251027    gcc-14
x86_64      buildonly-randconfig-004-20251027    gcc-14
x86_64      buildonly-randconfig-005-20251027    gcc-14
x86_64      buildonly-randconfig-006-20251027    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251028    gcc-15.1.0
xtensa                randconfig-002-20251028    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

