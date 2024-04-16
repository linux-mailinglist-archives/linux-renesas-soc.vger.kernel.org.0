Return-Path: <linux-renesas-soc+bounces-4632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B718A5F27
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 02:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2678B2816B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 00:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFAE386;
	Tue, 16 Apr 2024 00:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TL5pSu0y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB8136E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Apr 2024 00:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713226780; cv=none; b=UWX8CLdm8O2Uk6eRwo5UXovqIvqcaPiOvhT8BztdqkHOQshei+TS+6ytg2/8t9lZqSUDuoh+oPQywIJTAiT8iaY0PM9E0O0rCeIVDNNlFsqJ5mxNWqVDWeGDH0ZA2ZZufSc5nWMYZkuY2UMrgBwrN2P3l05lB+hjRqZIbP9j5N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713226780; c=relaxed/simple;
	bh=q7q08rER3SZLzwLn4p+FCDbLyKPlhZU0PMf+IXQ8hXw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YJ3VxH9v+LPxghqkqEy+ihk/7qSkjZhF2KFyuYNc/B02lXefYuQkih/hPl+XDilBOcgSVfpE770f3jZrnzw0yNqNRV0CGUlYWLC8API3H/DjLU1iAvUttH1/TZ+KG1RT9odNS6Gsm22Mv2zwJxl1fLc+rPc3PLpBVssZ2UKxlY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TL5pSu0y; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713226779; x=1744762779;
  h=date:from:to:cc:subject:message-id;
  bh=q7q08rER3SZLzwLn4p+FCDbLyKPlhZU0PMf+IXQ8hXw=;
  b=TL5pSu0yzl2bjNKVlZjbudnCcsHguXL6I7WP3BP0X4qnhqANKiOo5ilI
   CA7TPrB2AENhBk06ViMa2154FE1wu6LieDWRs7CxqbdBFXyIqBdmIJk+V
   a2dUcdNZu+sr6XL5ZRDEMDnKC/FBOWbCpDCAdPad+hispuj3NCHfiXiqs
   uTNk0/GCslyDDzGOXrkuSz4H2SI3QVBvfpRoA445HkI7FXwux4M07lpoG
   0bdJaYdBIv94GCiIpXCrHe7eU1nsC5hGCTkW3joepeX+Y4SAgWUEyl5Dt
   01YVPVcHE/u6lNo5YgvoHYjvU1MRPxhA0igf1tqLxSH9Ofu6PY6WAzOuX
   w==;
X-CSE-ConnectionGUID: bKyUedTjS/KALKpR1AKYPA==
X-CSE-MsgGUID: ABoBmr0jRjen9eNG67RrnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="31119992"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="31119992"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 17:19:39 -0700
X-CSE-ConnectionGUID: DL/KUcmOS22SDBEj+nZPYg==
X-CSE-MsgGUID: t6CYrbiFRgGlF1Ynfy4TSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="26741439"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2024 17:19:37 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwWXu-0004lY-2i;
	Tue, 16 Apr 2024 00:19:34 +0000
Date: Tue, 16 Apr 2024 08:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 ab000cac0c9a66856e832a0c359d176e875dcc4b
Message-ID: <202404160845.SyPE9XWG-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: ab000cac0c9a66856e832a0c359d176e875dcc4b  Merge branch 'renesas-next', tag 'v6.9-rc4' into renesas-devel

elapsed time: 728m

configs tested: 178
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240416   gcc  
arc                   randconfig-002-20240416   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   clang
arm                                 defconfig   clang
arm                         lpc32xx_defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                   randconfig-001-20240416   clang
arm                   randconfig-002-20240416   clang
arm                   randconfig-003-20240416   gcc  
arm                   randconfig-004-20240416   clang
arm                        spear6xx_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240416   gcc  
arm64                 randconfig-002-20240416   clang
arm64                 randconfig-003-20240416   gcc  
arm64                 randconfig-004-20240416   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240416   gcc  
csky                  randconfig-002-20240416   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240416   clang
hexagon               randconfig-002-20240416   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240415   clang
i386         buildonly-randconfig-002-20240415   gcc  
i386         buildonly-randconfig-003-20240415   gcc  
i386         buildonly-randconfig-004-20240415   gcc  
i386         buildonly-randconfig-005-20240415   gcc  
i386         buildonly-randconfig-006-20240415   clang
i386                                defconfig   clang
i386                  randconfig-001-20240415   gcc  
i386                  randconfig-002-20240415   clang
i386                  randconfig-003-20240415   gcc  
i386                  randconfig-004-20240415   gcc  
i386                  randconfig-005-20240415   gcc  
i386                  randconfig-006-20240415   clang
i386                  randconfig-011-20240415   gcc  
i386                  randconfig-012-20240415   clang
i386                  randconfig-013-20240415   gcc  
i386                  randconfig-014-20240415   gcc  
i386                  randconfig-015-20240415   gcc  
i386                  randconfig-016-20240415   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240416   gcc  
loongarch             randconfig-002-20240416   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   clang
mips                     loongson1c_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240416   gcc  
nios2                 randconfig-002-20240416   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240416   gcc  
parisc                randconfig-002-20240416   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   currituck_defconfig   clang
powerpc                   lite5200b_defconfig   clang
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc                 mpc832x_rdb_defconfig   gcc  
powerpc               randconfig-001-20240416   clang
powerpc               randconfig-002-20240416   gcc  
powerpc               randconfig-003-20240416   clang
powerpc64             randconfig-001-20240416   gcc  
powerpc64             randconfig-002-20240416   gcc  
powerpc64             randconfig-003-20240416   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240416   gcc  
riscv                 randconfig-002-20240416   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240416   clang
s390                  randconfig-002-20240416   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                    randconfig-001-20240416   gcc  
sh                    randconfig-002-20240416   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240416   gcc  
sparc64               randconfig-002-20240416   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240416   gcc  
um                    randconfig-002-20240416   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240416   gcc  
x86_64       buildonly-randconfig-002-20240416   gcc  
x86_64       buildonly-randconfig-003-20240416   gcc  
x86_64       buildonly-randconfig-004-20240416   clang
x86_64       buildonly-randconfig-005-20240416   gcc  
x86_64       buildonly-randconfig-006-20240416   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240416   clang
x86_64                randconfig-002-20240416   clang
x86_64                randconfig-003-20240416   gcc  
x86_64                randconfig-004-20240416   clang
x86_64                randconfig-005-20240416   clang
x86_64                randconfig-006-20240416   gcc  
x86_64                randconfig-011-20240416   gcc  
x86_64                randconfig-012-20240416   clang
x86_64                randconfig-013-20240416   clang
x86_64                randconfig-014-20240416   clang
x86_64                randconfig-015-20240416   clang
x86_64                randconfig-016-20240416   gcc  
x86_64                randconfig-071-20240416   clang
x86_64                randconfig-072-20240416   clang
x86_64                randconfig-073-20240416   clang
x86_64                randconfig-074-20240416   clang
x86_64                randconfig-075-20240416   gcc  
x86_64                randconfig-076-20240416   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-002-20240416   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

