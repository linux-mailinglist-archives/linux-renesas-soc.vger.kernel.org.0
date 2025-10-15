Return-Path: <linux-renesas-soc+bounces-23061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE71BDE74F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 14:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3C6719C1968
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 12:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73EC9321F27;
	Wed, 15 Oct 2025 12:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DL5nlX4Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5934231BCA9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760531141; cv=none; b=aoIH06zhUxzoEZAILsYajrB3qzilr4ybkKeHq5aUxlTgz4B5eQM7Frjmc1ntYVKzIsXZ6SeTxokmMdrokVFRJYhP/D9ukQSf3MuJPKTKDA6Zcwy0bC8VQh3OyCFpyOqb1KakF2BTatnXLhvJlTXHPz2Xl+tpJmtAUoc/Ex57hrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760531141; c=relaxed/simple;
	bh=Rk9kQFt/tvLd1S3IKJTvn8X2lEXDthcl656cM/ulKNA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FknKPFhsngFDILL2j/S7gqRvSJVqgxSW46AJf/S58oSFIO8x6TWWrHx5Inzm050eTdtk2yw8jnF6zGmLWNEHck6pk8URU90okdrQw5u1OLfQkdeXPv+pkTpqT1CJZyJLOkjlAbVtAOFnXF27ZhDJzMvOoDwskQv4S//UviM14i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DL5nlX4Y; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760531139; x=1792067139;
  h=date:from:to:cc:subject:message-id;
  bh=Rk9kQFt/tvLd1S3IKJTvn8X2lEXDthcl656cM/ulKNA=;
  b=DL5nlX4YM+B8shLs8VNxXy2h7kgFUy1LuQh7OporPLsR9u7d9W4bXrll
   M/umHk+SNsIn0upF43TNBjZuZG58RBTx5Bgpz+l/yFHkzFJ64Xq7zQSJJ
   Z1KtldHzPKJjCepR58CyFjbc3PimEh7mqFawx6PvfIUG6H5hOW3PgY9Yi
   G/NwsULp4qvGqc+9QvuuhvRX2tzLrkDtv901Hg05hKez9p/ntLOx4zxeo
   CY8OWjQhl2TchlxSTf7uFHnyHTRLiTGazq7XxocB12/K1V/f8lYCMNXx8
   x4DFJn+dwhBBUVzQAR2HDI46OGzz/hqszH5rWRTdkzPmtUb13fiQpeHL+
   A==;
X-CSE-ConnectionGUID: h/oDuw2SQKqwMlz7oT93CQ==
X-CSE-MsgGUID: 2cuLzD/GQimKZ3qb6Q4j+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62855856"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62855856"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 05:25:39 -0700
X-CSE-ConnectionGUID: Kjz1kYQcSqe+igzNpJjNFg==
X-CSE-MsgGUID: 30QV3I74Tym7uSrY8Gmu2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="182620969"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Oct 2025 05:25:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v90Yp-0003pD-0r;
	Wed, 15 Oct 2025 12:25:04 +0000
Date: Wed, 15 Oct 2025 20:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 0f537c41831aea18e54d889350e706e221beda63
Message-ID: <202510152054.Z3ib525L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 0f537c41831aea18e54d889350e706e221beda63  clk: renesas: r9a09g057: Add clock and reset entries for ISP

elapsed time: 1220m

configs tested: 242
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251015    gcc-8.5.0
arc                   randconfig-002-20251015    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    clang-22
arm                                 defconfig    clang-19
arm                          ep93xx_defconfig    clang-22
arm                             mxs_defconfig    clang-22
arm                   randconfig-001-20251015    clang-22
arm                   randconfig-001-20251015    gcc-8.5.0
arm                   randconfig-002-20251015    clang-22
arm                   randconfig-002-20251015    gcc-8.5.0
arm                   randconfig-003-20251015    gcc-8.5.0
arm                   randconfig-004-20251015    clang-22
arm                   randconfig-004-20251015    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251015    clang-22
arm64                 randconfig-001-20251015    gcc-8.5.0
arm64                 randconfig-002-20251015    gcc-13.4.0
arm64                 randconfig-002-20251015    gcc-8.5.0
arm64                 randconfig-003-20251015    clang-22
arm64                 randconfig-003-20251015    gcc-8.5.0
arm64                 randconfig-004-20251015    clang-22
arm64                 randconfig-004-20251015    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251015    clang-22
csky                  randconfig-001-20251015    gcc-15.1.0
csky                  randconfig-002-20251015    clang-22
csky                  randconfig-002-20251015    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251015    clang-22
hexagon               randconfig-002-20251015    clang-19
hexagon               randconfig-002-20251015    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251015    clang-20
i386        buildonly-randconfig-001-20251015    gcc-13
i386        buildonly-randconfig-002-20251015    clang-20
i386        buildonly-randconfig-002-20251015    gcc-14
i386        buildonly-randconfig-003-20251015    clang-20
i386        buildonly-randconfig-004-20251015    clang-20
i386        buildonly-randconfig-005-20251015    clang-20
i386        buildonly-randconfig-006-20251015    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251015    clang-20
i386                  randconfig-002-20251015    clang-20
i386                  randconfig-003-20251015    clang-20
i386                  randconfig-004-20251015    clang-20
i386                  randconfig-005-20251015    clang-20
i386                  randconfig-006-20251015    clang-20
i386                  randconfig-007-20251015    clang-20
i386                  randconfig-011-20251015    clang-20
i386                  randconfig-012-20251015    clang-20
i386                  randconfig-013-20251015    clang-20
i386                  randconfig-014-20251015    clang-20
i386                  randconfig-015-20251015    clang-20
i386                  randconfig-016-20251015    clang-20
i386                  randconfig-017-20251015    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251015    clang-22
loongarch             randconfig-001-20251015    gcc-15.1.0
loongarch             randconfig-002-20251015    clang-22
loongarch             randconfig-002-20251015    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                          multi_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    gcc-15.1.0
mips                           gcw0_defconfig    gcc-15.1.0
mips                           ip22_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251015    clang-22
nios2                 randconfig-001-20251015    gcc-8.5.0
nios2                 randconfig-002-20251015    clang-22
nios2                 randconfig-002-20251015    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251015    clang-22
parisc                randconfig-001-20251015    gcc-9.5.0
parisc                randconfig-002-20251015    clang-22
parisc                randconfig-002-20251015    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   currituck_defconfig    clang-22
powerpc                   motionpro_defconfig    gcc-15.1.0
powerpc                     mpc83xx_defconfig    clang-22
powerpc               randconfig-001-20251015    clang-22
powerpc               randconfig-001-20251015    gcc-15.1.0
powerpc               randconfig-002-20251015    clang-22
powerpc               randconfig-002-20251015    gcc-12.5.0
powerpc               randconfig-003-20251015    clang-22
powerpc                 xes_mpc85xx_defconfig    clang-22
powerpc64             randconfig-001-20251015    clang-22
powerpc64             randconfig-002-20251015    clang-22
powerpc64             randconfig-003-20251015    clang-22
powerpc64             randconfig-003-20251015    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv             nommu_k210_sdcard_defconfig    clang-22
riscv                 randconfig-001-20251015    clang-22
riscv                 randconfig-001-20251015    gcc-10.5.0
riscv                 randconfig-002-20251015    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251015    clang-22
s390                  randconfig-001-20251015    gcc-12.5.0
s390                  randconfig-002-20251015    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251015    clang-22
sh                    randconfig-001-20251015    gcc-11.5.0
sh                    randconfig-002-20251015    clang-22
sh                    randconfig-002-20251015    gcc-11.5.0
sh                          sdk7786_defconfig    gcc-15.1.0
sh                           sh2007_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251015    clang-22
sparc                 randconfig-001-20251015    gcc-8.5.0
sparc                 randconfig-002-20251015    clang-22
sparc                 randconfig-002-20251015    gcc-13.4.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251015    clang-22
sparc64               randconfig-002-20251015    clang-22
sparc64               randconfig-002-20251015    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251015    clang-22
um                    randconfig-002-20251015    clang-22
um                           x86_64_defconfig    gcc-14
um                           x86_64_defconfig    gcc-15.1.0
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251015    clang-20
x86_64      buildonly-randconfig-001-20251015    gcc-13
x86_64      buildonly-randconfig-002-20251015    gcc-13
x86_64      buildonly-randconfig-002-20251015    gcc-14
x86_64      buildonly-randconfig-003-20251015    clang-20
x86_64      buildonly-randconfig-003-20251015    gcc-13
x86_64      buildonly-randconfig-004-20251015    clang-20
x86_64      buildonly-randconfig-004-20251015    gcc-13
x86_64      buildonly-randconfig-005-20251015    gcc-13
x86_64      buildonly-randconfig-005-20251015    gcc-14
x86_64      buildonly-randconfig-006-20251015    gcc-13
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251015    clang-20
x86_64                randconfig-002-20251015    clang-20
x86_64                randconfig-003-20251015    clang-20
x86_64                randconfig-004-20251015    clang-20
x86_64                randconfig-005-20251015    clang-20
x86_64                randconfig-006-20251015    clang-20
x86_64                randconfig-007-20251015    clang-20
x86_64                randconfig-008-20251015    clang-20
x86_64                randconfig-071-20251015    gcc-14
x86_64                randconfig-072-20251015    gcc-14
x86_64                randconfig-073-20251015    gcc-14
x86_64                randconfig-074-20251015    gcc-14
x86_64                randconfig-075-20251015    gcc-14
x86_64                randconfig-076-20251015    gcc-14
x86_64                randconfig-077-20251015    gcc-14
x86_64                randconfig-078-20251015    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251015    clang-22
xtensa                randconfig-001-20251015    gcc-9.5.0
xtensa                randconfig-002-20251015    clang-22
xtensa                randconfig-002-20251015    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

