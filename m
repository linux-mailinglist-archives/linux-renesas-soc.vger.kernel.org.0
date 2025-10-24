Return-Path: <linux-renesas-soc+bounces-23588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F1BC07C0D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 20:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8E273A1841
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 18:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DF4257427;
	Fri, 24 Oct 2025 18:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqZB77kb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEA2330D43
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 18:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761330421; cv=none; b=Pd8TPxkukNYHULhcP6ExLOsWA/ucsF+TZmujHyq4w39WEXHT8Is21UZ8Q1yd6jUigIVsqK/kXPlQuZgm0UoGJ01oiCLPjF9GtVT6Q5FZr5Iw1itjIenSwLxWQWYVgNhamWV6xY0AC17NqcxFXRrnAatjouaF2nOWvkm8r4l/9oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761330421; c=relaxed/simple;
	bh=a0itJbGbPX4OThxL1OmB7EMtqVEqL++w3SFt7Scwn+w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nLzwwCAfnDS0S062CQQJEw/Uu1Ldpdoordc6b+z+RtyC/3dAOPMzqMJRO3X/jfXupCnWPdI575ncHlT2aq2s0/VJFkSLO1hQfwdhEs2ZKz0GLmbCtIcae2zRjRIRoJuDMmUKMXR3HCaLvKQnzeq2CO3Dqs93+9QruD9Z206uAfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqZB77kb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761330420; x=1792866420;
  h=date:from:to:cc:subject:message-id;
  bh=a0itJbGbPX4OThxL1OmB7EMtqVEqL++w3SFt7Scwn+w=;
  b=EqZB77kbOddwegnAhT6NcyU5F2DXXbsp+mqdUWJjefG+AlL6FKuZ4Bad
   sNtkCP403opiTLpg8hYYfADY5AK5rVs3y7vEvbGglZs1wYmWr5oWNva9I
   TLRHpA5uHInkzJ9SlN1fxQFMMCJinICu/4gZ+FBn0f2tOfTlXa026447K
   wL6e5chVkOm9mj9dlEaTj1gf5YGtjYiLRpsrvrkWr246rPjYHaJENASC6
   mJ3K7maK0hKelLe6xdIq0xvk+/rThyQIloc04w0TDiAmZd8AxBHRewxVz
   JWTAf3hWhMcicYC662v543hWqr5YU6xWQl5GbYLEoxKKZH+SrGPFE6tGO
   Q==;
X-CSE-ConnectionGUID: t0dv1sUvTAO212f3EXOEsQ==
X-CSE-MsgGUID: XYt4gIBvR5ycq6xA0hZSIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63219180"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="63219180"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 11:26:59 -0700
X-CSE-ConnectionGUID: GtO0VyyzQHuKr7cWUwosGw==
X-CSE-MsgGUID: ztRsBw7TS0GUlE3qTIBpSg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Oct 2025 11:26:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCMV5-000Eme-1i;
	Fri, 24 Oct 2025 18:26:55 +0000
Date: Sat, 25 Oct 2025 02:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v6.19] BUILD
 SUCCESS aa09d5a147702814ee8cf8faf0aea8f001cee1bc
Message-ID: <202510250235.exVeRPOi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v6.19
branch HEAD: aa09d5a147702814ee8cf8faf0aea8f001cee1bc  pinctrl: renesas: rza1: Make mux_conf const in rza1_pin_mux_single()

elapsed time: 1448m

configs tested: 200
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251024    clang-22
arc                   randconfig-001-20251024    gcc-8.5.0
arc                   randconfig-002-20251024    clang-22
arc                   randconfig-002-20251024    gcc-14.3.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   randconfig-001-20251024    clang-20
arm                   randconfig-001-20251024    clang-22
arm                   randconfig-002-20251024    clang-22
arm                   randconfig-002-20251024    gcc-15.1.0
arm                   randconfig-003-20251024    clang-22
arm                   randconfig-004-20251024    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251024    clang-22
arm64                 randconfig-001-20251024    gcc-8.5.0
arm64                 randconfig-002-20251024    clang-16
arm64                 randconfig-002-20251024    clang-22
arm64                 randconfig-003-20251024    clang-22
arm64                 randconfig-003-20251024    gcc-13.4.0
arm64                 randconfig-004-20251024    clang-17
arm64                 randconfig-004-20251024    clang-22
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20251024    gcc-14.3.0
csky                  randconfig-001-20251024    gcc-8.5.0
csky                  randconfig-002-20251024    gcc-11.5.0
csky                  randconfig-002-20251024    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251024    clang-22
hexagon               randconfig-001-20251024    gcc-8.5.0
hexagon               randconfig-002-20251024    clang-22
hexagon               randconfig-002-20251024    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251024    clang-20
i386        buildonly-randconfig-001-20251024    gcc-14
i386        buildonly-randconfig-002-20251024    gcc-14
i386        buildonly-randconfig-003-20251024    clang-20
i386        buildonly-randconfig-003-20251024    gcc-14
i386        buildonly-randconfig-004-20251024    gcc-14
i386        buildonly-randconfig-005-20251024    gcc-14
i386        buildonly-randconfig-006-20251024    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251024    clang-20
i386                  randconfig-002-20251024    clang-20
i386                  randconfig-003-20251024    clang-20
i386                  randconfig-004-20251024    clang-20
i386                  randconfig-005-20251024    clang-20
i386                  randconfig-006-20251024    clang-20
i386                  randconfig-007-20251024    clang-20
i386                  randconfig-011-20251024    clang-20
i386                  randconfig-012-20251024    clang-20
i386                  randconfig-013-20251024    clang-20
i386                  randconfig-014-20251024    clang-20
i386                  randconfig-015-20251024    clang-20
i386                  randconfig-016-20251024    clang-20
i386                  randconfig-017-20251024    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251024    gcc-15.1.0
loongarch             randconfig-001-20251024    gcc-8.5.0
loongarch             randconfig-002-20251024    gcc-15.1.0
loongarch             randconfig-002-20251024    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251024    gcc-11.5.0
nios2                 randconfig-001-20251024    gcc-8.5.0
nios2                 randconfig-002-20251024    gcc-11.5.0
nios2                 randconfig-002-20251024    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251024    gcc-8.5.0
parisc                randconfig-001-20251024    gcc-9.5.0
parisc                randconfig-002-20251024    gcc-13.4.0
parisc                randconfig-002-20251024    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251024    gcc-8.5.0
powerpc               randconfig-002-20251024    clang-17
powerpc               randconfig-002-20251024    gcc-8.5.0
powerpc               randconfig-003-20251024    clang-16
powerpc               randconfig-003-20251024    gcc-8.5.0
powerpc64             randconfig-001-20251024    gcc-12.5.0
powerpc64             randconfig-001-20251024    gcc-8.5.0
powerpc64             randconfig-002-20251024    gcc-14.3.0
powerpc64             randconfig-002-20251024    gcc-8.5.0
powerpc64             randconfig-003-20251024    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251024    clang-22
riscv                 randconfig-002-20251024    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251024    clang-22
s390                  randconfig-001-20251024    gcc-13.4.0
s390                  randconfig-002-20251024    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251024    clang-22
sh                    randconfig-001-20251024    gcc-12.5.0
sh                    randconfig-002-20251024    clang-22
sh                    randconfig-002-20251024    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251024    clang-22
sparc                 randconfig-001-20251024    gcc-12.5.0
sparc                 randconfig-002-20251024    clang-22
sparc                 randconfig-002-20251024    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251024    clang-20
sparc64               randconfig-001-20251024    clang-22
sparc64               randconfig-002-20251024    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251024    clang-22
um                    randconfig-001-20251024    gcc-14
um                    randconfig-002-20251024    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251024    clang-20
x86_64      buildonly-randconfig-002-20251024    clang-20
x86_64      buildonly-randconfig-003-20251024    clang-20
x86_64      buildonly-randconfig-004-20251024    gcc-14
x86_64      buildonly-randconfig-005-20251024    gcc-14
x86_64      buildonly-randconfig-006-20251024    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251024    gcc-14
x86_64                randconfig-002-20251024    gcc-14
x86_64                randconfig-003-20251024    gcc-14
x86_64                randconfig-004-20251024    gcc-14
x86_64                randconfig-005-20251024    gcc-14
x86_64                randconfig-006-20251024    gcc-14
x86_64                randconfig-007-20251024    gcc-14
x86_64                randconfig-008-20251024    gcc-14
x86_64                randconfig-071-20251024    clang-20
x86_64                randconfig-072-20251024    clang-20
x86_64                randconfig-073-20251024    clang-20
x86_64                randconfig-074-20251024    clang-20
x86_64                randconfig-075-20251024    clang-20
x86_64                randconfig-076-20251024    clang-20
x86_64                randconfig-077-20251024    clang-20
x86_64                randconfig-078-20251024    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251024    clang-22
xtensa                randconfig-001-20251024    gcc-11.5.0
xtensa                randconfig-002-20251024    clang-22
xtensa                randconfig-002-20251024    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

