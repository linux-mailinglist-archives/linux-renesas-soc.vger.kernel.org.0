Return-Path: <linux-renesas-soc+bounces-15992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 817CFA89A60
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 12:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6B6C188D2AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 10:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FAB1E0E0C;
	Tue, 15 Apr 2025 10:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzQH5c1E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EA827B4ED
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Apr 2025 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713285; cv=none; b=NeufyZOxIGZREOMq80Hr6ZIyEQ9P8PtROVSDbynmc8tn0+XFBbYH/EhS+NNrPStpm5UuZq/SQUHB2lOL6K5qV7J3Yt99q5e2ixuPkM11dJGxVbASSVfJHb2XW4j/MbG+G+pTyG4wFLs3lzAnJuZGzQBBXs0quc2w3iiRa3Gtyjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713285; c=relaxed/simple;
	bh=cWE2/Bkyi72eHP2a/Cwmif5ZrddAJ5UTTZeGmvuCA/0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=saXC/OZvQf0mp745QHilPcetU/xI85NGxA5DhACgeGOJDI/0A4a98NOTu/tE5270FuKrH7VWUyFb7uC7tEO2/tmW3dFLNBsqd2RRlGGnQUT9+GrhyxkYJrsyt54P2Uja0olGit26LeyoMJkryzzOC3H/Uyo5J2uUrnBqszI1SrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzQH5c1E; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744713284; x=1776249284;
  h=date:from:to:cc:subject:message-id;
  bh=cWE2/Bkyi72eHP2a/Cwmif5ZrddAJ5UTTZeGmvuCA/0=;
  b=XzQH5c1E1zxl6ZstNyQhOrRIuAFaQBgUHFu7zVRhBoIo99pZ/VQUdHJV
   pv3o83kS/WoTOUyYlns84XIc6KRL+YTq71pLpgIIpyMNCk8bHsbZh/bVh
   H8mxvUElB5eB3S+ukZSuciMiCNR4s+zfnIEGqpi2piJ0/eSQAdobHlWGJ
   q/lLZ4UAjQq6c0Rx4iismU4TNXoJtxhf1+qfaKMHMNHJApy7LLIjEay8a
   gRN18xSP4jBJM59x0/2qn+rLUAfim3Sx3heoQ7xN490kl03Cf+HWpUO6l
   qSBko2bJT72Ogvby2fj3CVfxLD6k5sPpvkkbFDN2tSmzvF26MwwBTrmcN
   Q==;
X-CSE-ConnectionGUID: kiP/MiBZR6S5BUkAz+8wqg==
X-CSE-MsgGUID: QXejs3G9Rj6nrKkgVeNNrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57207016"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="57207016"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 03:33:33 -0700
X-CSE-ConnectionGUID: w9m2a+oPSiydozKVzJNJjQ==
X-CSE-MsgGUID: lganfN3aRmuKPxVRB6ekCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130610950"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Apr 2025 03:33:32 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4dbd-000FeP-2X;
	Tue, 15 Apr 2025 10:33:29 +0000
Date: Tue, 15 Apr 2025 18:33:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.16] BUILD
 SUCCESS 33d5bf70fff43fbc612450164bd0bab6b9ada261
Message-ID: <202504151821.A5LG4lgY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.16
branch HEAD: 33d5bf70fff43fbc612450164bd0bab6b9ada261  arm: multi_v7_defconfig: Drop individual Renesas SoC entries

elapsed time: 1464m

configs tested: 104
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250414    gcc-14.2.0
arc                   randconfig-002-20250414    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                      jornada720_defconfig    clang-21
arm                   randconfig-001-20250414    clang-18
arm                   randconfig-002-20250414    gcc-7.5.0
arm                   randconfig-003-20250414    gcc-7.5.0
arm                   randconfig-004-20250414    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                 randconfig-001-20250414    clang-21
arm64                 randconfig-002-20250414    clang-19
arm64                 randconfig-003-20250414    gcc-8.5.0
arm64                 randconfig-004-20250414    gcc-6.5.0
csky                  randconfig-001-20250414    gcc-14.2.0
csky                  randconfig-002-20250414    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250414    clang-18
hexagon               randconfig-002-20250414    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250414    gcc-12
i386        buildonly-randconfig-002-20250414    clang-20
i386        buildonly-randconfig-003-20250414    clang-20
i386        buildonly-randconfig-004-20250414    gcc-12
i386        buildonly-randconfig-005-20250414    gcc-12
i386        buildonly-randconfig-006-20250414    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250414    gcc-12.4.0
loongarch             randconfig-002-20250414    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-21
mips                           mtx1_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250414    gcc-12.4.0
nios2                 randconfig-002-20250414    gcc-12.4.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250414    gcc-5.5.0
parisc                randconfig-002-20250414    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250414    gcc-8.5.0
powerpc               randconfig-002-20250414    clang-21
powerpc               randconfig-003-20250414    gcc-6.5.0
powerpc64             randconfig-001-20250414    clang-17
powerpc64             randconfig-002-20250414    clang-21
powerpc64             randconfig-003-20250414    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250414    gcc-8.5.0
riscv                 randconfig-002-20250414    clang-21
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250414    clang-20
s390                  randconfig-002-20250414    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250414    gcc-6.5.0
sh                    randconfig-002-20250414    gcc-10.5.0
sh                          rsk7269_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250414    gcc-11.5.0
sparc                 randconfig-002-20250414    gcc-13.3.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64               randconfig-001-20250414    gcc-5.5.0
sparc64               randconfig-002-20250414    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250414    clang-21
um                    randconfig-002-20250414    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250414    clang-20
x86_64      buildonly-randconfig-002-20250414    clang-20
x86_64      buildonly-randconfig-003-20250414    clang-20
x86_64      buildonly-randconfig-004-20250414    clang-20
x86_64      buildonly-randconfig-005-20250414    clang-20
x86_64      buildonly-randconfig-006-20250414    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250414    gcc-7.5.0
xtensa                randconfig-002-20250414    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

