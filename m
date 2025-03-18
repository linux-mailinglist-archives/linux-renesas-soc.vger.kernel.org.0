Return-Path: <linux-renesas-soc+bounces-14584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBBEA67370
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 13:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9E723B72D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 12:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05AC3206F30;
	Tue, 18 Mar 2025 12:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XllllLjk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD81B1DD0C7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 12:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742299514; cv=none; b=cid+YJzf22m3jSxfAXulaFAgOPcmnkrVbhRuH8E2zb9+bduVAvyc1E+0pDD7+GIcuzsj2O97Gf9klRmq7B89YzArcXIt4xxScyEeJ4uDYhy6pLI75KnQnHcFrInWYLPLJROuspgmfDf/fSz2GPs+ezUMJIkeQyTc/6UB3eRJT/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742299514; c=relaxed/simple;
	bh=ZdqBrGV8hDmRZo2UOW694+tDIT1CtjoyhsHezmoTets=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l8pT2q308Q+eMCXWGWYtU6O/dyFLJuxg7HZLTSG70SXcW7G7+f9P4jEevP8N4578m+fC/jrL0t5H2RzC7AM61AMHPEpYLeMyPbhXZyGFsV3gv6n46xwdyO2crvPBAZdTinn40f7QmU3ERfiN4w5urSwt3lR09XfEkBmpz197DT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XllllLjk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742299509; x=1773835509;
  h=date:from:to:cc:subject:message-id;
  bh=ZdqBrGV8hDmRZo2UOW694+tDIT1CtjoyhsHezmoTets=;
  b=XllllLjkmmqEysWX0XHHqOyu8xFRPJ3MT/LTHUJBHYjRcd1NYVBQvAKX
   mc/luo5TKH3oDC9V5f/5DjDB8rjpnT6aN/PmWQfq5iM0/3IxUFi4kUDyG
   PAiIT6y+w0KNaLQzn5IVuYdleCzwdm4ZcOdc1v/6YeEPLCV8u6NbO4xyo
   BwdSjHmfMTmVQDugSc6DQ+ATuCCjY73h+DBlLmIbV8Akv8c6hnM7AcAPj
   Kph21WMUjqV7fFEFjFNd2BJ3FrBZL8t8T66GdxN0tn46dcqPuPsD/kez7
   KTZo8mQRA3CbuSuu2oOOtSllIHljH43akGigLhpImktyHASJAoN7vqRnG
   Q==;
X-CSE-ConnectionGUID: fil3IjbnR5KnxbQ17RrQvg==
X-CSE-MsgGUID: +w86MfXsRFWYlGBGGFRNBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43172903"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="43172903"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 05:05:08 -0700
X-CSE-ConnectionGUID: 2caNwj74SbSyG3hRhE1npw==
X-CSE-MsgGUID: S9D0tsQ9QUe0ZUJop2orSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="145420332"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Mar 2025 05:05:07 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuVgv-000DjD-0I;
	Tue, 18 Mar 2025 12:05:05 +0000
Date: Tue, 18 Mar 2025 20:04:10 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 a0228c18301bbf5d985526681c20d5000681ecbd
Message-ID: <202503182056.4JgikL1d-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: a0228c18301bbf5d985526681c20d5000681ecbd  Merge branch 'renesas-dts-for-v6.16' into renesas-devel

elapsed time: 1448m

configs tested: 120
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.3.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250317    gcc-13.2.0
arc                   randconfig-002-20250317    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                   randconfig-001-20250317    gcc-14.2.0
arm                   randconfig-002-20250317    gcc-14.2.0
arm                   randconfig-003-20250317    gcc-14.2.0
arm                   randconfig-004-20250317    clang-21
arm                         s3c6400_defconfig    gcc-11.5.0
arm                           sama5_defconfig    gcc-8.5.0
arm                         socfpga_defconfig    gcc-14.2.0
arm                           stm32_defconfig    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-8.5.0
arm64                 randconfig-001-20250317    gcc-14.2.0
arm64                 randconfig-002-20250317    gcc-14.2.0
arm64                 randconfig-003-20250317    gcc-14.2.0
arm64                 randconfig-004-20250317    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250317    gcc-14.2.0
csky                  randconfig-002-20250317    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250317    clang-21
hexagon               randconfig-002-20250317    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250317    gcc-12
i386        buildonly-randconfig-002-20250317    clang-20
i386        buildonly-randconfig-003-20250317    clang-20
i386        buildonly-randconfig-004-20250317    clang-20
i386        buildonly-randconfig-005-20250317    gcc-12
i386        buildonly-randconfig-006-20250317    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250317    gcc-14.2.0
loongarch             randconfig-002-20250317    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-5.5.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        maltaup_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250317    gcc-14.2.0
nios2                 randconfig-002-20250317    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-10.5.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250317    gcc-14.2.0
parisc                randconfig-002-20250317    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     ppa8548_defconfig    gcc-8.5.0
powerpc                      ppc44x_defconfig    clang-21
powerpc               randconfig-001-20250317    clang-15
powerpc               randconfig-002-20250317    clang-21
powerpc               randconfig-003-20250317    gcc-14.2.0
powerpc64             randconfig-001-20250317    gcc-14.2.0
powerpc64             randconfig-002-20250317    gcc-14.2.0
powerpc64             randconfig-003-20250317    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250317    gcc-14.2.0
riscv                 randconfig-002-20250317    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250317    clang-15
s390                  randconfig-002-20250317    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-5.5.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250317    gcc-14.2.0
sh                    randconfig-002-20250317    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250317    gcc-14.2.0
sparc                 randconfig-002-20250317    gcc-14.2.0
sparc64               randconfig-001-20250317    gcc-14.2.0
sparc64               randconfig-002-20250317    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250317    gcc-12
um                    randconfig-002-20250317    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250317    gcc-12
x86_64      buildonly-randconfig-002-20250317    clang-20
x86_64      buildonly-randconfig-003-20250317    gcc-12
x86_64      buildonly-randconfig-004-20250317    gcc-12
x86_64      buildonly-randconfig-005-20250317    gcc-12
x86_64      buildonly-randconfig-006-20250317    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250317    gcc-14.2.0
xtensa                randconfig-002-20250317    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

