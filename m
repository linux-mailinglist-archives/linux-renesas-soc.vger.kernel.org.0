Return-Path: <linux-renesas-soc+bounces-16374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4E9A9C666
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 12:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 752863AAC47
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 10:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC49A22FF37;
	Fri, 25 Apr 2025 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyZuizgl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A518F4438B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 10:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578628; cv=none; b=p0fhXhzBTTlI0Y/78HcyxkAWAeSCBgL/PyM77gglPb/zM0uCTx4Vps3l4dgiZnLJHG2Ju8PvBoiRNCC8B21Uv3iT0PKr48r1RpAIWdsH6GF10oDKX9qYQz6Jt/IZKtGal57kG352Ew1Z7y8BO9e6IvOrMz7pgjpQbfd8QcG77Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578628; c=relaxed/simple;
	bh=rdZQbVdu0P6Evm5v3MM/zAmDvQ3Xer5aGreK7xAz1CU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SKUw/l+s9DYdzAGVnwmMVa23Keqz4wLvsNnuEU+r/3hc1XjRaBcYt6pDGvif2zj0HuqkAs5yW3ZvAJEwkKLbg0Oyx78jtU6JPNinYKMeObXbwZ1cW9dEGrCGDIatti1GJr0V7zP1NKUoRFMTfrXhIzl9t8ZEDGToNvA40twYZiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyZuizgl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745578627; x=1777114627;
  h=date:from:to:cc:subject:message-id;
  bh=rdZQbVdu0P6Evm5v3MM/zAmDvQ3Xer5aGreK7xAz1CU=;
  b=fyZuizgltFDBkk/S7GQfv2SnHN7HF82aCtsrI3gTNRDTQLk7jC42Ekji
   esvoxUCfaRF70JQgmT3FDD2iK5cmFq9RuuI5vUXLe1li7E+aCOATY90d1
   Wnlg63dSWyjkJWO4Ue5y4C+Q6xO32WAIPPrZCwLxXrR9PpBnu5G+3/lC6
   Qk/cRAgRFlwn9JwngCxy/0WoONiP5bnJNV0eX7QJNTTt2OijeJBRN3ESl
   jG4sYlCucB7sEF3RO5Nu0kccCrBh2N0DvMqzrmFjQZZ/HN0PfGYyVc7sa
   mnLo9kXUngxJcaZbtU9qOxinj7FHIdYZbG7rAX1fig+ZgjIq5Z2jfegeO
   w==;
X-CSE-ConnectionGUID: K8ZCq1x2SQ24Qu+ECdtN7w==
X-CSE-MsgGUID: tiT2GO9cRzas+5Z8SG6cLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="49894408"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="49894408"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:57:06 -0700
X-CSE-ConnectionGUID: dWm0qnqCRWW8jCiiIlaATw==
X-CSE-MsgGUID: 7zDjytvZQcmarg1mkSMO6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="163841940"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Apr 2025 03:57:05 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Gju-00055t-1U;
	Fri, 25 Apr 2025 10:57:02 +0000
Date: Fri, 25 Apr 2025 18:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 cb2e6671e05d300d7819e4c9ccae870a5e18a131
Message-ID: <202504251800.4OUF20U7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: cb2e6671e05d300d7819e4c9ccae870a5e18a131  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1462m

configs tested: 112
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250424    gcc-8.5.0
arc                   randconfig-002-20250424    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          exynos_defconfig    clang-21
arm                           h3600_defconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20250424    gcc-7.5.0
arm                   randconfig-002-20250424    gcc-7.5.0
arm                   randconfig-003-20250424    clang-21
arm                   randconfig-004-20250424    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250424    clang-21
arm64                 randconfig-002-20250424    gcc-8.5.0
arm64                 randconfig-003-20250424    clang-21
arm64                 randconfig-004-20250424    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250424    gcc-12.4.0
csky                  randconfig-002-20250424    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250424    clang-21
hexagon               randconfig-002-20250424    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250424    gcc-12
i386        buildonly-randconfig-002-20250424    clang-20
i386        buildonly-randconfig-003-20250424    clang-20
i386        buildonly-randconfig-004-20250424    clang-20
i386        buildonly-randconfig-005-20250424    gcc-12
i386        buildonly-randconfig-006-20250424    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250424    gcc-14.2.0
loongarch             randconfig-002-20250424    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
mips                           ip32_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250424    gcc-10.5.0
nios2                 randconfig-002-20250424    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250424    gcc-9.3.0
parisc                randconfig-002-20250424    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250424    clang-21
powerpc               randconfig-002-20250424    clang-17
powerpc               randconfig-003-20250424    clang-21
powerpc64             randconfig-001-20250424    clang-21
powerpc64             randconfig-002-20250424    clang-21
powerpc64             randconfig-003-20250424    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250424    clang-21
riscv                 randconfig-002-20250424    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250424    gcc-9.3.0
s390                  randconfig-002-20250424    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250424    gcc-12.4.0
sh                    randconfig-002-20250424    gcc-6.5.0
sh                           se7724_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250424    gcc-10.3.0
sparc                 randconfig-002-20250424    gcc-11.5.0
sparc64               randconfig-001-20250424    gcc-9.3.0
sparc64               randconfig-002-20250424    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250424    clang-21
um                    randconfig-002-20250424    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250424    gcc-12
x86_64      buildonly-randconfig-002-20250424    clang-20
x86_64      buildonly-randconfig-003-20250424    gcc-12
x86_64      buildonly-randconfig-004-20250424    clang-20
x86_64      buildonly-randconfig-005-20250424    clang-20
x86_64      buildonly-randconfig-006-20250424    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250424    gcc-14.2.0
xtensa                randconfig-002-20250424    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

