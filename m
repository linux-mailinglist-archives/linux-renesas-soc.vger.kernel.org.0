Return-Path: <linux-renesas-soc+bounces-22269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90761B98131
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9344019C7C80
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 02:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8A183A14;
	Wed, 24 Sep 2025 02:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORS1TJmw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5165834BA36
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 02:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758681250; cv=none; b=G/yeEf8Ua00qMaCaZkwQ3X7dBZjdoMjAo/wcfXW69JDmbrNibkJEtdprNnzckKnWfX+vt6Zd7YQivzleIOs1ox0JYtihyKfvB1ZE8wU8SMJmcFsjNEBRYc3LU9ObfAd9dKTrWUkVQI+l+MFXpV6vERSSp8TGFggmutKw42Jxu1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758681250; c=relaxed/simple;
	bh=JNHjntzkXn/nZLjrqKTd8dX3dbMkeqHkNFG0kjapDxQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m8sJw2e628IEVHdnB6PleTv1D/PNdr+kJMWdTgo1VHeT/eD+jJEpZs84b961c+9j8usa/zZNFMTEQvcUZScYG+ntVWPrXdztIG03fEjrYYMXYzsD7zxzjB0lHMCOCHxaqcG8RN3zMfsbgU6V2Wb1HuuILxdcvN9vCYtnXRze06M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORS1TJmw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758681248; x=1790217248;
  h=date:from:to:cc:subject:message-id;
  bh=JNHjntzkXn/nZLjrqKTd8dX3dbMkeqHkNFG0kjapDxQ=;
  b=ORS1TJmwvwXI737Hyp26qDXJOa/LiLi+mYh5L1LTPpOG4MhT+pMQuD3F
   8X1Jk56dsZU1xT9v1LJBtPGxiSMUKQRqlMuxZZKARsqRIcg2Jfz43VSbj
   vJAGXZ/uc0PvccDIkuclpF6Z5y4ALLBuUssFJVhr52DiZEv6n8FRrM99h
   6LYir9Bf1w3MADKZ+Ijzf7n/OkgSq91TjSkRN/eZb8G0Arq0M2lBoowCt
   3pqgL3v3eqAqt2ukOKQjO/Zh74ZnLPZWGtV4EP2X8b2/7Nsa0OskMRBT7
   KJbba6KZxMGWowBjK72vU3JgdZj83vVF1YKb7kVEm3jCiW5Yjd5qL/OL4
   Q==;
X-CSE-ConnectionGUID: QWCL5xPpRUqAB+5yiy7pdQ==
X-CSE-MsgGUID: 8fBvsaS/TUCDX52bUXnRIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60186763"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="60186763"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 19:34:07 -0700
X-CSE-ConnectionGUID: dO91qza0QiuHWW4yubbw/g==
X-CSE-MsgGUID: jSO7yPDfTtiTsL3Fy7e/5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="207855266"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2025 19:34:06 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1FKW-0003k1-1J;
	Wed, 24 Sep 2025 02:34:04 +0000
Date: Wed, 24 Sep 2025 10:33:22 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 dcaa18d605e31efd33384813a9f342e72826756d
Message-ID: <202509241012.Z0lDyZjV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: dcaa18d605e31efd33384813a9f342e72826756d  Merge branch 'renesas-dts-for-v6.19' into renesas-devel

elapsed time: 1085m

configs tested: 119
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                          axs103_defconfig    gcc-15.1.0
arc                   randconfig-001-20250923    gcc-12.5.0
arc                   randconfig-002-20250923    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         orion5x_defconfig    clang-22
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20250923    gcc-12.5.0
arm                   randconfig-002-20250923    clang-17
arm                   randconfig-003-20250923    gcc-8.5.0
arm                   randconfig-004-20250923    clang-22
arm                       versatile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250923    gcc-8.5.0
arm64                 randconfig-002-20250923    clang-18
arm64                 randconfig-003-20250923    gcc-8.5.0
arm64                 randconfig-004-20250923    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250923    gcc-9.5.0
csky                  randconfig-002-20250923    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250923    clang-22
hexagon               randconfig-002-20250923    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250923    gcc-14
i386        buildonly-randconfig-002-20250923    clang-20
i386        buildonly-randconfig-003-20250923    clang-20
i386        buildonly-randconfig-004-20250923    gcc-14
i386        buildonly-randconfig-005-20250923    clang-20
i386        buildonly-randconfig-006-20250923    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250923    gcc-15.1.0
loongarch             randconfig-002-20250923    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          multi_defconfig    gcc-15.1.0
microblaze                       alldefconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250923    gcc-11.5.0
nios2                 randconfig-002-20250923    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250923    gcc-15.1.0
parisc                randconfig-002-20250923    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250923    gcc-8.5.0
powerpc               randconfig-002-20250923    clang-16
powerpc               randconfig-003-20250923    gcc-12.5.0
powerpc64             randconfig-001-20250923    gcc-10.5.0
powerpc64             randconfig-002-20250923    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250923    gcc-12.5.0
riscv                 randconfig-002-20250923    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250923    gcc-8.5.0
s390                  randconfig-002-20250923    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250923    gcc-15.1.0
sh                    randconfig-002-20250923    gcc-10.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250923    gcc-8.5.0
sparc                 randconfig-002-20250923    gcc-12.5.0
sparc64               randconfig-001-20250923    clang-22
sparc64               randconfig-002-20250923    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250923    clang-22
um                    randconfig-002-20250923    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250923    gcc-14
x86_64      buildonly-randconfig-002-20250923    gcc-14
x86_64      buildonly-randconfig-003-20250923    gcc-14
x86_64      buildonly-randconfig-004-20250923    clang-20
x86_64      buildonly-randconfig-005-20250923    clang-20
x86_64      buildonly-randconfig-006-20250923    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250923    gcc-8.5.0
xtensa                randconfig-002-20250923    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

