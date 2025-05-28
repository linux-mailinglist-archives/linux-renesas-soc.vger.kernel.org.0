Return-Path: <linux-renesas-soc+bounces-17570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8681AC5EDA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 03:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F004C4A5F4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 01:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92189CA5E;
	Wed, 28 May 2025 01:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z75qToHf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE0A1A76BC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 01:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748396276; cv=none; b=uP3cI3NyJ+gZd5Ug890049BDjEmzWUAlzN4NHdLJPn0AYkZ7c1p6Mm+qDjleBUfNH8yPKdM0tsiCUXiLmYREgp00Sh4QLuTEiJjuyGk18a72UzCvc55+wg6qguWqVjuBNIeXk3kQjNUgPLs7837IGChQ3Gf2TJXmw3NCrO518Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748396276; c=relaxed/simple;
	bh=qoh+B8mkdPZrJRzgXCrwFCq8E2cq/mi9iCGmuZlcn4s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dyBC+wE5MxUl3MHWb9r63Uj39hpdeKuJ/9UXy5AtdT0iNaqkq68L8GC0LC3J7ZDCY4JIQrxz/izwo2Ht0nryPyJke5r8M9jCiNZIc6RIz4GfAr/A16CEqPsSmOLDPYJ83FxNvlkciph77m53Yd69byqvbP1UR9n08RFnL3/kkcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z75qToHf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748396275; x=1779932275;
  h=date:from:to:cc:subject:message-id;
  bh=qoh+B8mkdPZrJRzgXCrwFCq8E2cq/mi9iCGmuZlcn4s=;
  b=Z75qToHfvq1Y+ZJ2Xxte6QGLsgvFnrkDDC1BBV9xp7i01DwMdc2kTw0i
   aSllqqzLYSFmcXZl1z4pXt1dLpkEvoK1TzyWchU9pwL8B1YICXXGCKvje
   EVzLFMEGbzYOTqSBiGuTBzHBKGPNI02+CD4+NMPJjQi2ndKaI3l2C6dkG
   Udamc+TCbuH1U+VQ6TnDbE8iJsSzzKCKC9eGP01VMVzCrPS3xh6PGA0W6
   Ll58DaAsSJzEjjLLMeIVIwmJ9AmD/hRzdYg3coZjgFtSVtqbz/dtC34dH
   tlxy5vwF/uzahyHT/hn06Xap2ldJ9vXqXzn/lsf0OCRhSXI/tQG8n9G3a
   w==;
X-CSE-ConnectionGUID: 8zlg7A9LRQil79ux15V6oQ==
X-CSE-MsgGUID: EyJ4DnXwTCuTnFft7ur9Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61067833"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="61067833"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 18:37:54 -0700
X-CSE-ConnectionGUID: lXDqEcbORL2U3wTdr3mWnA==
X-CSE-MsgGUID: LRmvJ9WISLGsf07rS7rUtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="144027721"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 May 2025 18:37:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK5jq-000VA5-2F;
	Wed, 28 May 2025 01:37:50 +0000
Date: Wed, 28 May 2025 09:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 0cc4c9c39e8953745481c13288a46edc616dc7cd
Message-ID: <202505280926.MKURIIIW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 0cc4c9c39e8953745481c13288a46edc616dc7cd  Merge branch 'topic/renesas-defconfig' into renesas-devel

elapsed time: 726m

configs tested: 123
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs101_defconfig    gcc-14.2.0
arc                   randconfig-001-20250527    gcc-10.5.0
arc                   randconfig-002-20250527    gcc-10.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                        keystone_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20250527    clang-21
arm                   randconfig-002-20250527    gcc-7.5.0
arm                   randconfig-003-20250527    clang-19
arm                   randconfig-004-20250527    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250527    gcc-8.5.0
arm64                 randconfig-002-20250527    gcc-8.5.0
arm64                 randconfig-003-20250527    clang-16
arm64                 randconfig-004-20250527    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250527    gcc-12.4.0
csky                  randconfig-002-20250527    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250527    clang-21
hexagon               randconfig-002-20250527    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250527    gcc-12
i386        buildonly-randconfig-002-20250527    clang-20
i386        buildonly-randconfig-003-20250527    clang-20
i386        buildonly-randconfig-004-20250527    clang-20
i386        buildonly-randconfig-005-20250527    gcc-11
i386        buildonly-randconfig-006-20250527    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250527    gcc-15.1.0
loongarch             randconfig-002-20250527    gcc-15.1.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
mips                        omega2p_defconfig    clang-21
mips                        vocore2_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250527    gcc-14.2.0
nios2                 randconfig-002-20250527    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250527    gcc-9.3.0
parisc                randconfig-002-20250527    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                 mpc836x_rdk_defconfig    clang-21
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250527    gcc-6.5.0
powerpc               randconfig-002-20250527    clang-18
powerpc               randconfig-003-20250527    gcc-8.5.0
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250527    clang-21
powerpc64             randconfig-002-20250527    clang-21
powerpc64             randconfig-003-20250527    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250527    gcc-8.5.0
riscv                 randconfig-002-20250527    gcc-15.1.0
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250527    gcc-6.5.0
s390                  randconfig-002-20250527    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20250527    gcc-10.5.0
sh                    randconfig-002-20250527    gcc-15.1.0
sh                           sh2007_defconfig    gcc-14.2.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250527    gcc-11.5.0
sparc                 randconfig-002-20250527    gcc-7.5.0
sparc64               randconfig-001-20250527    gcc-5.5.0
sparc64               randconfig-002-20250527    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250527    clang-21
um                    randconfig-002-20250527    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250527    gcc-12
x86_64      buildonly-randconfig-002-20250527    clang-20
x86_64      buildonly-randconfig-003-20250527    gcc-12
x86_64      buildonly-randconfig-004-20250527    clang-20
x86_64      buildonly-randconfig-005-20250527    clang-20
x86_64      buildonly-randconfig-006-20250527    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250527    gcc-9.3.0
xtensa                randconfig-002-20250527    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

