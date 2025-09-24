Return-Path: <linux-renesas-soc+bounces-22306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DD1B99003
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 10:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC429189BE4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 08:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847A02D0619;
	Wed, 24 Sep 2025 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ekjpm6c+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB412D0631
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758704208; cv=none; b=fDslC2UgJ91szUqBhaFXyEH1c1bWFzIxpoo41Tf9KFqcIXA9dysMPTikIimYy+uMCa0JeeC21i0IaidXFTjF0RfwNU2KSqaZmPZq/n1UWNVLJyD1thSskLWQ4ScMo2CK3Ia7jBrWJ5RJr1wXvBVPSxK7KPlSKGDx0mP6IUweh3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758704208; c=relaxed/simple;
	bh=M9WCr+q+ZRiQwWZiIOlHc58VWDUlNfOlC4BuobJhnak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nvY7e0iwMN7nZgXIOtwqHoddiDSnHpxML/GqmNLWECFMhvb1rHbQPRVHGBdRcHmmfAVKHnhJVDHqCAObfAYEdhDZihRRcb9i9PryWuMWlQbdYw+LL6wxuLeyStAHEeyoWK78WCZMTfjc8xcbR8jcexRHCAR7LoyuJMb3VShzKWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ekjpm6c+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758704206; x=1790240206;
  h=date:from:to:cc:subject:message-id;
  bh=M9WCr+q+ZRiQwWZiIOlHc58VWDUlNfOlC4BuobJhnak=;
  b=Ekjpm6c+Q7tA8euXwUK9gr9B3EvYACFcV6i/5J8oAOX1O0E4Rn/3FiKF
   O7RtSaamlU6+VpvMD3B5W7QN0isxBh0+Hsrb1eSh42Rypg9pW93PoysHp
   NAjnQZqSvL46DTVQ62u7GeVQaZng0uUxImYVnjDaQ0/SoCIVhOgoHnEFx
   90j60caAWHufSu8KGN1EhiEqYD3BLU5A0lAgX55rD3LPKmLzp2Ux8tenN
   KedBMddqwuxpHRSFUvVf8NtCVi/2U4hyQQGxo+YgbOcsbi8j8KU0jK3iY
   MnGsW40fzOXC8exm0gmKgZ8Kf0+RltsjFhVK6o0wNejlGUEdm8veYxD0m
   w==;
X-CSE-ConnectionGUID: BNbJbfjKSciqPEZ0grjtiw==
X-CSE-MsgGUID: K6mQDnmYRXa14EbydWvAkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60938172"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60938172"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 01:56:46 -0700
X-CSE-ConnectionGUID: TbakWd1ARfy2CMI9+t7A0A==
X-CSE-MsgGUID: RAWE3vYaTVSe1av6715vVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="207727011"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Sep 2025 01:56:43 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1LIo-0003xd-1v;
	Wed, 24 Sep 2025 08:56:42 +0000
Date: Wed, 24 Sep 2025 16:56:01 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.19] BUILD SUCCESS
 1fd933b315e42312cfc5bc6b2016fb59ef09c4f9
Message-ID: <202509241652.iEGWnrdt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.19
branch HEAD: 1fd933b315e42312cfc5bc6b2016fb59ef09c4f9  arm64: dts: renesas: v3[mh]sk: Remove wrong sound property in HDMI encoder node

elapsed time: 1467m

configs tested: 250
configs skipped: 8

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
nios2                               defconfig    gcc-11.5.0
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
powerpc                          allyesconfig    clang-22
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
riscv                            allmodconfig    clang-22
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

