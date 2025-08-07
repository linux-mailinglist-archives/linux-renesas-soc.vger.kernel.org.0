Return-Path: <linux-renesas-soc+bounces-20073-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA0B1D17C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 06:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 644E57260BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 04:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3C815624D;
	Thu,  7 Aug 2025 04:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODpkoZHN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60EF199FB0
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Aug 2025 04:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754541240; cv=none; b=KYbKAUUt74mUcbXyDFttoc8jYLzX7/hkEL4nYubKLiop+HL54oL3PrARegyG04T79ThafadBEUiJri59ZDPQOrkY2fzJj/hsgaIcTcwshrJ4UOsSvjqdcdd5evDpt+L29XQ/Gt0UWc+XGJNdwFABMGKqd+XJxjDNFsx4e+2b0lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754541240; c=relaxed/simple;
	bh=N4GakeskdgzI3+kF5A08xV+iC72WSzdIk5kC/KLc52w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s8t/uCA1a5WZCBy+Igo6UEgbyWCoUKLZs2cLCUcOSj1K556OEsQvr34vpSN6hgklv9QfoQYf8EZ7y0sGNTOEeSJ1gH0jA6laGg527RtgtkEmUEfp+AgfOfunSTCpcEiarypEJiGoYxAuyX2GtBhe61K/lBAFLBYBIZ/1Ee/OrKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODpkoZHN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754541239; x=1786077239;
  h=date:from:to:cc:subject:message-id;
  bh=N4GakeskdgzI3+kF5A08xV+iC72WSzdIk5kC/KLc52w=;
  b=ODpkoZHNAUAAuNBKTWAM87OmGRDaz/Pxx0UcgRwANNrl5LFQdW3npM+k
   j0+bRAb1J9WZHGproDN7ipLzbpAY64rcuRFQ8/+x1ixpwCJKI4iBlzKxh
   6yZDx1fadSmr71McfSK3hmuoHeNxWhIcYQBdDJbJk+gZjxKWbWz/OgRi0
   R/HsZpQc7QFjcb+cf/vMkQdd2/kAbTIPx8e5v20OuoirnNsIjqdd6EURt
   erm2ywFbKblv+MnDw4kjwusyMzFUqekfCZKvE2mzCp5YNG53Msx+G8v0s
   I9f61zORlAVmCmRP+vTYyNjaTGos8ZyRtu3Vpj9jRxnsKNSOTZYKaUfvl
   Q==;
X-CSE-ConnectionGUID: k8jO3TcVTXG3zZL2hLvsEw==
X-CSE-MsgGUID: BKYRj/3XTeqjs7F7A2glZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60498371"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60498371"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 21:33:59 -0700
X-CSE-ConnectionGUID: aCUBnfewRs6cYszliz8j8A==
X-CSE-MsgGUID: AlKVPH+iSJCZB5mPdbIMBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164965664"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Aug 2025 21:33:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujsKA-0002N0-2P;
	Thu, 07 Aug 2025 04:33:54 +0000
Date: Thu, 07 Aug 2025 12:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-soc-for-v6.18] BUILD
 SUCCESS cb906ce5a44e52a35fcc151f73cc2e4c71239fa8
Message-ID: <202508071248.aGEia7qk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-soc-for-v6.18
branch HEAD: cb906ce5a44e52a35fcc151f73cc2e4c71239fa8  ARM: shmobile: rcar-gen2: Use SZ_256K definition

elapsed time: 731m

configs tested: 66
configs skipped: 123

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
arc                               allnoconfig    clang-22
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         axm55xx_defconfig    clang-22
arm                      jornada720_defconfig    clang-22
arm                   randconfig-001-20250807    clang-22
arm                   randconfig-002-20250807    gcc-10.5.0
arm                   randconfig-003-20250807    clang-22
arm                   randconfig-004-20250807    gcc-8.5.0
arm64                             allnoconfig    clang-22
csky                              allnoconfig    clang-22
csky                                defconfig    clang-22
hexagon                           allnoconfig    clang-22
i386        buildonly-randconfig-001-20250807    gcc-12
i386        buildonly-randconfig-002-20250807    gcc-12
i386        buildonly-randconfig-003-20250807    gcc-12
i386        buildonly-randconfig-004-20250807    gcc-12
i386        buildonly-randconfig-005-20250807    gcc-12
i386        buildonly-randconfig-006-20250807    gcc-12
i386                  randconfig-001-20250807    gcc-12
i386                  randconfig-002-20250807    gcc-12
i386                  randconfig-003-20250807    gcc-12
i386                  randconfig-004-20250807    gcc-12
i386                  randconfig-005-20250807    gcc-12
i386                  randconfig-006-20250807    gcc-12
i386                  randconfig-007-20250807    gcc-12
loongarch                         allnoconfig    clang-22
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                            alldefconfig    clang-22
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                    amigaone_defconfig    clang-22
powerpc                       ppc64_defconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                    nommu_virt_defconfig    clang-22
s390                              allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                           se7721_defconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
um                                allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20250807    gcc-11
x86_64      buildonly-randconfig-002-20250807    gcc-11
x86_64      buildonly-randconfig-003-20250807    gcc-11
x86_64      buildonly-randconfig-004-20250807    gcc-11
x86_64      buildonly-randconfig-005-20250807    gcc-11
x86_64      buildonly-randconfig-006-20250807    gcc-11
x86_64                randconfig-001-20250807    gcc-12
x86_64                randconfig-002-20250807    gcc-12
x86_64                randconfig-003-20250807    gcc-12
x86_64                randconfig-004-20250807    gcc-12
x86_64                randconfig-005-20250807    gcc-12
x86_64                randconfig-006-20250807    gcc-12
x86_64                randconfig-007-20250807    gcc-12
x86_64                randconfig-008-20250807    gcc-12
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

