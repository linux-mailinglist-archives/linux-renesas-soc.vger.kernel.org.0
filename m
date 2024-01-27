Return-Path: <linux-renesas-soc+bounces-1897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C194A83E91B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Jan 2024 02:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF54A1C2191F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Jan 2024 01:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60E9944D;
	Sat, 27 Jan 2024 01:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/5l7MoF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4135C33F6
	for <linux-renesas-soc@vger.kernel.org>; Sat, 27 Jan 2024 01:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706320160; cv=none; b=uDmOtPl3gIlSfSO/J5KqDNyznmwSYiMXCmPU/sLHCx0cNSEdaE/kfCJBv8Ug8aCJkWZXbp7fx9+VbZbLE8GOhkwszy7ThtVgwNARN3Ig6UMNVFK05hhGqpD6hH7I0p5NgExiLTytOANtlZYy4MM/y63s04da76soM8UHo2VGlnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706320160; c=relaxed/simple;
	bh=NzCna3mmL6X/ru+ZDUTZU0X+SoM+FF5H6fKPfZSUHZw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r/FlLexGjID1QsBKgjAiLkm1BAEoyaMpSofHQsv7kQ3ddZbeo4xhHFYgrxC3sQr/rmZougGimMn0Gt8dO5OBJGjBxfkloYwjCPMSgZ70OKbf1fc56I3l3q0Gzz6PhLB1vcVM715zu0yUIg/C7kKAXri0FLDEc/x2+d9/DSWFVzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/5l7MoF; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706320158; x=1737856158;
  h=date:from:to:cc:subject:message-id;
  bh=NzCna3mmL6X/ru+ZDUTZU0X+SoM+FF5H6fKPfZSUHZw=;
  b=H/5l7MoFbaAAzPHOZPkuNtZAR5oZ4vR3V8C+VEK6u1Kqrsa9UtkwlOcM
   NjVMtZ5asMRkuXhRD3WufJ2WucduIpyCJM7mqCluwnoE3IWCulTurnHHK
   MCUPq+UnPt8ph6UMq+ZVGiztzum1cS2p/F3MqHX+NJEoKVuOxlag37Ry7
   b7G0bOCGXJH9dAOWyqWyTRFSJWUulH+YadMRIK7JsfnyyMuITKBKaB9RM
   riTmOpSA2zmfPuZ24qAJwyoNWXis4Ngv6Zwq9mE+eB7ZMwtWRqFk4680Q
   Lh4vKmH4jtBDOAYMVLNPT1HYmWKzJyZFYMi2ILMts2r7aTDUQdLjvABV+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="433784846"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="433784846"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 17:46:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="960373356"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="960373356"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Jan 2024 17:46:57 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTXmZ-0001Xe-0p;
	Sat, 27 Jan 2024 01:46:55 +0000
Date: Sat, 27 Jan 2024 09:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/v4h-white-hawk-more-v2] BUILD
 SUCCESS c03107ce8d2fbec6ccb6ee669a87149a6ef55e37
Message-ID: <202401270951.fMCCSBC4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/v4h-white-hawk-more-v2
branch HEAD: c03107ce8d2fbec6ccb6ee669a87149a6ef55e37  arm64: dts: renesas: r8a779g2: Add White Hawk Single support

elapsed time: 2017m

configs tested: 131
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
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240127   gcc  
arc                   randconfig-002-20240127   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                         lpc18xx_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                   randconfig-001-20240127   gcc  
arm                   randconfig-002-20240127   gcc  
arm                   randconfig-003-20240127   gcc  
arm                   randconfig-004-20240127   gcc  
arm                        realview_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240127   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240126   clang
i386         buildonly-randconfig-002-20240126   clang
i386         buildonly-randconfig-003-20240126   clang
i386         buildonly-randconfig-004-20240126   clang
i386         buildonly-randconfig-005-20240126   clang
i386         buildonly-randconfig-006-20240126   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240126   clang
i386                  randconfig-002-20240126   clang
i386                  randconfig-003-20240126   clang
i386                  randconfig-004-20240126   clang
i386                  randconfig-005-20240126   clang
i386                  randconfig-006-20240126   clang
i386                  randconfig-011-20240126   gcc  
i386                  randconfig-012-20240126   gcc  
i386                  randconfig-013-20240126   gcc  
i386                  randconfig-014-20240126   gcc  
i386                  randconfig-015-20240126   gcc  
i386                  randconfig-016-20240126   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       alldefconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        icon_defconfig   clang
powerpc                 linkstation_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                     sequoia_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240127   gcc  
x86_64       buildonly-randconfig-002-20240127   gcc  
x86_64       buildonly-randconfig-003-20240127   gcc  
x86_64       buildonly-randconfig-004-20240127   gcc  
x86_64       buildonly-randconfig-005-20240127   gcc  
x86_64       buildonly-randconfig-006-20240127   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240127   clang
x86_64                randconfig-002-20240127   clang
x86_64                randconfig-003-20240127   clang
x86_64                randconfig-004-20240127   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

