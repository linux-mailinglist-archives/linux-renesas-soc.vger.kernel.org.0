Return-Path: <linux-renesas-soc+bounces-7377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C7993329D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2024 22:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E9A51C20D8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2024 20:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECED41C7F;
	Tue, 16 Jul 2024 20:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhXpUtrt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CCD28DD0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jul 2024 20:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721160259; cv=none; b=C6wujhdlNl1mzWSdCz0+CMXVTa3TFmtFxF23dbT/bbp16mCI2+UB36xSWeKjXX0Qj+sk+T2DZQv2mYGyZxVao07mWrmguGF6dFkBuS09blTCgF8UvT9PKIjRTTqfiniq/Z2/NOmDPjq6L0A5TGhm0aIC3sdKAEcWkBnBGY+Ixrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721160259; c=relaxed/simple;
	bh=rOq9fcC58fVBGGi7mq6PKskQfnqSDcEpk2NhrKvEuXY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FKkDuSyys3C49msttByKWcRFmv+PYUFp150qlD1P8wJj0J9Kr4nFL21eUxlbli96uJX9kvZ475dl84v25U94RNRthlUSY3n5D6Rh/XACm95Ot3q3PUPSKOo9N/tlEfEyPlQzUzuuM0PgL7KVh0zck/B+cPZrdN8df0KIoon2X2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhXpUtrt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721160257; x=1752696257;
  h=date:from:to:cc:subject:message-id;
  bh=rOq9fcC58fVBGGi7mq6PKskQfnqSDcEpk2NhrKvEuXY=;
  b=BhXpUtrtnTIPXS4S8FUy8Z+5FVDYu/VNnCHBTMNLpbZAIPs9ntE4Aj5H
   tFJe/HkbFo8oahBflTtJwtV3xMOpFw7sXklLnRMNhoaEIsa7Tfu80OZp/
   BdM9JPKxXhoZUZ6UBZE2rLtex7ph811WkT7h+Mosaz4p0jpuvi06MfSsY
   Vk2EqLTNkeYfJmTG+HMCnNJ9xxOwFzS0VaH7Kr7a2oAUWe0dIkzZ3jpdX
   FGdQCxye22ZfRravXIZbe9nybGLWjCAKNl66LwPgeqQUPHCyhwLZq6uKu
   cpidhwUka+3UuJWftwbNLuQ7SdME62o4JKk7M54vvtn6+ZKwxaRfFk8id
   w==;
X-CSE-ConnectionGUID: pU3Uq8lHS8u4ltz2YYDcBw==
X-CSE-MsgGUID: 7x/log3rQOmz/3pZuozzvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18328503"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="18328503"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 13:04:16 -0700
X-CSE-ConnectionGUID: HtItQDPqRhqAhzmunEQjWg==
X-CSE-MsgGUID: B5dpRkWeR266guwxLi6E2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="50075012"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jul 2024 13:04:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sToPE-000fcd-2S;
	Tue, 16 Jul 2024 20:04:12 +0000
Date: Wed, 17 Jul 2024 04:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.12] BUILD SUCCESS
 6cf8dc1891e09b0776ac601ddc64910391d8f997
Message-ID: <202407170411.J2MndizB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.12
branch HEAD: 6cf8dc1891e09b0776ac601ddc64910391d8f997  clk: renesas: r8a779h0: Initial clock descriptions should be __initconst

elapsed time: 721m

configs tested: 170
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                           imxrt_defconfig   gcc-13.2.0
arm                         nhk8815_defconfig   gcc-13.2.0
arm                        shmobile_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240716   clang-18
i386         buildonly-randconfig-001-20240717   clang-18
i386         buildonly-randconfig-002-20240716   clang-18
i386         buildonly-randconfig-002-20240717   clang-18
i386         buildonly-randconfig-003-20240716   clang-18
i386         buildonly-randconfig-003-20240717   clang-18
i386         buildonly-randconfig-004-20240716   clang-18
i386         buildonly-randconfig-004-20240717   clang-18
i386         buildonly-randconfig-005-20240716   clang-18
i386         buildonly-randconfig-005-20240717   clang-18
i386         buildonly-randconfig-006-20240716   clang-18
i386         buildonly-randconfig-006-20240717   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240716   clang-18
i386                  randconfig-001-20240717   clang-18
i386                  randconfig-002-20240716   clang-18
i386                  randconfig-002-20240717   clang-18
i386                  randconfig-003-20240716   clang-18
i386                  randconfig-003-20240716   gcc-9
i386                  randconfig-003-20240717   clang-18
i386                  randconfig-004-20240716   clang-18
i386                  randconfig-004-20240716   gcc-7
i386                  randconfig-004-20240717   clang-18
i386                  randconfig-005-20240716   clang-18
i386                  randconfig-005-20240717   clang-18
i386                  randconfig-006-20240716   clang-18
i386                  randconfig-006-20240716   gcc-9
i386                  randconfig-006-20240717   clang-18
i386                  randconfig-011-20240716   clang-18
i386                  randconfig-011-20240716   gcc-8
i386                  randconfig-011-20240717   clang-18
i386                  randconfig-012-20240716   clang-18
i386                  randconfig-012-20240717   clang-18
i386                  randconfig-013-20240716   clang-18
i386                  randconfig-013-20240716   gcc-8
i386                  randconfig-013-20240717   clang-18
i386                  randconfig-014-20240716   clang-18
i386                  randconfig-014-20240717   clang-18
i386                  randconfig-015-20240716   clang-18
i386                  randconfig-015-20240717   clang-18
i386                  randconfig-016-20240716   clang-18
i386                  randconfig-016-20240716   gcc-10
i386                  randconfig-016-20240717   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             alldefconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5475evb_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
microblaze                      mmu_defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                     cu1830-neo_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                    adder875_defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      arches_defconfig   gcc-13.2.0
powerpc                   microwatt_defconfig   gcc-13.2.0
powerpc                      pmac32_defconfig   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                        apsh4ad0a_defconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                               j2_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc64_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240716   gcc-13
x86_64       buildonly-randconfig-002-20240716   gcc-13
x86_64       buildonly-randconfig-003-20240716   gcc-13
x86_64       buildonly-randconfig-004-20240716   gcc-13
x86_64       buildonly-randconfig-005-20240716   gcc-13
x86_64       buildonly-randconfig-006-20240716   gcc-13
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240716   gcc-13
x86_64                randconfig-002-20240716   gcc-13
x86_64                randconfig-003-20240716   gcc-13
x86_64                randconfig-004-20240716   gcc-13
x86_64                randconfig-005-20240716   gcc-13
x86_64                randconfig-006-20240716   gcc-13
x86_64                randconfig-011-20240716   gcc-13
x86_64                randconfig-012-20240716   gcc-13
x86_64                randconfig-013-20240716   gcc-13
x86_64                randconfig-014-20240716   gcc-13
x86_64                randconfig-015-20240716   gcc-13
x86_64                randconfig-016-20240716   gcc-13
x86_64                randconfig-071-20240716   gcc-13
x86_64                randconfig-072-20240716   gcc-13
x86_64                randconfig-073-20240716   gcc-13
x86_64                randconfig-074-20240716   gcc-13
x86_64                randconfig-075-20240716   gcc-13
x86_64                randconfig-076-20240716   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

