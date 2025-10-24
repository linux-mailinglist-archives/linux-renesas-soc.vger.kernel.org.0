Return-Path: <linux-renesas-soc+bounces-23592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6446AC07C10
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 20:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C795B19A419C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 18:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8872330EF80;
	Fri, 24 Oct 2025 18:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LuTtPU8x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB6B347FEE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 18:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761330602; cv=none; b=Lao2M/Wbn45s7PfwUsI/TiCzccuCbYCVghzheO0JQJVxAsSvkppiK3oDS1Ua+pRHQtz9WkexM+PQPmTCeqpcwKsCtzxbqq//OjIpGCOGkrtUMJlLnUkCH/A+fBPnvCAXRne8VDTRu9F6njyXF2u1leHvLCPR7Ye0ojdmNwdZEz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761330602; c=relaxed/simple;
	bh=L8uFTRxsqnQ/zdt8k8di9yBfAsObc4cGtmLcdTay8Bs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ASkIrGgzn+fG+u/dNIBdmH9ZhiQqw4WJXv0KNw7YYXk9c924W2ErhHG2wPy/b9IJ9T6jIXaC4tA7y7xfeR5XzS0Y0wtOoUtK14Uc/qoeSHGx/UuhS2ZoOSlV2ThjINqLgHovVP6wdkYjYSrr+pETZnrwAkjtudeRjrA9qGRUAV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LuTtPU8x; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761330600; x=1792866600;
  h=date:from:to:cc:subject:message-id;
  bh=L8uFTRxsqnQ/zdt8k8di9yBfAsObc4cGtmLcdTay8Bs=;
  b=LuTtPU8x+SBPb4YXrxjgiXwvPfkZIxNnmAbZu26/19iI+NClLhbPT235
   FCkgi/2VVpvONFxS9DpaZymV3SMHifupjnvlG2tgQMNP/ZRU93z7xyulA
   PXE4BDspDbQatt5mV8Ij4QxAa8Llq4Shjr2F1xnhTBUVVWlAv1kkzSBXS
   MvnQk4SvBSGNDSxXxYXFqo9T/K1PJ2ZxOu8bfIVA18EeBiGgiVhZA6YKb
   60i6jnBYdBM9ssNABUXmAV6rXKlaOcrQjGs7Lzjy6bWSzulzKlV2XYAmh
   fbDRQ571qm2IO5ULEA5Q9UhxRo3xAh+xdS2tW+nZdrI39AZUOhjQH5wM6
   w==;
X-CSE-ConnectionGUID: 6ENvjEvzTDWHV2PcmrQnyQ==
X-CSE-MsgGUID: PNgM/48BQ4K7bWB71tq14g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67350815"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67350815"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 11:29:59 -0700
X-CSE-ConnectionGUID: INSMVtpKStSHInru2K5y6w==
X-CSE-MsgGUID: As5peONHQB+Z9xJEivQe8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="188556776"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Oct 2025 11:29:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCMXz-000En5-2z;
	Fri, 24 Oct 2025 18:29:55 +0000
Date: Sat, 25 Oct 2025 02:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 ab7504170dccd87a799288de37911585f28bc13c
Message-ID: <202510250217.EW6lvZtT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: ab7504170dccd87a799288de37911585f28bc13c  Merge branches 'renesas-arm-defconfig-for-v6.19', 'renesas-drivers-for-v6.19' and 'renesas-dts-for-v6.19' into renesas-next

elapsed time: 1450m

configs tested: 114
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251024    gcc-8.5.0
arc                   randconfig-002-20251024    gcc-14.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        multi_v7_defconfig    gcc-15.1.0
arm                   randconfig-001-20251024    clang-20
arm                   randconfig-002-20251024    gcc-15.1.0
arm                   randconfig-003-20251024    clang-22
arm                   randconfig-004-20251024    clang-22
arm                       versatile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251024    gcc-8.5.0
arm64                 randconfig-002-20251024    clang-16
arm64                 randconfig-003-20251024    gcc-13.4.0
arm64                 randconfig-004-20251024    clang-17
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251024    gcc-14.3.0
csky                  randconfig-002-20251024    gcc-11.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251024    clang-22
hexagon               randconfig-002-20251024    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251024    clang-20
i386        buildonly-randconfig-002-20251024    gcc-14
i386        buildonly-randconfig-003-20251024    clang-20
i386        buildonly-randconfig-004-20251024    gcc-14
i386        buildonly-randconfig-005-20251024    gcc-14
i386        buildonly-randconfig-006-20251024    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251024    gcc-15.1.0
loongarch             randconfig-002-20251024    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
microblaze                      mmu_defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ci20_defconfig    clang-22
mips                         rt305x_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251024    gcc-11.5.0
nios2                 randconfig-002-20251024    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251024    gcc-9.5.0
parisc                randconfig-002-20251024    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251024    gcc-8.5.0
powerpc               randconfig-002-20251024    clang-17
powerpc               randconfig-003-20251024    clang-16
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251024    gcc-12.5.0
powerpc64             randconfig-002-20251024    gcc-14.3.0
powerpc64             randconfig-003-20251024    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251024    clang-22
riscv                 randconfig-002-20251024    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251024    gcc-13.4.0
s390                  randconfig-002-20251024    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251024    gcc-12.5.0
sh                    randconfig-002-20251024    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251024    gcc-12.5.0
sparc                 randconfig-002-20251024    gcc-8.5.0
sparc64               randconfig-001-20251024    clang-20
sparc64               randconfig-002-20251024    clang-22
um                                allnoconfig    clang-22
um                    randconfig-001-20251024    gcc-14
um                    randconfig-002-20251024    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251024    clang-20
x86_64      buildonly-randconfig-002-20251024    clang-20
x86_64      buildonly-randconfig-003-20251024    clang-20
x86_64      buildonly-randconfig-004-20251024    gcc-14
x86_64      buildonly-randconfig-005-20251024    gcc-14
x86_64      buildonly-randconfig-006-20251024    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251024    gcc-11.5.0
xtensa                randconfig-002-20251024    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

