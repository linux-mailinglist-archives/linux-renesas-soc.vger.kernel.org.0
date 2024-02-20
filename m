Return-Path: <linux-renesas-soc+bounces-2991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D00FB85BAAF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 12:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85FBA2870A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 11:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3605D67754;
	Tue, 20 Feb 2024 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXKsJHKf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD556664A5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708428914; cv=none; b=KjR9uv0bKPmK4jzhWPzufQ5xKRlYbSTpnFcQdDhRftbBt7ZE66RBGNXjNLe4uV7je0CHYKZ8pMTGgglSGGvwPT8JzKsSegljuGwJJEyBgyIhqLiKkMfdwov22zIRb1cuYiMeIS4VMWZrelSn4AtH9KE5faHWjT4AT0HTA9tMIO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708428914; c=relaxed/simple;
	bh=2bkRGNYzMc267xqkC0dD7Dqoe04lSS/stJBc4qCxb1s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FnNJL9xZQwPaJ/I7jnYyPxd7m5j61tPkXA9OwQUbKatrD42q/KG/Qq5OQ8QLZdCOmseasP82OL5hblwd2/TvUhveZIw7f0VcKDOpyKqQDhausnYNF0j8nys8BWFoDc2OJKNaf9nwKqd4aPLuAO8gb7St4oe/Xd4yq6bPWT+s5Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXKsJHKf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708428912; x=1739964912;
  h=date:from:to:cc:subject:message-id;
  bh=2bkRGNYzMc267xqkC0dD7Dqoe04lSS/stJBc4qCxb1s=;
  b=bXKsJHKf1HlluT9fQ7oLHXN/mR5Lby5CAY5HxzXK4DdkBnjU8wF/XeNP
   cC7HMPNG3Sr+btYdHey+5OBsHNbGzk4lCVGJa2Nm9IohZrTsu5j0BKL75
   VfkeoY13Nb0x6Z8DKkU/yVqphaEGyvqsqSf7UjcfPgp2sG0AzXyHZbL93
   i/bf6Y6wJFapqgskJRiQGhLRbcW0oFX+QgMD+vuzQUNjnd4pgB3E/RbU3
   VncleF1wzko5hvdGu/XLyzbwn1BiD3o3EA6kpn1sde0MRuEpzwaUAhdFN
   P46q83GcgfQu8jt9fFhNrx1M6KqFomp9AUAJKS1n0BURHSOfUwHXnCpjl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2431259"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2431259"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 03:35:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="35515179"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Feb 2024 03:35:09 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcOOj-0004Si-1r;
	Tue, 20 Feb 2024 11:34:59 +0000
Date: Tue, 20 Feb 2024 19:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.9] BUILD SUCCESS
 2d5452e7853d88aca7aab15e90970996ecc9b9b7
Message-ID: <202402201946.y265ss1h-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.9
branch HEAD: 2d5452e7853d88aca7aab15e90970996ecc9b9b7  ARM: dts: renesas: r8a7778: Add missing reg-names for sound

elapsed time: 1451m

configs tested: 182
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
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20240220   gcc  
arc                   randconfig-002-20240220   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-002-20240220   gcc  
arm                   randconfig-003-20240220   gcc  
arm                   randconfig-004-20240220   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240220   gcc  
csky                  randconfig-002-20240220   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240220   gcc  
i386         buildonly-randconfig-002-20240220   gcc  
i386         buildonly-randconfig-003-20240220   clang
i386         buildonly-randconfig-004-20240220   clang
i386         buildonly-randconfig-005-20240220   gcc  
i386         buildonly-randconfig-006-20240220   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240220   gcc  
i386                  randconfig-002-20240220   gcc  
i386                  randconfig-003-20240220   clang
i386                  randconfig-004-20240220   clang
i386                  randconfig-005-20240220   gcc  
i386                  randconfig-006-20240220   clang
i386                  randconfig-011-20240220   clang
i386                  randconfig-012-20240220   gcc  
i386                  randconfig-013-20240220   gcc  
i386                  randconfig-014-20240220   clang
i386                  randconfig-015-20240220   clang
i386                  randconfig-016-20240220   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20240220   gcc  
loongarch             randconfig-002-20240220   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                     loongson1c_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240220   gcc  
nios2                 randconfig-002-20240220   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240220   gcc  
parisc                randconfig-002-20240220   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240220   gcc  
powerpc64             randconfig-001-20240220   gcc  
powerpc64             randconfig-002-20240220   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240220   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20240220   gcc  
sh                    randconfig-002-20240220   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240220   gcc  
sparc64               randconfig-002-20240220   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240220   gcc  
um                    randconfig-002-20240220   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240220   clang
x86_64       buildonly-randconfig-002-20240220   clang
x86_64       buildonly-randconfig-003-20240220   gcc  
x86_64       buildonly-randconfig-004-20240220   clang
x86_64       buildonly-randconfig-005-20240220   gcc  
x86_64       buildonly-randconfig-006-20240220   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240220   gcc  
x86_64                randconfig-002-20240220   gcc  
x86_64                randconfig-003-20240220   gcc  
x86_64                randconfig-004-20240220   clang
x86_64                randconfig-005-20240220   clang
x86_64                randconfig-006-20240220   gcc  
x86_64                randconfig-011-20240220   gcc  
x86_64                randconfig-012-20240220   clang
x86_64                randconfig-013-20240220   clang
x86_64                randconfig-014-20240220   gcc  
x86_64                randconfig-015-20240220   clang
x86_64                randconfig-016-20240220   gcc  
x86_64                randconfig-071-20240220   clang
x86_64                randconfig-072-20240220   clang
x86_64                randconfig-073-20240220   clang
x86_64                randconfig-074-20240220   clang
x86_64                randconfig-075-20240220   clang
x86_64                randconfig-076-20240220   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20240220   gcc  
xtensa                randconfig-002-20240220   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

