Return-Path: <linux-renesas-soc+bounces-3004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0254B85BFAC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 16:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED2821C20ACF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 15:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E7674E21;
	Tue, 20 Feb 2024 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLoCl36H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6F7745F1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 15:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708442259; cv=none; b=GJNjpMJfCbaFIJfawXad/+H1LdtIcsc6/S9OE7z3FX3oQqJrg8H1guOp3LrRnL8n9lQoIFP+GVvJXrdWA+juQ2sllf/aosMHt2Wg8k2K4OTHkY0LaEifqCDx4TgOKndgNtqMZBGnb1mEArj2rhu1EmgvtHEE1oYjuviEZOOmKJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708442259; c=relaxed/simple;
	bh=rHcLHl3HfneTTS+prOCydAkfEuC734bPRMZ2RrMdv1E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aLcEwpxtjTC/OdCdxN+Ty3MpDghSyH//SPqdYjWPoixOZWWonYqiErpcGzTLKSCNEXwaSJGl6zXrq6jqvuViyZ9pxpDbxk60/MrDfKNFQn+MNglxA2a9OI/YB3ARq2W3KUid6DY4rO4l0dSIuynW8na69W4oCL3/cI064QvuBPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLoCl36H; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708442258; x=1739978258;
  h=date:from:to:cc:subject:message-id;
  bh=rHcLHl3HfneTTS+prOCydAkfEuC734bPRMZ2RrMdv1E=;
  b=OLoCl36HrTP0bhwb7a8O/ZyQD7qHHFdRPSTVov4gn+JJhngSXfgUSB+D
   y1ltmAjUUuYOumMmYd0KdO0NQhG5kTzwedt++3RAqrCqUFbx8ipysNFDC
   wFb4oYb/Vmwjf2rkrVkO0FyneLF95PPPdPMl6YdMTv4yjj8eddTh9UyyY
   TBef8heDZMVJ3pwy5QPY3ZE/3HoNp2Zww1ZPxY8GLngU1SMjtnV8uNFyM
   FySZ6tuKLv1cXEg20bDsxVNfp/3vO8l9RQ2WnMiND/pTdqRNcdwgKpeyN
   gVeWH1grEOPDVOSe6Smt1EQ/J6U7vngMg12x6rX5+Spa8RX8hQYeClZtn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13106929"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="13106929"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 07:17:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="827170787"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="827170787"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Feb 2024 07:17:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcRrx-0004bi-1V;
	Tue, 20 Feb 2024 15:17:20 +0000
Date: Tue, 20 Feb 2024 23:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/v4m-gray-hawk-single-v2] BUILD
 SUCCESS 785d7e84052df212e11c2471bfd40d08f305c7bf
Message-ID: <202402202313.RrLuB5Yu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/v4m-gray-hawk-single-v2
branch HEAD: 785d7e84052df212e11c2471bfd40d08f305c7bf  arm64: dts: renesas: gray-hawk-single: Add QSPI FLASH support

elapsed time: 1454m

configs tested: 179
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240220   gcc  
arc                   randconfig-002-20240220   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                      footbridge_defconfig   clang
arm                      jornada720_defconfig   clang
arm                         lpc18xx_defconfig   clang
arm                   randconfig-001-20240220   clang
arm                   randconfig-002-20240220   gcc  
arm                   randconfig-003-20240220   gcc  
arm                   randconfig-004-20240220   gcc  
arm                           sama7_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240220   clang
arm64                 randconfig-002-20240220   clang
arm64                 randconfig-003-20240220   clang
arm64                 randconfig-004-20240220   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240220   gcc  
csky                  randconfig-002-20240220   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240220   clang
hexagon               randconfig-002-20240220   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240220   gcc  
i386         buildonly-randconfig-002-20240220   gcc  
i386         buildonly-randconfig-003-20240220   clang
i386         buildonly-randconfig-004-20240220   clang
i386         buildonly-randconfig-005-20240220   gcc  
i386         buildonly-randconfig-006-20240220   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240220   gcc  
i386                  randconfig-002-20240220   gcc  
i386                  randconfig-003-20240220   clang
i386                  randconfig-004-20240220   clang
i386                  randconfig-005-20240220   gcc  
i386                  randconfig-006-20240220   clang
i386                  randconfig-011-20240220   clang
i386                  randconfig-012-20240220   gcc  
i386                  randconfig-013-20240220   gcc  
i386                  randconfig-014-20240220   clang
i386                  randconfig-015-20240220   clang
i386                  randconfig-016-20240220   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240220   gcc  
loongarch             randconfig-002-20240220   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240220   gcc  
nios2                 randconfig-002-20240220   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240220   gcc  
parisc                randconfig-002-20240220   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240220   gcc  
powerpc               randconfig-002-20240220   clang
powerpc               randconfig-003-20240220   clang
powerpc                     skiroot_defconfig   clang
powerpc64             randconfig-001-20240220   gcc  
powerpc64             randconfig-002-20240220   gcc  
powerpc64             randconfig-003-20240220   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240220   clang
riscv                 randconfig-002-20240220   clang
s390                             alldefconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240220   gcc  
s390                  randconfig-002-20240220   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240220   gcc  
sh                    randconfig-002-20240220   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240220   gcc  
sparc64               randconfig-002-20240220   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240220   gcc  
um                    randconfig-002-20240220   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240220   clang
x86_64       buildonly-randconfig-002-20240220   clang
x86_64       buildonly-randconfig-003-20240220   gcc  
x86_64       buildonly-randconfig-004-20240220   clang
x86_64       buildonly-randconfig-005-20240220   gcc  
x86_64       buildonly-randconfig-006-20240220   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240220   gcc  
x86_64                randconfig-002-20240220   gcc  
x86_64                randconfig-003-20240220   gcc  
x86_64                randconfig-004-20240220   clang
x86_64                randconfig-005-20240220   clang
x86_64                randconfig-006-20240220   gcc  
x86_64                randconfig-011-20240220   gcc  
x86_64                randconfig-012-20240220   clang
x86_64                randconfig-013-20240220   clang
x86_64                randconfig-014-20240220   gcc  
x86_64                randconfig-015-20240220   clang
x86_64                randconfig-016-20240220   gcc  
x86_64                randconfig-071-20240220   clang
x86_64                randconfig-072-20240220   clang
x86_64                randconfig-073-20240220   clang
x86_64                randconfig-074-20240220   clang
x86_64                randconfig-075-20240220   clang
x86_64                randconfig-076-20240220   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240220   gcc  
xtensa                randconfig-002-20240220   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

