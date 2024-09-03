Return-Path: <linux-renesas-soc+bounces-8675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1FD96AC79
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 00:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F3AD1C2480E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 22:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F9B1D58B3;
	Tue,  3 Sep 2024 22:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICZ9ZXME"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6B21A4E82
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 22:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725403550; cv=none; b=Sva/k9eGiSXO7GEdRrG8Ur6XpE7YMx0TMU5MMIiV2OpvYvEeisQFQWxtxjoNOl6JD1r6qD/EL9Utir7CKhSw4MCVnbydRivtKxR+UZwSJyFxnXozdu29zMXFdk1DuHlFb53oD0mq31hlUgxrNFqR21uKOLAqaGRCwgMQjahoo04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725403550; c=relaxed/simple;
	bh=PoTqhLT9f1IHs7PTtcRwkBEjnsubQ7O+1wahw7sX8g4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XZlufUmNrIIBkLY3/8zUimFnZ32VFM90VpgsQga6rh5ErZYCAa6vt3uvTYSau/bpNu0ufFWfKt5/7MzEG//CN821iRJOggB3rgIYM9EJU9DVeuXkLGxECj5M8TCQiTIqu8/0MhGCSSFhCJyRNyb8o3DxJ4NuGmDckR/nlb67LP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICZ9ZXME; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725403549; x=1756939549;
  h=date:from:to:cc:subject:message-id;
  bh=PoTqhLT9f1IHs7PTtcRwkBEjnsubQ7O+1wahw7sX8g4=;
  b=ICZ9ZXMEFlgx86PRIk9d7yS4B8w38F/km/k6TRm7ZY5/o5I/PJGzFzVS
   NrF2JAyzGaQKNu6NK9uxXqB2HRYX9VwfZU4Dj9gBIxt6rO4JzZu1dyKdI
   IEqPhueJRZaFSrMR+7YogANXyxBlDOyGfpDrGoFv/SsSQtWIQCF7JN66A
   GNvK5xPlSKauLYL12b9F441lq6np1w8vzWyvp0uOE3ICU9u7ujc/pR1T3
   phC2TFCivWVYu6swlRNtEhBX3KM4hSWIBPaJboMt3DRPN5sU4+nJA0U9/
   oJva71N9fQFRpuSPor8Z9J3LBZxbOW0u3+dwKNqovO8e17eVgsB8P4bqn
   g==;
X-CSE-ConnectionGUID: tBQ7SHrpTFy20rqfkuAR1Q==
X-CSE-MsgGUID: EU/kNEdHT4m8M63KzYwB3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23547676"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="23547676"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 15:45:38 -0700
X-CSE-ConnectionGUID: sK7M2oTjSya2t6DGlzYlLA==
X-CSE-MsgGUID: jEAWpYRGSFuqtx4kY9NlUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="65306221"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Sep 2024 15:45:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slcHG-0007Ia-2w;
	Tue, 03 Sep 2024 22:45:34 +0000
Date: Wed, 04 Sep 2024 06:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.12] BUILD SUCCESS
 cc41aa93bbafdfe4c4c9026d307adbb89c1d80fa
Message-ID: <202409040654.0z5ghNNj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.12
branch HEAD: cc41aa93bbafdfe4c4c9026d307adbb89c1d80fa  arm64: dts: renesas: r8a779h0: Add family fallback for CSISP IP

elapsed time: 788m

configs tested: 117
configs skipped: 3

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
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                     am200epdkit_defconfig   clang-20
arm                         assabet_defconfig   clang-20
arm                         axm55xx_defconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                      jornada720_defconfig   clang-20
arm                        spear3xx_defconfig   clang-20
arm                        spear6xx_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386                                defconfig   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                        m5407c3_defconfig   clang-20
m68k                       m5475evb_defconfig   clang-20
m68k                           virt_defconfig   clang-20
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                           ip28_defconfig   clang-20
mips                     loongson2k_defconfig   clang-20
mips                      malta_kvm_defconfig   clang-20
mips                         rt305x_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                        icon_defconfig   clang-20
powerpc                  mpc885_ads_defconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sparc                            allmodconfig   gcc-14.1.0
sparc64                          alldefconfig   clang-20
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240904   clang-18
x86_64       buildonly-randconfig-002-20240904   clang-18
x86_64       buildonly-randconfig-003-20240904   clang-18
x86_64       buildonly-randconfig-004-20240904   clang-18
x86_64       buildonly-randconfig-005-20240904   clang-18
x86_64       buildonly-randconfig-006-20240904   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240904   clang-18
x86_64                randconfig-002-20240904   clang-18
x86_64                randconfig-003-20240904   clang-18
x86_64                randconfig-004-20240904   clang-18
x86_64                randconfig-005-20240904   clang-18
x86_64                randconfig-006-20240904   clang-18
x86_64                randconfig-011-20240904   clang-18
x86_64                randconfig-012-20240904   clang-18
x86_64                randconfig-013-20240904   clang-18
x86_64                randconfig-014-20240904   clang-18
x86_64                randconfig-015-20240904   clang-18
x86_64                randconfig-016-20240904   clang-18
x86_64                randconfig-071-20240904   clang-18
x86_64                randconfig-072-20240904   clang-18
x86_64                randconfig-073-20240904   clang-18
x86_64                randconfig-074-20240904   clang-18
x86_64                randconfig-075-20240904   clang-18
x86_64                randconfig-076-20240904   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

