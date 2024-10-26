Return-Path: <linux-renesas-soc+bounces-10169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A379B143D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2024 04:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 587C9B2179F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2024 02:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD2A2AEF5;
	Sat, 26 Oct 2024 02:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+kdDe+9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CE98BEE
	for <linux-renesas-soc@vger.kernel.org>; Sat, 26 Oct 2024 02:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729910987; cv=none; b=Paw+dFMQ7Z/1Zs/ypWmawOE9CDqDEU6xV9MlXDPq1J5qW++toyN8xFC2lHaE6s1U+NuQ8epXyNPIwlEnupKjsmu6ej73XAUjIOIQmmvUKgAHbZlb/Pp4JflVmBp4C4ZvJQtHjcmSG4V1oq2dlemR09WV4sixIfDIbnDIHt5RYsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729910987; c=relaxed/simple;
	bh=dUrpru/Yn6mRtoUXKGrNdefD3zaSjzwK689GbKSGAAs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oBGcqE55da862TcFUQ4OE9PhR+lL2X/D7UyTz2WonxneqhbhUoF6ysEYAGXGgTRECiLjKxXZYCGD1cfaKjv+wlLPzgFkxOJTQUzwM1rpCY0Zbr7/WXpP9F247i1hE7PLZGEpIvMrM7hrb7Ca2tnNYn3wE+Sl2LJui2ISATyiQQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+kdDe+9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729910985; x=1761446985;
  h=date:from:to:cc:subject:message-id;
  bh=dUrpru/Yn6mRtoUXKGrNdefD3zaSjzwK689GbKSGAAs=;
  b=D+kdDe+9o8hHLeHdQx0SHQErgxAm/9AfWBiziv4PaAclRkavJ2wZJYM+
   ZVSsUBiwHysD0Ubg2UYqeFhNCaVlMBu6vDQ8Z6OuZIJpyKaVG5xSpWtVq
   8As1AGtHHgsUaC1kjZ7ShGcVaqrGM1pMuzEZC1Y2pFQE21jP3mx8Ic1Bs
   YqXECdoP5gb6FOaGMNFMmDBLNPKPDul389r9SHDizpMKU14gynr9NkLN3
   cKNcneSy8qJ+gfCUASUe36GRm84Lr85TOI5qAFtYYqlyFeivypQoNuXZz
   cS6CF6nGM3LMW37vmaxvY69qtwqsYHc1SOIWnE50qdYicl7s/ZRDPGk6T
   A==;
X-CSE-ConnectionGUID: rcZJR5BJRfy07iRST1+C7A==
X-CSE-MsgGUID: GjFTENNpTYGd3GDP66VF3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29807840"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="29807840"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 19:49:45 -0700
X-CSE-ConnectionGUID: OlkRVvxeRYC99e9HWDG2WQ==
X-CSE-MsgGUID: gzmTKjjOTxCMo2BUabYrrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="86205495"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Oct 2024 19:49:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Ws1-000ZCS-0i;
	Sat, 26 Oct 2024 02:49:41 +0000
Date: Sat, 26 Oct 2024 10:49:30 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-r9a08g045-dt-binding-defs]
 BUILD SUCCESS 49991cca67d584a59cb10d48825cce3d11f7d843
Message-ID: <202410261021.lES1fDyb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-r9a08g045-dt-binding-defs
branch HEAD: 49991cca67d584a59cb10d48825cce3d11f7d843  dt-bindings: clock: r9a08g045-cpg: Add power domain ID for RTC

elapsed time: 984m

configs tested: 170
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              alldefconfig    clang-17
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                      axs103_smp_defconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                 nsimosci_hs_smp_defconfig    clang-17
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                   randconfig-001-20241026    gcc-14.1.0
arc                   randconfig-002-20241026    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                       imx_v4_v5_defconfig    clang-17
arm                             mxs_defconfig    clang-20
arm                   randconfig-001-20241026    gcc-14.1.0
arm                   randconfig-002-20241026    gcc-14.1.0
arm                   randconfig-003-20241026    gcc-14.1.0
arm                   randconfig-004-20241026    gcc-14.1.0
arm                       versatile_defconfig    clang-20
arm                         vf610m4_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241026    gcc-14.1.0
arm64                 randconfig-002-20241026    gcc-14.1.0
arm64                 randconfig-003-20241026    gcc-14.1.0
arm64                 randconfig-004-20241026    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241026    gcc-14.1.0
csky                  randconfig-002-20241026    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241026    gcc-14.1.0
hexagon               randconfig-002-20241026    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241026    gcc-12
i386        buildonly-randconfig-002-20241026    gcc-12
i386        buildonly-randconfig-003-20241026    gcc-12
i386        buildonly-randconfig-004-20241026    gcc-12
i386        buildonly-randconfig-005-20241026    gcc-12
i386        buildonly-randconfig-006-20241026    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241026    gcc-12
i386                  randconfig-002-20241026    gcc-12
i386                  randconfig-003-20241026    gcc-12
i386                  randconfig-004-20241026    gcc-12
i386                  randconfig-005-20241026    gcc-12
i386                  randconfig-006-20241026    gcc-12
i386                  randconfig-011-20241026    gcc-12
i386                  randconfig-012-20241026    gcc-12
i386                  randconfig-013-20241026    gcc-12
i386                  randconfig-014-20241026    gcc-12
i386                  randconfig-015-20241026    gcc-12
i386                  randconfig-016-20241026    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241026    gcc-14.1.0
loongarch             randconfig-002-20241026    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          atari_defconfig    clang-17
m68k                                defconfig    gcc-14.1.0
m68k                          multi_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ci20_defconfig    clang-17
mips                           ci20_defconfig    clang-20
mips                           ip30_defconfig    clang-20
mips                        qi_lb60_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241026    gcc-14.1.0
nios2                 randconfig-002-20241026    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    clang-20
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241026    gcc-14.1.0
parisc                randconfig-002-20241026    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                     asp8347_defconfig    clang-17
powerpc                        icon_defconfig    clang-17
powerpc                      katmai_defconfig    clang-20
powerpc                 mpc8313_rdb_defconfig    clang-17
powerpc                      ppc64e_defconfig    clang-17
powerpc                      ppc6xx_defconfig    clang-17
powerpc               randconfig-001-20241026    gcc-14.1.0
powerpc               randconfig-002-20241026    gcc-14.1.0
powerpc               randconfig-003-20241026    gcc-14.1.0
powerpc64             randconfig-001-20241026    gcc-14.1.0
powerpc64             randconfig-002-20241026    gcc-14.1.0
powerpc64             randconfig-003-20241026    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241026    gcc-14.1.0
riscv                 randconfig-002-20241026    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                          debug_defconfig    clang-20
s390                                defconfig    gcc-12
s390                  randconfig-001-20241026    gcc-14.1.0
s390                  randconfig-002-20241026    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    clang-20
sh                          r7780mp_defconfig    clang-17
sh                    randconfig-001-20241026    gcc-14.1.0
sh                    randconfig-002-20241026    gcc-14.1.0
sh                   rts7751r2dplus_defconfig    clang-17
sh                           se7721_defconfig    clang-17
sh                   sh7724_generic_defconfig    clang-17
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241026    gcc-14.1.0
sparc64               randconfig-002-20241026    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241026    gcc-14.1.0
um                    randconfig-002-20241026    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241026    gcc-14.1.0
xtensa                randconfig-002-20241026    gcc-14.1.0
xtensa                         virt_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

