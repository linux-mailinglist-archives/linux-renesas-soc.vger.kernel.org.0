Return-Path: <linux-renesas-soc+bounces-2422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA6F84C945
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 12:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF8071C2111B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 11:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BF518EB8;
	Wed,  7 Feb 2024 11:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EhihjsqO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE4218EA1
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707304375; cv=none; b=e6XIpnxkmvXE1Azg5iSKzQdP+66AmnrGM6sUfHwjt2di1u8GiAeNFuVkbUXKDaKvulZzK5c5U9MO1OsA7S4AA/yeRCum9H0a0kP/SwYIVyIyr70ftQGUDEU+j7PkkcI+MoWbHClG3MVFA0wyXEUcpbofW4oVEUi6Rgtx1iVuJQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707304375; c=relaxed/simple;
	bh=QSxK4CqaMFIFn0O/YfNCTGxy3XrE9Ev+OzBUN9NwC2U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TzI704/SF1WfHdW5G45GSqpJI7/MFJdckQJP+0XQVmdbI2H1gUXfkDhfKC1YSDbgCLXXu9Xp9AOCq54oEz6nIigFGvyLON+0mOCsOY/nZyNDbrT0i5+wShvaj/Ty6GwDUIcxCL49lDNcNAf51bKk8QnS2LhKOzdRspQLWR1I6KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EhihjsqO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707304374; x=1738840374;
  h=date:from:to:cc:subject:message-id;
  bh=QSxK4CqaMFIFn0O/YfNCTGxy3XrE9Ev+OzBUN9NwC2U=;
  b=EhihjsqOTls8hyCRTVVflAnKjJDeT6PJPHhkKOMVI74MFXfeh5cUJ0fP
   5jv4K1pNLDaC1B2m5N+PF137nXdh59DM5D9CwSyDczY1bOhMpiB8pcB2P
   9rseiOA0WJatGHLqgLFyhnUc6tG5suDCO6F2adxs+tiv7UEcmDL41GJxz
   JpBu0ao/n/vyIg5rbG175/WQK8gtG25AtpM5zEql5++Xu5wf2ctUMdGeT
   WCfW2lxURNBV8Ww2QA7KHpN1JIE5ryYUzvOcUuYoUL7wxomh7sUii95un
   Nw7uWlA7GkP0YP7ttrZbEA4JEXqLTQrJ/UB+Ubm0BjRtLybL/gTuYOrBx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="23442940"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="23442940"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 03:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="32377749"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Feb 2024 03:12:52 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXfrF-0002XR-2V;
	Wed, 07 Feb 2024 11:12:49 +0000
Date: Wed, 07 Feb 2024 19:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 91487349a9c3f75c983229f900978df1d14e7ff2
Message-ID: <202402071901.o5Cuwi2J-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 91487349a9c3f75c983229f900978df1d14e7ff2  Merge branch 'renesas-dts-for-v6.9' into renesas-next

elapsed time: 1473m

configs tested: 228
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240207   gcc  
arc                   randconfig-002-20240207   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                            qcom_defconfig   clang
arm                   randconfig-001-20240207   clang
arm                   randconfig-002-20240207   clang
arm                   randconfig-003-20240207   clang
arm                   randconfig-004-20240207   gcc  
arm                        shmobile_defconfig   gcc  
arm                          sp7021_defconfig   gcc  
arm                           spitz_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240207   clang
arm64                 randconfig-002-20240207   clang
arm64                 randconfig-003-20240207   clang
arm64                 randconfig-004-20240207   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240207   gcc  
csky                  randconfig-002-20240207   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240207   clang
hexagon               randconfig-002-20240207   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240206   clang
i386         buildonly-randconfig-002-20240206   clang
i386         buildonly-randconfig-003-20240206   gcc  
i386         buildonly-randconfig-004-20240206   clang
i386         buildonly-randconfig-005-20240206   gcc  
i386         buildonly-randconfig-006-20240206   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240206   clang
i386                  randconfig-001-20240207   gcc  
i386                  randconfig-002-20240206   clang
i386                  randconfig-003-20240206   clang
i386                  randconfig-003-20240207   gcc  
i386                  randconfig-004-20240206   clang
i386                  randconfig-004-20240207   gcc  
i386                  randconfig-005-20240206   clang
i386                  randconfig-005-20240207   gcc  
i386                  randconfig-006-20240206   clang
i386                  randconfig-011-20240206   clang
i386                  randconfig-011-20240207   gcc  
i386                  randconfig-012-20240206   gcc  
i386                  randconfig-012-20240207   gcc  
i386                  randconfig-013-20240206   clang
i386                  randconfig-013-20240207   gcc  
i386                  randconfig-014-20240206   gcc  
i386                  randconfig-014-20240207   gcc  
i386                  randconfig-015-20240206   gcc  
i386                  randconfig-015-20240207   gcc  
i386                  randconfig-016-20240206   gcc  
i386                  randconfig-016-20240207   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240207   gcc  
loongarch             randconfig-002-20240207   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   clang
mips                  cavium_octeon_defconfig   gcc  
mips                         db1xxx_defconfig   clang
mips                     decstation_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                           gcw0_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240207   gcc  
nios2                 randconfig-002-20240207   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240207   gcc  
parisc                randconfig-002-20240207   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc                      ppc40x_defconfig   clang
powerpc               randconfig-001-20240207   clang
powerpc               randconfig-002-20240207   clang
powerpc               randconfig-003-20240207   gcc  
powerpc64             randconfig-001-20240207   clang
powerpc64             randconfig-002-20240207   gcc  
powerpc64             randconfig-003-20240207   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20240207   clang
riscv                 randconfig-002-20240207   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240207   gcc  
s390                  randconfig-002-20240207   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240207   gcc  
sh                    randconfig-002-20240207   gcc  
sh                           sh2007_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240207   gcc  
sparc64               randconfig-002-20240207   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240207   clang
um                    randconfig-002-20240207   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240206   gcc  
x86_64       buildonly-randconfig-001-20240207   clang
x86_64       buildonly-randconfig-002-20240206   clang
x86_64       buildonly-randconfig-002-20240207   clang
x86_64       buildonly-randconfig-003-20240206   gcc  
x86_64       buildonly-randconfig-003-20240207   gcc  
x86_64       buildonly-randconfig-004-20240206   gcc  
x86_64       buildonly-randconfig-004-20240207   clang
x86_64       buildonly-randconfig-005-20240206   gcc  
x86_64       buildonly-randconfig-005-20240207   clang
x86_64       buildonly-randconfig-006-20240206   gcc  
x86_64       buildonly-randconfig-006-20240207   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240206   clang
x86_64                randconfig-001-20240207   clang
x86_64                randconfig-002-20240206   clang
x86_64                randconfig-002-20240207   gcc  
x86_64                randconfig-003-20240206   gcc  
x86_64                randconfig-003-20240207   gcc  
x86_64                randconfig-004-20240206   gcc  
x86_64                randconfig-004-20240207   gcc  
x86_64                randconfig-005-20240206   gcc  
x86_64                randconfig-005-20240207   clang
x86_64                randconfig-006-20240206   clang
x86_64                randconfig-006-20240207   clang
x86_64                randconfig-011-20240206   gcc  
x86_64                randconfig-011-20240207   clang
x86_64                randconfig-012-20240206   clang
x86_64                randconfig-012-20240207   gcc  
x86_64                randconfig-013-20240206   gcc  
x86_64                randconfig-013-20240207   clang
x86_64                randconfig-014-20240206   clang
x86_64                randconfig-014-20240207   clang
x86_64                randconfig-015-20240206   gcc  
x86_64                randconfig-015-20240207   gcc  
x86_64                randconfig-016-20240206   clang
x86_64                randconfig-016-20240207   gcc  
x86_64                randconfig-071-20240206   gcc  
x86_64                randconfig-071-20240207   gcc  
x86_64                randconfig-072-20240206   gcc  
x86_64                randconfig-072-20240207   clang
x86_64                randconfig-073-20240206   gcc  
x86_64                randconfig-073-20240207   clang
x86_64                randconfig-074-20240206   gcc  
x86_64                randconfig-074-20240207   gcc  
x86_64                randconfig-075-20240206   clang
x86_64                randconfig-075-20240207   gcc  
x86_64                randconfig-076-20240206   gcc  
x86_64                randconfig-076-20240207   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240207   gcc  
xtensa                randconfig-002-20240207   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

