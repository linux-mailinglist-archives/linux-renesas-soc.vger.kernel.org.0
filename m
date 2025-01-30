Return-Path: <linux-renesas-soc+bounces-12746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3B9A22C61
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 12:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA5EC163F12
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 11:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCC119D06B;
	Thu, 30 Jan 2025 11:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ksl6kK3K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646EC194096
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 11:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235726; cv=none; b=VhgzLVFgGU95A0gnS8ARDrLfFJHxNuTF4BNwhxMw3/Ubi2tlCG9OhjLSNizX7F1zjXNrXlWGH6jxVSc0I8466c7uqCpHctGfJI/z7/blGjBlEJN+HgVRCG+f405ekJfczGSndAd70YD5bptED4Z0u38WskkqgVAyrm6PdS2/oWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235726; c=relaxed/simple;
	bh=Y4LWXC9RStUqLANtNOmjQ94Y+Dd/DnzkW63on31qbzo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sS8oSQc22QcGMZWdsfQ7Sw/SRnepumiPlOwqijCvTNrGKMrA9hLvXC5Jm9pCvZ38ThKU9f/zpOd5RG2OYamuHaqpreNX2DMUcBOrSBuI7K6PtHcgAO5gZ3IFNzNsdYmMJ56qkvGq8qXbCD9GPltqu121jonQdcWtEQl8PTFsVPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ksl6kK3K; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738235725; x=1769771725;
  h=date:from:to:cc:subject:message-id;
  bh=Y4LWXC9RStUqLANtNOmjQ94Y+Dd/DnzkW63on31qbzo=;
  b=Ksl6kK3KxjZK1f1uH4YzsaJ3GjqMUV6LYkFCipt0NhHfk8oMyvY+cpvV
   aj7qGp9Fbb3EtF9gzEY/Fmx4F1c07x7jGEb34nu/HTugT/gFTh9X3FFpe
   pYj/KuY/9rG/M0mZOv/d5ux94WQO2S1DPjf9sLqUa+DtewMkwDtQxjJyE
   +Zv80x5WBQNOV0GDDCuv3KxW9viVsuRtOXnsdmgfPtdg4B2CuLMbUvncY
   Ongn99gFROAieMpdI50qcdKSxBQvjvvBFQXJTodxqDfIrPNs1cHzEr2u/
   UXoy7G0MWe2JvC20zv0YNlcIfhxxwi4gxm1DXxsRzYNs71L3+Kgz4gP13
   A==;
X-CSE-ConnectionGUID: B1wW3427RY6B3mapbV9NRA==
X-CSE-MsgGUID: bxDG1dc0QYut/UOI3xm0Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38654349"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="38654349"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 03:15:24 -0800
X-CSE-ConnectionGUID: BKbxpm23Tc6+KAQjJcmOGw==
X-CSE-MsgGUID: bEenwnjnTAilY1kxSLUGUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="109205841"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jan 2025 03:15:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdSW0-000jz6-1E;
	Thu, 30 Jan 2025 11:15:20 +0000
Date: Thu, 30 Jan 2025 19:15:03 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.15] BUILD
 REGRESSION 106b182b2d7f05703d27e37cbcf23a6fb652872f
Message-ID: <202501301956.DhNTfapW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.15
branch HEAD: 106b182b2d7f05703d27e37cbcf23a6fb652872f  soc: renesas: rzv2h: Add a callback to print SoC-specific extra features

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202501300600.APok2iDU-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202501300701.ujawOImj-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202501301435.kjJVK6kR-lkp@intel.com

    drivers/soc/renesas/r9a09g047-sys.c:51:13: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
    drivers/soc/renesas/r9a09g047-sys.c:51:6: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    drivers/soc/renesas/r9a09g057-sys.c:51:13: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-soc-renesas-r9a09g047-sys.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-soc-renesas-r9a09g057-sys.c:error:implicit-declaration-of-function-FIELD_GET
|-- arc-allmodconfig
|   |-- drivers-soc-renesas-r9a09g047-sys.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-soc-renesas-r9a09g057-sys.c:error:implicit-declaration-of-function-FIELD_GET
|-- arc-allyesconfig
|   |-- drivers-soc-renesas-r9a09g047-sys.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-soc-renesas-r9a09g057-sys.c:error:implicit-declaration-of-function-FIELD_GET
|-- hexagon-allmodconfig
|   `-- drivers-soc-renesas-r9a09g047-sys.c:error:call-to-undeclared-function-FIELD_GET-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- m68k-allmodconfig
|   |-- drivers-soc-renesas-r9a09g047-sys.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-soc-renesas-r9a09g057-sys.c:error:implicit-declaration-of-function-FIELD_GET
|-- m68k-allyesconfig
|   |-- drivers-soc-renesas-r9a09g047-sys.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-soc-renesas-r9a09g057-sys.c:error:implicit-declaration-of-function-FIELD_GET
|-- microblaze-allmodconfig
|   |-- drivers-soc-renesas-r9a09g047-sys.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-soc-renesas-r9a09g057-sys.c:error:implicit-declaration-of-function-FIELD_GET
|-- microblaze-allyesconfig
|   |-- drivers-soc-renesas-r9a09g047-sys.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-soc-renesas-r9a09g057-sys.c:error:implicit-declaration-of-function-FIELD_GET
|-- openrisc-allyesconfig
|   |-- drivers-soc-renesas-r9a09g047-sys.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-soc-renesas-r9a09g057-sys.c:error:implicit-declaration-of-function-FIELD_GET
|-- parisc-allmodconfig
|   |-- drivers-soc-renesas-r9a09g047-sys.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-soc-renesas-r9a09g057-sys.c:error:implicit-declaration-of-function-FIELD_GET
|-- parisc-allyesconfig
|   |-- drivers-soc-renesas-r9a09g047-sys.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-soc-renesas-r9a09g057-sys.c:error:implicit-declaration-of-function-FIELD_GET
|-- sh-allmodconfig
|   |-- drivers-soc-renesas-r9a09g047-sys.c:error:implicit-declaration-of-function-FIELD_GET
|   `-- drivers-soc-renesas-r9a09g057-sys.c:error:implicit-declaration-of-function-FIELD_GET
`-- xtensa-allyesconfig
    |-- drivers-soc-renesas-r9a09g047-sys.c:error:implicit-declaration-of-function-FIELD_GET
    `-- drivers-soc-renesas-r9a09g057-sys.c:error:implicit-declaration-of-function-FIELD_GET

elapsed time: 1051m

configs tested: 104
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250130    gcc-13.2.0
arc                   randconfig-002-20250130    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-20
arm                   randconfig-001-20250130    gcc-14.2.0
arm                   randconfig-002-20250130    clang-20
arm                   randconfig-003-20250130    gcc-14.2.0
arm                   randconfig-004-20250130    clang-20
arm                           spitz_defconfig    gcc-14.2.0
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
m68k                       m5208evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-16
mips                        qi_lb60_defconfig    clang-18
nios2                 randconfig-001-20250130    gcc-14.2.0
nios2                 randconfig-002-20250130    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250130    gcc-14.2.0
parisc                randconfig-002-20250130    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250130    gcc-14.2.0
powerpc               randconfig-002-20250130    clang-16
powerpc               randconfig-003-20250130    gcc-14.2.0
powerpc64             randconfig-001-20250130    gcc-14.2.0
powerpc64             randconfig-002-20250130    clang-20
powerpc64             randconfig-003-20250130    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250130    clang-20
riscv                 randconfig-002-20250130    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250130    gcc-14.2.0
s390                  randconfig-002-20250130    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250130    gcc-14.2.0
sh                    randconfig-002-20250130    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250130    gcc-14.2.0
sparc                 randconfig-002-20250130    gcc-14.2.0
sparc64               randconfig-001-20250130    gcc-14.2.0
sparc64               randconfig-002-20250130    gcc-14.2.0
um                               alldefconfig    clang-19
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250130    gcc-12
um                    randconfig-002-20250130    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250130    clang-19
x86_64      buildonly-randconfig-002-20250130    gcc-12
x86_64      buildonly-randconfig-003-20250130    gcc-12
x86_64      buildonly-randconfig-004-20250130    clang-19
x86_64      buildonly-randconfig-005-20250130    gcc-12
x86_64      buildonly-randconfig-006-20250130    gcc-12
x86_64                              defconfig    gcc-11
xtensa                randconfig-001-20250130    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

