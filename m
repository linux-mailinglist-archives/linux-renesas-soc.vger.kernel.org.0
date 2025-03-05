Return-Path: <linux-renesas-soc+bounces-14015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9166DA50383
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 16:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F61B3AA20D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 15:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A6224EF6B;
	Wed,  5 Mar 2025 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AD7shm8c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BED205511
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Mar 2025 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741188739; cv=none; b=fHNu9JRCwSLqIvXB5DueaHIKe44lN0JW/MmuTwF0D/R/RKzEmjdSlSPqWi8hE4z6SnxhNg4LszAKYlCNZE/AS9Qd12unWAd3jnOOEes8tH/5mpvkNUyihiABcCJRCCXBOaTrM383xwElToLpxKNiMDylwYAz6dfxuLpeZNySXcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741188739; c=relaxed/simple;
	bh=m5y5I2MWkY+KvnHsIT8s5FAdfSVNSKJXa+jJRVcZw9g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kpcusoPYrCT8a0ipm2LRFC0up+RG1LWnue76DPl4tL/8Eet4peqgA/2uRKbMvUWdSeFj+gOzUVY9hh5Jx0NENZlrqLgvuiWAkI5vdIF4a5Lf4zT0xn/xGv4BsIiUeikpj+acNCH8Jws6mi3llJXRiEXBV8+dpNZIabUXGRiqzqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AD7shm8c; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741188737; x=1772724737;
  h=date:from:to:cc:subject:message-id;
  bh=m5y5I2MWkY+KvnHsIT8s5FAdfSVNSKJXa+jJRVcZw9g=;
  b=AD7shm8cG5qhXdxzEqeYHSOKDGg6/muiCWdD47w8A6oSEWqFbZ/ANe0W
   VvFzMjtIv+TLn5gBNB6h/kRWQrHN9wMYDnYmkSybe+nQwO+Tn7FGs8AZr
   J8QVPuV/of5fsSWHfh74sxO6uzVaU2Mxe3vMBMRjZfzZIzj5lFmbI0M7Z
   Ykb9d0jl76Te6zKj/gn+n71JqskRZ6fSTLNBBaU/VkOAwU2qvd6baM2uG
   7T3gKia4cK6lxAwo9mM/U9zXKl7u5xL5Odz52stQRSp1uDy+PrYHxAJdE
   LreJLYnvWr6+EBTYyogIUWf1z866uWDZLDET8eS4iv1bsQKpHPxl4PSG9
   g==;
X-CSE-ConnectionGUID: PHFR80fNSYyzhX3pxF5/lg==
X-CSE-MsgGUID: hSv+NIVFSayiWJv00qDE/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29740311"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="29740311"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 07:32:14 -0800
X-CSE-ConnectionGUID: Oj9M3qARR6qQSNpRCFRe8w==
X-CSE-MsgGUID: e0c8MHvcQwa+cshPA1Lo0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118730620"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 07:32:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpqjC-000LA2-21;
	Wed, 05 Mar 2025 15:32:10 +0000
Date: Wed, 05 Mar 2025 23:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 340f8c004b253278947a58faee9cf11e5352a073
Message-ID: <202503052349.LELyn35J-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 340f8c004b253278947a58faee9cf11e5352a073  [LOCAL] riscv: rzfive: defconfig: Update rzfive_defconfig

elapsed time: 1455m

configs tested: 181
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                         haps_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250305    gcc-13.2.0
arc                   randconfig-001-20250305    gcc-14.2.0
arc                   randconfig-002-20250305    gcc-13.2.0
arc                   randconfig-002-20250305    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                      footbridge_defconfig    gcc-13.2.0
arm                       omap2plus_defconfig    gcc-14.2.0
arm                   randconfig-001-20250305    gcc-14.2.0
arm                   randconfig-002-20250305    clang-19
arm                   randconfig-002-20250305    gcc-14.2.0
arm                   randconfig-003-20250305    gcc-14.2.0
arm                   randconfig-004-20250305    gcc-14.2.0
arm                        spear3xx_defconfig    gcc-13.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250305    clang-15
arm64                 randconfig-001-20250305    gcc-14.2.0
arm64                 randconfig-002-20250305    gcc-14.2.0
arm64                 randconfig-003-20250305    clang-21
arm64                 randconfig-003-20250305    gcc-14.2.0
arm64                 randconfig-004-20250305    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250305    gcc-14.2.0
csky                  randconfig-002-20250305    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250305    clang-21
hexagon               randconfig-001-20250305    gcc-14.2.0
hexagon               randconfig-002-20250305    clang-18
hexagon               randconfig-002-20250305    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250305    clang-19
i386        buildonly-randconfig-002-20250305    clang-19
i386        buildonly-randconfig-003-20250305    clang-19
i386        buildonly-randconfig-004-20250305    clang-19
i386        buildonly-randconfig-005-20250305    clang-19
i386        buildonly-randconfig-006-20250305    clang-19
i386        buildonly-randconfig-006-20250305    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250305    clang-19
i386                  randconfig-002-20250305    clang-19
i386                  randconfig-003-20250305    clang-19
i386                  randconfig-004-20250305    clang-19
i386                  randconfig-005-20250305    clang-19
i386                  randconfig-006-20250305    clang-19
i386                  randconfig-007-20250305    clang-19
i386                  randconfig-011-20250305    gcc-11
i386                  randconfig-012-20250305    gcc-11
i386                  randconfig-013-20250305    gcc-11
i386                  randconfig-014-20250305    gcc-11
i386                  randconfig-015-20250305    gcc-11
i386                  randconfig-016-20250305    gcc-11
i386                  randconfig-017-20250305    gcc-11
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250305    gcc-14.2.0
loongarch             randconfig-002-20250305    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250305    gcc-14.2.0
nios2                 randconfig-002-20250305    gcc-14.2.0
openrisc                          allnoconfig    clang-15
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    gcc-13.2.0
parisc                            allnoconfig    clang-15
parisc                            allnoconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250305    gcc-14.2.0
parisc                randconfig-002-20250305    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                           allnoconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc                  mpc866_ads_defconfig    gcc-14.2.0
powerpc                     powernv_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250305    clang-17
powerpc               randconfig-001-20250305    gcc-14.2.0
powerpc               randconfig-002-20250305    gcc-14.2.0
powerpc               randconfig-003-20250305    gcc-14.2.0
powerpc                     tqm8540_defconfig    gcc-13.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-13.2.0
powerpc64             randconfig-001-20250305    clang-19
powerpc64             randconfig-001-20250305    gcc-14.2.0
powerpc64             randconfig-002-20250305    clang-17
powerpc64             randconfig-002-20250305    gcc-14.2.0
powerpc64             randconfig-003-20250305    clang-19
powerpc64             randconfig-003-20250305    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250305    clang-19
riscv                 randconfig-001-20250305    gcc-14.2.0
riscv                 randconfig-002-20250305    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250305    gcc-14.2.0
s390                  randconfig-002-20250305    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                          polaris_defconfig    gcc-14.2.0
sh                    randconfig-001-20250305    gcc-14.2.0
sh                    randconfig-002-20250305    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-13.2.0
sh                             shx3_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250305    gcc-14.2.0
sparc                 randconfig-002-20250305    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250305    gcc-14.2.0
sparc64               randconfig-002-20250305    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-15
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250305    clang-19
um                    randconfig-001-20250305    gcc-14.2.0
um                    randconfig-002-20250305    gcc-12
um                    randconfig-002-20250305    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250305    clang-19
x86_64      buildonly-randconfig-002-20250305    clang-19
x86_64      buildonly-randconfig-002-20250305    gcc-12
x86_64      buildonly-randconfig-003-20250305    clang-19
x86_64      buildonly-randconfig-004-20250305    clang-19
x86_64      buildonly-randconfig-004-20250305    gcc-12
x86_64      buildonly-randconfig-005-20250305    clang-19
x86_64      buildonly-randconfig-006-20250305    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250305    gcc-12
x86_64                randconfig-002-20250305    gcc-12
x86_64                randconfig-003-20250305    gcc-12
x86_64                randconfig-004-20250305    gcc-12
x86_64                randconfig-005-20250305    gcc-12
x86_64                randconfig-006-20250305    gcc-12
x86_64                randconfig-007-20250305    gcc-12
x86_64                randconfig-008-20250305    gcc-12
x86_64                randconfig-071-20250305    clang-19
x86_64                randconfig-072-20250305    clang-19
x86_64                randconfig-073-20250305    clang-19
x86_64                randconfig-074-20250305    clang-19
x86_64                randconfig-075-20250305    clang-19
x86_64                randconfig-076-20250305    clang-19
x86_64                randconfig-077-20250305    clang-19
x86_64                randconfig-078-20250305    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250305    gcc-14.2.0
xtensa                randconfig-002-20250305    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

