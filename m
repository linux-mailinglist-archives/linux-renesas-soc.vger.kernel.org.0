Return-Path: <linux-renesas-soc+bounces-11525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8E69F6224
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 10:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90F8A16FBF4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 09:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1374716630A;
	Wed, 18 Dec 2024 09:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csXoHaeK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F07156676
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734515375; cv=none; b=Bb0UCsPlvZVHMVMi9gxRZ1VkfQWWF/dpaXpwR7n8Ryp5lgixN1gCUgMAYzG65ptvX8gA9xzRWeh4qd0vqoUx/fkPpgx342KmNZItvHiru66/6fWMChBqCDBkybSnR9Cnzq4D+SWtlSVva0JEMGyAvEiJIIL3zPR9avi8UrlMbI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734515375; c=relaxed/simple;
	bh=+iU9OakA8LxdsPOjbKrSnnNXdZOUNy0tYwr8pzuyqL0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T47a/gG6qW6h8PbVTEAtDJDzDQRDUFlGnCqaBmbVOhCS19Fp2G/W0+LH/ha3ygGr/tftUt15lM+C9D81Ofs+kdw8C4pL+8lr7QsTvLtTudXgCP7MW1JMf6vKOPAWhaTetPyBR1ADwUnzEMxITRKKysrfOLQgtgwRkDrUSCuB0VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csXoHaeK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734515374; x=1766051374;
  h=date:from:to:cc:subject:message-id;
  bh=+iU9OakA8LxdsPOjbKrSnnNXdZOUNy0tYwr8pzuyqL0=;
  b=csXoHaeKklP+dFZAtseJYf7wq1gFwKTpqADsXFn+xr4MBxaUVGqgL/w0
   7twx+ezPsJGIX8t9N1SPLPHqVb8olGMRrTIUOK4ZRo8LwBwyTKcX3Xa65
   q4tTT58W/zZKMRVx1MgQfMCkEEXHT9X0ABZ3cg0Ud/1qjxRKjOo0m+ULQ
   GHaIEpyuKco63Lvw1ZAxS3Nb3k4K4WcLdRf2LMTC3DIRkNV6LRSwAtvmr
   baNSWS2fav4PVAyaTN2A5Su0FVuCXMmaCYkcDYBybj6onaVuBt+5fbiNS
   349IZpGNOUITMBUG31O8DR2JWYy3IHMIe0QCt4gPio9yqTwPm9RLO2XK/
   Q==;
X-CSE-ConnectionGUID: rmVynt2URgux3QMBZ7rmmQ==
X-CSE-MsgGUID: 7LZubwyiTe+flxSvmY5mGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="38657368"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="38657368"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 01:49:33 -0800
X-CSE-ConnectionGUID: BN0F6dU/S4Wjznf9ei8FXg==
X-CSE-MsgGUID: 7UrUAOt8SUOMMquq3fgYIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="102803097"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Dec 2024 01:49:31 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNqgL-000GG6-1G;
	Wed, 18 Dec 2024 09:49:29 +0000
Date: Wed, 18 Dec 2024 17:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 9f197ec80b0a2f5b62b5fe73b42f6c9afb3ceef6
Message-ID: <202412181712.0IbmlEN8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 9f197ec80b0a2f5b62b5fe73b42f6c9afb3ceef6  Merge branch 'renesas-dts-for-v6.14' into renesas-next

elapsed time: 1443m

configs tested: 121
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241217    gcc-13.2.0
arc                   randconfig-002-20241217    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    gcc-13.2.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                            qcom_defconfig    clang-17
arm                   randconfig-001-20241217    clang-16
arm                   randconfig-002-20241217    gcc-14.2.0
arm                   randconfig-003-20241217    gcc-14.2.0
arm                   randconfig-004-20241217    gcc-14.2.0
arm                           sama7_defconfig    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241217    clang-20
arm64                 randconfig-002-20241217    clang-16
arm64                 randconfig-003-20241217    clang-18
arm64                 randconfig-004-20241217    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241217    gcc-14.2.0
csky                  randconfig-002-20241217    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241217    clang-20
hexagon               randconfig-002-20241217    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241217    clang-19
i386        buildonly-randconfig-002-20241217    gcc-12
i386        buildonly-randconfig-003-20241217    gcc-12
i386        buildonly-randconfig-004-20241217    clang-19
i386        buildonly-randconfig-005-20241217    clang-19
i386        buildonly-randconfig-006-20241217    gcc-11
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241217    gcc-14.2.0
loongarch             randconfig-002-20241217    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        mvme147_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241217    gcc-14.2.0
nios2                 randconfig-002-20241217    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241217    gcc-14.2.0
parisc                randconfig-002-20241217    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241217    clang-20
powerpc               randconfig-002-20241217    gcc-14.2.0
powerpc               randconfig-003-20241217    clang-16
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241217    gcc-14.2.0
powerpc64             randconfig-002-20241217    gcc-14.2.0
powerpc64             randconfig-003-20241217    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241217    gcc-14.2.0
riscv                 randconfig-002-20241217    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241217    gcc-14.2.0
s390                  randconfig-002-20241217    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                    randconfig-001-20241217    gcc-14.2.0
sh                    randconfig-002-20241217    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241217    gcc-14.2.0
sparc                 randconfig-002-20241217    gcc-14.2.0
sparc64               randconfig-001-20241217    gcc-14.2.0
sparc64               randconfig-002-20241217    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20241217    clang-20
um                    randconfig-002-20241217    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241217    clang-19
x86_64      buildonly-randconfig-002-20241217    gcc-12
x86_64      buildonly-randconfig-003-20241217    gcc-12
x86_64      buildonly-randconfig-004-20241217    clang-19
x86_64      buildonly-randconfig-005-20241217    gcc-12
x86_64      buildonly-randconfig-006-20241217    clang-19
x86_64                              defconfig    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241217    gcc-14.2.0
xtensa                randconfig-002-20241217    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

