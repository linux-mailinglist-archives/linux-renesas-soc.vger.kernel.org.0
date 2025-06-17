Return-Path: <linux-renesas-soc+bounces-18409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29869ADBE95
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 03:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8B38174F99
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 01:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB861514F6;
	Tue, 17 Jun 2025 01:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1W3N/cW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BFC7483
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jun 2025 01:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124130; cv=none; b=uGaA+0qWBcdE70uLugJPIX8vCbvvwJCA4B3Qqx2ATDAF37f76Ep3NA7U/lKOE1IYSNx1nH//PIpofFglpVV7Eemcvof4whwlzzIZyMCxbt9vnx0bI3oMbK7hEnvvxvyU16qo/hp0TPMw8kOVC6jXS5fvYmsw10+J09086paZCtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124130; c=relaxed/simple;
	bh=JdBlgI81hkxf6+1AX4q9/hvQC8jGxWDgU1JF1MoIok8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SBwsrLNaaaODhMdIqGJInseCcBO8gxYl0S8NewfB4DdK1blm25TGNYri45AoQoeh6ri6ONO+TeV0rDwkzKbTeWAgaI2ues0bWWcWyPkldmSeEH/O3w5yZFYLKNcel+KFPbL10odYUyA34n91rockFDQZTsoGjsUZ3uPAXY/j/dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1W3N/cW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124129; x=1781660129;
  h=date:from:to:cc:subject:message-id;
  bh=JdBlgI81hkxf6+1AX4q9/hvQC8jGxWDgU1JF1MoIok8=;
  b=B1W3N/cWhBip04lZ/BribXsW26Wq1lr69rYtkTjmnqCnKra3UoItRwcM
   dDcIjdlcwYHoJS+4+1ZUiaAzygvtfjXzNyjhAboXsIMjG2JXMvZCOhh9B
   etL9JFm6eMzG0eymNfwVOM4DHUnEC1M/ouQ28rcgzdjD/P9PGoxkbp3sY
   t3Wf9yEhGo4IylYTzYnyHOntr79WFFQ+I6+oFNtwS+7XpTFYyPVgVBfeC
   ebJus9h2kBT65w9utOpdeqbwRE0ycNW1Vzsi1Ia2DMNGu+gfcwmDBsO1/
   gpbQs1l76CUK9z6F0QvBEzuW8UpiHRzUI/UDG2B0GUOlVKhFL1cX+p36X
   w==;
X-CSE-ConnectionGUID: /M+GXigrSju7XQWUhAGT7Q==
X-CSE-MsgGUID: pY1xXf7IRiaiWsh3dyi8aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52419514"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="52419514"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:35:28 -0700
X-CSE-ConnectionGUID: NuFRa219Q2ucaK1rhK5nxw==
X-CSE-MsgGUID: 20fJFehXSfCv8sUnhVAZeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148619927"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jun 2025 18:35:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRLES-000FU0-0i;
	Tue, 17 Jun 2025 01:35:24 +0000
Date: Tue, 17 Jun 2025 09:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.16-rc1]
 BUILD SUCCESS 10b98ce46d188419d958674bb09e3dd30f3a291b
Message-ID: <202506170940.b9whlYGq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.16-rc1
branch HEAD: 10b98ce46d188419d958674bb09e3dd30f3a291b  arm64: dts: renesas: white-hawk-single: cn3006: Add overlay for MSIOF2

elapsed time: 733m

configs tested: 140
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250616    gcc-15.1.0
arc                   randconfig-002-20250616    gcc-15.1.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                         at91_dt_defconfig    clang-21
arm                          exynos_defconfig    clang-21
arm                          gemini_defconfig    clang-20
arm                           h3600_defconfig    gcc-15.1.0
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20250616    gcc-12.4.0
arm                   randconfig-002-20250616    gcc-15.1.0
arm                   randconfig-003-20250616    clang-21
arm                   randconfig-004-20250616    clang-21
arm64                            alldefconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250616    gcc-8.5.0
arm64                 randconfig-002-20250616    gcc-15.1.0
arm64                 randconfig-003-20250616    clang-19
arm64                 randconfig-004-20250616    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250616    gcc-13.3.0
csky                  randconfig-002-20250616    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250616    clang-21
hexagon               randconfig-002-20250616    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250616    gcc-12
i386        buildonly-randconfig-002-20250616    gcc-11
i386        buildonly-randconfig-003-20250616    clang-20
i386        buildonly-randconfig-004-20250616    gcc-12
i386        buildonly-randconfig-005-20250616    gcc-12
i386        buildonly-randconfig-006-20250616    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250616    gcc-15.1.0
loongarch             randconfig-002-20250616    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5275evb_defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        omega2p_defconfig    clang-21
mips                          rb532_defconfig    clang-18
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250616    gcc-8.5.0
nios2                 randconfig-002-20250616    gcc-10.5.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250616    gcc-8.5.0
parisc                randconfig-002-20250616    gcc-9.3.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      bamboo_defconfig    clang-21
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc                 linkstation_defconfig    clang-20
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc               randconfig-001-20250616    clang-21
powerpc               randconfig-002-20250616    clang-21
powerpc               randconfig-003-20250616    clang-21
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250616    gcc-8.5.0
powerpc64             randconfig-002-20250616    clang-21
powerpc64             randconfig-003-20250616    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250616    clang-19
riscv                 randconfig-002-20250616    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250616    gcc-11.5.0
s390                  randconfig-002-20250616    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-15.1.0
sh                     magicpanelr2_defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20250616    gcc-12.4.0
sh                    randconfig-002-20250616    gcc-12.4.0
sh                           se7619_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250616    gcc-13.3.0
sparc                 randconfig-002-20250616    gcc-8.5.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250616    gcc-13.3.0
sparc64               randconfig-002-20250616    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250616    clang-20
um                    randconfig-002-20250616    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250616    clang-20
x86_64      buildonly-randconfig-002-20250616    clang-20
x86_64      buildonly-randconfig-003-20250616    clang-20
x86_64      buildonly-randconfig-004-20250616    clang-20
x86_64      buildonly-randconfig-005-20250616    gcc-12
x86_64      buildonly-randconfig-006-20250616    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  cadence_csp_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250616    gcc-13.3.0
xtensa                randconfig-002-20250616    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

