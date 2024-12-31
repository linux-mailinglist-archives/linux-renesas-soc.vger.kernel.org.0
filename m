Return-Path: <linux-renesas-soc+bounces-11748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4338B9FEBBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Dec 2024 01:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F7013A26D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Dec 2024 00:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E251163;
	Tue, 31 Dec 2024 00:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILWTLMs4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2E036D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Dec 2024 00:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735603446; cv=none; b=CcAEwL0vm8lGis097s5y5fe2bI23WqQpsibHQsVF9X4MyxALYKVTHKnGhEge1LvRedGR041MthalXL9mJmXaPV2Yv6dKvfWn1PAbblLk42W74TXcSHuU88oalZtZOxVdWr4ezgLwdIKIFtpmw9aipNvHipaSg6KZxvXRJbnbt1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735603446; c=relaxed/simple;
	bh=TCaCHsdzPP3vuNIHGazjKZPyChULWY19oxJ1R1w2MF4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z8uA1ZnKKbpOacUlJ9kF9/iW0pPNesXXFkg6KPblb8tGSdO88khRtcBlFLcBVLB0q4kPt5oTYzsHyP+6nLUurOkCEUhcBtNpNJVsQTfK6AfOczdP4wO/zWpdFPr2xag94g9XOWiSaRvedX+ZhhzFXxMDBzmefAkeOiOPDDFLhDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILWTLMs4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735603444; x=1767139444;
  h=date:from:to:cc:subject:message-id;
  bh=TCaCHsdzPP3vuNIHGazjKZPyChULWY19oxJ1R1w2MF4=;
  b=ILWTLMs4MwsL44+yHHaG4IddTl2laEadF898ynxwHpItvW65S8ETgRab
   pnn/WOA0PYd0XVMSo+PEpglHIMLMW/Yv9w9khtE1IYtFN0QPErH3yUBtM
   BBpDslh3zjtay15BCGPO5E5XlEbY72EGR2J5l6hwuV6HCdk9TgYza6N3g
   dRnqhVBr6iKRHMQAEv8CmnkL4Q73JDTwGaG+sbg8pVrnZFUKigz93qk4D
   vB4chpVmJq/r3IPChc0Jc9TboaB8VH24kbsyjq1ko8UzBSiJn8yLtJifG
   CYx62er+/OKtln7YUi7GqpX3jjSr7cCEpgnj6n0EU16CAGzeoDsyGevgC
   w==;
X-CSE-ConnectionGUID: 3mKZA3HaTzOmv2hCtVFC+g==
X-CSE-MsgGUID: UrR4M6I+TGKDYZcjUY9xbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35197413"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="35197413"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:04:03 -0800
X-CSE-ConnectionGUID: 0xa+N2X7Qt6RhcX0n9ofRg==
X-CSE-MsgGUID: AsDS8OpiQyaoGCchhGQM8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104969072"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Dec 2024 16:04:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSPjr-0006Tr-2t;
	Tue, 31 Dec 2024 00:03:59 +0000
Date: Tue, 31 Dec 2024 08:03:41 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 bfa44f8477ad5ff5c4832416c64791d6109e50e4
Message-ID: <202412310834.863yCm8h-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: bfa44f8477ad5ff5c4832416c64791d6109e50e4  Merge tag 'v6.13-rc5' into renesas-devel

elapsed time: 725m

configs tested: 230
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20241230    gcc-13.2.0
arc                   randconfig-001-20241231    clang-20
arc                   randconfig-002-20241230    gcc-13.2.0
arc                   randconfig-002-20241231    clang-20
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-20
arm                   randconfig-001-20241230    clang-20
arm                   randconfig-001-20241231    clang-20
arm                   randconfig-002-20241230    gcc-14.2.0
arm                   randconfig-002-20241231    clang-20
arm                   randconfig-003-20241230    gcc-14.2.0
arm                   randconfig-003-20241231    clang-20
arm                   randconfig-004-20241230    gcc-14.2.0
arm                   randconfig-004-20241231    clang-20
arm                       spear13xx_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241230    gcc-14.2.0
arm64                 randconfig-001-20241231    clang-20
arm64                 randconfig-002-20241230    clang-20
arm64                 randconfig-002-20241231    clang-20
arm64                 randconfig-003-20241230    clang-20
arm64                 randconfig-003-20241231    clang-20
arm64                 randconfig-004-20241230    gcc-14.2.0
arm64                 randconfig-004-20241231    clang-20
csky                             allmodconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                             allyesconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241230    gcc-14.2.0
csky                  randconfig-002-20241230    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241230    clang-17
hexagon               randconfig-002-20241230    clang-15
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241230    gcc-12
i386        buildonly-randconfig-002-20241230    gcc-12
i386        buildonly-randconfig-003-20241230    clang-19
i386        buildonly-randconfig-004-20241230    clang-19
i386        buildonly-randconfig-005-20241230    clang-19
i386        buildonly-randconfig-006-20241230    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241231    gcc-11
i386                  randconfig-002-20241231    gcc-11
i386                  randconfig-003-20241231    gcc-11
i386                  randconfig-004-20241231    gcc-11
i386                  randconfig-005-20241231    gcc-11
i386                  randconfig-006-20241231    gcc-11
i386                  randconfig-007-20241231    gcc-11
i386                  randconfig-011-20241231    gcc-12
i386                  randconfig-012-20241231    gcc-12
i386                  randconfig-013-20241231    gcc-12
i386                  randconfig-014-20241231    gcc-12
i386                  randconfig-015-20241231    gcc-12
i386                  randconfig-016-20241231    gcc-12
i386                  randconfig-017-20241231    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                        allyesconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    clang-20
loongarch             randconfig-001-20241230    gcc-14.2.0
loongarch             randconfig-002-20241230    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                             allmodconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    gcc-14.2.0
mips                          eyeq6_defconfig    clang-20
mips                           ip27_defconfig    clang-20
mips                           ip30_defconfig    clang-20
mips                           jazz_defconfig    clang-20
mips                      maltaaprp_defconfig    clang-20
mips                          rb532_defconfig    clang-20
mips                         rt305x_defconfig    clang-19
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241230    gcc-14.2.0
nios2                 randconfig-002-20241230    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241230    gcc-14.2.0
parisc                randconfig-002-20241230    gcc-14.2.0
parisc64                            defconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-20
powerpc                       ebony_defconfig    clang-20
powerpc                       eiger_defconfig    clang-17
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                       holly_defconfig    clang-20
powerpc                     mpc5200_defconfig    clang-20
powerpc                     mpc83xx_defconfig    clang-20
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241230    gcc-14.2.0
powerpc               randconfig-002-20241230    gcc-14.2.0
powerpc               randconfig-003-20241230    gcc-14.2.0
powerpc                     sequoia_defconfig    clang-17
powerpc64             randconfig-001-20241230    clang-18
powerpc64             randconfig-002-20241230    gcc-14.2.0
powerpc64             randconfig-003-20241230    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241230    clang-20
riscv                 randconfig-002-20241230    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20241230    clang-20
s390                  randconfig-002-20241230    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                    randconfig-001-20241230    gcc-14.2.0
sh                    randconfig-002-20241230    gcc-14.2.0
sh                           sh2007_defconfig    clang-20
sh                  sh7785lcr_32bit_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241230    gcc-14.2.0
sparc                 randconfig-002-20241230    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241230    gcc-14.2.0
sparc64               randconfig-002-20241230    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241230    gcc-12
um                    randconfig-002-20241230    gcc-12
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241230    clang-19
x86_64      buildonly-randconfig-002-20241230    clang-19
x86_64      buildonly-randconfig-003-20241230    gcc-12
x86_64      buildonly-randconfig-004-20241230    clang-19
x86_64      buildonly-randconfig-005-20241230    gcc-12
x86_64      buildonly-randconfig-006-20241230    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241231    gcc-12
x86_64                randconfig-002-20241231    gcc-12
x86_64                randconfig-003-20241231    gcc-12
x86_64                randconfig-004-20241231    gcc-12
x86_64                randconfig-005-20241231    gcc-12
x86_64                randconfig-006-20241231    gcc-12
x86_64                randconfig-007-20241231    gcc-12
x86_64                randconfig-008-20241231    gcc-12
x86_64                randconfig-071-20241231    clang-19
x86_64                randconfig-072-20241231    clang-19
x86_64                randconfig-073-20241231    clang-19
x86_64                randconfig-074-20241231    clang-19
x86_64                randconfig-075-20241231    clang-19
x86_64                randconfig-076-20241231    clang-19
x86_64                randconfig-077-20241231    clang-19
x86_64                randconfig-078-20241231    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241230    gcc-14.2.0
xtensa                randconfig-002-20241230    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

