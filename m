Return-Path: <linux-renesas-soc+bounces-18101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92299AD5346
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 13:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F15B3B3A7B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 11:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A5F2E6109;
	Wed, 11 Jun 2025 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3aXdPRu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7080D2E6102
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 11:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749639878; cv=none; b=Bf2z+FGpiyT50m22zbHs/9YjeN7Ga8i9eREaBg20D13TTmPE3yQGYOjDF0ocDGnzttWTLhv3c6YRDilXv4XkLklBQ8n1OnAVyDIWuftM7G+dPULzY/4hKrzP3F0QoKnhly4F6qluZKbOI2Y2w7c1VHTtsknwTgp3I5CCdmQ0vHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749639878; c=relaxed/simple;
	bh=PQPSvJEQnXJqvlJk35b/kKvxKGeKqrG+vnYt4njaEEA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LcfXOE4/FNE9aAdpydoRfNlGKOsW2euS5pmoVMeHTMh0iXxvyqluRiGxyVDEuO7Oau+ph3OqH/fR4CIH/W/FJk10B0o2JZVM1ODWj/WtOhG/EltyJR9YRi60WPMFeV9BI0aB8bK/Gb4KDBKeV+1NRV9lTFAkIYkb/Wn4zuE6dMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3aXdPRu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749639877; x=1781175877;
  h=date:from:to:cc:subject:message-id;
  bh=PQPSvJEQnXJqvlJk35b/kKvxKGeKqrG+vnYt4njaEEA=;
  b=N3aXdPRunni3crdCMZWU1mKvUpDJbrLbfbXGL4F483nSGVGZ+hsu+8nK
   30BDSFXbMrOUmkFoTcph6CZPNYtfiNW60PF4aQB9XXLBINsdnKd84ufej
   D10KFfvUW59ihTkNwQ9GfbTytW7bacZRd/ozs0xHpVfYDs+Wl3Orm8v+m
   CUlYfStUKHOXWM8AA4bgARdQWJdk5cHNtfCXvRyZafnYUs8zI/HiFSKUG
   WN/L9tffMX93Wk4ZWNOr6UiKZ6dp1pqMV1Fd08hE3sGhx1vUKI7Uz/ZHx
   R1zch2pKq0ze685zIrEfwbbbdmhZIm5LHHqYInEmTEamwgOgca75ly2kG
   A==;
X-CSE-ConnectionGUID: Io/gwi+5R/6aAZlx1tX2lg==
X-CSE-MsgGUID: dSf4IOSLQcqjSFmSExf2Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63187710"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="63187710"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 04:04:36 -0700
X-CSE-ConnectionGUID: ioihpctZQoyw6/S48lMQKw==
X-CSE-MsgGUID: RsLKEWXhSdC6mU1bggj/yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="147078510"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Jun 2025 04:04:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPJFv-000AL6-0a;
	Wed, 11 Jun 2025 11:04:31 +0000
Date: Wed, 11 Jun 2025 19:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.17] BUILD SUCCESS
 1d0eefea6039b7b3880e78259eda2329d7ac0640
Message-ID: <202506111947.fKM1Klpz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.17
branch HEAD: 1d0eefea6039b7b3880e78259eda2329d7ac0640  arm64: dts: renesas: r8a779g3-sparrow-hawk: Sort DTS

elapsed time: 1462m

configs tested: 199
configs skipped: 115

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                        nsim_700_defconfig    clang-21
arc                   randconfig-001-20250611    gcc-12.4.0
arc                   randconfig-002-20250611    gcc-12.4.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                          exynos_defconfig    clang-21
arm                      footbridge_defconfig    gcc-12
arm                       multi_v4t_defconfig    gcc-12
arm                        neponset_defconfig    gcc-15.1.0
arm                          pxa168_defconfig    gcc-15.1.0
arm                          pxa3xx_defconfig    clang-21
arm                             pxa_defconfig    gcc-12
arm                   randconfig-001-20250610    clang-19
arm                   randconfig-001-20250611    gcc-12.4.0
arm                   randconfig-002-20250610    gcc-8.5.0
arm                   randconfig-002-20250611    gcc-12.4.0
arm                   randconfig-003-20250610    clang-21
arm                   randconfig-003-20250611    gcc-12.4.0
arm                   randconfig-004-20250610    clang-16
arm                   randconfig-004-20250611    gcc-12.4.0
arm                         socfpga_defconfig    clang-21
arm                          sp7021_defconfig    clang-21
arm                        spear3xx_defconfig    gcc-12
arm                        spear3xx_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250610    clang-21
arm64                 randconfig-001-20250611    gcc-12.4.0
arm64                 randconfig-002-20250610    gcc-11.5.0
arm64                 randconfig-002-20250611    gcc-12.4.0
arm64                 randconfig-003-20250610    clang-21
arm64                 randconfig-003-20250611    gcc-12.4.0
arm64                 randconfig-004-20250610    clang-18
arm64                 randconfig-004-20250611    gcc-12.4.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250611    gcc-8.5.0
csky                  randconfig-002-20250611    gcc-8.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250611    gcc-8.5.0
hexagon               randconfig-002-20250611    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250611    clang-20
i386        buildonly-randconfig-002-20250611    clang-20
i386        buildonly-randconfig-003-20250611    clang-20
i386        buildonly-randconfig-004-20250611    clang-20
i386        buildonly-randconfig-005-20250611    clang-20
i386        buildonly-randconfig-006-20250611    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250611    clang-20
i386                  randconfig-002-20250611    clang-20
i386                  randconfig-003-20250611    clang-20
i386                  randconfig-004-20250611    clang-20
i386                  randconfig-005-20250611    clang-20
i386                  randconfig-006-20250611    clang-20
i386                  randconfig-007-20250611    clang-20
i386                  randconfig-011-20250611    gcc-12
i386                  randconfig-012-20250611    gcc-12
i386                  randconfig-013-20250611    gcc-12
i386                  randconfig-014-20250611    gcc-12
i386                  randconfig-015-20250611    gcc-12
i386                  randconfig-016-20250611    gcc-12
i386                  randconfig-017-20250611    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250611    gcc-8.5.0
loongarch             randconfig-002-20250611    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         apollo_defconfig    clang-21
m68k                                defconfig    gcc-15.1.0
m68k                        mvme147_defconfig    gcc-12
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    clang-21
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250611    gcc-8.5.0
nios2                 randconfig-002-20250611    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250611    gcc-8.5.0
parisc                randconfig-002-20250611    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      ep88xc_defconfig    clang-21
powerpc                       holly_defconfig    clang-21
powerpc                  mpc866_ads_defconfig    clang-21
powerpc               randconfig-001-20250611    gcc-8.5.0
powerpc               randconfig-002-20250611    gcc-8.5.0
powerpc               randconfig-003-20250611    gcc-8.5.0
powerpc64             randconfig-001-20250611    gcc-8.5.0
powerpc64             randconfig-002-20250611    gcc-8.5.0
riscv                            alldefconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250611    gcc-15.1.0
riscv                 randconfig-002-20250611    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250611    gcc-15.1.0
s390                  randconfig-002-20250611    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                          landisk_defconfig    clang-21
sh                    randconfig-001-20250611    gcc-15.1.0
sh                    randconfig-002-20250611    gcc-15.1.0
sh                              ul2_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250611    gcc-15.1.0
sparc                 randconfig-002-20250611    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250611    gcc-15.1.0
sparc64               randconfig-002-20250611    gcc-15.1.0
um                               alldefconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250611    gcc-15.1.0
um                    randconfig-002-20250611    gcc-15.1.0
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250611    clang-20
x86_64      buildonly-randconfig-002-20250611    clang-20
x86_64      buildonly-randconfig-003-20250611    clang-20
x86_64      buildonly-randconfig-004-20250611    clang-20
x86_64      buildonly-randconfig-005-20250611    clang-20
x86_64      buildonly-randconfig-006-20250611    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250611    clang-20
x86_64                randconfig-002-20250611    clang-20
x86_64                randconfig-003-20250611    clang-20
x86_64                randconfig-004-20250611    clang-20
x86_64                randconfig-005-20250611    clang-20
x86_64                randconfig-006-20250611    clang-20
x86_64                randconfig-007-20250611    clang-20
x86_64                randconfig-008-20250611    clang-20
x86_64                randconfig-071-20250611    gcc-12
x86_64                randconfig-072-20250611    gcc-12
x86_64                randconfig-073-20250611    gcc-12
x86_64                randconfig-074-20250611    gcc-12
x86_64                randconfig-075-20250611    gcc-12
x86_64                randconfig-076-20250611    gcc-12
x86_64                randconfig-077-20250611    gcc-12
x86_64                randconfig-078-20250611    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250611    gcc-15.1.0
xtensa                randconfig-002-20250611    gcc-15.1.0
xtensa                    smp_lx200_defconfig    gcc-12
xtensa                         virt_defconfig    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

