Return-Path: <linux-renesas-soc+bounces-21513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18335B4613A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 19:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE1891895374
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 17:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E25313269;
	Fri,  5 Sep 2025 17:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fR330bqW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BAF2D6E70
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Sep 2025 17:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757094888; cv=none; b=VAnuNXnb+JPvB8Qi22c8PIu5aGENkLOcxLlBapuscq65xqcuriUdNlfx2FWSbYAJ48B/Jkym5+txlvvnJ8RLs3oLg3MR9KFgOQv7VnPVDI1RHaNK1ML0444F7p/g48Cf1/rOtzIi4LaV+jan/ECKTC+L1s4Jy8wg2Q6GbR18gcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757094888; c=relaxed/simple;
	bh=tNDL6gNjqGdvkdiD9mpkf4wsJ+1m/AuTpf4mBAAVL4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iV1DxlmESCYDAXq0RaOcrlU3Elgz2D1kApS96GXEIbu3hYBrw32JQJHcbwP44ozMmggGT6E2c5QzZsWTFt0Z72CM65GyFHDC1vrdN+ayo2vsk1r14CtQRU+dt/7R7BXFqXWVCt68JV0Ik/nAG5cjDORfHU8QNjzcEuGzr6owffQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fR330bqW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757094886; x=1788630886;
  h=date:from:to:cc:subject:message-id;
  bh=tNDL6gNjqGdvkdiD9mpkf4wsJ+1m/AuTpf4mBAAVL4c=;
  b=fR330bqWjNNUrHQQbwUTSm5f0NfdUSThF4gxnPN4amfRVwRrWRc8nVxy
   vHiKbgeQjyFaa7Q+NM57cYek3eoRu94r3vrmaSfB/n9SBAFDrAOPVnAUZ
   brk00x29ZxZBFsI0EJveklvtzgosBA0ZkVQ8UsYEMIwbwWZuWE93xbzdz
   QEvpwozH75nt2NH2i50aPitZEnfTdwusZhvJS26zFm1pHfaMM6EejdxWo
   n+9Ub/i3WzOq1kXLNbA58OoKiSCIWlcxHH9f3Ju19CVcVXsQkhRXnrnjf
   MuuKeVdOWnE3U66qvWb6SFTdnvn1jOj4B09a5mVdB8ybu18YRGKXIWS1M
   Q==;
X-CSE-ConnectionGUID: 9slojcTGRnCZYd/jyEXRZw==
X-CSE-MsgGUID: ZHgujXffQXKwRdtm0BaZ/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59150001"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="59150001"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 10:54:46 -0700
X-CSE-ConnectionGUID: f52wivmkRXmqQNPZGbBgmA==
X-CSE-MsgGUID: clALWzBuSYCkHElbxoyRZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="171498134"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Sep 2025 10:54:45 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuae2-0000gk-1s;
	Fri, 05 Sep 2025 17:54:42 +0000
Date: Sat, 06 Sep 2025 01:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.18] BUILD SUCCESS
 09e3a0467375fe7bb19c66eaf5ad3edfd90ea16c
Message-ID: <202509060103.E469ulP8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.18
branch HEAD: 09e3a0467375fe7bb19c66eaf5ad3edfd90ea16c  clk: renesas: r9a09g077: Add Ethernet Subsystem core and module clocks

elapsed time: 1877m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250904    gcc-9.5.0
arc                   randconfig-002-20250904    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                         lpc32xx_defconfig    clang-17
arm                   randconfig-001-20250904    gcc-10.5.0
arm                   randconfig-002-20250904    gcc-13.4.0
arm                   randconfig-003-20250904    gcc-8.5.0
arm                   randconfig-004-20250904    gcc-13.4.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250904    gcc-8.5.0
arm64                 randconfig-002-20250904    gcc-8.5.0
arm64                 randconfig-003-20250904    clang-22
arm64                 randconfig-004-20250904    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250905    gcc-15.1.0
csky                  randconfig-002-20250905    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250905    clang-22
hexagon               randconfig-002-20250905    clang-22
i386                             allmodconfig    gcc-13
i386                              allnoconfig    gcc-13
i386                             allyesconfig    gcc-13
i386        buildonly-randconfig-001-20250904    clang-20
i386        buildonly-randconfig-002-20250904    gcc-12
i386        buildonly-randconfig-003-20250904    gcc-13
i386        buildonly-randconfig-004-20250904    gcc-13
i386        buildonly-randconfig-005-20250904    clang-20
i386        buildonly-randconfig-006-20250904    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250905    clang-18
loongarch             randconfig-002-20250905    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
m68k                        m5407c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20250905    gcc-10.5.0
nios2                 randconfig-002-20250905    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20250905    gcc-15.1.0
parisc                randconfig-002-20250905    gcc-8.5.0
parisc64                         alldefconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250905    gcc-8.5.0
powerpc               randconfig-002-20250905    clang-22
powerpc               randconfig-003-20250905    gcc-8.5.0
powerpc64             randconfig-001-20250905    clang-22
powerpc64             randconfig-002-20250905    clang-22
powerpc64             randconfig-003-20250905    gcc-14.3.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250904    gcc-8.5.0
riscv                 randconfig-002-20250904    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250904    gcc-10.5.0
s390                  randconfig-002-20250904    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250904    gcc-12.5.0
sh                    randconfig-002-20250904    gcc-10.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250904    gcc-11.5.0
sparc                 randconfig-002-20250904    gcc-15.1.0
sparc64               randconfig-001-20250904    gcc-12.5.0
sparc64               randconfig-002-20250904    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-13
um                    randconfig-001-20250904    gcc-13
um                    randconfig-002-20250904    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250904    gcc-12
x86_64      buildonly-randconfig-002-20250904    clang-20
x86_64      buildonly-randconfig-003-20250904    gcc-13
x86_64      buildonly-randconfig-004-20250904    gcc-13
x86_64      buildonly-randconfig-005-20250904    gcc-13
x86_64      buildonly-randconfig-006-20250904    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250904    gcc-10.5.0
xtensa                randconfig-002-20250904    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

