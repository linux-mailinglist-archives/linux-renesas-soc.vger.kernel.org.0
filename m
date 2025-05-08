Return-Path: <linux-renesas-soc+bounces-16783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E9AAF329
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 07:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1975B1C0536F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 05:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A74B1EF080;
	Thu,  8 May 2025 05:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVFoR3hi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97EE8C1E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 05:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683473; cv=none; b=njTK3KGkZu7i00sDX4afPn85jPUnPbqkbQOLjHbRCkfT4odf8ESmNYvvSQxuNFL/J7i1J38x31xJYvzeDl8vpPEY+64fGK/ybqptKteY2btbNzzsB4ozTUngwnVSoVByjIMfXRGoS+pjHeYDPg4Om2VatIRkbe7+iBEvld4qQkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683473; c=relaxed/simple;
	bh=wurclXVrpuPt31qE+f93g9LzvzmUt5b94VHcrR40l6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sbriPvqsMlhf/YvdXNTUiAi85l2McL4B+tci8WasHRbtiw4vgrvdF8OVt7ymwwQNvTlc0O2YsEwLpUppyfwyiIlkkWfnw2dngtgq0OO+da/WmSeSw18csISITEY7Y2y10mtduAqQzETVI09RpHyOa6w+7gH6zh8NyoR8bcehNqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVFoR3hi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746683472; x=1778219472;
  h=date:from:to:cc:subject:message-id;
  bh=wurclXVrpuPt31qE+f93g9LzvzmUt5b94VHcrR40l6g=;
  b=cVFoR3hiwKRsz5kdodRNbFB2XfPFv/6OI4v4oBIQ3QZwO2EGY+Z1H+8M
   4lQK2THxHRIHVquLSWX6vjWv2vumbeFttVa6+aDRXcea4pmM06ifK6pup
   siiOSrVWsswegocscn2PKS/2mmtGbH7yshbgLg+4T8i+aOD7KCiDrb7ff
   ZV1gmHUfrJGY0CSbRGJFv/ZVcVSq3DWzRM7eiydcXK64el3UEQzARE1tW
   yhifOESwHFRGRGGAcNGtD8Q89tQULsZ4j0EC/yC1VoBLyyfgJp1m2qF52
   dde5CGo5clxW/tS2UTDb/mLULsVk5Mv75ohLSEr8HYxFxJ1PEoAMIu7QR
   g==;
X-CSE-ConnectionGUID: lVW9cX+fR6yEIRuZSRq14w==
X-CSE-MsgGUID: 8vNVHl0oRDSc+gzcbG2Zxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52258567"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="52258567"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:51:12 -0700
X-CSE-ConnectionGUID: khZps+nBSISFoDwqzHkSBg==
X-CSE-MsgGUID: z2EASHvnR2qJOf7BtfVCCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="136682569"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 May 2025 22:51:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCuA0-000ATc-1l;
	Thu, 08 May 2025 05:51:08 +0000
Date: Thu, 08 May 2025 13:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 71f15569e0581077492659bcc9a482791723a2e4
Message-ID: <202505081353.eZp0qVU7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 71f15569e0581077492659bcc9a482791723a2e4  Merge branches 'renesas-next' and 'topic/renesas-defconfig' into renesas-devel

elapsed time: 2747m

configs tested: 94
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250506    gcc-8.5.0
arc                   randconfig-002-20250506    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250506    clang-21
arm                   randconfig-002-20250506    clang-21
arm                   randconfig-003-20250506    clang-17
arm                   randconfig-004-20250506    clang-21
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250506    clang-21
arm64                 randconfig-002-20250506    gcc-8.5.0
arm64                 randconfig-003-20250506    clang-21
arm64                 randconfig-004-20250506    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250506    gcc-14.2.0
csky                  randconfig-002-20250506    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250506    clang-21
hexagon               randconfig-002-20250506    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250506    clang-20
i386        buildonly-randconfig-002-20250506    clang-20
i386        buildonly-randconfig-003-20250506    clang-20
i386        buildonly-randconfig-004-20250506    gcc-12
i386                                defconfig    clang-20
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250506    gcc-14.2.0
loongarch             randconfig-002-20250506    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250506    gcc-8.5.0
nios2                 randconfig-002-20250506    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250506    gcc-11.5.0
parisc                randconfig-002-20250506    gcc-5.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250506    clang-21
powerpc               randconfig-002-20250506    gcc-8.5.0
powerpc               randconfig-003-20250506    gcc-8.5.0
powerpc64             randconfig-001-20250506    clang-20
powerpc64             randconfig-002-20250506    gcc-8.5.0
powerpc64             randconfig-003-20250506    clang-18
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250506    clang-19
riscv                 randconfig-002-20250506    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250506    gcc-9.3.0
s390                  randconfig-002-20250506    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250506    gcc-12.4.0
sh                    randconfig-002-20250506    gcc-12.4.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250506    gcc-11.5.0
sparc                 randconfig-002-20250506    gcc-6.5.0
sparc64               randconfig-001-20250506    gcc-7.5.0
sparc64               randconfig-002-20250506    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250506    clang-17
um                    randconfig-002-20250506    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250506    clang-20
x86_64      buildonly-randconfig-002-20250506    gcc-12
x86_64      buildonly-randconfig-003-20250506    gcc-12
x86_64      buildonly-randconfig-004-20250506    clang-20
x86_64      buildonly-randconfig-005-20250506    clang-20
x86_64      buildonly-randconfig-006-20250506    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250506    gcc-13.3.0
xtensa                randconfig-002-20250506    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

