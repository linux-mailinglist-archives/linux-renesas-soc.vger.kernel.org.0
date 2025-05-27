Return-Path: <linux-renesas-soc+bounces-17524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75875AC48A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 08:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 203DB16C263
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 06:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDD918A6B0;
	Tue, 27 May 2025 06:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfS4IRnf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8332F852
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 06:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748328762; cv=none; b=Wd8X5NQo/j+4lqVqiafcb1QV/WQc4Daco7qUs8xtGRkvdgjOiOpi4vaJ7cvPuTeKKqVSrMTKPAKwDVHekJnNnp1uDdSYsA9aLO5iUgE06g8XaStV1qITNEfdjA3mlVSpI9BWRkCKHIWBcEMZpWGAqPlD0tNWvtDTQS1Jlp+fYps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748328762; c=relaxed/simple;
	bh=mRx5LtvYEtTLcsVToGi4BGR6LZ5LMVfchTYCvvuG6Rg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nTg9ly2RN9eT5aQ0VX70YvXKpHzaK/MIhvq97VhMhR8HMnn0M3W6/iE/p5a2KRc/Caildj3FCMbY9Dyac0mCQux2tTS+zrGIudUM6ZWRTUHiOxazjjAwQ3UODau2nyU79tpW70UZx83VxtjXFXQCjU3Nt5f5LxfR+mSPNOvnWeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfS4IRnf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748328760; x=1779864760;
  h=date:from:to:cc:subject:message-id;
  bh=mRx5LtvYEtTLcsVToGi4BGR6LZ5LMVfchTYCvvuG6Rg=;
  b=bfS4IRnfy515rzJBcS3W4ShJqgNrgaDL7LGXBZjxHR43WueffbB8dGsw
   dOo0hNFdu2cmMcaAA1rYEXCAzw47R86+EpdshfxnFuIedmba6ggSyk/zf
   H4ojSfQ4n5Ua2XP2ocYDJo/3SUM+4CSLQQAedTCjhJNmCl8uxaXGf+xcG
   +ifmYlJ2xLJKrjHjCVmCU5tbn6atlr2UL1h/Nc9O+J6qpDBUgqdswuITu
   9WHsI0hVPa8AWSJCC6yVGWflOH4tg+yszuP9ORlfuJuJKESIxHzq4Asdd
   wA/sEL0Bmic2RBr3Fw6TRdJHShUIQnZafdMlIIROup2wfXZwV+eHsieyo
   g==;
X-CSE-ConnectionGUID: i2es7R/LTqWuw3B59JXCXg==
X-CSE-MsgGUID: pH0wzOT1S8urJumSgvoMbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="52922661"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="52922661"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:52:39 -0700
X-CSE-ConnectionGUID: /HQwygVCRBiCuBbvpburcw==
X-CSE-MsgGUID: Xziz5qgDROy1B/PJBD91qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="142599727"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 May 2025 23:52:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJoAt-000Syu-1e;
	Tue, 27 May 2025 06:52:35 +0000
Date: Tue, 27 May 2025 14:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.17] BUILD
 SUCCESS 5d3828a487d3226a3b1f044f485a1dee0997c406
Message-ID: <202505271440.hunlavAH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.17
branch HEAD: 5d3828a487d3226a3b1f044f485a1dee0997c406  arm64: defconfig: Enable RZ/V2H(P) USB2 PHY controller reset driver

elapsed time: 1028m

configs tested: 197
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250527    gcc-10.5.0
arc                   randconfig-002-20250527    gcc-10.5.0
arc                    vdk_hs38_smp_defconfig    clang-21
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250527    clang-21
arm                   randconfig-002-20250527    gcc-7.5.0
arm                   randconfig-003-20250527    clang-19
arm                   randconfig-004-20250527    clang-21
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250527    gcc-8.5.0
arm64                 randconfig-002-20250527    gcc-8.5.0
arm64                 randconfig-003-20250527    clang-16
arm64                 randconfig-004-20250527    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250526    gcc-9.3.0
csky                  randconfig-001-20250527    gcc-14.2.0
csky                  randconfig-002-20250526    gcc-15.1.0
csky                  randconfig-002-20250527    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250526    clang-19
hexagon               randconfig-001-20250527    gcc-14.2.0
hexagon               randconfig-002-20250526    clang-21
hexagon               randconfig-002-20250527    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250527    gcc-12
i386        buildonly-randconfig-002-20250527    clang-20
i386        buildonly-randconfig-003-20250527    clang-20
i386        buildonly-randconfig-004-20250527    clang-20
i386        buildonly-randconfig-005-20250527    gcc-11
i386        buildonly-randconfig-006-20250527    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250527    clang-20
i386                  randconfig-002-20250527    clang-20
i386                  randconfig-003-20250527    clang-20
i386                  randconfig-004-20250527    clang-20
i386                  randconfig-005-20250527    clang-20
i386                  randconfig-006-20250527    clang-20
i386                  randconfig-007-20250527    clang-20
i386                  randconfig-011-20250527    gcc-12
i386                  randconfig-012-20250527    gcc-12
i386                  randconfig-013-20250527    gcc-12
i386                  randconfig-014-20250527    gcc-12
i386                  randconfig-015-20250527    gcc-12
i386                  randconfig-016-20250527    gcc-12
i386                  randconfig-017-20250527    gcc-12
loongarch                        alldefconfig    clang-21
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250526    gcc-15.1.0
loongarch             randconfig-001-20250527    gcc-14.2.0
loongarch             randconfig-002-20250526    gcc-15.1.0
loongarch             randconfig-002-20250527    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250526    gcc-5.5.0
nios2                 randconfig-001-20250527    gcc-14.2.0
nios2                 randconfig-002-20250526    gcc-9.3.0
nios2                 randconfig-002-20250527    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250526    gcc-6.5.0
parisc                randconfig-001-20250527    gcc-14.2.0
parisc                randconfig-002-20250526    gcc-8.5.0
parisc                randconfig-002-20250527    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    clang-21
powerpc                      cm5200_defconfig    clang-21
powerpc                  mpc866_ads_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250526    clang-21
powerpc               randconfig-001-20250527    gcc-14.2.0
powerpc               randconfig-002-20250526    clang-18
powerpc               randconfig-002-20250527    gcc-14.2.0
powerpc               randconfig-003-20250526    clang-21
powerpc               randconfig-003-20250527    gcc-14.2.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250526    gcc-7.5.0
powerpc64             randconfig-001-20250527    gcc-14.2.0
powerpc64             randconfig-002-20250526    gcc-7.5.0
powerpc64             randconfig-002-20250527    gcc-14.2.0
powerpc64             randconfig-003-20250526    clang-21
powerpc64             randconfig-003-20250527    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250527    gcc-8.5.0
riscv                 randconfig-002-20250527    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250527    gcc-6.5.0
s390                  randconfig-002-20250527    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250527    gcc-10.5.0
sh                    randconfig-002-20250527    gcc-15.1.0
sh                          rsk7203_defconfig    clang-21
sh                           se7751_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250527    gcc-11.5.0
sparc                 randconfig-002-20250527    gcc-7.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250527    gcc-5.5.0
sparc64               randconfig-002-20250527    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250527    clang-21
um                    randconfig-002-20250527    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250526    gcc-12
x86_64      buildonly-randconfig-002-20250526    gcc-12
x86_64      buildonly-randconfig-003-20250526    clang-20
x86_64      buildonly-randconfig-004-20250526    gcc-12
x86_64      buildonly-randconfig-005-20250526    gcc-12
x86_64      buildonly-randconfig-006-20250526    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250527    clang-20
x86_64                randconfig-002-20250527    clang-20
x86_64                randconfig-003-20250527    clang-20
x86_64                randconfig-004-20250527    clang-20
x86_64                randconfig-005-20250527    clang-20
x86_64                randconfig-006-20250527    clang-20
x86_64                randconfig-007-20250527    clang-20
x86_64                randconfig-008-20250527    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250527    gcc-9.3.0
xtensa                randconfig-002-20250527    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

