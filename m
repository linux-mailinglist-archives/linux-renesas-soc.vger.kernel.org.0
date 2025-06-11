Return-Path: <linux-renesas-soc+bounces-18080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E870DAD4D78
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 09:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D34A1189ECD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 07:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377DB29D19;
	Wed, 11 Jun 2025 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7okQjAs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F19F2D541D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 07:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749628457; cv=none; b=JYGMdTtl0XfSSYePn9i5Tea21C96BCC1TVRvf3IShj0fUAKnhJ0SKFrPB2cH82wFL9bkQIKmLZKoJK2H0JorgPLeqUZYt0BbrMY346Znz9qERf9zf/hPu73OIagksXeUPd1AUN6eulA1xUuwRtpUzqxKSBku9EjaM0PIJYdgUs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749628457; c=relaxed/simple;
	bh=iEupZyE9wlGmvJHxZpa2OPELENnrKm3jbq4n7Kzfh/Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BvJ+FvQe0xv/+Sz4KnHlEPG7Ya2A0HdR68TLDb9aBP9Idon1H26AmebtaJiK0hF0thZNS1AQanNkGaBpzoULfum7Bp08AcmlXWSP+31C8V0Y51szmRH5piAv6VQU50Kil7Yt2RaiaRj7y9WDDeITVPYrHkQ+6C569B7Q/efHHfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7okQjAs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749628455; x=1781164455;
  h=date:from:to:cc:subject:message-id;
  bh=iEupZyE9wlGmvJHxZpa2OPELENnrKm3jbq4n7Kzfh/Y=;
  b=V7okQjAsEhQdt4ieCB5slc3LFCTQVPEZISBnhGDeX9+CiJa2aGM9LNMt
   ytHlyHQ9HvSmi2aBLAl1hoIgcBOdEHXWXV9bWI43SXX7NqzaOPU0wjSEO
   BbbIP8VlnL3T4tWDtRz+12aM+RhhPTrbqLd27tUlOj1EGGPsQuNWxKyQg
   kCF1D0Ra7BGxdC8wnnFIJtBcLYPw4E0LRoUIUctiiRlQhaNRH2ux9fvF+
   LdRIy3oQYL7TBtMhDin/z8A/1yZCGFxuENlCd0/YNIGAimUw1lXi02z/J
   psYyJM18a3vRo10b+YgVAFa1T3CmBiQJGvpqFEMefMYhJm3zt0Z4OSUu8
   w==;
X-CSE-ConnectionGUID: VLBWGrfmTgeQHQbBahaiQg==
X-CSE-MsgGUID: e7EQ3YCyQdOp2tmg+i/23g==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51622314"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51622314"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 00:54:15 -0700
X-CSE-ConnectionGUID: rU7jXuKjTQmcNcJaL3ONWA==
X-CSE-MsgGUID: bPpA8aAnRj2RPl0Vc45J3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="146986138"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jun 2025 00:54:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPGHj-000A9M-20;
	Wed, 11 Jun 2025 07:54:11 +0000
Date: Wed, 11 Jun 2025 15:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v6.17] BUILD
 SUCCESS ac02e070627af24a7674334450bfd8e75488c6d2
Message-ID: <202506111544.iUDjdJ7m-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.17
branch HEAD: ac02e070627af24a7674334450bfd8e75488c6d2  dt-bindings: soc: renesas: Document RZ/V2H EVK board part number

elapsed time: 1272m

configs tested: 245
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                        nsim_700_defconfig    clang-21
arc                   randconfig-001-20250610    gcc-12.4.0
arc                   randconfig-001-20250611    gcc-12.4.0
arc                   randconfig-002-20250610    gcc-14.3.0
arc                   randconfig-002-20250611    gcc-12.4.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
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
csky                  randconfig-001-20250610    gcc-12.4.0
csky                  randconfig-001-20250611    gcc-8.5.0
csky                  randconfig-002-20250610    gcc-14.3.0
csky                  randconfig-002-20250611    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250610    clang-21
hexagon               randconfig-001-20250611    gcc-8.5.0
hexagon               randconfig-002-20250610    clang-21
hexagon               randconfig-002-20250611    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250610    clang-20
i386        buildonly-randconfig-001-20250611    clang-20
i386        buildonly-randconfig-002-20250610    clang-20
i386        buildonly-randconfig-002-20250611    clang-20
i386        buildonly-randconfig-003-20250610    clang-20
i386        buildonly-randconfig-003-20250611    clang-20
i386        buildonly-randconfig-004-20250610    gcc-12
i386        buildonly-randconfig-004-20250611    clang-20
i386        buildonly-randconfig-005-20250610    clang-20
i386        buildonly-randconfig-005-20250611    clang-20
i386        buildonly-randconfig-006-20250610    clang-20
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
loongarch             randconfig-001-20250610    gcc-15.1.0
loongarch             randconfig-001-20250611    gcc-8.5.0
loongarch             randconfig-002-20250610    gcc-15.1.0
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
nios2                 randconfig-001-20250610    gcc-8.5.0
nios2                 randconfig-001-20250611    gcc-8.5.0
nios2                 randconfig-002-20250610    gcc-13.3.0
nios2                 randconfig-002-20250611    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250610    gcc-10.5.0
parisc                randconfig-001-20250611    gcc-8.5.0
parisc                randconfig-002-20250610    gcc-15.1.0
parisc                randconfig-002-20250611    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      ep88xc_defconfig    clang-21
powerpc                       holly_defconfig    clang-21
powerpc                  mpc866_ads_defconfig    clang-21
powerpc               randconfig-001-20250610    gcc-10.5.0
powerpc               randconfig-001-20250611    gcc-8.5.0
powerpc               randconfig-002-20250610    gcc-8.5.0
powerpc               randconfig-002-20250611    gcc-8.5.0
powerpc               randconfig-003-20250610    clang-21
powerpc               randconfig-003-20250611    gcc-8.5.0
powerpc64             randconfig-001-20250610    clang-21
powerpc64             randconfig-001-20250611    gcc-8.5.0
powerpc64             randconfig-002-20250610    clang-21
powerpc64             randconfig-002-20250611    gcc-8.5.0
riscv                            alldefconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250610    gcc-14.3.0
riscv                 randconfig-001-20250611    gcc-15.1.0
riscv                 randconfig-002-20250610    clang-16
riscv                 randconfig-002-20250611    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250610    gcc-8.5.0
s390                  randconfig-001-20250611    gcc-15.1.0
s390                  randconfig-002-20250610    gcc-14.3.0
s390                  randconfig-002-20250611    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                          landisk_defconfig    clang-21
sh                    randconfig-001-20250610    gcc-9.3.0
sh                    randconfig-001-20250611    gcc-15.1.0
sh                    randconfig-002-20250610    gcc-15.1.0
sh                    randconfig-002-20250611    gcc-15.1.0
sh                              ul2_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250610    gcc-15.1.0
sparc                 randconfig-001-20250611    gcc-15.1.0
sparc                 randconfig-002-20250610    gcc-12.4.0
sparc                 randconfig-002-20250611    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250610    gcc-8.5.0
sparc64               randconfig-001-20250611    gcc-15.1.0
sparc64               randconfig-002-20250610    gcc-8.5.0
sparc64               randconfig-002-20250611    gcc-15.1.0
um                               alldefconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250610    gcc-11
um                    randconfig-001-20250611    gcc-15.1.0
um                    randconfig-002-20250610    gcc-12
um                    randconfig-002-20250611    gcc-15.1.0
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250610    clang-20
x86_64      buildonly-randconfig-001-20250611    clang-20
x86_64      buildonly-randconfig-002-20250610    gcc-12
x86_64      buildonly-randconfig-002-20250611    clang-20
x86_64      buildonly-randconfig-003-20250610    clang-20
x86_64      buildonly-randconfig-003-20250611    clang-20
x86_64      buildonly-randconfig-004-20250610    clang-20
x86_64      buildonly-randconfig-004-20250611    clang-20
x86_64      buildonly-randconfig-005-20250610    gcc-12
x86_64      buildonly-randconfig-005-20250611    clang-20
x86_64      buildonly-randconfig-006-20250610    gcc-12
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
xtensa                randconfig-001-20250610    gcc-11.5.0
xtensa                randconfig-001-20250611    gcc-15.1.0
xtensa                randconfig-002-20250610    gcc-12.4.0
xtensa                randconfig-002-20250611    gcc-15.1.0
xtensa                    smp_lx200_defconfig    gcc-12
xtensa                         virt_defconfig    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

