Return-Path: <linux-renesas-soc+bounces-8726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AFD96CABB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2024 01:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 875FB283E4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 23:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2B91714B2;
	Wed,  4 Sep 2024 23:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmj0/eEz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1863379E1
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Sep 2024 23:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725491585; cv=none; b=maGBLhw1lsEVIBOnMT7aNhdYUO7lmDSBVUtk2x0AzupzK0NCA2NqIEYM6vXTAKf3EqSsqAGy8E3WzeKW2+aJEVNXHRHEGFPwYcXw995zol7c7fW4oeuLBTFDL/74I5rL/t7itZ94MhNswU9Qj91RZE8Xia/7oXtSGXCoODrZGfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725491585; c=relaxed/simple;
	bh=o7QMize8n6ui9EpSt8Ohp6s7FRIZLGW901W/rcvhwnY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WfmDbNvRd1FZbUN2oGd41RgAW12UPa4Tyd1nAzh5H16Sb1JrQnLoU4WCuWj3hC7sFWJtfFtXH3VLdu7Fp1SuM/XXmwoktaLKSzxaRk4wx4rnWZoAH/D6BEAwOOhgGzWZxdb9QXo2RSXNrqswRmifu+DfFB3fFlXcU09MV0qOHsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmj0/eEz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725491584; x=1757027584;
  h=date:from:to:cc:subject:message-id;
  bh=o7QMize8n6ui9EpSt8Ohp6s7FRIZLGW901W/rcvhwnY=;
  b=cmj0/eEzZ1HQ2cq24i/efDt6lEilonzaS2HSRzwE6TUObn+6hKnF0nLB
   d2EmFiaDY5QRKPLUq8r44tuMhOYVnjWYZGXYikDKCzh/9Y9bl+CNWGrDR
   P2yZ/QahciD/peYEX+9BtiZEvpyPxg1Fvc2rWiD9mltscAcR2ueu7f6ib
   81nXPPrvryB8FT2IdEa71moKewdhqdgV9lf4+z54eQtrMaKhC/hBJFmAk
   GJcEnK4N6uEPLPexVQnkkT9VzyrZ3dCxxXO4o7z2lBAl+3wKuHEXOhr5g
   cE2Q0cxar6FYEzuCv32Ywbas1W7m3jsH0nZ0c5ithsBlqih8bqyOW+/Sh
   g==;
X-CSE-ConnectionGUID: PIBy8aUHRYSCxdkEKP0upA==
X-CSE-MsgGUID: YqYKITBGQguy3/8wedM54A==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="49589761"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="49589761"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 16:12:51 -0700
X-CSE-ConnectionGUID: z2Oe2ug5SJOBx9e4xYcEHw==
X-CSE-MsgGUID: EtOhbXteRYO5nb60or/v9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="66166243"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Sep 2024 16:12:50 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slzBA-0008gd-0U;
	Wed, 04 Sep 2024 23:12:48 +0000
Date: Thu, 05 Sep 2024 07:12:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-overlays] BUILD SUCCESS
 8436b2ed18c4c1ccdf3fbe6487d39f381ef36c4e
Message-ID: <202409050725.69UXppa7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
branch HEAD: 8436b2ed18c4c1ccdf3fbe6487d39f381ef36c4e  arm64: dts: renesas: white-hawk-cpu: Add overlay for CP97/98

elapsed time: 2040m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240905   gcc-13.2.0
arc                   randconfig-002-20240905   gcc-13.2.0
arm                               allnoconfig   clang-20
arm                   randconfig-001-20240905   clang-14
arm                   randconfig-002-20240905   clang-20
arm                   randconfig-003-20240905   clang-20
arm                   randconfig-004-20240905   gcc-14.1.0
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240905   clang-20
arm64                 randconfig-002-20240905   gcc-14.1.0
arm64                 randconfig-003-20240905   clang-20
arm64                 randconfig-004-20240905   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240905   gcc-14.1.0
csky                  randconfig-002-20240905   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240905   clang-20
hexagon               randconfig-002-20240905   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240904   clang-18
i386         buildonly-randconfig-002-20240904   gcc-12
i386         buildonly-randconfig-003-20240904   clang-18
i386         buildonly-randconfig-004-20240904   clang-18
i386         buildonly-randconfig-005-20240904   clang-18
i386         buildonly-randconfig-006-20240904   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240904   clang-18
i386                  randconfig-002-20240904   clang-18
i386                  randconfig-003-20240904   clang-18
i386                  randconfig-004-20240904   clang-18
i386                  randconfig-005-20240904   gcc-12
i386                  randconfig-006-20240904   gcc-12
i386                  randconfig-011-20240904   clang-18
i386                  randconfig-012-20240904   clang-18
i386                  randconfig-013-20240904   gcc-12
i386                  randconfig-014-20240904   clang-18
i386                  randconfig-015-20240904   clang-18
i386                  randconfig-016-20240904   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240905   gcc-14.1.0
loongarch             randconfig-002-20240905   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240905   gcc-14.1.0
nios2                 randconfig-002-20240905   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                randconfig-001-20240905   gcc-14.1.0
parisc                randconfig-002-20240905   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc               randconfig-001-20240905   clang-14
powerpc               randconfig-002-20240905   clang-20
powerpc               randconfig-003-20240905   gcc-14.1.0
powerpc64             randconfig-001-20240905   gcc-14.1.0
powerpc64             randconfig-002-20240905   gcc-14.1.0
powerpc64             randconfig-003-20240905   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                 randconfig-001-20240905   gcc-14.1.0
riscv                 randconfig-002-20240905   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                  randconfig-001-20240905   clang-20
s390                  randconfig-002-20240905   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                    randconfig-001-20240905   gcc-14.1.0
sh                    randconfig-002-20240905   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240905   gcc-12
x86_64       buildonly-randconfig-002-20240905   clang-18
x86_64       buildonly-randconfig-003-20240905   gcc-12
x86_64       buildonly-randconfig-004-20240905   clang-18
x86_64       buildonly-randconfig-005-20240905   clang-18
x86_64       buildonly-randconfig-006-20240905   gcc-12
x86_64                              defconfig   gcc-11
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

