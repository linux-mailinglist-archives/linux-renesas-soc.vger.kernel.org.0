Return-Path: <linux-renesas-soc+bounces-22860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE42BCB397
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 01:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0421E19E6F64
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 23:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBCF24DCFD;
	Thu,  9 Oct 2025 23:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiVmA0Ow"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E20A2110
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 23:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760053752; cv=none; b=p9cwOrrTF/F2f+bteZKolS+ziwzHVA53L8fWsVEZi4I7AdY9Qy/zhMF4hlp6Gxjy+RYPbIXtkjqBw9sIrCo2oWaATcZj+6ODq4xxJ4ZlpbmIGYWNVfXiIeIfQ7/Ef5GBCWOTRJuP47hs4kTYPtFYvOmlYD8VV4NF3js+sjU0gkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760053752; c=relaxed/simple;
	bh=OpcQ/u/jDs8o4gyGVAtx7sfgAES0ryoFn4NB70UB5BI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qLB96Nawc8riY9XRzqBbWsTuCC49m7ujfBd7JLEwsmLvVxuYScyisbul2hEDu5JXvrs0NWk61NafZNGie8XdK3q++KxmkPoz6ev646XZPzhE8SJmtSaPaZPYS7pfAPc6PuW3z1w2n7VQdKYFUm7eOqcRZVxxstVpSb3PsAMw0qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jiVmA0Ow; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760053750; x=1791589750;
  h=date:from:to:cc:subject:message-id;
  bh=OpcQ/u/jDs8o4gyGVAtx7sfgAES0ryoFn4NB70UB5BI=;
  b=jiVmA0Ow8KY0J9H1M3g+NiU1p6OkIuU9b35OBUVEiNRSHs81ck78Zhbb
   44DAiBK2xerKVe8S4veJXRyRTd08F3ty0dfPe0GUswUUZ0unNUkVb8F/i
   t0RBFduGGdEImIaWrcoqn0Bp4hRwOaTpYeEoyIZVT9cZKQb3PPcAjcpoy
   yCwCk2Ler3lXtd6BwIlCJxfrG/VbJcrD8d04boHmMw65YZC+4qLrr64eL
   oXIzn+uyli3dllybZscoGD275Ey4yP0/Rj2ZTkucOhb2L2sAbJIzuTl5o
   JNhQwlk3gYdyGy9poMrXwtCoAC8B+q/D6R7Sq+H+BauPn1ylmzziZWzG3
   g==;
X-CSE-ConnectionGUID: 85pMFRuZSvOIJOnSq55s3g==
X-CSE-MsgGUID: MU1pY91ySxihguazK1seFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66105539"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66105539"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 16:49:10 -0700
X-CSE-ConnectionGUID: JqFU8rrxSQy/2+RwttQfDw==
X-CSE-MsgGUID: sQyTkkwoQvGXreNuJYmhJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="180789250"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2025 16:49:08 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v70Ne-0001dB-0T;
	Thu, 09 Oct 2025 23:49:06 +0000
Date: Fri, 10 Oct 2025 07:48:32 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 211a0732d593decec164f76929ba008e705c7515
Message-ID: <202510100726.5gaCC3qQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 211a0732d593decec164f76929ba008e705c7515  Merge branch 'renesas-dts-for-v6.19' into renesas-devel

elapsed time: 1016m

configs tested: 242
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251010    gcc-8.5.0
arc                   randconfig-002-20251010    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                       imx_v4_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20251010    gcc-8.5.0
arm                   randconfig-002-20251010    gcc-8.5.0
arm                   randconfig-003-20251010    gcc-8.5.0
arm                   randconfig-004-20251010    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251010    gcc-8.5.0
arm64                 randconfig-002-20251010    gcc-8.5.0
arm64                 randconfig-003-20251010    gcc-8.5.0
arm64                 randconfig-004-20251010    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20251009    clang-16
csky                  randconfig-001-20251010    gcc-14.3.0
csky                  randconfig-002-20251009    clang-16
csky                  randconfig-002-20251010    gcc-14.3.0
hexagon                          alldefconfig    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251009    clang-16
hexagon               randconfig-001-20251010    gcc-14.3.0
hexagon               randconfig-002-20251009    clang-16
hexagon               randconfig-002-20251010    gcc-14.3.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251009    gcc-14
i386        buildonly-randconfig-001-20251010    gcc-14
i386        buildonly-randconfig-002-20251009    gcc-14
i386        buildonly-randconfig-002-20251010    gcc-14
i386        buildonly-randconfig-003-20251009    gcc-14
i386        buildonly-randconfig-003-20251010    gcc-14
i386        buildonly-randconfig-004-20251009    gcc-14
i386        buildonly-randconfig-004-20251010    gcc-14
i386        buildonly-randconfig-005-20251009    gcc-14
i386        buildonly-randconfig-005-20251010    gcc-14
i386        buildonly-randconfig-006-20251009    gcc-14
i386        buildonly-randconfig-006-20251010    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251010    clang-20
i386                  randconfig-002-20251010    clang-20
i386                  randconfig-003-20251010    clang-20
i386                  randconfig-004-20251010    clang-20
i386                  randconfig-005-20251010    clang-20
i386                  randconfig-006-20251010    clang-20
i386                  randconfig-007-20251010    clang-20
i386                  randconfig-011-20251009    clang-20
i386                  randconfig-011-20251010    gcc-14
i386                  randconfig-012-20251009    clang-20
i386                  randconfig-012-20251010    gcc-14
i386                  randconfig-013-20251009    clang-20
i386                  randconfig-013-20251010    gcc-14
i386                  randconfig-014-20251009    clang-20
i386                  randconfig-014-20251010    gcc-14
i386                  randconfig-015-20251009    clang-20
i386                  randconfig-015-20251010    gcc-14
i386                  randconfig-016-20251009    clang-20
i386                  randconfig-016-20251010    gcc-14
i386                  randconfig-017-20251009    clang-20
i386                  randconfig-017-20251010    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251009    clang-16
loongarch             randconfig-001-20251010    gcc-14.3.0
loongarch             randconfig-002-20251009    clang-16
loongarch             randconfig-002-20251010    gcc-14.3.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq5_defconfig    clang-22
mips                           ip22_defconfig    clang-22
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251009    clang-16
nios2                 randconfig-001-20251010    gcc-14.3.0
nios2                 randconfig-002-20251009    clang-16
nios2                 randconfig-002-20251010    gcc-14.3.0
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                  or1klitex_defconfig    clang-22
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251009    clang-16
parisc                randconfig-001-20251010    gcc-14.3.0
parisc                randconfig-002-20251009    clang-16
parisc                randconfig-002-20251010    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                      mgcoge_defconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc               randconfig-001-20251009    clang-16
powerpc               randconfig-001-20251010    gcc-14.3.0
powerpc               randconfig-002-20251009    clang-16
powerpc               randconfig-002-20251010    gcc-14.3.0
powerpc               randconfig-003-20251009    clang-16
powerpc               randconfig-003-20251010    gcc-14.3.0
powerpc64             randconfig-001-20251010    gcc-14.3.0
powerpc64             randconfig-002-20251009    clang-16
powerpc64             randconfig-002-20251010    gcc-14.3.0
powerpc64             randconfig-003-20251009    clang-16
powerpc64             randconfig-003-20251010    gcc-14.3.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                 randconfig-001-20251009    clang-22
riscv                 randconfig-001-20251009    gcc-8.5.0
riscv                 randconfig-001-20251010    gcc-9.5.0
riscv                 randconfig-002-20251009    clang-19
riscv                 randconfig-002-20251009    clang-22
riscv                 randconfig-002-20251010    gcc-9.5.0
s390                             alldefconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251009    clang-22
s390                  randconfig-001-20251010    gcc-9.5.0
s390                  randconfig-002-20251009    clang-22
s390                  randconfig-002-20251010    gcc-9.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                    randconfig-001-20251009    clang-22
sh                    randconfig-001-20251009    gcc-15.1.0
sh                    randconfig-001-20251010    gcc-9.5.0
sh                    randconfig-002-20251009    clang-22
sh                    randconfig-002-20251009    gcc-12.5.0
sh                    randconfig-002-20251010    gcc-9.5.0
sh                           se7721_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251009    clang-22
sparc                 randconfig-001-20251009    gcc-8.5.0
sparc                 randconfig-001-20251010    gcc-9.5.0
sparc                 randconfig-002-20251009    clang-22
sparc                 randconfig-002-20251009    gcc-8.5.0
sparc                 randconfig-002-20251010    gcc-9.5.0
sparc64               randconfig-001-20251009    clang-22
sparc64               randconfig-001-20251010    gcc-9.5.0
sparc64               randconfig-002-20251009    clang-22
sparc64               randconfig-002-20251010    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                    randconfig-001-20251009    clang-17
um                    randconfig-001-20251009    clang-22
um                    randconfig-001-20251010    gcc-9.5.0
um                    randconfig-002-20251009    clang-22
um                    randconfig-002-20251009    gcc-14
um                    randconfig-002-20251010    gcc-9.5.0
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251009    clang-20
x86_64      buildonly-randconfig-001-20251010    gcc-14
x86_64      buildonly-randconfig-002-20251009    clang-20
x86_64      buildonly-randconfig-002-20251010    gcc-14
x86_64      buildonly-randconfig-003-20251009    clang-20
x86_64      buildonly-randconfig-003-20251010    gcc-14
x86_64      buildonly-randconfig-004-20251009    clang-20
x86_64      buildonly-randconfig-004-20251010    gcc-14
x86_64      buildonly-randconfig-005-20251009    clang-20
x86_64      buildonly-randconfig-005-20251010    gcc-14
x86_64      buildonly-randconfig-006-20251009    clang-20
x86_64      buildonly-randconfig-006-20251010    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251010    clang-20
x86_64                randconfig-002-20251010    clang-20
x86_64                randconfig-003-20251010    clang-20
x86_64                randconfig-004-20251010    clang-20
x86_64                randconfig-005-20251010    clang-20
x86_64                randconfig-006-20251010    clang-20
x86_64                randconfig-007-20251010    clang-20
x86_64                randconfig-008-20251010    clang-20
x86_64                randconfig-071-20251009    gcc-14
x86_64                randconfig-071-20251010    clang-20
x86_64                randconfig-072-20251009    gcc-14
x86_64                randconfig-072-20251010    clang-20
x86_64                randconfig-073-20251009    gcc-14
x86_64                randconfig-073-20251010    clang-20
x86_64                randconfig-074-20251009    gcc-14
x86_64                randconfig-074-20251010    clang-20
x86_64                randconfig-075-20251009    gcc-14
x86_64                randconfig-075-20251010    clang-20
x86_64                randconfig-076-20251009    gcc-14
x86_64                randconfig-076-20251010    clang-20
x86_64                randconfig-077-20251009    gcc-14
x86_64                randconfig-077-20251010    clang-20
x86_64                randconfig-078-20251009    gcc-14
x86_64                randconfig-078-20251010    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251009    clang-22
xtensa                randconfig-001-20251009    gcc-11.5.0
xtensa                randconfig-001-20251010    gcc-9.5.0
xtensa                randconfig-002-20251009    clang-22
xtensa                randconfig-002-20251009    gcc-8.5.0
xtensa                randconfig-002-20251010    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

