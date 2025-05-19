Return-Path: <linux-renesas-soc+bounces-17232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5CCABCBB1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 01:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A7BC3B4894
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 23:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD54021FF2C;
	Mon, 19 May 2025 23:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PiNaESK6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE989B67A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 23:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747698267; cv=none; b=GICYpD8BFtW5/fGEj2JIn6Ij2hsp4kEmZ0Pxc8/huZFuZpBbcFCwcoKtBZxI+Sy1GQq8MJGhBJQL6o9tiOhAup2AWYR9Ynz/JSLElkkdy44D6tpFISMcEz1+iHUzuc4638rQxkDKVzpVJOzVGbLFs0WSkYpQE9XCrPt4lqnj59c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747698267; c=relaxed/simple;
	bh=WX1ZBFzAySqmZh+xZxOchvjdZt5/DNWjtr5xbj6OVh0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k7Y9gpukS9+8ieGreuanvNJDmn7Pet7V7NPZkMSNu0zl3G1gSdYsaLlS4fg7xvTjXJ1Yi7Fv3JtYEsv1siwUQRHMWiyXC5v55JUhTqVnGOYRCskfk200etKImD9fwGcAZ0tkmKwDP+Bmt3PubBTlBc1RTs40qQmG8X20H9t5DZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PiNaESK6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747698266; x=1779234266;
  h=date:from:to:cc:subject:message-id;
  bh=WX1ZBFzAySqmZh+xZxOchvjdZt5/DNWjtr5xbj6OVh0=;
  b=PiNaESK6xMNfgZX9/fZ6Rzin0YTfOXw7LqATvH1SgbHTAP0NlOxOQPE1
   uSwZs6zWfa3XIDmXF56Jxwy5G+4I84QK/NWIpviMoGHDR4K4tHFfsLQby
   asoWj7ydTvznWFKSBxiwr62Wlq5we9D0aPZjJV/dUz6j3MJsBWWe+kc2Q
   5TCMUQya5xXNbU4z+sRPR5liA0gcs+Q0q9CzNncMKcizRCTNZdMNOC+zS
   T10IdwInEwyfnHiC1nWldmV70E0fbDldzEJnLyB5BMC1uxYs5Yufz9Qb4
   lCJ77Nq/+MNPSWlwm+8lYdM1UHrWjQ3wwIOzecmG1blydj2mL5O/eQpq5
   A==;
X-CSE-ConnectionGUID: qrT07eiJTkKrIOrh+fWW5w==
X-CSE-MsgGUID: 6Q0F39GzS9eT8GbsVtWlMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49546752"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49546752"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:44:25 -0700
X-CSE-ConnectionGUID: b7TYm5zITOeJtl5pAUhxMA==
X-CSE-MsgGUID: hwqAQmpIRLmdkpO4UYhkuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144508130"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 May 2025 16:44:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHA9d-000M00-2F;
	Mon, 19 May 2025 23:44:21 +0000
Date: Tue, 20 May 2025 07:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v6.17] BUILD
 SUCCESS e6da3b749e13c67db3c247632d6c8003050a9013
Message-ID: <202505200723.OU23JexT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.17
branch HEAD: e6da3b749e13c67db3c247632d6c8003050a9013  dt-bindings: soc: renesas: Document RZ/V2H EVK board part number

elapsed time: 864m

configs tested: 132
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250519    gcc-12.4.0
arc                   randconfig-002-20250519    gcc-8.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                        multi_v5_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250519    clang-18
arm                   randconfig-002-20250519    clang-21
arm                   randconfig-003-20250519    clang-20
arm                   randconfig-004-20250519    clang-21
arm                         socfpga_defconfig    gcc-14.2.0
arm                        spear6xx_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250519    clang-17
arm64                 randconfig-002-20250519    gcc-8.5.0
arm64                 randconfig-003-20250519    clang-19
arm64                 randconfig-004-20250519    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250519    gcc-10.5.0
csky                  randconfig-002-20250519    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250519    clang-21
hexagon               randconfig-002-20250519    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250519    clang-20
i386        buildonly-randconfig-002-20250519    clang-20
i386        buildonly-randconfig-003-20250519    gcc-12
i386        buildonly-randconfig-004-20250519    gcc-12
i386        buildonly-randconfig-005-20250519    gcc-12
i386        buildonly-randconfig-006-20250519    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250519    gcc-14.2.0
loongarch             randconfig-002-20250519    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-21
mips                          eyeq5_defconfig    gcc-14.2.0
mips                           ip32_defconfig    clang-21
mips                       rbtx49xx_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250519    gcc-14.2.0
nios2                 randconfig-002-20250519    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250519    gcc-7.5.0
parisc                randconfig-002-20250519    gcc-13.3.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250519    gcc-8.5.0
powerpc               randconfig-002-20250519    gcc-6.5.0
powerpc               randconfig-003-20250519    gcc-8.5.0
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20250519    clang-20
powerpc64             randconfig-002-20250519    gcc-6.5.0
powerpc64             randconfig-003-20250519    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250519    gcc-14.2.0
riscv                 randconfig-002-20250519    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250519    gcc-7.5.0
s390                  randconfig-002-20250519    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20250519    gcc-12.4.0
sh                    randconfig-002-20250519    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250519    gcc-11.5.0
sparc                 randconfig-002-20250519    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250519    gcc-7.5.0
sparc64               randconfig-002-20250519    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250519    gcc-12
um                    randconfig-002-20250519    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250519    clang-20
x86_64      buildonly-randconfig-002-20250519    gcc-12
x86_64      buildonly-randconfig-003-20250519    clang-20
x86_64      buildonly-randconfig-004-20250519    clang-20
x86_64      buildonly-randconfig-005-20250519    gcc-12
x86_64      buildonly-randconfig-006-20250519    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250519    gcc-7.5.0
xtensa                randconfig-002-20250519    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

