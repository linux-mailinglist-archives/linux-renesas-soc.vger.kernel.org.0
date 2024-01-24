Return-Path: <linux-renesas-soc+bounces-1798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F10483B396
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 22:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1A73283DE7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 21:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C121350CB;
	Wed, 24 Jan 2024 21:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2dBvZPq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2076E1350CA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 21:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706130500; cv=none; b=Rb/dbmnKGv4ZM6pOK7fT6NhCrKANBDUcfN82Nr5xjY9zSMVeT+/UHKJ7RCN0V6IxoqpXkdALDw+FEP0e6a3Veu+pUZOeKXJa1JgFq1IdWFrJwFdUaZt+uMH//fHaBW9n/vutDOQbADQo207E4SFbgvqyfgl6fJLWUJ+HkeuPI9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706130500; c=relaxed/simple;
	bh=y3uZM3ohSF0ueFiOklGhY71sCI1ANTGG5KXZAV8DSNI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e3vnDMgzYROUrltZgwXLYIPux76o/thFPSgqyyYc0eIuT6YaX35QcmSEwCbTKp4ozQXExYgWz2yhU+ntkQQilgNYrx3X9zOk9FpRiOYwfk7cY2Qz/jUUliGEkX2y2UYJS16S5o9QH+K9Ek3IdQVTQddANOpbvpGk4Ugazu5He0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2dBvZPq; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706130499; x=1737666499;
  h=date:from:to:cc:subject:message-id;
  bh=y3uZM3ohSF0ueFiOklGhY71sCI1ANTGG5KXZAV8DSNI=;
  b=R2dBvZPqd0wGq1APNpVWLYFOPqEwPF7VfLJksfSvId3V00e7odEPV6lJ
   wEQSEE5/f6Jrwp926NgEkNHuX1uByea4ubx2yMNHhmyMh4+3OGCNVBgaa
   9HbOM0YZcPk95FVAwLOl4hvtXabQv9PjJOd8tktMnplM0s0RNloFa5KO9
   OP4tqHH29WQ0WR2NcS80ZqLjmP/QOv4hl9POdg+/teIv6Zu1E7NTd7B+v
   AycCLZFYIbf9y592udzvxHFTMz94/kIGegLhIFcFcdpxXp0XuaUEf00kl
   ylQaeczOfYTp4hv1GxMyRmLOln/c5F9rPEzkqEmYWWk7o7hynmfRaIVAb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405724051"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="405724051"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 13:08:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2052282"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Jan 2024 13:08:16 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSkTm-0008TH-1e;
	Wed, 24 Jan 2024 21:08:14 +0000
Date: Thu, 25 Jan 2024 05:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 456f4c1de929015e1b3019275a3ddeb281215fbb
Message-ID: <202401250513.nqXCzmIY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 456f4c1de929015e1b3019275a3ddeb281215fbb  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 1465m

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
arc                   randconfig-001-20240124   gcc  
arc                   randconfig-002-20240124   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   clang
arm                   randconfig-001-20240124   clang
arm                   randconfig-002-20240124   clang
arm                   randconfig-003-20240124   clang
arm                   randconfig-004-20240124   clang
arm                        shmobile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240124   clang
arm64                 randconfig-002-20240124   clang
arm64                 randconfig-003-20240124   clang
arm64                 randconfig-004-20240124   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240124   gcc  
csky                  randconfig-002-20240124   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240124   clang
hexagon               randconfig-002-20240124   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240124   clang
i386         buildonly-randconfig-002-20240124   clang
i386         buildonly-randconfig-003-20240124   clang
i386         buildonly-randconfig-004-20240124   clang
i386         buildonly-randconfig-005-20240124   clang
i386         buildonly-randconfig-006-20240124   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240124   clang
i386                  randconfig-002-20240124   clang
i386                  randconfig-003-20240124   clang
i386                  randconfig-004-20240124   clang
i386                  randconfig-005-20240124   clang
i386                  randconfig-006-20240124   clang
i386                  randconfig-011-20240124   gcc  
i386                  randconfig-012-20240124   gcc  
i386                  randconfig-013-20240124   gcc  
i386                  randconfig-014-20240124   gcc  
i386                  randconfig-015-20240124   gcc  
i386                  randconfig-016-20240124   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240124   gcc  
loongarch             randconfig-002-20240124   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                     loongson2k_defconfig   gcc  
mips                         rt305x_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240124   gcc  
nios2                 randconfig-002-20240124   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240124   gcc  
parisc                randconfig-002-20240124   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   gcc  
powerpc                     mpc5200_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc                      pasemi_defconfig   gcc  
powerpc               randconfig-001-20240124   clang
powerpc               randconfig-002-20240124   clang
powerpc               randconfig-003-20240124   clang
powerpc64             randconfig-001-20240124   clang
powerpc64             randconfig-002-20240124   clang
powerpc64             randconfig-003-20240124   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240124   clang
riscv                 randconfig-002-20240124   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240124   gcc  
s390                  randconfig-002-20240124   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20240124   gcc  
sh                    randconfig-002-20240124   gcc  
sh                           se7724_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240124   gcc  
sparc64               randconfig-002-20240124   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240124   clang
um                    randconfig-002-20240124   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240124   clang
x86_64       buildonly-randconfig-002-20240124   clang
x86_64       buildonly-randconfig-003-20240124   clang
x86_64       buildonly-randconfig-004-20240124   clang
x86_64       buildonly-randconfig-005-20240124   clang
x86_64       buildonly-randconfig-006-20240124   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240124   gcc  
x86_64                randconfig-002-20240124   gcc  
x86_64                randconfig-003-20240124   gcc  
x86_64                randconfig-004-20240124   gcc  
x86_64                randconfig-005-20240124   gcc  
x86_64                randconfig-006-20240124   gcc  
x86_64                randconfig-011-20240124   clang
x86_64                randconfig-012-20240124   clang
x86_64                randconfig-013-20240124   clang
x86_64                randconfig-014-20240124   clang
x86_64                randconfig-015-20240124   clang
x86_64                randconfig-016-20240124   clang
x86_64                randconfig-071-20240124   clang
x86_64                randconfig-072-20240124   clang
x86_64                randconfig-073-20240124   clang
x86_64                randconfig-074-20240124   clang
x86_64                randconfig-075-20240124   clang
x86_64                randconfig-076-20240124   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240124   gcc  
xtensa                randconfig-002-20240124   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

