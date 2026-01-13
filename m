Return-Path: <linux-renesas-soc+bounces-26637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DA3D15F29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 01:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37CE83008C5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 00:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282E821D3C5;
	Tue, 13 Jan 2026 00:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQlW2iNo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D656207A09
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 00:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768263407; cv=none; b=iAxPRb2KEpG3yNr+G2w8yxAO30saxjwPhUrWKgOgtj0zZzc+XjQKTVoeM0z1FICWw+Tx9cObK3asRtnWRL/3dHW4qItBUysIo1/tDTqQW9p3XY6fT9pq/j0RQc0yMD4Bn19tzkApCcDyH/0QzUFjvWnyG0l42IKnU3+8oq+s88E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768263407; c=relaxed/simple;
	bh=kVg2R1GRwS8cutijcduvqzDOcvRvVE4K7zVUANR7wtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T8HVelCd4cVzyuuau3jwekQ2ByvmQjnecMe4/Mnk+HN3HFLuyG2lv2cv8eb4KoSYtxyIx+GK6XlSmlCBHdeZrK39W/mlOXdjBJYDBZ8xiSYE/dzNMhU4762OPQ0yQ602hr4/AqaDLiZodEG+5NSZrCKYhGJEv9/2Jff+wRqzYjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQlW2iNo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768263405; x=1799799405;
  h=date:from:to:cc:subject:message-id;
  bh=kVg2R1GRwS8cutijcduvqzDOcvRvVE4K7zVUANR7wtk=;
  b=iQlW2iNoKMtHa5OCugifHOgTM9CCCK7U2KJy0OxNkc0RosLbWeR/N3AF
   APzsAtG7sy5A9x45xYxC6MGsyQtW1X0ROuE8f9nPai3d/uqBpj7aIeHOm
   Km1O3UVaZfsnmlXECUOWPpy0skFz9DXL0G5tFoqCKmLRpCr8/AxaDOtwx
   3K5S1IpcphwXdKazBsN3bIumcG9u001pMw/53pbqtCvzl4nJ7pK/k8ui0
   h2YWdrXV9wXdueT4slWrTBp/zKwiKznBMIUK7Cg38DxvLtah13Az4lRiJ
   tSzx0uvY/7Ie59JMRw1LoEOGJDIN+TtaUwPK9WcilFKP0txyvFGcvWtkY
   Q==;
X-CSE-ConnectionGUID: 0ja5tmWvTMKnT/3CaM9H5w==
X-CSE-MsgGUID: Z/h+HcVBQ9y6JA6Eqx3QJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69597394"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69597394"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 16:16:44 -0800
X-CSE-ConnectionGUID: 3UC0u2wqQjGLbNKkAQeIFg==
X-CSE-MsgGUID: RwKXAm8uRmWW1OLrU1NcXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204876561"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jan 2026 16:16:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfS5R-00000000E1Q-0O9A;
	Tue, 13 Jan 2026 00:16:41 +0000
Date: Tue, 13 Jan 2026 08:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.20] BUILD SUCCESS
 2b84bd93eda9f08ab57cd4322387fc0ca44a9fb9
Message-ID: <202601130853.baBHAgpX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.20
branch HEAD: 2b84bd93eda9f08ab57cd4322387fc0ca44a9fb9  arm64: dts: renesas: Use lowercase hex

elapsed time: 774m

configs tested: 259
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260112    gcc-8.5.0
arc                   randconfig-001-20260113    clang-22
arc                   randconfig-002-20260112    gcc-8.5.0
arc                   randconfig-002-20260113    clang-22
arc                           tb10x_defconfig    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                            mmp2_defconfig    gcc-15.2.0
arm                         orion5x_defconfig    gcc-15.2.0
arm                   randconfig-001-20260112    clang-22
arm                   randconfig-001-20260113    clang-22
arm                   randconfig-002-20260112    gcc-8.5.0
arm                   randconfig-002-20260113    clang-22
arm                   randconfig-003-20260112    clang-22
arm                   randconfig-003-20260113    clang-22
arm                   randconfig-004-20260112    gcc-8.5.0
arm                   randconfig-004-20260113    clang-22
arm                           tegra_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260112    clang-19
arm64                 randconfig-001-20260113    clang-22
arm64                 randconfig-002-20260112    gcc-8.5.0
arm64                 randconfig-002-20260113    clang-22
arm64                 randconfig-003-20260112    gcc-15.2.0
arm64                 randconfig-003-20260113    clang-22
arm64                 randconfig-004-20260112    clang-18
arm64                 randconfig-004-20260113    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260112    gcc-15.2.0
csky                  randconfig-001-20260113    clang-22
csky                  randconfig-002-20260112    gcc-9.5.0
csky                  randconfig-002-20260113    clang-22
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260112    clang-22
hexagon               randconfig-001-20260113    clang-22
hexagon               randconfig-002-20260112    clang-22
hexagon               randconfig-002-20260113    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260112    gcc-14
i386        buildonly-randconfig-001-20260113    clang-20
i386        buildonly-randconfig-002-20260112    clang-20
i386        buildonly-randconfig-002-20260113    clang-20
i386        buildonly-randconfig-003-20260112    gcc-14
i386        buildonly-randconfig-003-20260113    clang-20
i386        buildonly-randconfig-004-20260112    clang-20
i386        buildonly-randconfig-004-20260113    clang-20
i386        buildonly-randconfig-005-20260112    gcc-14
i386        buildonly-randconfig-005-20260113    clang-20
i386        buildonly-randconfig-006-20260112    gcc-14
i386        buildonly-randconfig-006-20260113    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260112    clang-20
i386                  randconfig-001-20260113    clang-20
i386                  randconfig-002-20260112    clang-20
i386                  randconfig-002-20260113    clang-20
i386                  randconfig-003-20260112    clang-20
i386                  randconfig-003-20260113    clang-20
i386                  randconfig-004-20260112    gcc-14
i386                  randconfig-004-20260113    clang-20
i386                  randconfig-005-20260112    gcc-14
i386                  randconfig-005-20260113    clang-20
i386                  randconfig-006-20260112    gcc-12
i386                  randconfig-006-20260113    clang-20
i386                  randconfig-007-20260112    gcc-14
i386                  randconfig-007-20260113    clang-20
i386                  randconfig-011-20260113    gcc-14
i386                  randconfig-012-20260113    gcc-14
i386                  randconfig-013-20260113    gcc-14
i386                  randconfig-014-20260113    gcc-14
i386                  randconfig-015-20260113    gcc-14
i386                  randconfig-016-20260113    gcc-14
i386                  randconfig-017-20260113    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260112    gcc-15.2.0
loongarch             randconfig-001-20260113    clang-22
loongarch             randconfig-002-20260112    gcc-15.2.0
loongarch             randconfig-002-20260113    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.2.0
m68k                        m5272c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          eyeq6_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260112    gcc-8.5.0
nios2                 randconfig-001-20260113    clang-22
nios2                 randconfig-002-20260112    gcc-9.5.0
nios2                 randconfig-002-20260113    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
openrisc                  or1klitex_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260112    gcc-14.3.0
parisc                randconfig-001-20260113    clang-19
parisc                randconfig-002-20260112    gcc-11.5.0
parisc                randconfig-002-20260113    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                       ppc64_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260112    gcc-13.4.0
powerpc               randconfig-001-20260113    clang-19
powerpc               randconfig-002-20260112    gcc-11.5.0
powerpc               randconfig-002-20260113    clang-19
powerpc64             randconfig-001-20260112    gcc-10.5.0
powerpc64             randconfig-001-20260113    clang-19
powerpc64             randconfig-002-20260112    clang-22
powerpc64             randconfig-002-20260113    clang-19
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260112    gcc-11.5.0
riscv                 randconfig-001-20260113    gcc-15.2.0
riscv                 randconfig-002-20260112    clang-17
riscv                 randconfig-002-20260113    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260112    clang-22
s390                  randconfig-001-20260113    gcc-15.2.0
s390                  randconfig-002-20260112    gcc-10.5.0
s390                  randconfig-002-20260113    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                     magicpanelr2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260112    gcc-15.2.0
sh                    randconfig-001-20260113    gcc-15.2.0
sh                    randconfig-002-20260112    gcc-14.3.0
sh                    randconfig-002-20260113    gcc-15.2.0
sh                           se7724_defconfig    gcc-15.2.0
sh                           se7751_defconfig    gcc-15.2.0
sh                        sh7757lcr_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260112    gcc-15.2.0
sparc                 randconfig-001-20260113    gcc-14.3.0
sparc                 randconfig-002-20260112    gcc-14.3.0
sparc                 randconfig-002-20260113    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260112    clang-20
sparc64               randconfig-001-20260113    gcc-14.3.0
sparc64               randconfig-002-20260112    gcc-12.5.0
sparc64               randconfig-002-20260113    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260112    gcc-14
um                    randconfig-001-20260113    gcc-14.3.0
um                    randconfig-002-20260112    gcc-14
um                    randconfig-002-20260113    gcc-14.3.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260113    clang-20
x86_64      buildonly-randconfig-002-20260113    clang-20
x86_64      buildonly-randconfig-003-20260113    clang-20
x86_64      buildonly-randconfig-004-20260113    clang-20
x86_64      buildonly-randconfig-005-20260113    clang-20
x86_64      buildonly-randconfig-006-20260113    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260112    gcc-13
x86_64                randconfig-001-20260113    gcc-14
x86_64                randconfig-002-20260112    clang-20
x86_64                randconfig-002-20260113    gcc-14
x86_64                randconfig-003-20260112    gcc-13
x86_64                randconfig-003-20260113    gcc-14
x86_64                randconfig-004-20260112    gcc-13
x86_64                randconfig-004-20260113    gcc-14
x86_64                randconfig-005-20260112    clang-20
x86_64                randconfig-005-20260113    gcc-14
x86_64                randconfig-006-20260112    clang-20
x86_64                randconfig-006-20260113    gcc-14
x86_64                randconfig-011-20260112    clang-20
x86_64                randconfig-011-20260113    clang-20
x86_64                randconfig-012-20260112    gcc-14
x86_64                randconfig-012-20260113    clang-20
x86_64                randconfig-013-20260112    gcc-14
x86_64                randconfig-013-20260113    clang-20
x86_64                randconfig-014-20260112    gcc-14
x86_64                randconfig-014-20260113    clang-20
x86_64                randconfig-015-20260112    gcc-12
x86_64                randconfig-015-20260113    clang-20
x86_64                randconfig-016-20260112    clang-20
x86_64                randconfig-016-20260113    clang-20
x86_64                randconfig-071-20260112    gcc-14
x86_64                randconfig-071-20260113    clang-20
x86_64                randconfig-072-20260112    gcc-14
x86_64                randconfig-072-20260113    clang-20
x86_64                randconfig-073-20260112    gcc-14
x86_64                randconfig-073-20260113    clang-20
x86_64                randconfig-074-20260112    gcc-14
x86_64                randconfig-074-20260113    clang-20
x86_64                randconfig-075-20260112    clang-20
x86_64                randconfig-075-20260113    clang-20
x86_64                randconfig-076-20260112    clang-20
x86_64                randconfig-076-20260113    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    gcc-15.2.0
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                generic_kc705_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260112    gcc-10.5.0
xtensa                randconfig-001-20260113    gcc-14.3.0
xtensa                randconfig-002-20260112    gcc-8.5.0
xtensa                randconfig-002-20260113    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

