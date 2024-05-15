Return-Path: <linux-renesas-soc+bounces-5364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8831B8C5F64
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2024 05:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B5F31F218FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2024 03:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A6E374C3;
	Wed, 15 May 2024 03:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5vfnWEy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A5A33998
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 May 2024 03:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715743700; cv=none; b=eTMf5/Ha9itG3MWwpofsliaw6STskujXB3RbmzF2mDRXClYf3Lm/6gDBo1VxfaIGPhiB+Le2/GTEJR+XIo0+KZonpGukRi8i6uUjyzc4jQjGVpTXNeOtw873xGYv+fy+cKA3nbB0LW7cqDvXCNGL7LgM5Sr21qe9NbFHh38uGUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715743700; c=relaxed/simple;
	bh=3anm00h1BFjeD4gJB3S5QB9DKw61bDm6fpAsNDpWaFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eqCZSHN/RBhSoIGNI+ttzuzHl8KqNJk+M/W7tvy2/TKD3YFl3LUdEFMPiCi7g4qsn7zY4X0KgGlB3mrx98xZznmtzePl3mBH2VSa7mlyBErJbIcSJSqp41APpSbTZOooNiohYLjp8sxUBfzLI0XSpoBgnNdv8bKwMyrB9Ox9NDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5vfnWEy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715743698; x=1747279698;
  h=date:from:to:cc:subject:message-id;
  bh=3anm00h1BFjeD4gJB3S5QB9DKw61bDm6fpAsNDpWaFA=;
  b=l5vfnWEyFEe141Vgwbx3JWNj9GDZ+oWR5VX0MAHOAKWCR3qU8UoOuu7E
   MBtgDxhGFa7sRtzRqujYgM5uS522KPn+zbLDzJNcsYeDcmNQS/dAGvGFM
   dw1KyACRHlzdkCaWLDnqNlbbMauVtaAq+6A9CgfwZwwnD7fQ/Crtn22Qu
   Zw16d2gWxTrm9vu9xHCkg/w9R3L2XbBwVLJ0SgkON9z7rxamXtZAhl1rK
   GhP5fJBIywIWKHuQ77foj4x2ywtdodDa9FYt5w3qgBX8aA90RqYFNelhI
   RwaY9uJ2ENsUTzkhDLqsCoX5tiodeRwyp17EoimCoGxJe6IFdDguc0zMw
   A==;
X-CSE-ConnectionGUID: pb8WGVrqQqGA3PC+Zaxmfw==
X-CSE-MsgGUID: L/kcJILQQyKhTQTiQc4ydQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22913775"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="22913775"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 20:28:18 -0700
X-CSE-ConnectionGUID: PHt5GNlbTySP2VdfLJIiAA==
X-CSE-MsgGUID: LG5z34+ETM+2sc1pMuHMiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="35602507"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 May 2024 20:28:17 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s75JO-000CJJ-04;
	Wed, 15 May 2024 03:28:14 +0000
Date: Wed, 15 May 2024 11:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 af4e3adde4c0cf0d02762a1286fc777efbfd9d10
Message-ID: <202405151149.Kb2KEqoo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: af4e3adde4c0cf0d02762a1286fc777efbfd9d10  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 734m

configs tested: 179
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240515   gcc  
arc                   randconfig-002-20240515   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                            mps2_defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                   randconfig-001-20240515   clang
arm                   randconfig-002-20240515   gcc  
arm                   randconfig-003-20240515   clang
arm                   randconfig-004-20240515   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240515   gcc  
arm64                 randconfig-002-20240515   clang
arm64                 randconfig-003-20240515   clang
arm64                 randconfig-004-20240515   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240515   gcc  
csky                  randconfig-002-20240515   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240515   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240515   gcc  
i386         buildonly-randconfig-002-20240515   gcc  
i386         buildonly-randconfig-003-20240515   gcc  
i386         buildonly-randconfig-004-20240515   gcc  
i386         buildonly-randconfig-005-20240515   gcc  
i386         buildonly-randconfig-006-20240515   clang
i386                                defconfig   clang
i386                  randconfig-001-20240515   clang
i386                  randconfig-002-20240515   gcc  
i386                  randconfig-003-20240515   gcc  
i386                  randconfig-004-20240515   gcc  
i386                  randconfig-005-20240515   clang
i386                  randconfig-006-20240515   gcc  
i386                  randconfig-011-20240515   clang
i386                  randconfig-012-20240515   gcc  
i386                  randconfig-013-20240515   clang
i386                  randconfig-014-20240515   gcc  
i386                  randconfig-015-20240515   gcc  
i386                  randconfig-016-20240515   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240515   gcc  
loongarch             randconfig-002-20240515   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           gcw0_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240515   gcc  
nios2                 randconfig-002-20240515   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240515   gcc  
parisc                randconfig-002-20240515   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240515   clang
powerpc               randconfig-002-20240515   clang
powerpc               randconfig-003-20240515   gcc  
powerpc                      tqm8xx_defconfig   clang
powerpc64             randconfig-001-20240515   gcc  
powerpc64             randconfig-002-20240515   clang
powerpc64             randconfig-003-20240515   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240515   clang
riscv                 randconfig-002-20240515   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240515   clang
s390                  randconfig-002-20240515   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240515   gcc  
sh                    randconfig-002-20240515   gcc  
sh                          rsk7269_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240515   gcc  
sparc64               randconfig-002-20240515   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240515   gcc  
um                    randconfig-002-20240515   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240515   gcc  
x86_64       buildonly-randconfig-002-20240515   gcc  
x86_64       buildonly-randconfig-003-20240515   clang
x86_64       buildonly-randconfig-004-20240515   clang
x86_64       buildonly-randconfig-005-20240515   clang
x86_64       buildonly-randconfig-006-20240515   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240515   gcc  
x86_64                randconfig-002-20240515   clang
x86_64                randconfig-003-20240515   clang
x86_64                randconfig-004-20240515   clang
x86_64                randconfig-005-20240515   clang
x86_64                randconfig-006-20240515   clang
x86_64                randconfig-011-20240515   clang
x86_64                randconfig-012-20240515   clang
x86_64                randconfig-013-20240515   gcc  
x86_64                randconfig-014-20240515   gcc  
x86_64                randconfig-015-20240515   clang
x86_64                randconfig-016-20240515   clang
x86_64                randconfig-071-20240515   gcc  
x86_64                randconfig-072-20240515   gcc  
x86_64                randconfig-073-20240515   gcc  
x86_64                randconfig-074-20240515   clang
x86_64                randconfig-075-20240515   clang
x86_64                randconfig-076-20240515   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240515   gcc  
xtensa                randconfig-002-20240515   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

