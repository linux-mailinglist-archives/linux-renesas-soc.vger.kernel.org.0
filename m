Return-Path: <linux-renesas-soc+bounces-21512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 740CBB46035
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 19:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20F581BC8C4C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 17:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542D1306B1C;
	Fri,  5 Sep 2025 17:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGQoiLHC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8770309F06
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Sep 2025 17:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757093625; cv=none; b=YBHZecOqmNabIQDOKQz5zIU+Yp3kcj2hUlJV37VPd43vIfJHPggyVT4LZvEv8vOJT0xFYVjf+5BgvaurBtm7j1RJrC720nIYCQAJA7DvXS/ALP1HFglqcbY7JRJaDfmhT7rquuH4GIXFPY/YmW89egkuRtghZAI1WZ9e57LUVwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757093625; c=relaxed/simple;
	bh=nZG0UyyvC1yeMFMqoH90/9GAWHffvu0oD93nctTKP5A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PVK2iLjVt5RcOelPvd6v3M5CN+3QC/LbqsTFvZznVYpuF0oH74dq3UARIw5q5LFN2kXcPBpSUXrGz0GaUng3tf27JMUK6e7dabxd5lHgPQVn/wB51RLSX5D013eiKHwtDphPDmqL1ZTeaUjeUV1wRMs36cMCF4O0zpvPMqCRcE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGQoiLHC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757093624; x=1788629624;
  h=date:from:to:cc:subject:message-id;
  bh=nZG0UyyvC1yeMFMqoH90/9GAWHffvu0oD93nctTKP5A=;
  b=aGQoiLHCghzRKNCkvNL0tKdfsCwW/FMIXskHoZyPEHp6T1naUc1+f5y2
   YxTrautvnTphaTC/YyzU+0MxFGH8TUq+sK7Qo3t4qoEdnZCu6Qu2uOAHT
   7tL0acYoIMzLcXiehqOBRgzcaZubGCt29qrWdoSJEqqtM69K/GlkdkCyD
   rcoWQYBOACmVX1VQR5ohtqFJFCbODkavfHxn33uO1EyQy/62J7oPPn5TH
   gPYdSWT0EHW/rB7JYGp/9Baj9i8crjcKNWgpETD6tWKrAhbA0DUbnbFSk
   tbv9a6FPb3wwr0EjVNtfK3jkkyfVDyB89QukxIGE2llfPmtbtisvaN1YS
   g==;
X-CSE-ConnectionGUID: sMIXrfagTYOake7czhGVGg==
X-CSE-MsgGUID: HPl6n24qQrKjcjg2ZhtFOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59517127"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59517127"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 10:33:44 -0700
X-CSE-ConnectionGUID: vVf+xq/GQGCyOCIdnxWiAA==
X-CSE-MsgGUID: hmxxK8tfRLC41SLzIbNvug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="176552566"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Sep 2025 10:33:43 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuaJg-0000fr-0t;
	Fri, 05 Sep 2025 17:33:40 +0000
Date: Sat, 06 Sep 2025 01:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 14222b52662487cfed5de86314a9b66f324e2f98
Message-ID: <202509060127.9TWRyFcH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 14222b52662487cfed5de86314a9b66f324e2f98  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1856m

configs tested: 102
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                          axs101_defconfig    gcc-15.1.0
arc                   randconfig-001-20250904    gcc-9.5.0
arc                   randconfig-002-20250904    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250904    gcc-10.5.0
arm                   randconfig-002-20250904    gcc-13.4.0
arm                   randconfig-003-20250904    gcc-8.5.0
arm                   randconfig-004-20250904    gcc-13.4.0
arm                        spear6xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250904    gcc-8.5.0
arm64                 randconfig-002-20250904    gcc-8.5.0
arm64                 randconfig-003-20250904    clang-22
arm64                 randconfig-004-20250904    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250904    gcc-15.1.0
csky                  randconfig-002-20250904    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250904    clang-22
hexagon               randconfig-002-20250904    clang-20
i386                             allmodconfig    gcc-13
i386                              allnoconfig    gcc-13
i386                             allyesconfig    gcc-13
i386        buildonly-randconfig-001-20250904    clang-20
i386        buildonly-randconfig-002-20250904    gcc-12
i386        buildonly-randconfig-003-20250904    gcc-13
i386        buildonly-randconfig-004-20250904    gcc-13
i386        buildonly-randconfig-005-20250904    clang-20
i386        buildonly-randconfig-006-20250904    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250904    gcc-15.1.0
loongarch             randconfig-002-20250904    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250904    gcc-11.5.0
nios2                 randconfig-002-20250904    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20250904    gcc-8.5.0
parisc                randconfig-002-20250904    gcc-11.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250904    clang-19
powerpc               randconfig-002-20250904    gcc-13.4.0
powerpc               randconfig-003-20250904    clang-22
powerpc64             randconfig-001-20250904    gcc-15.1.0
powerpc64             randconfig-002-20250904    clang-22
powerpc64             randconfig-003-20250904    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250904    gcc-8.5.0
riscv                 randconfig-002-20250904    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250904    gcc-10.5.0
s390                  randconfig-002-20250904    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250904    gcc-12.5.0
sh                    randconfig-002-20250904    gcc-10.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250904    gcc-11.5.0
sparc                 randconfig-002-20250904    gcc-15.1.0
sparc64               randconfig-001-20250904    gcc-12.5.0
sparc64               randconfig-002-20250904    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-13
um                    randconfig-001-20250904    gcc-13
um                    randconfig-002-20250904    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250904    gcc-12
x86_64      buildonly-randconfig-002-20250904    clang-20
x86_64      buildonly-randconfig-003-20250904    gcc-13
x86_64      buildonly-randconfig-004-20250904    gcc-13
x86_64      buildonly-randconfig-005-20250904    gcc-13
x86_64      buildonly-randconfig-006-20250904    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250904    gcc-10.5.0
xtensa                randconfig-002-20250904    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

