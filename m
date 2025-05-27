Return-Path: <linux-renesas-soc+bounces-17522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB94FAC4610
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 03:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 501E33B5B71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 01:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E851EEE0;
	Tue, 27 May 2025 01:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/uTrdGF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FD8EEAA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 01:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748311153; cv=none; b=ZXppMiObi104jdWtTUGL2HWROZYamVwvbeLhxyGvQB1IguF/stTM3dYZDcVHkzTKhtjEchXyyQqI23y9rQm8z8+XxC/7yEcPDI73dQEI9FmoA7auCxOUIKH8KjGF3omqrTlLkNCA99f8jTxfUORZPzVWg8sVtsMTnYE0YbfdgrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748311153; c=relaxed/simple;
	bh=WC9bh5sWXKeGf79SI0JpbnkncZLhg7PquDSyOO+H1rk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m6bwH4oOlJYUz11ovGmeKN9aK83nevYxj2piFZHojbeQiumR/ApLFQgPE0U4w6UsP7OBNk8wzKEJosOgHcvyBHqw4OsLiK5AIKLa1Xo1tAWvzThy0mKM85ZB3bpxm4SbtnGIBoQxwLKczR2NZ0eHcGjdhjeE9pd3eHsdNr3a2qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/uTrdGF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748311152; x=1779847152;
  h=date:from:to:cc:subject:message-id;
  bh=WC9bh5sWXKeGf79SI0JpbnkncZLhg7PquDSyOO+H1rk=;
  b=J/uTrdGFJM0TX30y6sl1MUK3Gko/KG9zeIh18bBB7bzDdz4DSONpnHlE
   uo9yhn1gehypNCzGAFeeVaFYt9bwZj5xH3DG3Jljo6pZBMgw0h1pnfwk+
   K0B3U1vy63+poug0XszWhtsomy7O1JBM+qMFuav7dk3n0b/PdzwenRlTf
   NZT0OSy/BkUfrLU3m9YwWT3Z2KFaTC3lkIC8dKJdOrAKArTAhq3SnEsl4
   R1rimHnqp8ZzgDDw8wC3qdRw+ZWSawceZTcd7nwwmWNPMl9JF+YB9w7b1
   TEPYalVQggFbUMEh/E9gBTn6+hG2uKKjfeVX2wqpG8xknQ2f/vmysAVnt
   w==;
X-CSE-ConnectionGUID: mTD/Fq8MR4GoUohtx7bPmQ==
X-CSE-MsgGUID: WOp8dWy6Sdqt9eLipCznjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61341271"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="61341271"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 18:59:11 -0700
X-CSE-ConnectionGUID: dej17EAQQlqSQ7AKippGWA==
X-CSE-MsgGUID: bJDxCWz8QCOdmZvMSOlnOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="179775338"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 May 2025 18:59:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJjau-000So8-0T;
	Tue, 27 May 2025 01:59:08 +0000
Date: Tue, 27 May 2025 09:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.17] BUILD SUCCESS
 5b48a30c02366c2215cd6f7e2996fdc7c329d322
Message-ID: <202505270946.A4VORI7F-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.17
branch HEAD: 5b48a30c02366c2215cd6f7e2996fdc7c329d322  clk: renesas: Add support for R9A09G077 SoC

elapsed time: 725m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20250527    gcc-10.5.0
arc                   randconfig-002-20250527    gcc-10.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-16
arm                   milbeaut_m10v_defconfig    clang-19
arm                   randconfig-001-20250527    clang-21
arm                   randconfig-002-20250527    gcc-7.5.0
arm                   randconfig-003-20250527    clang-19
arm                   randconfig-004-20250527    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250527    gcc-8.5.0
arm64                 randconfig-002-20250527    gcc-8.5.0
arm64                 randconfig-003-20250527    clang-16
arm64                 randconfig-004-20250527    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250526    gcc-9.3.0
csky                  randconfig-002-20250526    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250526    clang-19
hexagon               randconfig-002-20250526    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250526    gcc-12
i386        buildonly-randconfig-002-20250526    clang-20
i386        buildonly-randconfig-003-20250526    clang-20
i386        buildonly-randconfig-004-20250526    gcc-12
i386        buildonly-randconfig-005-20250526    clang-20
i386        buildonly-randconfig-006-20250526    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250526    gcc-15.1.0
loongarch             randconfig-002-20250526    gcc-15.1.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         apollo_defconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250526    gcc-5.5.0
nios2                 randconfig-002-20250526    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250526    gcc-6.5.0
parisc                randconfig-002-20250526    gcc-8.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                       ebony_defconfig    clang-21
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-21
powerpc               randconfig-001-20250526    clang-21
powerpc               randconfig-002-20250526    clang-18
powerpc               randconfig-003-20250526    clang-21
powerpc64             randconfig-001-20250526    gcc-7.5.0
powerpc64             randconfig-002-20250526    gcc-7.5.0
powerpc64             randconfig-003-20250526    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250526    clang-21
riscv                 randconfig-002-20250526    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250526    clang-18
s390                  randconfig-002-20250526    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250526    gcc-11.5.0
sh                    randconfig-002-20250526    gcc-7.5.0
sh                             sh03_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250526    gcc-14.2.0
sparc                 randconfig-002-20250526    gcc-14.2.0
sparc64               randconfig-001-20250526    gcc-14.2.0
sparc64               randconfig-002-20250526    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250526    clang-21
um                    randconfig-002-20250526    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250526    gcc-12
x86_64      buildonly-randconfig-002-20250526    gcc-12
x86_64      buildonly-randconfig-003-20250526    clang-20
x86_64      buildonly-randconfig-004-20250526    gcc-12
x86_64      buildonly-randconfig-005-20250526    gcc-12
x86_64      buildonly-randconfig-006-20250526    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250526    gcc-12.4.0
xtensa                randconfig-002-20250526    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

