Return-Path: <linux-renesas-soc+bounces-25406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BFBC94F85
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 13:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8D46B344E8E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 12:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F54422D4E9;
	Sun, 30 Nov 2025 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgluN4LU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99C721FF55
	for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Nov 2025 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764506277; cv=none; b=BqWyX498re9fTfG3b19Gts/qSPcNXdh/99rn86778Q74Z1xOBFPnjWqZ3MGyVtH4U8HauGqI+vtjZrFMFvvjwo5Bc2VgBV/ezkXsM3sByxT7MR0TrtPRjqO1RBSl/w8vRT7tvOio9UNZ4iAWyW3nma9zhMLjH6bPqil4bcUBXC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764506277; c=relaxed/simple;
	bh=mMAuLrHPd8jCRLfPUVOxbcGS6XNm3u9GxWWCWa+ntnc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fAmhQnLIBrawg6oJ0XZVZ5HWDkRJcHttjqjv5fh1pVs8fxKRSVxSjviO4XFbflxGuR3CCxO1mMUzbEM69ckahIKgvfSSx1dG2ponv9mVQ1KT45xey6RdnLIHWSKtj7Kraet9GutjvZUN4VbYx716q0te4KA6qqD8k960hyxS/ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgluN4LU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764506276; x=1796042276;
  h=date:from:to:cc:subject:message-id;
  bh=mMAuLrHPd8jCRLfPUVOxbcGS6XNm3u9GxWWCWa+ntnc=;
  b=NgluN4LU2dWmcRMBIZ8i376DebvhWvW+S5gyZY3BQVkqBsluQJiBglKv
   Mjs22pSA445GYJNV1eWjmAtNlC5mGeDbudEjfdUj6M2wUDLWmP2Cd5lOu
   sbE14rdv3E8B2vTiNP5zVkifP6kBwr+AxSSgu8AaHe/oi/Uet2oaT0HVH
   9siyYHcaXu+sz2qVsjHWwD2ubeY4lBOUGNtHGxbiUg1w2onmf/sxeU98W
   OqQLZIEni302AVZcjkiA2TqdVezYtMyQ88zQJvcf7gYxco/cwwiwW1qXZ
   KKULtldtElS6els9vSo2ddQCDnMz2DKk9vW+9G8f8hYEFctVo8mY08Oh6
   A==;
X-CSE-ConnectionGUID: vQPhLYoyR7SU6R2zK1Uy8Q==
X-CSE-MsgGUID: FicK0t3mRG+DuBcDek7O7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="70308638"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="70308638"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 04:37:55 -0800
X-CSE-ConnectionGUID: /RLGhqBQQMKiChlfJBfMSg==
X-CSE-MsgGUID: 1A4ODsJuQrS2viX9nFLkIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="198030479"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Nov 2025 04:37:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPggZ-000000007xL-2j72;
	Sun, 30 Nov 2025 12:37:51 +0000
Date: Sun, 30 Nov 2025 20:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.20] BUILD SUCCESS
 3099b7d2d7ecae523036abe0cabfae25e8e56349
Message-ID: <202511302013.8P7N1wMX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.20
branch HEAD: 3099b7d2d7ecae523036abe0cabfae25e8e56349  clk: renesas: r9a09g056: Add entries for the RSPIs

elapsed time: 2884m

configs tested: 72
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                   randconfig-001-20251129    gcc-8.5.0
arc                   randconfig-002-20251129    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                                 defconfig    clang-22
arm                         lpc18xx_defconfig    clang-22
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20251129    clang-20
arm                   randconfig-002-20251129    gcc-10.5.0
arm                   randconfig-003-20251129    gcc-13.4.0
arm                   randconfig-004-20251129    gcc-8.5.0
arm                        spear3xx_defconfig    clang-17
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-003-20251129    gcc-8.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251129    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251129    clang-22
hexagon               randconfig-002-20251129    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251129    clang-20
i386        buildonly-randconfig-002-20251129    clang-20
i386        buildonly-randconfig-003-20251129    gcc-14
i386        buildonly-randconfig-004-20251129    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-011-20251129    clang-20
i386                  randconfig-012-20251129    gcc-13
i386                  randconfig-013-20251129    clang-20
i386                  randconfig-014-20251129    clang-20
i386                  randconfig-015-20251129    gcc-14
i386                  randconfig-016-20251129    clang-20
i386                  randconfig-017-20251129    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251129    gcc-15.1.0
loongarch             randconfig-002-20251129    gcc-14.3.0
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251129    gcc-11.5.0
nios2                 randconfig-002-20251129    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251129    gcc-10.5.0
parisc                randconfig-002-20251129    gcc-13.4.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251129    gcc-8.5.0
powerpc               randconfig-002-20251129    clang-22
powerpc64             randconfig-001-20251129    gcc-8.5.0
powerpc64             randconfig-002-20251129    gcc-13.4.0
riscv                             allnoconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                                allnoconfig    clang-22
x86_64                            allnoconfig    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

