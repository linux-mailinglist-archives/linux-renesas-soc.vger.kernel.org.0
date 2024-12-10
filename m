Return-Path: <linux-renesas-soc+bounces-11137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3488C9EA861
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 07:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8EFB288649
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 06:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8604224AEB;
	Tue, 10 Dec 2024 05:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2WbaxX+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4908F22836B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 05:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733810273; cv=none; b=Gk9eOu9lL00MhnMltwUrEhXEnIShMMwJdlLW6ClIxTyR8NVCFbryMonP5s6XnmklbDUGaz58wZCbw8Kd0xbYH/mUVjti0ez5aKXzap5zUuZb8A9lq1zy6/6TjB39cqAewcf8I3DMFkvq/SiHnYRqg1M5ACuSbRbCkGi358feDyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733810273; c=relaxed/simple;
	bh=OQZc3cD0Swalkea4KfyQKBbXUUf85qf6/txi0oqsE+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T7nHwxcPwSDcfoF/JS82KpQrZcy9N+Q7E69+ydEvSPyo0avx5WxwYRD7bYc+IekxiqRbul7tsL7xJq9RwuS6msrvDkLgabHFz7cGkk4nSbIHlGJd0WsKfx3SsN20lP9WS0jE1+WGoeTzrHwDoYAfsxSixwQQm6JE2V4Z66B4ncs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2WbaxX+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733810271; x=1765346271;
  h=date:from:to:cc:subject:message-id;
  bh=OQZc3cD0Swalkea4KfyQKBbXUUf85qf6/txi0oqsE+o=;
  b=k2WbaxX+oILXLGsJsvVr5M5cFvYmuRk+/sGZdqQnWYSZQedHZCBoT0sd
   +X/KV5C3Q0LNQVe01M0eT2DrfFwGRbes3dknKYZTl0LVVWBxEYWyLsTdo
   odtmDMgUScr9QQNYP63q0HtEg3d+M4F4tBiLzqoGO0yvBtZ3T6GDRKhez
   ZafZQu4hbOel/8h277LuoG5DwANanGKK+jrmJh1mGZQIgE+iIUo9YMC98
   25sMzFkeyNqC0Fd4RCpK2VFnL3vrO1A1RAQs1uiORLzvWC3dREW/vi7gv
   4ky1qLmOcOTcgDahS/STFxPcYokUm+k1v9atGpNel77UPlmygYeR3mXQv
   w==;
X-CSE-ConnectionGUID: CrYK5qpmRmSy9Zh+B8h84A==
X-CSE-MsgGUID: KMb5EdaER+iSb3hxzLuknA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="45535357"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="45535357"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 21:57:51 -0800
X-CSE-ConnectionGUID: 7SUAz8pCRnmZPa3op7CJNg==
X-CSE-MsgGUID: xs1dqY3WR12CmIoBux/Crw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="126128421"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2024 21:57:50 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKtFj-00059q-01;
	Tue, 10 Dec 2024 05:57:47 +0000
Date: Tue, 10 Dec 2024 13:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 55b8ff7bf1583d8261aa0a45d253ce27ee0891b5
Message-ID: <202412101318.vICFvz1L-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 55b8ff7bf1583d8261aa0a45d253ce27ee0891b5  Merge tag 'v6.13-rc2' into renesas-devel

elapsed time: 1202m

configs tested: 269
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20241209    gcc-13.2.0
arc                   randconfig-001-20241210    gcc-14.2.0
arc                   randconfig-002-20241209    gcc-13.2.0
arc                   randconfig-002-20241210    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-16
arm                                 defconfig    gcc-14.2.0
arm                           omap1_defconfig    clang-16
arm                           omap1_defconfig    gcc-14.2.0
arm                          pxa3xx_defconfig    clang-16
arm                   randconfig-001-20241209    clang-20
arm                   randconfig-001-20241210    gcc-14.2.0
arm                   randconfig-002-20241209    clang-20
arm                   randconfig-002-20241210    gcc-14.2.0
arm                   randconfig-003-20241209    clang-20
arm                   randconfig-003-20241210    gcc-14.2.0
arm                   randconfig-004-20241209    clang-20
arm                   randconfig-004-20241210    gcc-14.2.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm                        spear3xx_defconfig    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241209    gcc-14.2.0
arm64                 randconfig-001-20241210    gcc-14.2.0
arm64                 randconfig-002-20241209    clang-20
arm64                 randconfig-002-20241210    gcc-14.2.0
arm64                 randconfig-003-20241209    clang-19
arm64                 randconfig-003-20241210    gcc-14.2.0
arm64                 randconfig-004-20241209    gcc-14.2.0
arm64                 randconfig-004-20241210    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241209    gcc-14.2.0
csky                  randconfig-001-20241210    gcc-14.2.0
csky                  randconfig-002-20241209    gcc-14.2.0
csky                  randconfig-002-20241210    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241209    clang-16
hexagon               randconfig-001-20241210    gcc-14.2.0
hexagon               randconfig-002-20241209    clang-20
hexagon               randconfig-002-20241210    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241209    clang-19
i386        buildonly-randconfig-001-20241210    gcc-12
i386        buildonly-randconfig-002-20241209    clang-19
i386        buildonly-randconfig-002-20241210    gcc-12
i386        buildonly-randconfig-003-20241209    clang-19
i386        buildonly-randconfig-003-20241210    gcc-12
i386        buildonly-randconfig-004-20241209    clang-19
i386        buildonly-randconfig-004-20241210    gcc-12
i386        buildonly-randconfig-005-20241209    clang-19
i386        buildonly-randconfig-005-20241210    gcc-12
i386        buildonly-randconfig-006-20241209    clang-19
i386        buildonly-randconfig-006-20241210    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241210    clang-19
i386                  randconfig-002-20241210    clang-19
i386                  randconfig-003-20241210    clang-19
i386                  randconfig-004-20241210    clang-19
i386                  randconfig-005-20241210    clang-19
i386                  randconfig-006-20241210    clang-19
i386                  randconfig-007-20241210    clang-19
i386                  randconfig-011-20241210    clang-19
i386                  randconfig-012-20241210    clang-19
i386                  randconfig-013-20241210    clang-19
i386                  randconfig-014-20241210    clang-19
i386                  randconfig-015-20241210    clang-19
i386                  randconfig-016-20241210    clang-19
i386                  randconfig-017-20241210    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241209    gcc-14.2.0
loongarch             randconfig-001-20241210    gcc-14.2.0
loongarch             randconfig-002-20241209    gcc-14.2.0
loongarch             randconfig-002-20241210    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-16
mips                          eyeq5_defconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
mips                           mtx1_defconfig    clang-20
mips                        qi_lb60_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241209    gcc-14.2.0
nios2                 randconfig-001-20241210    gcc-14.2.0
nios2                 randconfig-002-20241209    gcc-14.2.0
nios2                 randconfig-002-20241210    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241209    gcc-14.2.0
parisc                randconfig-001-20241210    gcc-14.2.0
parisc                randconfig-002-20241209    gcc-14.2.0
parisc                randconfig-002-20241210    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       eiger_defconfig    clang-17
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-16
powerpc                   motionpro_defconfig    clang-16
powerpc                     mpc83xx_defconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241209    gcc-14.2.0
powerpc               randconfig-001-20241210    gcc-14.2.0
powerpc               randconfig-002-20241209    clang-15
powerpc               randconfig-002-20241210    gcc-14.2.0
powerpc               randconfig-003-20241209    clang-17
powerpc               randconfig-003-20241210    gcc-14.2.0
powerpc                     tqm8541_defconfig    clang-15
powerpc64             randconfig-001-20241209    gcc-14.2.0
powerpc64             randconfig-001-20241210    gcc-14.2.0
powerpc64             randconfig-002-20241209    clang-17
powerpc64             randconfig-002-20241210    gcc-14.2.0
powerpc64             randconfig-003-20241209    clang-20
powerpc64             randconfig-003-20241210    gcc-14.2.0
riscv                            alldefconfig    clang-16
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20241209    clang-19
riscv                 randconfig-001-20241210    gcc-14.2.0
riscv                 randconfig-002-20241209    clang-20
riscv                 randconfig-002-20241210    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20241209    clang-16
s390                  randconfig-001-20241210    gcc-14.2.0
s390                  randconfig-002-20241209    gcc-14.2.0
s390                  randconfig-002-20241210    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                    randconfig-001-20241209    gcc-14.2.0
sh                    randconfig-001-20241210    gcc-14.2.0
sh                    randconfig-002-20241209    gcc-14.2.0
sh                    randconfig-002-20241210    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                           se7343_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241209    gcc-14.2.0
sparc                 randconfig-001-20241210    gcc-14.2.0
sparc                 randconfig-002-20241209    gcc-14.2.0
sparc                 randconfig-002-20241210    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241209    gcc-14.2.0
sparc64               randconfig-001-20241210    gcc-14.2.0
sparc64               randconfig-002-20241209    gcc-14.2.0
sparc64               randconfig-002-20241210    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241209    clang-19
um                    randconfig-001-20241210    gcc-14.2.0
um                    randconfig-002-20241209    gcc-12
um                    randconfig-002-20241210    gcc-14.2.0
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.2.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241209    gcc-12
x86_64      buildonly-randconfig-001-20241210    clang-19
x86_64      buildonly-randconfig-002-20241209    gcc-12
x86_64      buildonly-randconfig-002-20241210    clang-19
x86_64      buildonly-randconfig-003-20241209    clang-19
x86_64      buildonly-randconfig-003-20241210    clang-19
x86_64      buildonly-randconfig-004-20241209    gcc-12
x86_64      buildonly-randconfig-004-20241210    clang-19
x86_64      buildonly-randconfig-005-20241209    clang-19
x86_64      buildonly-randconfig-005-20241210    clang-19
x86_64      buildonly-randconfig-006-20241209    clang-19
x86_64      buildonly-randconfig-006-20241210    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241210    gcc-12
x86_64                randconfig-002-20241210    gcc-12
x86_64                randconfig-003-20241210    gcc-12
x86_64                randconfig-004-20241210    gcc-12
x86_64                randconfig-005-20241210    gcc-12
x86_64                randconfig-006-20241210    gcc-12
x86_64                randconfig-007-20241210    gcc-12
x86_64                randconfig-008-20241210    gcc-12
x86_64                randconfig-071-20241210    gcc-12
x86_64                randconfig-072-20241210    gcc-12
x86_64                randconfig-073-20241210    gcc-12
x86_64                randconfig-074-20241210    gcc-12
x86_64                randconfig-075-20241210    gcc-12
x86_64                randconfig-076-20241210    gcc-12
x86_64                randconfig-077-20241210    gcc-12
x86_64                randconfig-078-20241210    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241209    gcc-14.2.0
xtensa                randconfig-001-20241210    gcc-14.2.0
xtensa                randconfig-002-20241209    gcc-14.2.0
xtensa                randconfig-002-20241210    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

