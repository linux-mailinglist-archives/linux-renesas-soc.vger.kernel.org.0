Return-Path: <linux-renesas-soc+bounces-4808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ADB8ADC35
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Apr 2024 05:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F410B23517
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Apr 2024 03:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F393E18032;
	Tue, 23 Apr 2024 03:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KA8jCzS+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BE617C66
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Apr 2024 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713842636; cv=none; b=YZ8kTAbrtEKzVyZDhf3RMTCCDXrE/Yre7T2l+u4c/aSfCaaXP4jn8zGOtpJonSXuNs2q5M7kHW67J7uXCfBQAzKIUmBwx0mdO6PbS3Mp1IqC7JOnPX9uNkZezJf4tNnkQSKRb5v6qf9e/EgyhUeSKvnVK6pCqUgdU966hLPNbBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713842636; c=relaxed/simple;
	bh=U7zzr7mcA0BitJqArrtg8A+F+PE0CwXEyTKN/Nzi1d0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AGUcMCKhk6mtzfpbkng4X/I9Z0FGWXkvrX7koTDdHu+zg4z86ESdidFEZnOoZWNLQSano1k3S4UrjfcdwRfH1j17zv/1mOBbaiDO/LRbxyndk79aRvT3nwkvX7i/XFBj1Aq/MctuJoRafju8JLbh+KfKJcCE1j+hifPxz7d0OgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KA8jCzS+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713842635; x=1745378635;
  h=date:from:to:cc:subject:message-id;
  bh=U7zzr7mcA0BitJqArrtg8A+F+PE0CwXEyTKN/Nzi1d0=;
  b=KA8jCzS+PIvHhW6wPhSQ+PEhfjbjgiCDbjvBMcShECNOcb9J5q6GqEnD
   hs+J1RT/7nkeV5Q0YpJgWvNWI6ZW8PpyrTNx7GG4aCTMjvvHK8RuZ3O1Z
   WTCc560jJByxVfDEPWRtXr4Vw66s2wS90dsAdV0oobvnejMk327WSPgJf
   rwVArTl/PtOUYtgEIpmREWRIce7PPayOqyluYHBAR5klqfUaNatlTDFtg
   ua5Zw+foUSOCvbFRSYJWCZsQoiSR0Gl52tLfxomPzxbQHAt0Bcxf/FUdL
   b3Z7jNQae1brIl9Z9VCgdsEtkIjjRiDqVDkVR84RRdjyA1ZSQsfj2Yzq6
   g==;
X-CSE-ConnectionGUID: aVKTIh23QYKwzndsj4IT9Q==
X-CSE-MsgGUID: jQ901zGwR6ibEbwbXwhTxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9575836"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9575836"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 20:23:54 -0700
X-CSE-ConnectionGUID: ez6pimumQFK+BDEBQPR/jA==
X-CSE-MsgGUID: aqmarZCdTj+kSJp3eL1UOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="28881681"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Apr 2024 20:23:54 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz6l5-0000Rw-0F;
	Tue, 23 Apr 2024 03:23:51 +0000
Date: Tue, 23 Apr 2024 11:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 de20c778e68045aceda59ddc45ab00ac5fe7e8d0
Message-ID: <202404231142.mcFZpIXK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: de20c778e68045aceda59ddc45ab00ac5fe7e8d0  Merge branch 'renesas-next', tag 'v6.9-rc5' into renesas-devel

elapsed time: 1097m

configs tested: 177
configs skipped: 5

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
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20240423   gcc  
arc                   randconfig-002-20240423   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   clang
arm                        clps711x_defconfig   clang
arm                                 defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm                   randconfig-001-20240423   clang
arm                   randconfig-002-20240423   clang
arm                   randconfig-003-20240423   clang
arm                   randconfig-004-20240423   gcc  
arm                         s5pv210_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240423   clang
arm64                 randconfig-002-20240423   gcc  
arm64                 randconfig-003-20240423   clang
arm64                 randconfig-004-20240423   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240423   gcc  
csky                  randconfig-002-20240423   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240423   clang
hexagon               randconfig-002-20240423   clang
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240422   clang
i386         buildonly-randconfig-002-20240422   gcc  
i386         buildonly-randconfig-003-20240422   clang
i386         buildonly-randconfig-004-20240422   gcc  
i386         buildonly-randconfig-005-20240422   gcc  
i386         buildonly-randconfig-006-20240422   clang
i386                                defconfig   clang
i386                  randconfig-001-20240422   clang
i386                  randconfig-002-20240422   clang
i386                  randconfig-003-20240422   gcc  
i386                  randconfig-004-20240422   clang
i386                  randconfig-005-20240422   gcc  
i386                  randconfig-006-20240422   gcc  
i386                  randconfig-011-20240422   clang
i386                  randconfig-012-20240422   clang
i386                  randconfig-013-20240422   clang
i386                  randconfig-014-20240422   clang
i386                  randconfig-015-20240422   clang
i386                  randconfig-016-20240422   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240423   gcc  
loongarch             randconfig-002-20240423   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240423   gcc  
nios2                 randconfig-002-20240423   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240423   gcc  
parisc                randconfig-002-20240423   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    gamecube_defconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                      ppc44x_defconfig   clang
powerpc               randconfig-001-20240423   gcc  
powerpc               randconfig-002-20240423   gcc  
powerpc               randconfig-003-20240423   clang
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240423   gcc  
powerpc64             randconfig-002-20240423   clang
powerpc64             randconfig-003-20240423   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240423   gcc  
riscv                 randconfig-002-20240423   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240423   clang
s390                  randconfig-002-20240423   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240423   gcc  
sh                    randconfig-002-20240423   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240423   gcc  
sparc64               randconfig-002-20240423   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240423   gcc  
um                    randconfig-002-20240423   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240422   clang
x86_64       buildonly-randconfig-002-20240422   gcc  
x86_64       buildonly-randconfig-003-20240422   gcc  
x86_64       buildonly-randconfig-004-20240422   clang
x86_64       buildonly-randconfig-005-20240422   gcc  
x86_64       buildonly-randconfig-006-20240422   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240422   clang
x86_64                randconfig-002-20240422   gcc  
x86_64                randconfig-003-20240422   clang
x86_64                randconfig-004-20240422   gcc  
x86_64                randconfig-005-20240422   gcc  
x86_64                randconfig-006-20240422   clang
x86_64                randconfig-011-20240422   gcc  
x86_64                randconfig-012-20240422   clang
x86_64                randconfig-013-20240422   gcc  
x86_64                randconfig-014-20240422   clang
x86_64                randconfig-015-20240422   gcc  
x86_64                randconfig-016-20240422   gcc  
x86_64                randconfig-071-20240422   clang
x86_64                randconfig-072-20240422   gcc  
x86_64                randconfig-073-20240422   gcc  
x86_64                randconfig-074-20240422   gcc  
x86_64                randconfig-075-20240422   gcc  
x86_64                randconfig-076-20240422   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240423   gcc  
xtensa                randconfig-002-20240423   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

