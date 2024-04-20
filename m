Return-Path: <linux-renesas-soc+bounces-4747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C7F8ABBC4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Apr 2024 15:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A9E11C2061A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Apr 2024 13:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100D71C6AD;
	Sat, 20 Apr 2024 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0q/IT2P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D62DF43
	for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Apr 2024 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713620017; cv=none; b=MBLihfPOxhERtuvCNqGBs9+U3NHgSnml2c9CmQMQ1JtrF2l8C9UsTfmftRvOsRUkpZzIOZH2yjLmt5s5cAPreLP5oqHQGM2MTQ6C0xdK8iKJwyUxwcY20rcyvU9Pa/S2jz4hV9RlcERlBajPJVnZdvD7o4cUM+KAeDHuSMSo2kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713620017; c=relaxed/simple;
	bh=aVVGOgMk5Nei36Wcs6IqLpLe+WdOKKz3z4Ru0FdTEe4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OjmZj/r7JB0JJOX1tMqE9DqbzUlmHZMxLakU+PU4Ki7qnSpQf+gq1xcbkjhXrRy2YSd71WQ53ZCb7+PL1IKnWsih3mqGRppyWlODBNKedL35ynn5fX8LVb9MSWhEgSDbPhGLUNhQm/VsDPN94PrV8BqO2eirW6FC55vMyTVO/ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0q/IT2P; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713620014; x=1745156014;
  h=date:from:to:cc:subject:message-id;
  bh=aVVGOgMk5Nei36Wcs6IqLpLe+WdOKKz3z4Ru0FdTEe4=;
  b=T0q/IT2P8BQ10Q1V3mIBpmMU09w6FbB4CBx+SmiN1DUBnI9E6DXC6Iav
   Xr5cXWRzqUpP24p5Fj7injKPYYkAsKLZSJXT0X7VVMy9C84GHcNC0rCIp
   DRg6SynsJOqLRQA8INaJgOTZDDFSKpqQLHGoAFnSEbAbSHw/gppmmrvn6
   iTrhzaf0H97aT+8holfxyb/fYjCVUB8UXqwJq8NPU0C4QOZnrM8DVcLBd
   FWPWz1ktMZHM42sbx8erT2lpSSOPWLKpMkkTeAwH5HDmrHToDIgP4fffV
   u5dMbKq6fGuYRIoxkC1DQ1tYro0IWZPzpTxJDKovgoe50nFl0PKr9NgzV
   A==;
X-CSE-ConnectionGUID: L6tlRMcNTSKeE8jttEtN9w==
X-CSE-MsgGUID: 5+5FdMvqQQ2Gz1EYYPnF9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="9326543"
X-IronPort-AV: E=Sophos;i="6.07,216,1708416000"; 
   d="scan'208";a="9326543"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 06:33:34 -0700
X-CSE-ConnectionGUID: MpIrekYAQX+gBzUgbO90tA==
X-CSE-MsgGUID: s68ulKdPT4qEXCB99zO3jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,216,1708416000"; 
   d="scan'208";a="23652243"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Apr 2024 06:33:32 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryAqQ-000B6u-1Y;
	Sat, 20 Apr 2024 13:33:30 +0000
Date: Sat, 20 Apr 2024 21:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/v4m-gray-hawk-single-v3] BUILD
 SUCCESS 91d0dccc7a15704ad8d28f7579aee086843acff8
Message-ID: <202404202132.nA9L2Y8a-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/v4m-gray-hawk-single-v3
branch HEAD: 91d0dccc7a15704ad8d28f7579aee086843acff8  arm64: dts: renesas: r8a779h0: Link IOMMU consumers

elapsed time: 1452m

configs tested: 179
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20240420   gcc  
arc                   randconfig-002-20240420   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                   randconfig-001-20240420   gcc  
arm                   randconfig-002-20240420   gcc  
arm                   randconfig-003-20240420   clang
arm                   randconfig-004-20240420   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240420   clang
arm64                 randconfig-002-20240420   clang
arm64                 randconfig-003-20240420   gcc  
arm64                 randconfig-004-20240420   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240420   gcc  
csky                  randconfig-002-20240420   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240420   clang
hexagon               randconfig-002-20240420   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240419   clang
i386         buildonly-randconfig-002-20240419   gcc  
i386         buildonly-randconfig-002-20240420   clang
i386         buildonly-randconfig-003-20240419   gcc  
i386         buildonly-randconfig-004-20240419   gcc  
i386         buildonly-randconfig-005-20240419   gcc  
i386         buildonly-randconfig-006-20240419   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240420   clang
i386                  randconfig-002-20240419   clang
i386                  randconfig-003-20240419   clang
i386                  randconfig-004-20240419   gcc  
i386                  randconfig-005-20240419   clang
i386                  randconfig-005-20240420   clang
i386                  randconfig-006-20240419   clang
i386                  randconfig-011-20240419   gcc  
i386                  randconfig-011-20240420   clang
i386                  randconfig-012-20240419   clang
i386                  randconfig-012-20240420   clang
i386                  randconfig-013-20240419   gcc  
i386                  randconfig-013-20240420   clang
i386                  randconfig-014-20240419   clang
i386                  randconfig-014-20240420   clang
i386                  randconfig-015-20240419   gcc  
i386                  randconfig-015-20240420   clang
i386                  randconfig-016-20240419   clang
i386                  randconfig-016-20240420   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20240420   gcc  
loongarch             randconfig-002-20240420   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                           ip28_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240420   gcc  
nios2                 randconfig-002-20240420   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240420   gcc  
parisc                randconfig-002-20240420   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20240420   gcc  
powerpc               randconfig-002-20240420   clang
powerpc               randconfig-003-20240420   clang
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240420   clang
powerpc64             randconfig-002-20240420   gcc  
powerpc64             randconfig-003-20240420   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240420   clang
riscv                 randconfig-002-20240420   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240420   clang
s390                  randconfig-002-20240420   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240420   gcc  
sh                    randconfig-002-20240420   gcc  
sh                           se7750_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240420   gcc  
sparc64               randconfig-002-20240420   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240420   clang
um                    randconfig-002-20240420   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-002-20240420   clang
x86_64       buildonly-randconfig-005-20240420   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240420   clang
x86_64                randconfig-002-20240420   clang
x86_64                randconfig-004-20240420   clang
x86_64                randconfig-005-20240420   clang
x86_64                randconfig-015-20240420   clang
x86_64                randconfig-076-20240420   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240420   gcc  
xtensa                randconfig-002-20240420   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

