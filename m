Return-Path: <linux-renesas-soc+bounces-25181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DD2C8A011
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 14:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A5298343C07
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 13:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81472E22BA;
	Wed, 26 Nov 2025 13:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nthTLz1e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC2326D4F9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 13:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764163558; cv=none; b=AXtJJJ27m2hzLY+HAuMAPjQrtl6KNeJzd3P8umm2f9mMs+QoFYwx/kvZ6eNJ3zxoqhALKByPA0UgPgLQA7uV7t31mNVqtXP7TOFYZjViGTRcw5sjkAaMfEaVNjfDFS+0MuDvXqqpZ/1A3zUEihpMmGha1rdm9d7wXnPg8zx7cQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764163558; c=relaxed/simple;
	bh=nezJCauXnOc+MFVfXiJW/Zarc/0WC9jHnbq1r/PoJYc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NbNZJIAQwULDb6HyYx956AgpPLYXvE31KbUeIe9//ejDCLlHK8UKNYRNldNteUbBNIpK34yFbSRGvhepzWZyzcq5E7VaC1Svi7/hkUSe4DHJN6nhvbagG1EW03AS5goI0paDhkghcLFZtNQ+H9NZHrWvAJBZoul0z/2jGlQFpW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nthTLz1e; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764163557; x=1795699557;
  h=date:from:to:cc:subject:message-id;
  bh=nezJCauXnOc+MFVfXiJW/Zarc/0WC9jHnbq1r/PoJYc=;
  b=nthTLz1eRhBkilSvGI6h0lWv5zTe3wMzlFG5cpqMS4scPXkeIORgzbDb
   kjryyc25ITX2yWD50FeYu4AvDs2/c9OhuDeJt4Z3yC/f3jjsLkFN8RSzJ
   mSjyjd5W8UZXy8BGwMY/rJFWc3ljw9XwjTu7ksjx5K2jDckar6BX9OcD/
   AVxAUtvjnGcuHcwwR6bDkxO3Ze3kifML34CbxCp+c7xFOxtimODpVW0P6
   /jWiId8YG924STRbU073rtga7IF4vR2T2qqEpeXuAyXYhHoSYDG/oKZeE
   6RmjsmX65qabwu/rRRoBvfHC7M1BcvHymu7bR7BElbNR2ou69Wd/ezlsO
   g==;
X-CSE-ConnectionGUID: A/BEqL/vRBqAgYGMK/dyRA==
X-CSE-MsgGUID: wBAFkiMtRBC5hRUIKWi7ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65387020"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="65387020"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 05:25:56 -0800
X-CSE-ConnectionGUID: a5E/4iJqQ9GcfTtQDyCSeg==
X-CSE-MsgGUID: iYe5eypSRZSUhDRXSZ+dng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192580665"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Nov 2025 05:25:56 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOFWr-000000002vJ-1Kwg;
	Wed, 26 Nov 2025 13:25:53 +0000
Date: Wed, 26 Nov 2025 21:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 9b024363ae70bd46815e448f5d29f2dc774fb012
Message-ID: <202511262113.9JU5wr4p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 9b024363ae70bd46815e448f5d29f2dc774fb012  Merge branch 'renesas-dts-for-v6.20' into renesas-devel

elapsed time: 1655m

configs tested: 97
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20251125    gcc-9.5.0
arc                   randconfig-002-20251125    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251125    clang-22
arm                   randconfig-002-20251125    gcc-10.5.0
arm                   randconfig-003-20251125    gcc-10.5.0
arm                   randconfig-004-20251125    gcc-8.5.0
arm                        spear6xx_defconfig    clang-22
arm64                            alldefconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251125    clang-19
hexagon               randconfig-002-20251125    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251126    clang-20
i386        buildonly-randconfig-002-20251126    gcc-14
i386        buildonly-randconfig-003-20251126    clang-20
i386        buildonly-randconfig-004-20251126    clang-20
i386        buildonly-randconfig-005-20251126    clang-20
i386        buildonly-randconfig-006-20251126    gcc-14
i386                  randconfig-001-20251126    clang-20
i386                  randconfig-002-20251126    clang-20
i386                  randconfig-003-20251126    gcc-14
i386                  randconfig-004-20251126    clang-20
i386                  randconfig-005-20251126    gcc-14
i386                  randconfig-006-20251126    gcc-14
i386                  randconfig-007-20251126    clang-20
i386                  randconfig-011-20251126    gcc-14
i386                  randconfig-012-20251126    gcc-14
i386                  randconfig-014-20251126    gcc-14
i386                  randconfig-016-20251126    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251125    gcc-15.1.0
loongarch             randconfig-002-20251125    gcc-12.5.0
m68k                              allnoconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                            q40_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        omega2p_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251125    gcc-8.5.0
nios2                 randconfig-002-20251125    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251125    gcc-13.4.0
parisc                randconfig-002-20251125    gcc-10.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       eiger_defconfig    clang-22
powerpc               randconfig-001-20251125    clang-19
powerpc               randconfig-002-20251125    gcc-8.5.0
powerpc64             randconfig-002-20251125    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251125    gcc-8.5.0
riscv                 randconfig-002-20251125    gcc-13.4.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251125    gcc-8.5.0
s390                  randconfig-002-20251125    gcc-14.3.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251125    gcc-15.1.0
sh                    randconfig-002-20251125    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251126    gcc-8.5.0
sparc                 randconfig-002-20251126    gcc-14.3.0
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
x86_64                randconfig-001-20251126    clang-20
x86_64                randconfig-002-20251126    gcc-14
x86_64                randconfig-003-20251126    clang-20
x86_64                randconfig-004-20251126    gcc-14
x86_64                randconfig-005-20251126    gcc-12
x86_64                randconfig-006-20251126    clang-20
x86_64                randconfig-013-20251126    gcc-14
x86_64                randconfig-015-20251126    clang-20
x86_64                randconfig-016-20251126    clang-20
x86_64                randconfig-072-20251126    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251126    gcc-14.3.0
xtensa                randconfig-002-20251126    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

