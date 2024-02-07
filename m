Return-Path: <linux-renesas-soc+bounces-2421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9171684C922
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 12:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACCD41C203BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 11:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CCD1B275;
	Wed,  7 Feb 2024 11:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXmLN+BG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01DD1B285
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 11:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707303775; cv=none; b=uGHuDvtlRCLGIB0eaja+A9TrUxjusEjvUIsMsVs9AYYr8IeBWDdaWW3z9CXpfm5/EVzNCv0xfqYPSToUF8qWVjgTte1UyLc2pqhfwpdhE7+w16qnGURYcyO/GKI5Et+Jn5gHCgh6huqUCINIue95z4vSF50/VhretvUf1Q/Q8gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707303775; c=relaxed/simple;
	bh=p5XmtwZ09ClyjUK+kOUNbmy5S01/tlFKjg+Cp5u0iZE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bnsjBeA91DCuLAHxQ1VNopIY8sMmCwC6VzK/wVebw7Oq/CAY6nHDSTpagKrtsW7ZScaU6NDxUOCMcZy6hvnOao9Xc/R2FayBKBBa/5caoBzafuv7QFFbrnlHydXZAaEqI7FG93rabh2DSr0f9HwSQWHaUELxTCdAOxM64Uz48nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXmLN+BG; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707303773; x=1738839773;
  h=date:from:to:cc:subject:message-id;
  bh=p5XmtwZ09ClyjUK+kOUNbmy5S01/tlFKjg+Cp5u0iZE=;
  b=MXmLN+BGSEivKzMdbUs04jqpOyh2JwqAQP1drtYiEuYcshozOXuIcFVl
   he5gvAxc+xIZojW8GPpHbw0lTL3W73wbZnBjayQS3eeI/XimsgH0u8LmW
   cshMZDbk7Tl82XrbCnxlkxQe/LL1U8Zahq+sDgx6q4k2ag2SMHHuuk7qJ
   eQ1CK2U+6WyaVhisZtYKdmireLr7s0T4jBmpwbWkQnYtXrBFMlMV8+f1H
   csVjfNLc4SKa6VR8OEfooFDc6Q7Blvb6VHSuiW3AvFgNMSk75H473Padf
   OCNHUwmMWSfea2uwqRSyDe59EU4ao7WOFdgh6OM+fjljq6EN1Ycsy5QGV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="436098091"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="436098091"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 03:02:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1297544"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Feb 2024 03:02:52 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXfhZ-0002Wa-0s;
	Wed, 07 Feb 2024 11:02:49 +0000
Date: Wed, 07 Feb 2024 19:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.9] BUILD SUCCESS
 785b3c25761a828c5e22b3361541c50fd3b92fde
Message-ID: <202402071903.25nQpFcS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.9
branch HEAD: 785b3c25761a828c5e22b3361541c50fd3b92fde  arm64: dts: renesas: gray-hawk-single: Enable watchdog timer

elapsed time: 1463m

configs tested: 228
configs skipped: 3

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
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240207   gcc  
arc                   randconfig-002-20240207   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                            qcom_defconfig   clang
arm                   randconfig-001-20240207   clang
arm                   randconfig-002-20240207   clang
arm                   randconfig-003-20240207   clang
arm                   randconfig-004-20240207   gcc  
arm                        shmobile_defconfig   gcc  
arm                          sp7021_defconfig   gcc  
arm                           spitz_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240207   clang
arm64                 randconfig-002-20240207   clang
arm64                 randconfig-003-20240207   clang
arm64                 randconfig-004-20240207   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240207   gcc  
csky                  randconfig-002-20240207   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240207   clang
hexagon               randconfig-002-20240207   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240206   clang
i386         buildonly-randconfig-002-20240206   clang
i386         buildonly-randconfig-003-20240206   gcc  
i386         buildonly-randconfig-004-20240206   clang
i386         buildonly-randconfig-005-20240206   gcc  
i386         buildonly-randconfig-006-20240206   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240206   clang
i386                  randconfig-001-20240207   gcc  
i386                  randconfig-002-20240206   clang
i386                  randconfig-003-20240206   clang
i386                  randconfig-003-20240207   gcc  
i386                  randconfig-004-20240206   clang
i386                  randconfig-004-20240207   gcc  
i386                  randconfig-005-20240206   clang
i386                  randconfig-005-20240207   gcc  
i386                  randconfig-006-20240206   clang
i386                  randconfig-011-20240206   clang
i386                  randconfig-011-20240207   gcc  
i386                  randconfig-012-20240206   gcc  
i386                  randconfig-012-20240207   gcc  
i386                  randconfig-013-20240206   clang
i386                  randconfig-013-20240207   gcc  
i386                  randconfig-014-20240206   gcc  
i386                  randconfig-014-20240207   gcc  
i386                  randconfig-015-20240206   gcc  
i386                  randconfig-015-20240207   gcc  
i386                  randconfig-016-20240206   gcc  
i386                  randconfig-016-20240207   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240207   gcc  
loongarch             randconfig-002-20240207   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   clang
mips                  cavium_octeon_defconfig   gcc  
mips                         db1xxx_defconfig   clang
mips                     decstation_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                           gcw0_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240207   gcc  
nios2                 randconfig-002-20240207   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240207   gcc  
parisc                randconfig-002-20240207   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc                      ppc40x_defconfig   clang
powerpc               randconfig-001-20240207   clang
powerpc               randconfig-002-20240207   clang
powerpc               randconfig-003-20240207   gcc  
powerpc64             randconfig-001-20240207   clang
powerpc64             randconfig-002-20240207   gcc  
powerpc64             randconfig-003-20240207   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20240207   clang
riscv                 randconfig-002-20240207   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240207   gcc  
s390                  randconfig-002-20240207   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240207   gcc  
sh                    randconfig-002-20240207   gcc  
sh                           sh2007_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240207   gcc  
sparc64               randconfig-002-20240207   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240207   clang
um                    randconfig-002-20240207   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240206   gcc  
x86_64       buildonly-randconfig-001-20240207   clang
x86_64       buildonly-randconfig-002-20240206   clang
x86_64       buildonly-randconfig-002-20240207   clang
x86_64       buildonly-randconfig-003-20240206   gcc  
x86_64       buildonly-randconfig-003-20240207   gcc  
x86_64       buildonly-randconfig-004-20240206   gcc  
x86_64       buildonly-randconfig-004-20240207   clang
x86_64       buildonly-randconfig-005-20240206   gcc  
x86_64       buildonly-randconfig-005-20240207   clang
x86_64       buildonly-randconfig-006-20240206   gcc  
x86_64       buildonly-randconfig-006-20240207   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240206   clang
x86_64                randconfig-001-20240207   clang
x86_64                randconfig-002-20240206   clang
x86_64                randconfig-002-20240207   gcc  
x86_64                randconfig-003-20240206   gcc  
x86_64                randconfig-003-20240207   gcc  
x86_64                randconfig-004-20240206   gcc  
x86_64                randconfig-004-20240207   gcc  
x86_64                randconfig-005-20240206   gcc  
x86_64                randconfig-005-20240207   clang
x86_64                randconfig-006-20240206   clang
x86_64                randconfig-006-20240207   clang
x86_64                randconfig-011-20240206   gcc  
x86_64                randconfig-011-20240207   clang
x86_64                randconfig-012-20240206   clang
x86_64                randconfig-012-20240207   gcc  
x86_64                randconfig-013-20240206   gcc  
x86_64                randconfig-013-20240207   clang
x86_64                randconfig-014-20240206   clang
x86_64                randconfig-014-20240207   clang
x86_64                randconfig-015-20240206   gcc  
x86_64                randconfig-015-20240207   gcc  
x86_64                randconfig-016-20240206   clang
x86_64                randconfig-016-20240207   gcc  
x86_64                randconfig-071-20240206   gcc  
x86_64                randconfig-071-20240207   gcc  
x86_64                randconfig-072-20240206   gcc  
x86_64                randconfig-072-20240207   clang
x86_64                randconfig-073-20240206   gcc  
x86_64                randconfig-073-20240207   clang
x86_64                randconfig-074-20240206   gcc  
x86_64                randconfig-074-20240207   gcc  
x86_64                randconfig-075-20240206   clang
x86_64                randconfig-075-20240207   gcc  
x86_64                randconfig-076-20240206   gcc  
x86_64                randconfig-076-20240207   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240207   gcc  
xtensa                randconfig-002-20240207   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

