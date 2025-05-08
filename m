Return-Path: <linux-renesas-soc+bounces-16782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63834AAF2DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 07:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4236C1BC3576
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 05:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42757212D7C;
	Thu,  8 May 2025 05:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhJnS5mu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96797770E2
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 05:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746682090; cv=none; b=PKMWYS5kXXXBEe9Fb4y2J+rD34hirZNFijfT8YNNzyA5fy+a0esieHeXyaoaq3paXhAVtV+YDZLuYOMlpmbWUJGnGNt7e79TPSuTbHYmrfM8Uv+4KDPIt0f7LWJ0AVDK7PBYpXnMUCRoMm8JTyRwlo3dU79bn6O4Sg5kt9C/Hxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746682090; c=relaxed/simple;
	bh=THmd3pDwunWO1VsTLK2ZVz0KNZxVnZd7J0nvqLw3ArY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ks/XZ1n3ymuGIWvWHKIU2rgDpz6GMNBeBmDcUbZEsRQ7sg39scgabmuwiRDr/ZGQor29H3QQavcg0bDG96uOQ90P3r4uX/Awl52zoriExHp6E8K7XsF3vgjQFhuU69aHZVb4TaFU4dpZUXO79yR5TXZsIXODL+xx9SdL+jSy1q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhJnS5mu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746682088; x=1778218088;
  h=date:from:to:cc:subject:message-id;
  bh=THmd3pDwunWO1VsTLK2ZVz0KNZxVnZd7J0nvqLw3ArY=;
  b=HhJnS5muOSm4etQEwNn1KImTBWCnXjJEd11yTHddNV5sORXVMwKqsQHe
   AMMSzoGBS0bCNZgrFWRqSETjmq12ov5UH4cDf0zDb8dYUKBL+rdFL6HnK
   oG8v4Wkv2QNteoEi7H1VCJX0mLd8HpJ/NT+ewEpCtK2JrEI7LwLVg0fyX
   OjhQ1bSas/xjwpjbzfkM65FYWiZOF6fL8wSeysthvHriJedFzaiamYwso
   il0y4weZa9AGMdd7AxVZSEq6QQBmpa5MKr6irSMfYFG8v8Fa7UqUXBAN1
   hXgmj8fI2Sp2ONyCZL92MVsloMv71D3VsIHf4X+LECr9HqyReZSBjkpDv
   g==;
X-CSE-ConnectionGUID: 85NC6nk9Sx+Mc5VKVJloNg==
X-CSE-MsgGUID: aXIlBJGQQNy1q8Sa6HRTfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52098291"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="52098291"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:28:07 -0700
X-CSE-ConnectionGUID: comkjR8KQgW2EKOxEsqHlg==
X-CSE-MsgGUID: dfxCge2TRTq1+BTJJ8dDvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="141390954"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2025 22:28:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCtnc-000AMh-1X;
	Thu, 08 May 2025 05:28:00 +0000
Date: Thu, 08 May 2025 13:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 e313fa7ecf2b9a9a01684b9fc2866cea3d64619c
Message-ID: <202505081307.gV0FWcwp-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: e313fa7ecf2b9a9a01684b9fc2866cea3d64619c  [LOCAL] riscv: rzfive: defconfig: Update rzfive_defconfig

elapsed time: 2425m

configs tested: 67
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.2.0
arc                    allmodconfig    gcc-14.2.0
arc                     allnoconfig    gcc-14.2.0
arc                    allyesconfig    gcc-14.2.0
arc         randconfig-001-20250506    gcc-8.5.0
arc         randconfig-002-20250506    gcc-12.4.0
arm                    allmodconfig    gcc-14.2.0
arm                     allnoconfig    clang-21
arm                    allyesconfig    gcc-14.2.0
arm         randconfig-001-20250506    clang-21
arm         randconfig-002-20250506    clang-21
arm         randconfig-003-20250506    clang-17
arm         randconfig-004-20250506    clang-21
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-14.2.0
arm64       randconfig-001-20250506    clang-21
csky                    allnoconfig    gcc-14.2.0
csky        randconfig-001-20250506    gcc-14.2.0
csky        randconfig-002-20250506    gcc-14.2.0
hexagon                 allnoconfig    clang-21
hexagon     randconfig-001-20250506    clang-21
hexagon     randconfig-002-20250506    clang-21
i386                   allmodconfig    gcc-12
i386                    allnoconfig    gcc-12
i386                   allyesconfig    gcc-12
i386                      defconfig    clang-20
loongarch              allmodconfig    gcc-14.2.0
loongarch               allnoconfig    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                    allnoconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze              allnoconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
mips                    allnoconfig    gcc-14.2.0
nios2                   allnoconfig    gcc-14.2.0
nios2       randconfig-001-20250506    gcc-8.5.0
nios2       randconfig-002-20250506    gcc-6.5.0
openrisc                allnoconfig    gcc-14.2.0
parisc                  allnoconfig    gcc-14.2.0
powerpc                 allnoconfig    gcc-14.2.0
riscv                   allnoconfig    gcc-14.2.0
riscv       randconfig-001-20250506    clang-19
riscv       randconfig-002-20250506    clang-21
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-21
s390                   allyesconfig    gcc-14.2.0
s390        randconfig-001-20250506    gcc-9.3.0
s390        randconfig-002-20250506    clang-21
sh                     allmodconfig    gcc-14.2.0
sh                      allnoconfig    gcc-14.2.0
sh                     allyesconfig    gcc-14.2.0
sh          randconfig-001-20250506    gcc-12.4.0
sh          randconfig-002-20250506    gcc-12.4.0
sparc                  allmodconfig    gcc-14.2.0
sparc                   allnoconfig    gcc-14.2.0
sparc       randconfig-001-20250506    gcc-11.5.0
sparc       randconfig-002-20250506    gcc-6.5.0
sparc64     randconfig-001-20250506    gcc-7.5.0
sparc64     randconfig-002-20250506    gcc-5.5.0
um                      allnoconfig    clang-21
um          randconfig-001-20250506    clang-17
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    gcc-11
xtensa                  allnoconfig    gcc-14.2.0
xtensa      randconfig-002-20250506    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

