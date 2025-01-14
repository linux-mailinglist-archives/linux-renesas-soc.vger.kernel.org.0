Return-Path: <linux-renesas-soc+bounces-12109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81588A10311
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 10:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A459188581D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 09:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3200A22DC5D;
	Tue, 14 Jan 2025 09:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOsMUlIg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A0A22DC29
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jan 2025 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736847287; cv=none; b=lSEqo3Ct+RhbXSdZC0eQpyZM7bLB/OJ+HLyJfYDfAQPyv7rDEgP1RAT/wLEpJuYoPQJx/9nasOc9et/VQzCBjvnUMmp58TgtGXoEDPD62E1IdIXYvqRwzty5yrWDteAOaPGa/yFlz4puLRQkcn+VvxeTryyrVHiF6DhZc1XFuqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736847287; c=relaxed/simple;
	bh=Pp4dq38J1moKwuFZZsayd0XAzSetJjw+K0HEQ1HtuHo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u+COWvjXGflHDom/rtsrV+fjOQfhruUe4K+PIKxrtae6RqkifIDs6oWXdkVwnHjhEIcZC877/ZVl2tx08hEbjxHtQVaFguir8VonyMxmJizNGc0MKkZeGb1JZZ5khI2ZXC/bmaQ3i2hOyp1Z43xQ5PRoPFx1qRB++gRn35kcL8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOsMUlIg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736847286; x=1768383286;
  h=date:from:to:cc:subject:message-id;
  bh=Pp4dq38J1moKwuFZZsayd0XAzSetJjw+K0HEQ1HtuHo=;
  b=lOsMUlIgKf/QQsEmNqPLSQTUwJc1Q2fzpa0ooX9xIe8P/CKjg+Rcv6m5
   Ekrpu5WdI1pB485AWuWOL/4MT6IbqiF4paQG4M53ZVhWU63u1Irkfh2hX
   7O+vh09faWqPq1XXg/aAMiJtnETTTyiTQim+R2FKB3fA5Y+C+f9/Yr63c
   6+6vb9/254EhRJyZ80FLDfP8ZaP2vaugWBjo+IlmmtKxF65rWsX/Kt5sJ
   /zV/N1Tx0XK6+welrPOB21O5BFco3mvgrq6712lWA6pHniiqdZojNHTUT
   hZVrUNbEXLj5nzQaQAeaxmeu50XOA2jagTOA0cM2gSnJr6LRWWof2BZjM
   Q==;
X-CSE-ConnectionGUID: UVE6pwbFTiGJ0JkTTTExSQ==
X-CSE-MsgGUID: HxaSnPneQ5WSpXzoAZCD2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48135209"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="48135209"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 01:34:45 -0800
X-CSE-ConnectionGUID: 442gcPtdQkig8xK5zHF3Gg==
X-CSE-MsgGUID: uL44Dz/iRJaOl+I7Mvm+Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105240276"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2025 01:34:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXdJp-000OLV-13;
	Tue, 14 Jan 2025 09:34:41 +0000
Date: Tue, 14 Jan 2025 17:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 04163f0e2c93ba32550d50b9c0c9fb90cd0feec4
Message-ID: <202501141716.VHcU4oxb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 04163f0e2c93ba32550d50b9c0c9fb90cd0feec4  Merge branches 'renesas-arm-soc-for-v6.15' and 'renesas-dts-for-v6.15' into renesas-devel

elapsed time: 1450m

configs tested: 119
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20250113    gcc-13.2.0
arc                   randconfig-002-20250113    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                   randconfig-001-20250113    gcc-14.2.0
arm                   randconfig-002-20250113    gcc-14.2.0
arm                   randconfig-003-20250113    gcc-14.2.0
arm                   randconfig-004-20250113    clang-20
arm                         s3c6400_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250113    gcc-14.2.0
arm64                 randconfig-002-20250113    clang-18
arm64                 randconfig-003-20250113    clang-20
arm64                 randconfig-004-20250113    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250113    gcc-14.2.0
csky                  randconfig-002-20250113    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250113    clang-20
hexagon               randconfig-002-20250113    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250113    clang-19
i386        buildonly-randconfig-002-20250113    gcc-12
i386        buildonly-randconfig-003-20250113    clang-19
i386        buildonly-randconfig-004-20250113    clang-19
i386        buildonly-randconfig-005-20250113    clang-19
i386        buildonly-randconfig-006-20250113    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250113    gcc-14.2.0
loongarch             randconfig-002-20250113    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip28_defconfig    gcc-14.2.0
mips                           mtx1_defconfig    clang-20
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250113    gcc-14.2.0
nios2                 randconfig-002-20250113    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250113    gcc-14.2.0
parisc                randconfig-002-20250113    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                   motionpro_defconfig    clang-17
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250113    clang-18
powerpc               randconfig-002-20250113    gcc-14.2.0
powerpc               randconfig-003-20250113    clang-20
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250113    clang-20
powerpc64             randconfig-002-20250113    gcc-14.2.0
powerpc64             randconfig-003-20250113    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250113    gcc-14.2.0
riscv                 randconfig-002-20250113    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                  randconfig-001-20250113    gcc-14.2.0
s390                  randconfig-002-20250113    gcc-14.2.0
s390                       zfcpdump_defconfig    clang-19
sh                                allnoconfig    gcc-14.2.0
sh                    randconfig-001-20250113    gcc-14.2.0
sh                    randconfig-002-20250113    gcc-14.2.0
sh                          sdk7786_defconfig    gcc-14.2.0
sh                           se7780_defconfig    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250113    gcc-14.2.0
sparc                 randconfig-002-20250113    gcc-14.2.0
sparc64               randconfig-001-20250113    gcc-14.2.0
sparc64               randconfig-002-20250113    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250113    gcc-12
um                    randconfig-002-20250113    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250113    gcc-12
x86_64      buildonly-randconfig-002-20250113    gcc-12
x86_64      buildonly-randconfig-003-20250113    gcc-12
x86_64      buildonly-randconfig-004-20250113    gcc-12
x86_64      buildonly-randconfig-005-20250113    clang-19
x86_64      buildonly-randconfig-006-20250113    clang-19
x86_64                              defconfig    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250113    gcc-14.2.0
xtensa                randconfig-002-20250113    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

