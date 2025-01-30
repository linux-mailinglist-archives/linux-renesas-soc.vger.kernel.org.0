Return-Path: <linux-renesas-soc+bounces-12757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E029DA230C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 16:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 497AF162BCE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 15:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B821E98FF;
	Thu, 30 Jan 2025 15:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeA5wHys"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44E313FEE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 15:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738249501; cv=none; b=hrWJhPhIfFBGiT/7zHQF4vTmsP/Pp8aStxrnI9Cg4ycpT3LWVj7YAMpHV9aIBTMlVEbDcwsfJgY8RSOW8Emr9j5kQjYEGjAMAItMn1OMwFu4qJccQ+0/qcM4vELnMSR1RQ/+2wQ9UQy1lVU58HLnpZY2fUwz7RCryJZb/9y5wfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738249501; c=relaxed/simple;
	bh=qx6vn1gUzlScYaliI5Whr6SC+Xj/Ajhc/w4Lg5Z6BbA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F4n4lkQZ8uiCbY7rul9XU1jjA6GfZ2erM2DGcm2J9FpFXC/hB75dETODnGUORXSNsbS/dIFtY6iCP0qRU/lr+5mPyYrY4xMnKypUdXsKGSbvKosCQNvYbjlxoKuMGo3rqB6R+bZyjV/FhD4N6TwUSHmJR2Zq7Cok6pwyALSP5Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeA5wHys; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738249500; x=1769785500;
  h=date:from:to:cc:subject:message-id;
  bh=qx6vn1gUzlScYaliI5Whr6SC+Xj/Ajhc/w4Lg5Z6BbA=;
  b=HeA5wHysRqIuvXYJ6766c4PRlB4hQGrtzLActBSc4Wndq7419uQvMXj6
   5lC3hqHDHzCceEHIGBJd5XsIL1rcgf1OZiLsIqjkb33tyMM7mORD2bKuY
   NHW9of5M//Naz4OsfNmuwhNidW0kjAkv9SF5wSN/WxX4IOELlpgvS61sC
   KhrlPCi7oz2hMJAWAy/QRn5C4G5WB8XFbdbRozmENSL8XaGGhbPe7BfJK
   l8BKozbfBhEBn4yeZV3Wieq+ZFnFnxy5ktu+lu2f1/MEnj5swinZJOVOj
   f8KS/0gEsTEQqH5HXqGa3usD1lFE4yj0EeiAY1tFkMwNT4Ptstek66I6b
   g==;
X-CSE-ConnectionGUID: eSK38xuXSAWJsnqkv51nNA==
X-CSE-MsgGUID: 6PW+YNSWQdSYwgkPwScciQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="56223320"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="56223320"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 07:04:59 -0800
X-CSE-ConnectionGUID: 84aePbKYRYuHUY8YwXhYDA==
X-CSE-MsgGUID: p266o8WQTPSLI55EMqriZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114499117"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Jan 2025 07:04:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdW6B-000kaX-2W;
	Thu, 30 Jan 2025 15:04:55 +0000
Date: Thu, 30 Jan 2025 23:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 95b6babc16ef42bad035e90a64403220cff09850
Message-ID: <202501302348.SclE11GW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 95b6babc16ef42bad035e90a64403220cff09850  arm64: renesas: defconfig: Disable CONFIG_PROVE_LOCKING

elapsed time: 1280m

configs tested: 181
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                   randconfig-001-20250130    gcc-13.2.0
arc                   randconfig-002-20250130    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                          collie_defconfig    gcc-14.2.0
arm                        multi_v7_defconfig    clang-20
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250130    gcc-14.2.0
arm                   randconfig-002-20250130    clang-20
arm                   randconfig-003-20250130    gcc-14.2.0
arm                   randconfig-004-20250130    clang-20
arm                           stm32_defconfig    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250130    clang-20
arm64                 randconfig-002-20250130    gcc-14.2.0
arm64                 randconfig-003-20250130    clang-20
arm64                 randconfig-004-20250130    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250130    clang-21
csky                  randconfig-001-20250130    gcc-14.2.0
csky                  randconfig-002-20250130    clang-21
csky                  randconfig-002-20250130    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon               randconfig-001-20250130    clang-20
hexagon               randconfig-001-20250130    clang-21
hexagon               randconfig-002-20250130    clang-20
hexagon               randconfig-002-20250130    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250130    clang-19
i386        buildonly-randconfig-002-20250130    clang-19
i386        buildonly-randconfig-003-20250130    gcc-11
i386        buildonly-randconfig-004-20250130    gcc-12
i386        buildonly-randconfig-005-20250130    gcc-12
i386        buildonly-randconfig-006-20250130    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250130    gcc-12
i386                  randconfig-002-20250130    gcc-12
i386                  randconfig-003-20250130    gcc-12
i386                  randconfig-004-20250130    gcc-12
i386                  randconfig-005-20250130    gcc-12
i386                  randconfig-006-20250130    gcc-12
i386                  randconfig-007-20250130    gcc-12
i386                  randconfig-011-20250130    clang-19
i386                  randconfig-012-20250130    clang-19
i386                  randconfig-013-20250130    clang-19
i386                  randconfig-014-20250130    clang-19
i386                  randconfig-015-20250130    clang-19
i386                  randconfig-016-20250130    clang-19
i386                  randconfig-017-20250130    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250130    clang-21
loongarch             randconfig-001-20250130    gcc-14.2.0
loongarch             randconfig-002-20250130    clang-21
loongarch             randconfig-002-20250130    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                     loongson1b_defconfig    clang-20
mips                        omega2p_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250130    clang-21
nios2                 randconfig-001-20250130    gcc-14.2.0
nios2                 randconfig-002-20250130    clang-21
nios2                 randconfig-002-20250130    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250130    clang-21
parisc                randconfig-001-20250130    gcc-14.2.0
parisc                randconfig-002-20250130    clang-21
parisc                randconfig-002-20250130    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 linkstation_defconfig    clang-20
powerpc               randconfig-001-20250130    clang-21
powerpc               randconfig-001-20250130    gcc-14.2.0
powerpc               randconfig-002-20250130    clang-16
powerpc               randconfig-002-20250130    clang-21
powerpc               randconfig-003-20250130    clang-21
powerpc               randconfig-003-20250130    gcc-14.2.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250130    clang-21
powerpc64             randconfig-001-20250130    gcc-14.2.0
powerpc64             randconfig-002-20250130    clang-20
powerpc64             randconfig-002-20250130    clang-21
powerpc64             randconfig-003-20250130    clang-20
powerpc64             randconfig-003-20250130    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250130    clang-20
riscv                 randconfig-002-20250130    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250130    gcc-14.2.0
s390                  randconfig-002-20250130    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250130    gcc-14.2.0
sh                    randconfig-002-20250130    gcc-14.2.0
sh                           se7722_defconfig    clang-20
sh                           se7722_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250130    gcc-14.2.0
sparc                 randconfig-002-20250130    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250130    gcc-14.2.0
sparc64               randconfig-002-20250130    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250130    gcc-12
um                    randconfig-002-20250130    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250130    clang-19
x86_64      buildonly-randconfig-002-20250130    gcc-12
x86_64      buildonly-randconfig-003-20250130    gcc-12
x86_64      buildonly-randconfig-004-20250130    clang-19
x86_64      buildonly-randconfig-005-20250130    gcc-12
x86_64      buildonly-randconfig-006-20250130    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-071-20250130    clang-19
x86_64                randconfig-072-20250130    clang-19
x86_64                randconfig-073-20250130    clang-19
x86_64                randconfig-074-20250130    clang-19
x86_64                randconfig-075-20250130    clang-19
x86_64                randconfig-076-20250130    clang-19
x86_64                randconfig-077-20250130    clang-19
x86_64                randconfig-078-20250130    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250130    gcc-14.2.0
xtensa                randconfig-002-20250130    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

