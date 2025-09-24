Return-Path: <linux-renesas-soc+bounces-22331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD3AB9A12D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 15:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE71D1B20C3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 13:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15B33043BD;
	Wed, 24 Sep 2025 13:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ituZ/4pT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCF9303CBD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 13:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758721261; cv=none; b=OpfZ6OAwCHF27tH2Hcbe4mN2JQzUv9sYTuEyOt7WmgO0idRVR0qs4ToyGeQGTtPxDE8k1f7QIn0fzl/r0yMa2Xe3yM9Jxg4bdI1oRFzvw2HhqUPBpJ6o4w2MlP1GY+zYncYJe+cKwSQwxv/Gpmlc4PVoDmIheOMx0z6T5jD2Q8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758721261; c=relaxed/simple;
	bh=FVWl+6Qu2zXk55yFKuHDrEOAVJ4g+1qQ2pbazGgii8c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y3LJiXNVelPEj5/a5MKOHn/JZ3KexlMMMUJzq7DUeA/I8Nj04v69kD+/naNbv3XWsaeRfVZ++51nGXHnASud8tS8ht5f1ipHAR7w9yT1H85FD7GLjKqNAfUY9+J4+y4MPk+NjICxPxPrgbv0sjgXsfbEAw6cu4klW+24J7jnfsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ituZ/4pT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758721260; x=1790257260;
  h=date:from:to:cc:subject:message-id;
  bh=FVWl+6Qu2zXk55yFKuHDrEOAVJ4g+1qQ2pbazGgii8c=;
  b=ituZ/4pTFfwNYC8c3shBwjLRskV1yWlIyGl32fzPhlbNPpED3mfJGE7e
   nHNKkZKErP0173Snd5j5s7ihhD0aMnpGoxS5DXI0gcXtWPTrn/WEp+Rus
   UunsJUfMOI/Fx0LLjxHdXakGrHH1n6CKg4M8XdUoncYeEverQbRrMzzgs
   1R40P2V2wKch4D+1W8y6wdW89tcAoE89VsxcGVhnY2C297UrsAlbzAml8
   PbnXFZuXWhhy1lr1X0n5LNuP/PIbqdL2fEXaztNDKdcEiDVoq3O8crVYR
   olYtuejaddlqWyv0wYqEjVEMlHue6yghXzpVPxa9Cy5yAB25OgjPR2L8a
   g==;
X-CSE-ConnectionGUID: chPxuFZIRNKGxLjb5/D48Q==
X-CSE-MsgGUID: hY0Y7QgRSAGF9banC3uINQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="63644825"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="63644825"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 06:40:59 -0700
X-CSE-ConnectionGUID: 0xdVDPKeRJuNTKS0nLCc1Q==
X-CSE-MsgGUID: Ij7ICLIpQJq6bRA4BrFE/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="207776649"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Sep 2025 06:40:56 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Pjr-0004BP-1r;
	Wed, 24 Sep 2025 13:40:55 +0000
Date: Wed, 24 Sep 2025 21:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/r8a78000-v5] BUILD SUCCESS
 c3252d441711f234c5e3438725338a9df17500fa
Message-ID: <202509242120.3N3BqV6J-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/r8a78000-v5
branch HEAD: c3252d441711f234c5e3438725338a9df17500fa  arm64: dts: renesas: R8A78000: Add initial Ironhide support

elapsed time: 1453m

configs tested: 252
configs skipped: 5

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
arc                                 defconfig    clang-19
arc                   randconfig-001-20250923    gcc-12.5.0
arc                   randconfig-001-20250924    gcc-11.5.0
arc                   randconfig-002-20250923    gcc-12.5.0
arc                   randconfig-002-20250924    gcc-11.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                            mmp2_defconfig    gcc-15.1.0
arm                            mps2_defconfig    clang-22
arm                   randconfig-001-20250923    gcc-12.5.0
arm                   randconfig-001-20250924    gcc-11.5.0
arm                   randconfig-002-20250923    clang-17
arm                   randconfig-002-20250924    gcc-11.5.0
arm                   randconfig-003-20250923    gcc-8.5.0
arm                   randconfig-003-20250924    gcc-11.5.0
arm                   randconfig-004-20250923    clang-22
arm                   randconfig-004-20250924    gcc-11.5.0
arm                             rpc_defconfig    clang-18
arm                           stm32_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250923    gcc-8.5.0
arm64                 randconfig-001-20250924    gcc-11.5.0
arm64                 randconfig-002-20250923    clang-18
arm64                 randconfig-002-20250924    gcc-11.5.0
arm64                 randconfig-003-20250923    gcc-8.5.0
arm64                 randconfig-003-20250924    gcc-11.5.0
arm64                 randconfig-004-20250923    gcc-11.5.0
arm64                 randconfig-004-20250924    gcc-11.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250923    gcc-9.5.0
csky                  randconfig-001-20250924    clang-22
csky                  randconfig-002-20250923    gcc-15.1.0
csky                  randconfig-002-20250924    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250923    clang-22
hexagon               randconfig-001-20250924    clang-22
hexagon               randconfig-002-20250923    clang-22
hexagon               randconfig-002-20250924    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250923    gcc-14
i386        buildonly-randconfig-001-20250924    gcc-14
i386        buildonly-randconfig-002-20250923    clang-20
i386        buildonly-randconfig-002-20250924    gcc-14
i386        buildonly-randconfig-003-20250923    clang-20
i386        buildonly-randconfig-003-20250924    gcc-14
i386        buildonly-randconfig-004-20250923    gcc-14
i386        buildonly-randconfig-004-20250924    gcc-14
i386        buildonly-randconfig-005-20250923    clang-20
i386        buildonly-randconfig-005-20250924    gcc-14
i386        buildonly-randconfig-006-20250923    clang-20
i386        buildonly-randconfig-006-20250924    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20250924    clang-20
i386                  randconfig-002-20250924    clang-20
i386                  randconfig-003-20250924    clang-20
i386                  randconfig-004-20250924    clang-20
i386                  randconfig-005-20250924    clang-20
i386                  randconfig-006-20250924    clang-20
i386                  randconfig-007-20250924    clang-20
i386                  randconfig-011-20250924    gcc-14
i386                  randconfig-012-20250924    gcc-14
i386                  randconfig-013-20250924    gcc-14
i386                  randconfig-014-20250924    gcc-14
i386                  randconfig-015-20250924    gcc-14
i386                  randconfig-016-20250924    gcc-14
i386                  randconfig-017-20250924    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250923    gcc-15.1.0
loongarch             randconfig-001-20250924    clang-22
loongarch             randconfig-002-20250923    gcc-15.1.0
loongarch             randconfig-002-20250924    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        mvme147_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250923    gcc-11.5.0
nios2                 randconfig-001-20250924    clang-22
nios2                 randconfig-002-20250923    gcc-11.5.0
nios2                 randconfig-002-20250924    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250923    gcc-15.1.0
parisc                randconfig-001-20250924    clang-22
parisc                randconfig-002-20250923    gcc-9.5.0
parisc                randconfig-002-20250924    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     kmeter1_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250923    gcc-8.5.0
powerpc               randconfig-001-20250924    clang-22
powerpc               randconfig-002-20250923    clang-16
powerpc               randconfig-002-20250924    clang-22
powerpc               randconfig-003-20250923    gcc-12.5.0
powerpc               randconfig-003-20250924    clang-22
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250923    gcc-10.5.0
powerpc64             randconfig-001-20250924    clang-22
powerpc64             randconfig-002-20250923    clang-22
powerpc64             randconfig-002-20250924    clang-22
powerpc64             randconfig-003-20250924    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250923    gcc-12.5.0
riscv                 randconfig-001-20250924    gcc-8.5.0
riscv                 randconfig-002-20250923    clang-22
riscv                 randconfig-002-20250924    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250923    gcc-8.5.0
s390                  randconfig-001-20250924    gcc-8.5.0
s390                  randconfig-002-20250923    clang-22
s390                  randconfig-002-20250924    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250923    gcc-15.1.0
sh                    randconfig-001-20250924    gcc-8.5.0
sh                    randconfig-002-20250923    gcc-10.5.0
sh                    randconfig-002-20250924    gcc-8.5.0
sh                           se7705_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250923    gcc-8.5.0
sparc                 randconfig-001-20250924    gcc-8.5.0
sparc                 randconfig-002-20250923    gcc-12.5.0
sparc                 randconfig-002-20250924    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250923    clang-22
sparc64               randconfig-001-20250924    gcc-8.5.0
sparc64               randconfig-002-20250923    gcc-8.5.0
sparc64               randconfig-002-20250924    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250923    clang-22
um                    randconfig-001-20250924    gcc-8.5.0
um                    randconfig-002-20250923    clang-22
um                    randconfig-002-20250924    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250923    gcc-14
x86_64      buildonly-randconfig-001-20250924    clang-20
x86_64      buildonly-randconfig-002-20250923    gcc-14
x86_64      buildonly-randconfig-002-20250924    clang-20
x86_64      buildonly-randconfig-003-20250923    gcc-14
x86_64      buildonly-randconfig-003-20250924    clang-20
x86_64      buildonly-randconfig-004-20250923    clang-20
x86_64      buildonly-randconfig-004-20250924    clang-20
x86_64      buildonly-randconfig-005-20250923    clang-20
x86_64      buildonly-randconfig-005-20250924    clang-20
x86_64      buildonly-randconfig-006-20250923    clang-20
x86_64      buildonly-randconfig-006-20250924    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250924    gcc-14
x86_64                randconfig-002-20250924    gcc-14
x86_64                randconfig-003-20250924    gcc-14
x86_64                randconfig-004-20250924    gcc-14
x86_64                randconfig-005-20250924    gcc-14
x86_64                randconfig-006-20250924    gcc-14
x86_64                randconfig-007-20250924    gcc-14
x86_64                randconfig-008-20250924    gcc-14
x86_64                randconfig-071-20250924    clang-20
x86_64                randconfig-072-20250924    clang-20
x86_64                randconfig-073-20250924    clang-20
x86_64                randconfig-074-20250924    clang-20
x86_64                randconfig-075-20250924    clang-20
x86_64                randconfig-076-20250924    clang-20
x86_64                randconfig-077-20250924    clang-20
x86_64                randconfig-078-20250924    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250923    gcc-8.5.0
xtensa                randconfig-001-20250924    gcc-8.5.0
xtensa                randconfig-002-20250923    gcc-8.5.0
xtensa                randconfig-002-20250924    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

