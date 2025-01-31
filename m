Return-Path: <linux-renesas-soc+bounces-12768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1CFA23845
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 01:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D51E416404F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 00:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57E49479;
	Fri, 31 Jan 2025 00:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Es+yEPOS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3833ECF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Jan 2025 00:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738283621; cv=none; b=Mx2VyHZoipqx6K4M6PUTC4bdebSPN5XaEdJTbHnfTXlpL/aMwfYl1pIKaBlzJyuFAjoDVuBW/eD1Q3+n7/l/TUQmRVLSWnZ6EU4tQ75uasLehoXLH68u8FvKchiTT7/DmiqLQDCqOKPv4MYB/bO4bSnZvdwI98S3YUcm/Z1s3GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738283621; c=relaxed/simple;
	bh=wh+S/nnaSlX1WcviUNZ1Axr4jaZDoit5U6jF/OnkrZw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uUs816Z/LdoPxek0V0on4xtYwBHXuduZ2JDzSr8d77e18zyNGPHhF+TAf45AJZXeQoxZGAM+zb4hDwelLHUr4g3lnzcumyJMa7lHjEq1XNsVh+cEGHVFM4QLJcQ8l+CTsSL5tbr3aHHxxxBhd1gSj0jDrEtfcoTLO53WH4e+pOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Es+yEPOS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738283619; x=1769819619;
  h=date:from:to:cc:subject:message-id;
  bh=wh+S/nnaSlX1WcviUNZ1Axr4jaZDoit5U6jF/OnkrZw=;
  b=Es+yEPOSUJ576e68GFEHbGpMtM+VHYMEl3RfHfMA8ZJZ7cYE2l95L/Ss
   YGPnI8bZFoGIsgKzyui2siUrNQpKIQqdrRWAP4/4nDV/QvwmxMPpdyyum
   RVcIy3Q3attOxSEHPAglEqzU7136KGmQH0DEdu1ThfjG5Sp7iQjegyDra
   iQ0dbPVok1RJZrtChOToIIpRhsaXjq/eRnxqAB/vnxVJp2gYbrHhbETOe
   Hn4vcHK54PER7hPll1Dy46z//50vHh4WLFd+HgGbtA2lHVPmgISJ9d5Vs
   Yx8wpiF0zjVpYSiZdPdvwwRqVPITL9YbhrsrWyLEhWv1tFbi1x08Br++x
   Q==;
X-CSE-ConnectionGUID: 3Jy2NsNlQnyH8yuUuYaU8A==
X-CSE-MsgGUID: UGgZ44FPQYahcwK6HVag4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="64218038"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; 
   d="scan'208";a="64218038"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 16:33:39 -0800
X-CSE-ConnectionGUID: xUDDD4LVQHuGewawBXIuPA==
X-CSE-MsgGUID: VIlR273QTjC2SqwKdARWNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; 
   d="scan'208";a="109440498"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Jan 2025 16:33:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdeyV-000lSV-2u;
	Fri, 31 Jan 2025 00:33:35 +0000
Date: Fri, 31 Jan 2025 08:32:54 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.15] BUILD
 SUCCESS 4e8a5f545765a036e7b0e65872b0efce45a043ee
Message-ID: <202501310848.D41OmVjj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.15
branch HEAD: 4e8a5f545765a036e7b0e65872b0efce45a043ee  soc: renesas: r9a09g057-sys: Add a callback to print SoC-specific extra features

elapsed time: 787m

configs tested: 120
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250130    gcc-13.2.0
arc                   randconfig-002-20250130    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250130    gcc-14.2.0
arm                   randconfig-002-20250130    clang-20
arm                   randconfig-003-20250130    gcc-14.2.0
arm                   randconfig-004-20250130    clang-20
arm                        realview_defconfig    clang-19
arm                        shmobile_defconfig    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250130    clang-20
arm64                 randconfig-002-20250130    gcc-14.2.0
arm64                 randconfig-003-20250130    clang-20
arm64                 randconfig-004-20250130    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250130    gcc-14.2.0
csky                  randconfig-002-20250130    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250130    clang-20
hexagon               randconfig-002-20250130    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250130    clang-19
i386        buildonly-randconfig-002-20250130    clang-19
i386        buildonly-randconfig-003-20250130    gcc-11
i386        buildonly-randconfig-004-20250130    gcc-12
i386        buildonly-randconfig-005-20250130    gcc-12
i386        buildonly-randconfig-006-20250130    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250130    gcc-14.2.0
loongarch             randconfig-002-20250130    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
mips                           jazz_defconfig    clang-21
nios2                 randconfig-001-20250130    gcc-14.2.0
nios2                 randconfig-002-20250130    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250130    gcc-14.2.0
parisc                randconfig-002-20250130    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250130    gcc-14.2.0
powerpc               randconfig-002-20250130    clang-16
powerpc               randconfig-003-20250130    gcc-14.2.0
powerpc64             randconfig-001-20250130    gcc-14.2.0
powerpc64             randconfig-002-20250130    clang-21
powerpc64             randconfig-003-20250130    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250131    clang-19
riscv                 randconfig-002-20250131    clang-21
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250131    clang-16
s390                  randconfig-002-20250131    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250131    gcc-14.2.0
sh                    randconfig-002-20250131    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250131    gcc-14.2.0
sparc                 randconfig-002-20250131    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250131    gcc-14.2.0
sparc64               randconfig-002-20250131    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250131    clang-19
um                    randconfig-002-20250131    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250130    clang-19
x86_64      buildonly-randconfig-002-20250130    gcc-12
x86_64      buildonly-randconfig-003-20250130    gcc-12
x86_64      buildonly-randconfig-004-20250130    clang-19
x86_64      buildonly-randconfig-005-20250130    gcc-12
x86_64      buildonly-randconfig-006-20250130    gcc-12
x86_64                              defconfig    gcc-11
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                  nommu_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250131    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

