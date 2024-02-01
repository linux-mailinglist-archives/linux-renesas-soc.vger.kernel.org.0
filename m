Return-Path: <linux-renesas-soc+bounces-2224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49648845BCC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 16:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4D40B2DFF2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 15:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB45626BF;
	Thu,  1 Feb 2024 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeabHax9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FA8626B5
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706802097; cv=none; b=qTN6S1vO7DoUlWWieXlmyykhlrVNeWirjfetN3XrNq3XElhTrX4cVsoJksRqi5fzwJ0RNNzOS6VOQkjJ4qQ999Pm7psLau6mjlM0bTR1l+jlJga2vmz0KNEkYbLOH/7d7o3AaZqYL3tR3UsB/SOrqggSsRECdtrPB9seUFN1+0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706802097; c=relaxed/simple;
	bh=idLdMaqInJjKopKbWoAWx9XTmUh0WZ/Fu72sb/Ub5jY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bG8tXpAaZtv48GUP1D9Y0Hz/JPjJ6czKnn20tk6MMf0bgrQd8XtCzUd9+UpX3e6M7CizpbPqIwMuH6zMaOQQS7zndcj+TZyIds32BdKqHEzPatEDZ7hejl0gtNjmL62EPNFVeADLufhHwgDljyjWAqs8vSun1ncLHYXou7NKHSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeabHax9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706802095; x=1738338095;
  h=date:from:to:cc:subject:message-id;
  bh=idLdMaqInJjKopKbWoAWx9XTmUh0WZ/Fu72sb/Ub5jY=;
  b=EeabHax9cNp5AALPTnWGmTw5670Kze9dCdmoHgKse4xB7D+wO358UJbP
   I0SvDkwiqLulFoAei1UJRhmyE1Y2FxUAEjj/A0YHLJq1S5W8b76r7jWRn
   mgh7hvlcCIVDpkUMPVZuF3cpEqvGGkwQ2LQaS2qtqDqrKHtUENMLauIIw
   iEpdBOzUSmlfSVb9tWPu9ZAcCoWKhezeiBriI9T+nOiPG1LVN0N38xo2C
   +VnPYaOdte/tCsQDaaPxBgSN3tW1FUH9XBzRMpOoWIWH09oche1t53CgL
   nZ7lLu0encsQ2cgOdKjkyhxKaTqZ1GXRf5j70rpkUttx4bO5uhEQhJebK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3755167"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="3755167"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 07:41:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4433202"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Feb 2024 07:41:32 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVZBy-0002uP-27;
	Thu, 01 Feb 2024 15:41:30 +0000
Date: Thu, 01 Feb 2024 23:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 0d39942a3f4a1916a58e1dbda27495871704647b
Message-ID: <202402012308.n5vOxJoQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 0d39942a3f4a1916a58e1dbda27495871704647b  arm64: renesas: defconfig: Enable R-Car V4M (R8A779H0) SoC support

elapsed time: 1447m

configs tested: 205
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240201   gcc  
arc                   randconfig-002-20240201   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                       netwinder_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                   randconfig-001-20240201   gcc  
arm                   randconfig-002-20240201   gcc  
arm                   randconfig-003-20240201   gcc  
arm                   randconfig-004-20240201   gcc  
arm                           sama5_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240201   gcc  
arm64                 randconfig-002-20240201   gcc  
arm64                 randconfig-003-20240201   gcc  
arm64                 randconfig-004-20240201   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240201   gcc  
csky                  randconfig-002-20240201   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240201   clang
hexagon               randconfig-002-20240201   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240201   gcc  
i386         buildonly-randconfig-002-20240201   gcc  
i386         buildonly-randconfig-003-20240201   gcc  
i386         buildonly-randconfig-004-20240201   gcc  
i386         buildonly-randconfig-005-20240201   gcc  
i386         buildonly-randconfig-006-20240201   gcc  
i386                                defconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240201   gcc  
i386                  randconfig-002-20240201   gcc  
i386                  randconfig-003-20240201   gcc  
i386                  randconfig-004-20240201   gcc  
i386                  randconfig-005-20240201   gcc  
i386                  randconfig-006-20240201   gcc  
i386                  randconfig-011-20240201   clang
i386                  randconfig-012-20240201   clang
i386                  randconfig-012-20240201   gcc  
i386                  randconfig-013-20240201   clang
i386                  randconfig-013-20240201   gcc  
i386                  randconfig-014-20240201   clang
i386                  randconfig-014-20240201   gcc  
i386                  randconfig-015-20240201   clang
i386                  randconfig-015-20240201   gcc  
i386                  randconfig-016-20240201   clang
i386                  randconfig-016-20240201   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240201   gcc  
loongarch             randconfig-002-20240201   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1830-neo_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240201   gcc  
nios2                 randconfig-002-20240201   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240201   gcc  
parisc                randconfig-002-20240201   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                     ksi8560_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc               randconfig-001-20240201   gcc  
powerpc               randconfig-002-20240201   gcc  
powerpc               randconfig-003-20240201   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240201   gcc  
powerpc64             randconfig-002-20240201   gcc  
powerpc64             randconfig-003-20240201   gcc  
riscv                            allmodconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240201   gcc  
riscv                 randconfig-002-20240201   gcc  
s390                             allmodconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240201   clang
s390                  randconfig-001-20240201   gcc  
s390                  randconfig-002-20240201   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20240201   gcc  
sh                    randconfig-002-20240201   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240201   gcc  
sparc64               randconfig-002-20240201   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                                allnoconfig   gcc  
um                               allyesconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240201   gcc  
um                    randconfig-002-20240201   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240201   gcc  
x86_64       buildonly-randconfig-002-20240201   gcc  
x86_64       buildonly-randconfig-003-20240201   gcc  
x86_64       buildonly-randconfig-004-20240201   gcc  
x86_64       buildonly-randconfig-005-20240201   gcc  
x86_64       buildonly-randconfig-006-20240201   gcc  
x86_64                              defconfig   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   clang
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20240201   clang
x86_64                randconfig-002-20240201   clang
x86_64                randconfig-003-20240201   clang
x86_64                randconfig-004-20240201   clang
x86_64                randconfig-005-20240201   clang
x86_64                randconfig-006-20240201   clang
x86_64                randconfig-011-20240201   gcc  
x86_64                randconfig-012-20240201   gcc  
x86_64                randconfig-013-20240201   gcc  
x86_64                randconfig-014-20240201   gcc  
x86_64                randconfig-015-20240201   gcc  
x86_64                randconfig-016-20240201   gcc  
x86_64                randconfig-071-20240201   gcc  
x86_64                randconfig-072-20240201   gcc  
x86_64                randconfig-073-20240201   gcc  
x86_64                randconfig-074-20240201   gcc  
x86_64                randconfig-075-20240201   gcc  
x86_64                randconfig-076-20240201   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20240201   gcc  
xtensa                randconfig-002-20240201   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

