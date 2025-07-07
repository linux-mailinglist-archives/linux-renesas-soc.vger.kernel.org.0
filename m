Return-Path: <linux-renesas-soc+bounces-19359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC69CAFBE72
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 00:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 125814239C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 22:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94728256C7C;
	Mon,  7 Jul 2025 22:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhAaQbDi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CA720459A
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jul 2025 22:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751929183; cv=none; b=myo1aRphfDf7kKn2NMJ8iMtj+OBWB1mbv+LSZm2jUFOHs3BBquqcEY96BLohVoD231yWL8/wGDTCWEgxpwa3LZW0StpmfSwsNv2/aEoOY6eYvCE8EaSzGJkCCZccBhQG+Ngu1QUMDEGEf2adj0Qn8bEyh30k3A8jb5bZ+m95rfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751929183; c=relaxed/simple;
	bh=PH82YMC+a96whaHkI8307/EKmhhIXMoF7ORpbLtEk+c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gzpUTrffvlOpoZ0emVHPo7/Z83YK9bBOkeTKPXX6l96FaGm/R2GjlA5I0BvyoP37mMgcv73OU0fxKxpD5yc2AE3YuaZ4VoKjqj8lTuoF21DyACSf5ugmP7uDZFRqbOXYMXKNU6K5So4lITUw0RF+pjEvG8xQhP5twmpQVyEsf/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhAaQbDi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751929182; x=1783465182;
  h=date:from:to:cc:subject:message-id;
  bh=PH82YMC+a96whaHkI8307/EKmhhIXMoF7ORpbLtEk+c=;
  b=bhAaQbDinqD7u6EpZ5ua9GviG19HwFjFH9/mVD6aDGFJrkZn10h5wqHW
   /RSRq4rB0bpDIvBi821xgzHJLR7dOO5BX1r60xvLIS18Ha7WAeFqhMYYm
   9FMLwBCyO4I42VK+yPoZKjEVoln6GkDHnKAxzjpgKIDGSrsWHel+I9HYx
   F44UepyZmwl+KTmycCbqOlXpOeTkB6QfSJXdVozyFo11RKlYvN6aowyaf
   Y8YmbLuCyeojM8/r6fjWDmihoN9uOQx/hGIhbNtObLHvV2iTs6h5LoduK
   4CF2yqERQcCVSePt+1HyNjqD0lzN9M6aYXX8X2vpB9+nONoHJ1gJjTcTZ
   w==;
X-CSE-ConnectionGUID: KnL5KYjeRHet70ETvOP3tw==
X-CSE-MsgGUID: vjc0gAPVQNaeA8tPaejYNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53278304"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="53278304"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 15:59:41 -0700
X-CSE-ConnectionGUID: BgbFTbZ1QhuYRpS9q8ruPg==
X-CSE-MsgGUID: 9HxEJ7YlRKCroaqt8ZSY5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="186364372"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jul 2025 15:59:40 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYuoD-0000nz-31;
	Mon, 07 Jul 2025 22:59:37 +0000
Date: Tue, 08 Jul 2025 06:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 b88f6252668ef4410ee25669089c7db38ba9b308
Message-ID: <202507080627.wQu4arJV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: b88f6252668ef4410ee25669089c7db38ba9b308  Merge branch 'renesas-next', tag 'v6.16-rc5' into renesas-devel

elapsed time: 785m

configs tested: 128
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250707    gcc-15.1.0
arc                   randconfig-002-20250707    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250707    gcc-10.5.0
arm                   randconfig-002-20250707    gcc-11.5.0
arm                   randconfig-003-20250707    clang-21
arm                   randconfig-004-20250707    clang-21
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250707    gcc-8.5.0
arm64                 randconfig-002-20250707    gcc-11.5.0
arm64                 randconfig-003-20250707    gcc-12.3.0
arm64                 randconfig-004-20250707    gcc-14.3.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250707    gcc-15.1.0
csky                  randconfig-002-20250707    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250707    clang-21
hexagon               randconfig-002-20250707    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250707    gcc-12
i386        buildonly-randconfig-002-20250707    clang-20
i386        buildonly-randconfig-003-20250707    gcc-12
i386        buildonly-randconfig-004-20250707    gcc-12
i386        buildonly-randconfig-005-20250707    gcc-12
i386        buildonly-randconfig-006-20250707    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250707    clang-21
loongarch             randconfig-002-20250707    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250707    gcc-10.5.0
nios2                 randconfig-002-20250707    gcc-12.4.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250707    gcc-8.5.0
parisc                randconfig-002-20250707    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                       eiger_defconfig    clang-21
powerpc               randconfig-001-20250707    gcc-8.5.0
powerpc               randconfig-002-20250707    clang-21
powerpc               randconfig-003-20250707    gcc-8.5.0
powerpc64             randconfig-001-20250707    gcc-8.5.0
powerpc64             randconfig-002-20250707    gcc-10.5.0
powerpc64             randconfig-003-20250707    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250707    clang-21
riscv                 randconfig-002-20250707    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250707    clang-21
s390                  randconfig-002-20250707    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          landisk_defconfig    gcc-15.1.0
sh                    randconfig-001-20250707    gcc-15.1.0
sh                    randconfig-002-20250707    gcc-15.1.0
sh                           se7751_defconfig    gcc-15.1.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250707    gcc-12.4.0
sparc                 randconfig-002-20250707    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250707    clang-20
sparc64               randconfig-002-20250707    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250707    gcc-12
um                    randconfig-002-20250707    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250707    gcc-12
x86_64      buildonly-randconfig-002-20250707    gcc-12
x86_64      buildonly-randconfig-003-20250707    gcc-12
x86_64      buildonly-randconfig-004-20250707    clang-20
x86_64      buildonly-randconfig-005-20250707    gcc-12
x86_64      buildonly-randconfig-006-20250707    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250707    gcc-12.4.0
xtensa                randconfig-002-20250707    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

