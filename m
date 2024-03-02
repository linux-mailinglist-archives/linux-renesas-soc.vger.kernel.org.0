Return-Path: <linux-renesas-soc+bounces-3403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E15C886F01C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 11:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08116B22384
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 10:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4CDB661;
	Sat,  2 Mar 2024 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lt8EhJWX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BA7566A
	for <linux-renesas-soc@vger.kernel.org>; Sat,  2 Mar 2024 10:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709376905; cv=none; b=dg//ImwTMZOn5t/lKD/RijOC00iijoMjm587a+DagfsH51uWpqiVa85ratZaXAAwQo+QWYYxZlguT/0YUJAmo1NUHbuCU/sBh2rbHuKuxycVu3sESB6Wy/7gSC3Mji5R5QUzy4D7lCA4x2wwSB09HP6pLG6j9IAqjYw+bPi2Yjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709376905; c=relaxed/simple;
	bh=GMDMaH51xvQdKaMxKjSXYGkZSnM26llEKKcupCyCGhA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aW8hN7QEf5PontGmguOAh9O2WeW0Pwk8P1sQO4MYeW77HTb9yBZ00OPe0BNhTTHH5JkggfPOFWv2fQyhiggl1kd2T3EVH6fKqaNBoqltRdd7OqNW7UVaCSwG0/yNs02CmcWGPDTMg8ioX9KJGpGM61/Jwy2+23jNF/5JBCxd73E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lt8EhJWX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709376903; x=1740912903;
  h=date:from:to:cc:subject:message-id;
  bh=GMDMaH51xvQdKaMxKjSXYGkZSnM26llEKKcupCyCGhA=;
  b=Lt8EhJWXu+Bd2F2EhF5JLVrj4Pllh7l3/iRKNLvN+fd/nWXZkAporulM
   TGXkTaGMc7/+aQODc6C9VHkgAhm6WRRa9+7xTRgKwgM7rs7Uky6bs+2s2
   0X0vQWH+PHXWTOrxJXSwE09FT1773Dq6ZFgh9ExiD5hvo4d/jmeuKnTh5
   LXOEdfKkXr11tQOPykx1j2HKhdP8sAZfHsL0OqHJrL7bMk7MYH4esS2Mn
   3LzNbfi5pc17v5AbHmRYhsCp1AQqQ9F6ah6q528bNjWHLX+xFqsQzehWv
   9tj7W6KZfsLsonLQ7DfJtsHx3jEkfHLz7HXPu2zSsAnFL95HLxe05iDJT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4048083"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="4048083"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 02:55:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="12980039"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Mar 2024 02:55:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgMxU-000EXv-0Q;
	Sat, 02 Mar 2024 10:53:12 +0000
Date: Sat, 02 Mar 2024 18:46:09 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 fed1f2cab74909632fe4971f2bb071e08f4f0bbb
Message-ID: <202403021806.zkmF1FUP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: fed1f2cab74909632fe4971f2bb071e08f4f0bbb  arm64: renesas: defconfig: Enable Renesas DA9062 PMIC

elapsed time: 1106m

configs tested: 182
configs skipped: 6

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
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240302   gcc  
arc                   randconfig-002-20240302   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240302   gcc  
arm                   randconfig-002-20240302   gcc  
arm                   randconfig-003-20240302   gcc  
arm                   randconfig-004-20240302   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240302   gcc  
arm64                 randconfig-002-20240302   gcc  
arm64                 randconfig-003-20240302   clang
arm64                 randconfig-004-20240302   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240302   gcc  
csky                  randconfig-002-20240302   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240302   clang
hexagon               randconfig-002-20240302   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240302   clang
i386         buildonly-randconfig-002-20240302   gcc  
i386         buildonly-randconfig-003-20240302   gcc  
i386         buildonly-randconfig-004-20240302   clang
i386         buildonly-randconfig-005-20240302   gcc  
i386         buildonly-randconfig-006-20240302   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240302   clang
i386                  randconfig-002-20240302   gcc  
i386                  randconfig-003-20240302   clang
i386                  randconfig-004-20240302   gcc  
i386                  randconfig-005-20240302   gcc  
i386                  randconfig-006-20240302   clang
i386                  randconfig-011-20240302   gcc  
i386                  randconfig-012-20240302   gcc  
i386                  randconfig-013-20240302   gcc  
i386                  randconfig-014-20240302   gcc  
i386                  randconfig-015-20240302   clang
i386                  randconfig-016-20240302   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240302   gcc  
loongarch             randconfig-002-20240302   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          malta_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240302   gcc  
nios2                 randconfig-002-20240302   gcc  
openrisc                         alldefconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240302   gcc  
parisc                randconfig-002-20240302   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240302   clang
powerpc               randconfig-002-20240302   clang
powerpc               randconfig-003-20240302   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc64             randconfig-001-20240302   clang
powerpc64             randconfig-002-20240302   gcc  
powerpc64             randconfig-003-20240302   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240302   gcc  
riscv                 randconfig-002-20240302   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240302   gcc  
s390                  randconfig-002-20240302   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20240302   gcc  
sh                    randconfig-002-20240302   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240302   gcc  
sparc64               randconfig-002-20240302   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240302   gcc  
um                    randconfig-002-20240302   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64       buildonly-randconfig-001-20240302   clang
x86_64       buildonly-randconfig-002-20240302   clang
x86_64       buildonly-randconfig-003-20240302   gcc  
x86_64       buildonly-randconfig-004-20240302   gcc  
x86_64       buildonly-randconfig-005-20240302   gcc  
x86_64       buildonly-randconfig-006-20240302   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240302   clang
x86_64                randconfig-002-20240302   gcc  
x86_64                randconfig-003-20240302   gcc  
x86_64                randconfig-004-20240302   clang
x86_64                randconfig-005-20240302   gcc  
x86_64                randconfig-006-20240302   clang
x86_64                randconfig-011-20240302   clang
x86_64                randconfig-012-20240302   clang
x86_64                randconfig-013-20240302   gcc  
x86_64                randconfig-014-20240302   gcc  
x86_64                randconfig-015-20240302   clang
x86_64                randconfig-016-20240302   gcc  
x86_64                randconfig-071-20240302   clang
x86_64                randconfig-072-20240302   clang
x86_64                randconfig-073-20240302   clang
x86_64                randconfig-074-20240302   gcc  
x86_64                randconfig-075-20240302   clang
x86_64                randconfig-076-20240302   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240302   gcc  
xtensa                randconfig-002-20240302   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

