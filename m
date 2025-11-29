Return-Path: <linux-renesas-soc+bounces-25370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 22672C93DED
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 14:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 032804E107A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 13:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A473930E837;
	Sat, 29 Nov 2025 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+cQYlnG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2E830DEBC
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764421205; cv=none; b=EZIStDlg5to46ph7HyJA4nx6pZhK0T8dJC+JCOkJw/y2XLi4ehLJ2Nz2La1Fn8tfdaF/LPMLwKXn4kjuXmFa7wlqaWQbiTcJn/V4X40343dedR/tQMeOzLMvtbCrAuewQ/1UQjUyLu+xDVSEz351645Uje9IbBPWlMKhuwBwXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764421205; c=relaxed/simple;
	bh=rU7/7dYKBJHhqv5v4E1hbHRbm+SYe5UaJTRzP1Jzrrs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g2OFlV/be7mS7SOHM0oZNKdHCnFOKTvhSkPbPRiEVWeadyyf3gK0vwqZFV3t8i3Jx+thwjSOPkIuThq7W2CII4Wet458kT/U3Pgf0petd0b+Ca1d6TZVsB/5PIUtHaoPPAIw95d14VbFT5gzTBre7oV2tndCtm7Embxd3s38Oss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+cQYlnG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764421203; x=1795957203;
  h=date:from:to:cc:subject:message-id;
  bh=rU7/7dYKBJHhqv5v4E1hbHRbm+SYe5UaJTRzP1Jzrrs=;
  b=d+cQYlnGrKmos+WeM5P3lDjZKtLsi7ILlE5xamGbo8VZSYIKuuW0oSvm
   4qe/MnMx3cN96IdoSoUJIbBHSMAJJBGAl4hfmSwjECRShAhygW3vsH1/y
   gDEps4bkxR1ET4djfGRU1+ukHGNam48j2IXLIyDoSuJ6zcys37J6AgPqZ
   HYnoyY1vzuMK3qVdTe4pjc/ly2eoRWY4qbz62sBgw9Kdhcky9lwDKT4GU
   Hq8U4yHS/unyAFTVhzg+TXD6lGrYJnOgQZMRJksQjJ63PUZ83I6inIoVP
   BSF5MEHvG8VOs3Kpjk1fh/xqWgLnr23HOw6NLyL+j/2xpCsKPv9xOIjaL
   w==;
X-CSE-ConnectionGUID: 2aAxWtlCRP2A/HzcLv2zHw==
X-CSE-MsgGUID: MZtMUeI2QeW7kVMSJa18WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="83807705"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="83807705"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 05:00:02 -0800
X-CSE-ConnectionGUID: BDnrHzpXTlm7Hs1DfrZa6g==
X-CSE-MsgGUID: geG/nNraROi5LFcr9KZJFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="193767846"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Nov 2025 05:00:01 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPKYQ-000000007BL-30S9;
	Sat, 29 Nov 2025 12:59:58 +0000
Date: Sat, 29 Nov 2025 20:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.20] BUILD
 SUCCESS 16ab9e170af8f177e9ae04fe8de1eabee15a8db9
Message-ID: <202511292000.vwCicdLQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.20
branch HEAD: 16ab9e170af8f177e9ae04fe8de1eabee15a8db9  arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC

elapsed time: 1463m

configs tested: 186
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251129    gcc-10.5.0
arc                   randconfig-002-20251129    gcc-10.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-16
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20251129    clang-20
arm                   randconfig-001-20251129    gcc-10.5.0
arm                   randconfig-002-20251129    gcc-10.5.0
arm                   randconfig-003-20251129    gcc-10.5.0
arm                   randconfig-003-20251129    gcc-13.4.0
arm                   randconfig-004-20251129    gcc-10.5.0
arm                   randconfig-004-20251129    gcc-8.5.0
arm                         s3c6400_defconfig    gcc-15.1.0
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-16
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251129    gcc-15.1.0
arm64                 randconfig-002-20251129    gcc-15.1.0
arm64                 randconfig-003-20251129    gcc-15.1.0
arm64                 randconfig-004-20251129    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251129    gcc-15.1.0
csky                  randconfig-002-20251129    gcc-15.1.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251129    gcc-14.3.0
hexagon               randconfig-002-20251129    gcc-14.3.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251129    gcc-14
i386        buildonly-randconfig-002-20251129    gcc-14
i386        buildonly-randconfig-003-20251129    gcc-14
i386        buildonly-randconfig-004-20251129    gcc-14
i386        buildonly-randconfig-005-20251129    gcc-14
i386        buildonly-randconfig-006-20251129    gcc-14
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251129    gcc-14
i386                  randconfig-002-20251129    gcc-14
i386                  randconfig-003-20251129    gcc-14
i386                  randconfig-004-20251129    gcc-14
i386                  randconfig-005-20251129    gcc-14
i386                  randconfig-006-20251129    gcc-14
i386                  randconfig-007-20251129    gcc-14
i386                  randconfig-011-20251129    clang-20
i386                  randconfig-012-20251129    clang-20
i386                  randconfig-013-20251129    clang-20
i386                  randconfig-014-20251129    clang-20
i386                  randconfig-015-20251129    clang-20
i386                  randconfig-016-20251129    clang-20
i386                  randconfig-017-20251129    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251129    gcc-14.3.0
loongarch             randconfig-002-20251129    gcc-14.3.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                  maltasmvp_eva_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251129    gcc-14.3.0
nios2                 randconfig-002-20251129    gcc-14.3.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251129    clang-22
parisc                randconfig-002-20251129    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                 mpc8315_rdb_defconfig    gcc-15.1.0
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc                      pcm030_defconfig    gcc-15.1.0
powerpc                     ppa8548_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251129    clang-22
powerpc               randconfig-002-20251129    clang-22
powerpc64             randconfig-001-20251129    clang-22
powerpc64             randconfig-002-20251129    clang-22
riscv                            allmodconfig    clang-16
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251129    gcc-15.1.0
riscv                 randconfig-002-20251129    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251129    gcc-15.1.0
s390                  randconfig-002-20251129    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20251129    gcc-15.1.0
sh                    randconfig-002-20251129    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251129    gcc-14
sparc                 randconfig-002-20251129    gcc-14
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251129    gcc-14
sparc64               randconfig-002-20251129    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251129    gcc-14
um                    randconfig-002-20251129    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251129    gcc-14
x86_64      buildonly-randconfig-002-20251129    gcc-14
x86_64      buildonly-randconfig-003-20251129    gcc-14
x86_64      buildonly-randconfig-004-20251129    gcc-14
x86_64      buildonly-randconfig-005-20251129    gcc-14
x86_64      buildonly-randconfig-006-20251129    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251129    clang-20
x86_64                randconfig-002-20251129    clang-20
x86_64                randconfig-003-20251129    clang-20
x86_64                randconfig-004-20251129    clang-20
x86_64                randconfig-005-20251129    clang-20
x86_64                randconfig-006-20251129    clang-20
x86_64                randconfig-011-20251129    gcc-14
x86_64                randconfig-012-20251129    gcc-14
x86_64                randconfig-013-20251129    gcc-14
x86_64                randconfig-014-20251129    gcc-14
x86_64                randconfig-015-20251129    gcc-14
x86_64                randconfig-016-20251129    gcc-14
x86_64                randconfig-071-20251129    gcc-14
x86_64                randconfig-072-20251129    gcc-14
x86_64                randconfig-073-20251129    gcc-14
x86_64                randconfig-074-20251129    gcc-14
x86_64                randconfig-075-20251129    gcc-14
x86_64                randconfig-076-20251129    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251129    gcc-14
xtensa                randconfig-002-20251129    gcc-14
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

