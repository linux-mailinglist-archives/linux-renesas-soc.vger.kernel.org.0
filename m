Return-Path: <linux-renesas-soc+bounces-17281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A3CABEA22
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 05:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 179137AD997
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 03:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFF91632D7;
	Wed, 21 May 2025 03:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOCSrAy+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB27F2868B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 03:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747796530; cv=none; b=gUzHyOb3FDzA3aWBefn8uN4mBQo7N+GcqM1KuCfCu7Le7tzkvzwEh2T46D4IQB3ELHT9m6ObSNhK2FwEdE5mj4UiCmtn3cwajO8mrc5I0PtvBo70Ea/zVGQFQtRUEE3j3y35wAPiDIdkPYExUAY3zY8bGbSoYsYg/Mrt4pU0bsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747796530; c=relaxed/simple;
	bh=Y2ybP6qMgXy29h2wzcM3GIKH+kDMIIX5mr169YHT/0I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TcRXbjS/CO+ZfVMQ2RAmi4ooIT8BXz0OPPOar3wJIevdA5dPezuouACoiGPPP+XPLvXUu9pw7CAeF+4aBEMJtnKkLP176sKLpDowcMJct8eyvcs4u+KX/EIy+v5xL4Kgn/HBl9CXmisYslb2WR8lBymqYnpQGBI9rhXV53Js+eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOCSrAy+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747796528; x=1779332528;
  h=date:from:to:cc:subject:message-id;
  bh=Y2ybP6qMgXy29h2wzcM3GIKH+kDMIIX5mr169YHT/0I=;
  b=KOCSrAy++soMb/7WawWRkfxqAEQQv/dM+BLRy1O3aq5gN/5vyQfO+NCf
   +ac76bSyp8q6GI846351e/K0H2H4n4XS5ix1jzFJXQIYdNkLV8KTIsFEt
   GbuZRphgOLeDj8CbKSjNCPv3V5/T7bacLLn4A5Nw38MqTgXOgEkp8TI9O
   8BALEHAmWmhqsIZF/R9E/FII40654QNFF/UmZPDb/OvuvRUyTcxbZpfmZ
   Vr6f3g6EMG/hyVlzSVRG3BL7btiDUEYODgEHiKjqkWvTymMQnupmhYrcr
   vz3mdp17x7xT+bxnZFgQDLAzR5+0xZ0Mp9cUv3G2DdamnCZvZVyqjAW7a
   Q==;
X-CSE-ConnectionGUID: oUhIEpkRTjS46AYDRSmOhg==
X-CSE-MsgGUID: SFOEUsXXRdSozxmimZDSQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="72276124"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="72276124"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 20:02:08 -0700
X-CSE-ConnectionGUID: H/ZZC1OkQYCBUZWuMtq1LA==
X-CSE-MsgGUID: X+yn8iijTKiI+enf2dMAhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140294854"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2025 20:02:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHZiW-000No5-0k;
	Wed, 21 May 2025 03:02:04 +0000
Date: Wed, 21 May 2025 11:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.17] BUILD SUCCESS
 0ab013727c40021975d23386f094d557e4afd18c
Message-ID: <202505211141.fyLkWT1x-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.17
branch HEAD: 0ab013727c40021975d23386f094d557e4afd18c  clk: renesas: r9a09g057: Add clock and reset entries for GBETH0/1

elapsed time: 741m

configs tested: 200
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250520    gcc-11.5.0
arc                   randconfig-001-20250521    clang-21
arc                   randconfig-002-20250520    gcc-15.1.0
arc                   randconfig-002-20250521    clang-21
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250520    gcc-6.5.0
arm                   randconfig-001-20250521    clang-21
arm                   randconfig-002-20250520    gcc-10.5.0
arm                   randconfig-002-20250521    clang-21
arm                   randconfig-003-20250520    clang-19
arm                   randconfig-003-20250521    clang-21
arm                   randconfig-004-20250520    gcc-7.5.0
arm                   randconfig-004-20250521    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250520    clang-21
arm64                 randconfig-001-20250521    clang-21
arm64                 randconfig-002-20250520    gcc-9.5.0
arm64                 randconfig-002-20250521    clang-21
arm64                 randconfig-003-20250520    clang-18
arm64                 randconfig-003-20250521    clang-21
arm64                 randconfig-004-20250520    gcc-9.5.0
arm64                 randconfig-004-20250521    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250521    gcc-10.5.0
csky                  randconfig-001-20250521    gcc-14.2.0
csky                  randconfig-002-20250521    gcc-12.4.0
csky                  randconfig-002-20250521    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250521    clang-20
hexagon               randconfig-001-20250521    gcc-14.2.0
hexagon               randconfig-002-20250521    clang-21
hexagon               randconfig-002-20250521    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250520    gcc-12
i386        buildonly-randconfig-001-20250521    clang-20
i386        buildonly-randconfig-002-20250520    gcc-12
i386        buildonly-randconfig-002-20250521    clang-20
i386        buildonly-randconfig-003-20250520    clang-20
i386        buildonly-randconfig-003-20250521    clang-20
i386        buildonly-randconfig-004-20250520    gcc-12
i386        buildonly-randconfig-004-20250521    clang-20
i386        buildonly-randconfig-005-20250520    clang-20
i386        buildonly-randconfig-005-20250521    clang-20
i386        buildonly-randconfig-006-20250520    gcc-12
i386        buildonly-randconfig-006-20250521    clang-20
i386                                defconfig    clang-20
i386                  randconfig-011-20250521    gcc-12
i386                  randconfig-012-20250521    gcc-12
i386                  randconfig-013-20250521    gcc-12
i386                  randconfig-014-20250521    gcc-12
i386                  randconfig-015-20250521    gcc-12
i386                  randconfig-016-20250521    gcc-12
i386                  randconfig-017-20250521    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250521    gcc-14.2.0
loongarch             randconfig-001-20250521    gcc-15.1.0
loongarch             randconfig-002-20250521    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250521    gcc-14.2.0
nios2                 randconfig-002-20250521    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250521    gcc-13.3.0
parisc                randconfig-001-20250521    gcc-14.2.0
parisc                randconfig-002-20250521    gcc-11.5.0
parisc                randconfig-002-20250521    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc               randconfig-001-20250521    clang-21
powerpc               randconfig-001-20250521    gcc-14.2.0
powerpc               randconfig-002-20250521    gcc-14.2.0
powerpc               randconfig-002-20250521    gcc-8.5.0
powerpc               randconfig-003-20250521    gcc-14.2.0
powerpc               randconfig-003-20250521    gcc-6.5.0
powerpc64             randconfig-001-20250521    gcc-14.2.0
powerpc64             randconfig-001-20250521    gcc-8.5.0
powerpc64             randconfig-002-20250521    gcc-14.2.0
powerpc64             randconfig-002-20250521    gcc-6.5.0
powerpc64             randconfig-003-20250521    clang-21
powerpc64             randconfig-003-20250521    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250520    gcc-9.3.0
riscv                 randconfig-001-20250521    gcc-8.5.0
riscv                 randconfig-002-20250520    clang-21
riscv                 randconfig-002-20250521    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250520    clang-21
s390                  randconfig-001-20250521    gcc-8.5.0
s390                  randconfig-002-20250520    clang-21
s390                  randconfig-002-20250521    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250520    gcc-9.3.0
sh                    randconfig-001-20250521    gcc-8.5.0
sh                    randconfig-002-20250520    gcc-9.3.0
sh                    randconfig-002-20250521    gcc-8.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250520    gcc-8.5.0
sparc                 randconfig-001-20250521    gcc-8.5.0
sparc                 randconfig-002-20250520    gcc-12.4.0
sparc                 randconfig-002-20250521    gcc-8.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250520    gcc-8.5.0
sparc64               randconfig-001-20250521    gcc-8.5.0
sparc64               randconfig-002-20250520    gcc-12.4.0
sparc64               randconfig-002-20250521    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250520    clang-21
um                    randconfig-001-20250521    gcc-8.5.0
um                    randconfig-002-20250520    clang-21
um                    randconfig-002-20250521    gcc-8.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250520    gcc-12
x86_64      buildonly-randconfig-001-20250521    clang-20
x86_64      buildonly-randconfig-002-20250520    gcc-12
x86_64      buildonly-randconfig-002-20250521    clang-20
x86_64      buildonly-randconfig-003-20250520    gcc-12
x86_64      buildonly-randconfig-003-20250521    clang-20
x86_64      buildonly-randconfig-004-20250520    gcc-12
x86_64      buildonly-randconfig-004-20250521    clang-20
x86_64      buildonly-randconfig-005-20250520    gcc-12
x86_64      buildonly-randconfig-005-20250521    clang-20
x86_64      buildonly-randconfig-006-20250520    gcc-12
x86_64      buildonly-randconfig-006-20250521    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20250521    gcc-12
x86_64                randconfig-002-20250521    gcc-12
x86_64                randconfig-003-20250521    gcc-12
x86_64                randconfig-004-20250521    gcc-12
x86_64                randconfig-005-20250521    gcc-12
x86_64                randconfig-006-20250521    gcc-12
x86_64                randconfig-007-20250521    gcc-12
x86_64                randconfig-008-20250521    gcc-12
x86_64                randconfig-071-20250521    clang-20
x86_64                randconfig-072-20250521    clang-20
x86_64                randconfig-073-20250521    clang-20
x86_64                randconfig-074-20250521    clang-20
x86_64                randconfig-075-20250521    clang-20
x86_64                randconfig-076-20250521    clang-20
x86_64                randconfig-077-20250521    clang-20
x86_64                randconfig-078-20250521    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250520    gcc-6.5.0
xtensa                randconfig-001-20250521    gcc-8.5.0
xtensa                randconfig-002-20250520    gcc-12.4.0
xtensa                randconfig-002-20250521    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

