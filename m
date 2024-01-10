Return-Path: <linux-renesas-soc+bounces-1487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E54CB829E1E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 17:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4992EB265C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 16:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDDC4C3C8;
	Wed, 10 Jan 2024 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHmjL9MU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14524C3BD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jan 2024 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704902461; x=1736438461;
  h=date:from:to:cc:subject:message-id;
  bh=YROTFMaYwm01P2SPgEteT/rvX13nECbbr/m3vwfpY/s=;
  b=NHmjL9MUrYNlPNBRPN+Ny0+ewABjzHOZYz3u27Mhi2MiSdGmrEhVZ9QA
   7WxBMwadMNhqWFqXV5vgQB4ysry9j5hksWdLvXMPt5rCge4lfRmyGhsTT
   EYICMaM+l41QEVQWDaog65Gnta5XJKimJR8pWOgXDRL2hoNdItzRPE2J8
   GO4ElWubc4cfce5u64S5QAD4KOkvA6OP/IR8G9h6ydEWea4SsrS3h4SEX
   o/or2VwXSF7lQEyzBqxD9x/+8qbeM7ibpUJV7yXkdGYMPQ+hxX/3az7Y2
   6+DP8NNkGci0CO3SwSZA3yLMTgTb0/9xzsBrg5Z9UwR0X9Yxi1GiPbzFo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="17151752"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="17151752"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 08:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="782239727"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="782239727"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 10 Jan 2024 08:00:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNazt-0007DI-0R;
	Wed, 10 Jan 2024 16:00:05 +0000
Date: Wed, 10 Jan 2024 23:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 b975e4dc77c1fdeaac0cc8589ff48c9ab070de40
Message-ID: <202401102310.3XxS1eqT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: b975e4dc77c1fdeaac0cc8589ff48c9ab070de40  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 1463m

configs tested: 177
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
arc                   randconfig-001-20240110   gcc  
arc                   randconfig-002-20240110   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240110   clang
arm                   randconfig-002-20240110   clang
arm                   randconfig-003-20240110   clang
arm                   randconfig-004-20240110   clang
arm                           stm32_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240110   clang
arm64                 randconfig-002-20240110   clang
arm64                 randconfig-003-20240110   clang
arm64                 randconfig-004-20240110   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240110   gcc  
csky                  randconfig-002-20240110   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240110   clang
hexagon               randconfig-002-20240110   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240110   clang
i386         buildonly-randconfig-002-20240110   clang
i386         buildonly-randconfig-003-20240110   clang
i386         buildonly-randconfig-004-20240110   clang
i386         buildonly-randconfig-005-20240110   clang
i386         buildonly-randconfig-006-20240110   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240110   clang
i386                  randconfig-002-20240110   clang
i386                  randconfig-003-20240110   clang
i386                  randconfig-004-20240110   clang
i386                  randconfig-005-20240110   clang
i386                  randconfig-006-20240110   clang
i386                  randconfig-011-20240110   gcc  
i386                  randconfig-012-20240110   gcc  
i386                  randconfig-013-20240110   gcc  
i386                  randconfig-014-20240110   gcc  
i386                  randconfig-015-20240110   gcc  
i386                  randconfig-016-20240110   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240110   gcc  
loongarch             randconfig-002-20240110   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                      bmips_stb_defconfig   clang
mips                         cobalt_defconfig   gcc  
mips                          rb532_defconfig   gcc  
mips                        vocore2_defconfig   gcc  
mips                           xway_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240110   gcc  
nios2                 randconfig-002-20240110   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240110   gcc  
parisc                randconfig-002-20240110   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      mgcoge_defconfig   gcc  
powerpc                  mpc885_ads_defconfig   clang
powerpc                      pasemi_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc               randconfig-001-20240110   clang
powerpc               randconfig-002-20240110   clang
powerpc               randconfig-003-20240110   clang
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240110   clang
powerpc64             randconfig-002-20240110   clang
powerpc64             randconfig-003-20240110   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240110   clang
riscv                 randconfig-002-20240110   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240110   gcc  
s390                  randconfig-002-20240110   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240110   gcc  
sh                    randconfig-002-20240110   gcc  
sh                           se7750_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240110   gcc  
sparc64               randconfig-002-20240110   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240110   clang
um                    randconfig-002-20240110   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240110   clang
x86_64       buildonly-randconfig-002-20240110   clang
x86_64       buildonly-randconfig-003-20240110   clang
x86_64       buildonly-randconfig-004-20240110   clang
x86_64       buildonly-randconfig-005-20240110   clang
x86_64       buildonly-randconfig-006-20240110   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240110   gcc  
x86_64                randconfig-002-20240110   gcc  
x86_64                randconfig-003-20240110   gcc  
x86_64                randconfig-004-20240110   gcc  
x86_64                randconfig-005-20240110   gcc  
x86_64                randconfig-006-20240110   gcc  
x86_64                randconfig-011-20240110   clang
x86_64                randconfig-012-20240110   clang
x86_64                randconfig-013-20240110   clang
x86_64                randconfig-014-20240110   clang
x86_64                randconfig-015-20240110   clang
x86_64                randconfig-016-20240110   clang
x86_64                randconfig-071-20240110   clang
x86_64                randconfig-072-20240110   clang
x86_64                randconfig-073-20240110   clang
x86_64                randconfig-074-20240110   clang
x86_64                randconfig-075-20240110   clang
x86_64                randconfig-076-20240110   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240110   gcc  
xtensa                randconfig-002-20240110   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

