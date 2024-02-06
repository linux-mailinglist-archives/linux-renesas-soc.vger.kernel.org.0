Return-Path: <linux-renesas-soc+bounces-2389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7B784B29D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 11:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C19B1C2419E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 10:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289801EA71;
	Tue,  6 Feb 2024 10:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kF/5Odkk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8435FDA6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Feb 2024 10:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707215944; cv=none; b=GpzlXKRFfrXvJomQuPNnYL1DclR9XvuTa8pyj9CQylRnY5geVshM/p1Ni6qZcEJ4YdDt0k4AOOIJ7aGdjEymTHttCKOIVLWb1Zw0HUyTw7wCDfDqcfeOk9Q1KieuQMsh/2Le6BFs5AhnNPA6ZGdcgG7HkaSNfF+9qQ9ZuKr1hXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707215944; c=relaxed/simple;
	bh=siAn/Q6sYr1YtXVigiqb8JbGq3IaU8jVcPKXu+4foBQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KIZGobTl4J7H6KAX0473ZB9RqJqa95cen3PYrGzkJot9GIEolzYKVA7PdGwym/LbZe2dNRqCQaqutGLfI9DlPF0d/mdzzJnlZbjBZDoXPFxCmXa1nhP6+6LEx+DpkBKWKcqjgxQoKv7ss5KxHGU7HotW9Oe2pNdZeNuF0nDQpGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kF/5Odkk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707215942; x=1738751942;
  h=date:from:to:cc:subject:message-id;
  bh=siAn/Q6sYr1YtXVigiqb8JbGq3IaU8jVcPKXu+4foBQ=;
  b=kF/5OdkkDG+dt9Xlqz1AVgnMCNWatl0IOIY3Ua72uLdv8dp8N1YSrWux
   jyMgAfNdRmdbjUA9gJytNWLdG7Ed6JIeISK8jgDJDICGU2U8Cn8eBtou+
   dRaC0C6swO4wQ2AvStq4hOQBA31+3zDsIO5BYnPyo6HmVLagU9rscvccL
   Y6pfvW/QsLLgtkOc52zRFSIXAXC7b9aM66wuoMPUycZpHi3Ova5yGjvP1
   np4ZRI4RdaS/z+iSLGkEVVo//fb6YQJs9yIfOtfppK34Okhe9kspWTmJJ
   /6w/68q3HjWoxpG3H2HqnpmLKC9eEcrwH9Th7M67I23ndnS0iy7n28wIf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="601736"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="601736"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 02:39:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="31801124"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Feb 2024 02:39:00 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXIqv-0001Ht-0d;
	Tue, 06 Feb 2024 10:38:57 +0000
Date: Tue, 06 Feb 2024 18:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 5ee5c13dd1cd222d2add58f1546f05b849c402ff
Message-ID: <202402061816.J75KZLUr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 5ee5c13dd1cd222d2add58f1546f05b849c402ff  Merge tag 'v6.8-rc3' into renesas-devel

elapsed time: 1485m

configs tested: 268
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
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20240205   gcc  
arc                   randconfig-001-20240206   gcc  
arc                   randconfig-002-20240205   gcc  
arc                   randconfig-002-20240206   gcc  
arc                           tb10x_defconfig   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                        mvebu_v5_defconfig   gcc  
arm                        neponset_defconfig   gcc  
arm                       netwinder_defconfig   gcc  
arm                   randconfig-002-20240205   gcc  
arm                   randconfig-002-20240206   gcc  
arm                   randconfig-003-20240206   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240205   gcc  
arm64                 randconfig-001-20240206   gcc  
arm64                 randconfig-002-20240205   gcc  
arm64                 randconfig-003-20240205   gcc  
arm64                 randconfig-003-20240206   gcc  
arm64                 randconfig-004-20240205   gcc  
arm64                 randconfig-004-20240206   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240205   gcc  
csky                  randconfig-001-20240206   gcc  
csky                  randconfig-002-20240205   gcc  
csky                  randconfig-002-20240206   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240205   clang
i386         buildonly-randconfig-002-20240205   clang
i386         buildonly-randconfig-003-20240205   clang
i386         buildonly-randconfig-003-20240206   gcc  
i386         buildonly-randconfig-004-20240205   clang
i386         buildonly-randconfig-005-20240205   clang
i386         buildonly-randconfig-005-20240206   gcc  
i386         buildonly-randconfig-006-20240205   clang
i386         buildonly-randconfig-006-20240206   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240205   clang
i386                  randconfig-002-20240205   clang
i386                  randconfig-003-20240205   clang
i386                  randconfig-004-20240205   gcc  
i386                  randconfig-005-20240205   clang
i386                  randconfig-006-20240205   gcc  
i386                  randconfig-011-20240205   gcc  
i386                  randconfig-012-20240205   clang
i386                  randconfig-012-20240206   gcc  
i386                  randconfig-013-20240205   gcc  
i386                  randconfig-014-20240205   gcc  
i386                  randconfig-014-20240206   gcc  
i386                  randconfig-015-20240205   clang
i386                  randconfig-015-20240206   gcc  
i386                  randconfig-016-20240205   gcc  
i386                  randconfig-016-20240206   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240205   gcc  
loongarch             randconfig-001-20240206   gcc  
loongarch             randconfig-002-20240205   gcc  
loongarch             randconfig-002-20240206   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                           rs90_defconfig   gcc  
mips                   sb1250_swarm_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240205   gcc  
nios2                 randconfig-001-20240206   gcc  
nios2                 randconfig-002-20240205   gcc  
nios2                 randconfig-002-20240206   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240205   gcc  
parisc                randconfig-001-20240206   gcc  
parisc                randconfig-002-20240205   gcc  
parisc                randconfig-002-20240206   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc                 mpc832x_rdb_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc                     ppa8548_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-002-20240206   gcc  
powerpc               randconfig-003-20240205   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240206   gcc  
powerpc64             randconfig-003-20240206   gcc  
riscv                            alldefconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240206   gcc  
riscv                 randconfig-002-20240205   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240205   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20240205   gcc  
sh                    randconfig-001-20240206   gcc  
sh                    randconfig-002-20240205   gcc  
sh                    randconfig-002-20240206   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240205   gcc  
sparc64               randconfig-001-20240206   gcc  
sparc64               randconfig-002-20240205   gcc  
sparc64               randconfig-002-20240206   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-002-20240205   gcc  
um                    randconfig-002-20240206   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240205   clang
x86_64       buildonly-randconfig-001-20240206   gcc  
x86_64       buildonly-randconfig-002-20240205   clang
x86_64       buildonly-randconfig-002-20240206   clang
x86_64       buildonly-randconfig-003-20240205   gcc  
x86_64       buildonly-randconfig-003-20240206   gcc  
x86_64       buildonly-randconfig-004-20240205   gcc  
x86_64       buildonly-randconfig-004-20240206   gcc  
x86_64       buildonly-randconfig-005-20240205   gcc  
x86_64       buildonly-randconfig-005-20240206   gcc  
x86_64       buildonly-randconfig-006-20240205   gcc  
x86_64       buildonly-randconfig-006-20240206   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240205   gcc  
x86_64                randconfig-001-20240206   clang
x86_64                randconfig-002-20240205   gcc  
x86_64                randconfig-002-20240206   clang
x86_64                randconfig-003-20240205   clang
x86_64                randconfig-003-20240206   gcc  
x86_64                randconfig-004-20240205   gcc  
x86_64                randconfig-004-20240206   gcc  
x86_64                randconfig-005-20240205   gcc  
x86_64                randconfig-005-20240206   gcc  
x86_64                randconfig-006-20240205   gcc  
x86_64                randconfig-006-20240206   clang
x86_64                randconfig-011-20240205   gcc  
x86_64                randconfig-011-20240206   gcc  
x86_64                randconfig-012-20240205   gcc  
x86_64                randconfig-012-20240206   clang
x86_64                randconfig-013-20240205   clang
x86_64                randconfig-013-20240206   gcc  
x86_64                randconfig-014-20240205   clang
x86_64                randconfig-014-20240206   clang
x86_64                randconfig-015-20240205   gcc  
x86_64                randconfig-015-20240206   gcc  
x86_64                randconfig-016-20240205   clang
x86_64                randconfig-016-20240206   clang
x86_64                randconfig-071-20240205   clang
x86_64                randconfig-071-20240206   gcc  
x86_64                randconfig-072-20240205   gcc  
x86_64                randconfig-072-20240206   gcc  
x86_64                randconfig-073-20240205   clang
x86_64                randconfig-073-20240206   gcc  
x86_64                randconfig-074-20240205   clang
x86_64                randconfig-074-20240206   gcc  
x86_64                randconfig-075-20240205   gcc  
x86_64                randconfig-075-20240206   clang
x86_64                randconfig-076-20240205   clang
x86_64                randconfig-076-20240206   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                randconfig-001-20240205   gcc  
xtensa                randconfig-001-20240206   gcc  
xtensa                randconfig-002-20240205   gcc  
xtensa                randconfig-002-20240206   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

