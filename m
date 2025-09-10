Return-Path: <linux-renesas-soc+bounces-21714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0739EB5177E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02E25465B49
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 12:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D3E31196C;
	Wed, 10 Sep 2025 12:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKuE9X8y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309B82BE65A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 12:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757509161; cv=none; b=PqSjJI+BiiJkZZ7+ktu9fsa8nA3g4zkvK2Vm+9/Jf6BY+MTWqVD2iwf67hiler3/R7HBCScpOQ0cOzINvBTOsgPV85Gz7KyomTI14dMbBH8Ud0ldfw9nGuSUzGBlVAQ6x7x4gJtNQ67/+5jQZbXXqE6Bfago/+9NhRLfdgNCnTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757509161; c=relaxed/simple;
	bh=6W+bJCZh0h59fi4ZQ77Asj2PAKd4c9s1tLzXqxmFYV4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fuUFOjVJjB1/syoCXGHw/d0wCODGhOy9z18t1cLmuTEBRadOGLaSnkqw6/lVJ+TdB541SGP3RkmwjVE/lMGiPwXwTDUjXt4GqVvf3kcSFAgzwigdWfAtTuKSbsVk1MPeT3I8Zirwt/7T2mLwfsPLJ9Wj2pH2iUeCdqySKI2JF+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKuE9X8y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757509159; x=1789045159;
  h=date:from:to:cc:subject:message-id;
  bh=6W+bJCZh0h59fi4ZQ77Asj2PAKd4c9s1tLzXqxmFYV4=;
  b=dKuE9X8yOuj/YD3fUEwobbVodoKeR9YIpaXNDq+QrO5AwDcGc9cwIlzh
   DBmKNyzGbewG+P+ZDDB5vO1zl+fR9c2AWAinjQF3JUc7/PClykHkJmCaL
   Tb9IKP+rG+OgtQDPHNibVMxwTG1gQRLej08yxBvK+1DWZkkUstIHRQawH
   jzY0YxrRydXZN8QTug4DLhRwe50p4i0q218Sj2Izx8Ow3o/kxMrAaNY51
   1L0ioIG8dr9RS0W1/ELTOzfUll4FGQONoOZz2yo9nYihAxAa9/yBzfJE4
   yvnhhy6NLKJ5/GvH18qFoe0qu2LONxrl0/LDUlHTNpii3tz9DfgChR70Z
   A==;
X-CSE-ConnectionGUID: uExkf8fzT5ukHDE1DOwWPg==
X-CSE-MsgGUID: Cl6abd+cSTyUj1IgM3xhZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70505766"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="70505766"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 05:59:19 -0700
X-CSE-ConnectionGUID: WvqeR8boTa+jfe4pUNyajA==
X-CSE-MsgGUID: XWCgEp4uQfClDFSK3YfyHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="177656009"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Sep 2025 05:59:17 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwKPq-0005wV-0z;
	Wed, 10 Sep 2025 12:59:14 +0000
Date: Wed, 10 Sep 2025 20:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/r8a78000-v1] BUILD SUCCESS
 2f45b9fe8dc3290f5a40ac68b84f754b9c5ca30b
Message-ID: <202509102030.qlOqJrGJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/r8a78000-v1
branch HEAD: 2f45b9fe8dc3290f5a40ac68b84f754b9c5ca30b  arm64: renesas: Add R8A78000 Ironhide board code

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0 (arm,cortex-a720): Unevaluated properties are not allowed ('l1-cache-controller-0', 'l2-cache-controller-0' were unexpected)

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20250910
|   `-- arch-arm64-boot-dts-renesas-r8a78000-ironhide.dtb:cpu-(arm-cortex-a720):Unevaluated-properties-are-not-allowed-(-l1-cache-controller-l2-cache-controller-were-unexpected)
|-- arm64-randconfig-052-20250910
|   `-- arch-arm64-boot-dts-renesas-r8a78000-ironhide.dtb:cpu-(arm-cortex-a720):Unevaluated-properties-are-not-allowed-(-l1-cache-controller-l2-cache-controller-were-unexpected)
|-- arm64-randconfig-053-20250910
|   `-- arch-arm64-boot-dts-renesas-r8a78000-ironhide.dtb:cpu-(arm-cortex-a720):Unevaluated-properties-are-not-allowed-(-l1-cache-controller-l2-cache-controller-were-unexpected)
|-- arm64-randconfig-054-20250910
|   `-- arch-arm64-boot-dts-renesas-r8a78000-ironhide.dtb:cpu-(arm-cortex-a720):Unevaluated-properties-are-not-allowed-(-l1-cache-controller-l2-cache-controller-were-unexpected)
`-- arm64-randconfig-055-20250910
    `-- arch-arm64-boot-dts-renesas-r8a78000-ironhide.dtb:cpu-(arm-cortex-a720):Unevaluated-properties-are-not-allowed-(-l1-cache-controller-l2-cache-controller-were-unexpected)

elapsed time: 1413m

configs tested: 259
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                          axs101_defconfig    clang-22
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                 nsimosci_hs_smp_defconfig    clang-22
arc                   randconfig-001-20250909    gcc-8.5.0
arc                   randconfig-001-20250910    gcc-13.4.0
arc                   randconfig-002-20250909    gcc-8.5.0
arc                   randconfig-002-20250910    gcc-13.4.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                            mps2_defconfig    clang-22
arm                   randconfig-001-20250909    clang-18
arm                   randconfig-001-20250910    gcc-13.4.0
arm                   randconfig-002-20250909    clang-17
arm                   randconfig-002-20250910    gcc-13.4.0
arm                   randconfig-003-20250909    clang-22
arm                   randconfig-003-20250910    gcc-13.4.0
arm                   randconfig-004-20250909    clang-19
arm                   randconfig-004-20250910    gcc-13.4.0
arm                           spitz_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250909    clang-16
arm64                 randconfig-001-20250910    gcc-13.4.0
arm64                 randconfig-002-20250909    gcc-11.5.0
arm64                 randconfig-002-20250910    gcc-13.4.0
arm64                 randconfig-003-20250909    gcc-11.5.0
arm64                 randconfig-003-20250910    gcc-13.4.0
arm64                 randconfig-004-20250909    clang-22
arm64                 randconfig-004-20250910    gcc-13.4.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250909    gcc-15.1.0
csky                  randconfig-001-20250910    clang-22
csky                  randconfig-002-20250909    gcc-15.1.0
csky                  randconfig-002-20250910    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250909    clang-22
hexagon               randconfig-001-20250910    clang-22
hexagon               randconfig-002-20250909    clang-22
hexagon               randconfig-002-20250910    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250909    gcc-13
i386        buildonly-randconfig-001-20250910    clang-20
i386        buildonly-randconfig-002-20250909    clang-20
i386        buildonly-randconfig-002-20250910    clang-20
i386        buildonly-randconfig-003-20250909    clang-20
i386        buildonly-randconfig-003-20250910    clang-20
i386        buildonly-randconfig-004-20250909    clang-20
i386        buildonly-randconfig-004-20250910    clang-20
i386        buildonly-randconfig-005-20250909    clang-20
i386        buildonly-randconfig-005-20250910    clang-20
i386        buildonly-randconfig-006-20250909    clang-20
i386        buildonly-randconfig-006-20250910    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250910    clang-20
i386                  randconfig-002-20250910    clang-20
i386                  randconfig-003-20250910    clang-20
i386                  randconfig-004-20250910    clang-20
i386                  randconfig-005-20250910    clang-20
i386                  randconfig-006-20250910    clang-20
i386                  randconfig-007-20250910    clang-20
i386                  randconfig-011-20250910    clang-20
i386                  randconfig-012-20250910    clang-20
i386                  randconfig-013-20250910    clang-20
i386                  randconfig-014-20250910    clang-20
i386                  randconfig-015-20250910    clang-20
i386                  randconfig-016-20250910    clang-20
i386                  randconfig-017-20250910    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250909    gcc-15.1.0
loongarch             randconfig-001-20250910    clang-22
loongarch             randconfig-002-20250909    gcc-15.1.0
loongarch             randconfig-002-20250910    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
microblaze                      mmu_defconfig    clang-22
mips                              allnoconfig    gcc-15.1.0
mips                        maltaup_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                            allyesconfig    clang-22
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250909    gcc-11.5.0
nios2                 randconfig-001-20250910    clang-22
nios2                 randconfig-002-20250909    gcc-8.5.0
nios2                 randconfig-002-20250910    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250909    gcc-8.5.0
parisc                randconfig-001-20250910    clang-22
parisc                randconfig-002-20250909    gcc-12.5.0
parisc                randconfig-002-20250910    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                        cell_defconfig    gcc-15.1.0
powerpc                      cm5200_defconfig    clang-22
powerpc                    ge_imp3a_defconfig    gcc-15.1.0
powerpc                  mpc885_ads_defconfig    clang-22
powerpc               randconfig-001-20250909    clang-22
powerpc               randconfig-001-20250910    clang-22
powerpc               randconfig-002-20250909    clang-17
powerpc               randconfig-002-20250910    clang-22
powerpc               randconfig-003-20250909    gcc-8.5.0
powerpc               randconfig-003-20250910    clang-22
powerpc                    socrates_defconfig    clang-22
powerpc64             randconfig-001-20250909    clang-20
powerpc64             randconfig-002-20250909    gcc-10.5.0
powerpc64             randconfig-002-20250910    clang-22
powerpc64             randconfig-003-20250909    gcc-8.5.0
powerpc64             randconfig-003-20250910    clang-22
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250909    clang-22
riscv                 randconfig-001-20250910    gcc-12.5.0
riscv                 randconfig-002-20250909    clang-22
riscv                 randconfig-002-20250910    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250909    gcc-11.5.0
s390                  randconfig-001-20250910    gcc-12.5.0
s390                  randconfig-002-20250909    clang-18
s390                  randconfig-002-20250910    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250909    gcc-15.1.0
sh                    randconfig-001-20250910    gcc-12.5.0
sh                    randconfig-002-20250909    gcc-9.5.0
sh                    randconfig-002-20250910    gcc-12.5.0
sh                        sh7785lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250909    gcc-8.5.0
sparc                 randconfig-001-20250910    gcc-12.5.0
sparc                 randconfig-002-20250909    gcc-15.1.0
sparc                 randconfig-002-20250910    gcc-12.5.0
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250909    clang-22
sparc64               randconfig-001-20250910    gcc-12.5.0
sparc64               randconfig-002-20250909    gcc-8.5.0
sparc64               randconfig-002-20250910    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250909    gcc-14
um                    randconfig-001-20250910    gcc-12.5.0
um                    randconfig-002-20250909    gcc-14
um                    randconfig-002-20250910    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250909    clang-20
x86_64      buildonly-randconfig-001-20250910    gcc-14
x86_64      buildonly-randconfig-002-20250909    clang-20
x86_64      buildonly-randconfig-002-20250910    gcc-14
x86_64      buildonly-randconfig-003-20250909    gcc-14
x86_64      buildonly-randconfig-003-20250910    gcc-14
x86_64      buildonly-randconfig-004-20250909    clang-20
x86_64      buildonly-randconfig-004-20250910    gcc-14
x86_64      buildonly-randconfig-005-20250909    gcc-14
x86_64      buildonly-randconfig-005-20250910    gcc-14
x86_64      buildonly-randconfig-006-20250909    clang-20
x86_64      buildonly-randconfig-006-20250910    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250910    clang-20
x86_64                randconfig-002-20250910    clang-20
x86_64                randconfig-003-20250910    clang-20
x86_64                randconfig-004-20250910    clang-20
x86_64                randconfig-005-20250910    clang-20
x86_64                randconfig-006-20250910    clang-20
x86_64                randconfig-007-20250910    clang-20
x86_64                randconfig-008-20250910    clang-20
x86_64                randconfig-071-20250910    gcc-14
x86_64                randconfig-072-20250910    gcc-14
x86_64                randconfig-073-20250910    gcc-14
x86_64                randconfig-074-20250910    gcc-14
x86_64                randconfig-075-20250910    gcc-14
x86_64                randconfig-076-20250910    gcc-14
x86_64                randconfig-077-20250910    gcc-14
x86_64                randconfig-078-20250910    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20250909    gcc-8.5.0
xtensa                randconfig-001-20250910    gcc-12.5.0
xtensa                randconfig-002-20250909    gcc-15.1.0
xtensa                randconfig-002-20250910    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

