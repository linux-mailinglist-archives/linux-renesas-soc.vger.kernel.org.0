Return-Path: <linux-renesas-soc+bounces-8640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9474D9699AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 12:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6BA8B24DC1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 10:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293681A4E9D;
	Tue,  3 Sep 2024 10:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPFVHc2j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2416D1A4E8B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725357601; cv=none; b=tQKJvFKmnnXV12CygY/h93+KeXATN5rdQ7gyyN5Uu1i3a9eqv6qlWEKaDaERY4NcB6Wbi9IOgaLR/VwUnj6Y2afmLAqRsYgOpHLcfIxrmo0sdDuibTMl7ON1kA+wFs6ECgz7jAyW7QaRBdP/gcDwj/KLs1Y5HQQR0Rj0BtibKjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725357601; c=relaxed/simple;
	bh=h2nB4lM0Okl69svsvpsWjs97LkFpv2sAxp7zj3EyyB0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EZnuEl9M9+sFrlhTRAemSYSVDCVNco+NiZ+cWml+aloL8gJti8+aAm76XUQh2KmMtJkGHrHh6vBSvjdA+O7TOnuOZJYaSndjmDsnvDuI1g1FS3HFKOBzOl5qeBKLJYg0dj048YG6t2rqIoFmYc90w3rJ/DbLRi4O1AF6rFe8ans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPFVHc2j; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725357600; x=1756893600;
  h=date:from:to:cc:subject:message-id;
  bh=h2nB4lM0Okl69svsvpsWjs97LkFpv2sAxp7zj3EyyB0=;
  b=FPFVHc2j4ZKRX76ZBpFhMm7nOPCEMwgolhYn94MmbYdoNvsgiVyB/ApR
   /LJE2NE9celplJidLsTsSc5GJBTDtbTPscPsKrO9k/SCRtJTwVGEJNuCD
   yS/QhoHvJk9YXubFzdpvAOosZGmLLoSvqdTu5vcwZBtEhv+Z8uGLEW4jt
   SrioymDBN2zI/TaEV/HbVH2ThMFf8S7G7uyjkuSMNfU3dLXwVHjqCBk+i
   T83xyl+jCdZznsvjHEgQu5cGwCb+fZtbSQztapql6YcuSsWpNmjUz+6gw
   UJXuY+wbvBr+VjgL+tskeuYrfR1AHOoFRjZSZzL5IpsoCUmD25doLYtIc
   Q==;
X-CSE-ConnectionGUID: dZGHGjBURqCZ1pPw28sZKw==
X-CSE-MsgGUID: Z8PxXY1ERkmvr0RcY6M5wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24061660"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="24061660"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 02:59:58 -0700
X-CSE-ConnectionGUID: JISZajPHTOqATF/AOUVyzw==
X-CSE-MsgGUID: ENF/DzH/R0eyq7VdkX7f5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="95655161"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Sep 2024 02:59:56 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slQKI-0006Ti-0j;
	Tue, 03 Sep 2024 09:59:54 +0000
Date: Tue, 03 Sep 2024 17:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 3aeccbe08171b79f82fb802393a6324c7b732669
Message-ID: <202409031723.47pifyIQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 3aeccbe08171b79f82fb802393a6324c7b732669  clk: renesas: r9a09g057: Add clock and reset entries for GTM/RIIC/SDHI/WDT

elapsed time: 1407m

configs tested: 169
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arc                        nsim_700_defconfig   clang-20
arc                        nsimosci_defconfig   clang-20
arc                   randconfig-001-20240903   clang-20
arc                   randconfig-002-20240903   clang-20
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                     davinci_all_defconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                      jornada720_defconfig   clang-20
arm                   randconfig-001-20240903   clang-20
arm                   randconfig-002-20240903   clang-20
arm                   randconfig-003-20240903   clang-20
arm                   randconfig-004-20240903   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240903   clang-20
arm64                 randconfig-002-20240903   clang-20
arm64                 randconfig-003-20240903   clang-20
arm64                 randconfig-004-20240903   clang-20
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240903   clang-20
csky                  randconfig-002-20240903   clang-20
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
hexagon               randconfig-001-20240903   clang-20
hexagon               randconfig-002-20240903   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240903   gcc-12
i386         buildonly-randconfig-002-20240903   gcc-12
i386         buildonly-randconfig-003-20240903   gcc-12
i386         buildonly-randconfig-004-20240903   gcc-12
i386         buildonly-randconfig-005-20240903   gcc-12
i386         buildonly-randconfig-006-20240903   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240903   gcc-12
i386                  randconfig-002-20240903   gcc-12
i386                  randconfig-003-20240903   gcc-12
i386                  randconfig-004-20240903   gcc-12
i386                  randconfig-005-20240903   gcc-12
i386                  randconfig-006-20240903   gcc-12
i386                  randconfig-011-20240903   gcc-12
i386                  randconfig-012-20240903   gcc-12
i386                  randconfig-013-20240903   gcc-12
i386                  randconfig-014-20240903   gcc-12
i386                  randconfig-015-20240903   gcc-12
i386                  randconfig-016-20240903   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240903   clang-20
loongarch             randconfig-002-20240903   clang-20
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                         db1xxx_defconfig   clang-20
mips                     loongson1b_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240903   clang-20
nios2                 randconfig-002-20240903   clang-20
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc                randconfig-001-20240903   clang-20
parisc                randconfig-002-20240903   clang-20
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                        fsp2_defconfig   clang-20
powerpc                       maple_defconfig   clang-20
powerpc                 mpc834x_itx_defconfig   clang-20
powerpc                      pcm030_defconfig   clang-20
powerpc               randconfig-002-20240903   clang-20
powerpc64                        alldefconfig   clang-20
powerpc64             randconfig-001-20240903   clang-20
powerpc64             randconfig-002-20240903   clang-20
powerpc64             randconfig-003-20240903   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
riscv                 randconfig-001-20240903   clang-20
riscv                 randconfig-002-20240903   clang-20
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
s390                  randconfig-001-20240903   clang-20
s390                  randconfig-002-20240903   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                ecovec24-romimage_defconfig   clang-20
sh                        edosk7760_defconfig   clang-20
sh                          r7780mp_defconfig   clang-20
sh                    randconfig-001-20240903   clang-20
sh                    randconfig-002-20240903   clang-20
sh                           se7619_defconfig   clang-20
sh                           se7721_defconfig   clang-20
sh                   sh7724_generic_defconfig   clang-20
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
sparc64               randconfig-001-20240903   clang-20
sparc64               randconfig-002-20240903   clang-20
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240903   clang-20
um                    randconfig-002-20240903   clang-20
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240903   gcc-12
x86_64       buildonly-randconfig-002-20240903   gcc-12
x86_64       buildonly-randconfig-003-20240903   gcc-12
x86_64       buildonly-randconfig-004-20240903   gcc-12
x86_64       buildonly-randconfig-005-20240903   gcc-12
x86_64       buildonly-randconfig-006-20240903   gcc-12
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240903   gcc-12
x86_64                randconfig-002-20240903   gcc-12
x86_64                randconfig-003-20240903   gcc-12
x86_64                randconfig-004-20240903   gcc-12
x86_64                randconfig-005-20240903   gcc-12
x86_64                randconfig-006-20240903   gcc-12
x86_64                randconfig-011-20240903   gcc-12
x86_64                randconfig-012-20240903   gcc-12
x86_64                randconfig-013-20240903   gcc-12
x86_64                randconfig-014-20240903   gcc-12
x86_64                randconfig-015-20240903   gcc-12
x86_64                randconfig-016-20240903   gcc-12
x86_64                randconfig-071-20240903   gcc-12
x86_64                randconfig-072-20240903   gcc-12
x86_64                randconfig-073-20240903   gcc-12
x86_64                randconfig-074-20240903   gcc-12
x86_64                randconfig-075-20240903   gcc-12
x86_64                randconfig-076-20240903   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240903   clang-20
xtensa                randconfig-002-20240903   clang-20

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

