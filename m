Return-Path: <linux-renesas-soc+bounces-25215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 180E9C8B53C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 18:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF2084F0303
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 17:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC75F343D8F;
	Wed, 26 Nov 2025 17:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f06y4NBZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B1B343D9E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 17:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178936; cv=none; b=FYlMvi9pITyZWRZXOMGmmpK+dip2HPMxC05ySWKUUQIdDcktItRumifcKYoDWZ0IPJxtsO7CZ/ovbz23KJrI0IxtkzubFz+s0O/NSGucJ9pMWe7oXVmJN6LKtiwg6nzKecsYCgcMF7NRTkJBTaAtnET5RqWTr/f/ZHOfSniRXLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178936; c=relaxed/simple;
	bh=cPPH2WZMEopou+e4NFTaMQJaDKi/XFGSPfwjBMGUNYU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LQMy6nHnKgm0pLh0DYSDfF3CimqkEtTrY1dw2+Bnmvh4RjOmZSQqaqEFaoEo5AiWyYioM5tKm6ahqnS60o/mfeEsMY3oeiMenwtW7guNNtrXsK85bxmSH4bIlRkvIP152jH8uM3Lf2i1H4KkBT46sp049IthN6baumtZ6PxgKOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f06y4NBZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764178935; x=1795714935;
  h=date:from:to:cc:subject:message-id;
  bh=cPPH2WZMEopou+e4NFTaMQJaDKi/XFGSPfwjBMGUNYU=;
  b=f06y4NBZWMOC7Qi581sWXNWYcoezaw9DGIPyVWyT5JQ4Q93RZFGCPaOm
   of+YxOMp8658pLLXeoHnIMtKLKr3++tx2jG5umvvJVmIpg91Z14HmDei3
   5NfNU2Ob2j645PcSm19Ysi5ZSGVdseIcAi1YwU8RpSeDAAQNVTFL8EuJv
   rYzgubBMPNQ7RdSLiUABCXbAC3/SJtz+Tz3OhAnZjVs4zWSppelROJR6I
   hQdu+s1KFC4HXlNNF5lOBY5v9JdNuYVQ20M8QU+FjvhTH1ryZPH/gtCV+
   BmecIGAKY0bWWD3dEg9T9oUUJp3JXeioYPEDe5BE6lNzrpi54pEq7gcGm
   g==;
X-CSE-ConnectionGUID: wj+XsBgmR9m7kyPV7BsxsA==
X-CSE-MsgGUID: AhD4aGQ1Ty2wDTMGEyEdiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="53791418"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="53791418"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 09:42:12 -0800
X-CSE-ConnectionGUID: NR9L4JXYQZafgFA4jH2L5A==
X-CSE-MsgGUID: 2nOUhxmFQ1CpWvkSk3KpPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="197941926"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2025 09:42:11 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOJWr-000000003CD-0Mdr;
	Wed, 26 Nov 2025 17:42:09 +0000
Date: Thu, 27 Nov 2025 01:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 3262572145c3279a0692130aa7d48461e18beaf3
Message-ID: <202511270145.wDTorHt9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 3262572145c3279a0692130aa7d48461e18beaf3  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

elapsed time: 1538m

configs tested: 97
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251126    gcc-13.4.0
arc                   randconfig-002-20251126    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                         lpc18xx_defconfig    clang-22
arm                   randconfig-002-20251126    clang-22
arm                   randconfig-003-20251126    clang-19
arm                   randconfig-004-20251126    clang-22
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            alldefconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251126    gcc-8.5.0
arm64                 randconfig-003-20251126    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251126    gcc-11.5.0
hexagon                           allnoconfig    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251126    clang-20
i386        buildonly-randconfig-002-20251126    gcc-14
i386        buildonly-randconfig-003-20251126    clang-20
i386        buildonly-randconfig-004-20251126    clang-20
i386        buildonly-randconfig-005-20251126    clang-20
i386        buildonly-randconfig-006-20251126    gcc-14
i386                  randconfig-003-20251126    gcc-14
i386                  randconfig-004-20251126    clang-20
i386                  randconfig-005-20251126    gcc-14
i386                  randconfig-006-20251126    gcc-14
i386                  randconfig-012-20251126    gcc-14
i386                  randconfig-014-20251126    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251126    gcc-15.1.0
loongarch             randconfig-002-20251126    clang-22
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251126    gcc-11.5.0
nios2                 randconfig-002-20251126    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251126    gcc-8.5.0
parisc                randconfig-002-20251126    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     kmeter1_defconfig    gcc-15.1.0
powerpc                     mpc83xx_defconfig    clang-22
powerpc               randconfig-001-20251126    gcc-10.5.0
powerpc               randconfig-002-20251126    gcc-8.5.0
powerpc64             randconfig-001-20251126    clang-19
powerpc64             randconfig-002-20251126    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251126    gcc-10.5.0
riscv                 randconfig-002-20251126    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251126    gcc-8.5.0
s390                  randconfig-002-20251126    gcc-8.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251126    gcc-14.3.0
sh                    randconfig-002-20251126    gcc-11.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251126    gcc-8.5.0
sparc                 randconfig-002-20251126    gcc-14.3.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251126    gcc-8.5.0
sparc64               randconfig-002-20251126    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251126    clang-19
um                    randconfig-002-20251126    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-013-20251126    gcc-14
x86_64                randconfig-071-20251126    clang-20
x86_64                randconfig-072-20251126    gcc-14
x86_64                randconfig-073-20251126    clang-20
x86_64                randconfig-074-20251126    gcc-14
x86_64                randconfig-075-20251126    clang-20
x86_64                randconfig-076-20251126    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251126    gcc-14.3.0
xtensa                randconfig-002-20251126    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

