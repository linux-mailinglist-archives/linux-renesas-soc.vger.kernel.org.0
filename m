Return-Path: <linux-renesas-soc+bounces-12148-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59394A11E8A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 10:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95749188EC37
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 09:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B78024816D;
	Wed, 15 Jan 2025 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSxn96uv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DF0248166
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jan 2025 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736934471; cv=none; b=Sm5sGIYdYAZ7/36CMx1RM+fvHcS4pgOU4kyqweQQBxlj7ogMOoylOVHEai0hyUjmBJM0e844HtTK2LUS+nVeAYuYKtAF4SfnKSIG2HXvumexUVoW3Eq4hyqzDxYMU6YeZrGt9yIDksK4zUXL/pl+aXu7CnSszvruTE535i2PQGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736934471; c=relaxed/simple;
	bh=z/jOP2QABXUyFSPzsaLAWcYZBS4qTC/wH+W+JLGKJuA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EuT+Rr6fQGSFyMwhaLh/vH+EcKJ9etnwKbXHh/9Dbp2HXNdLcj/IJaQS2RhIUv2vxtw80/IwQjJ8GDhOV52zdtkUItvag+Q1J1febvqVSMR5Ju/WZ8WdoamU5nPDu37aZuOqvVhWEz1RJN4gs9yiC0Z5oo7OP+98GaE0wnKny9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSxn96uv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736934469; x=1768470469;
  h=date:from:to:cc:subject:message-id;
  bh=z/jOP2QABXUyFSPzsaLAWcYZBS4qTC/wH+W+JLGKJuA=;
  b=PSxn96uv0zHj+nHPIzwfyBrq3e7aGaNJl7q+KvqeHiDFNerbDWuLR3gk
   UcdXwGTdJVOZeyCbj52XHWZDFC78c+hDYbKxhqmYi+7acMHBPYCdnkg/c
   DzwTt0hsMi1EI4bmQH0kM/Ou7gEbdIDhLxG8yJ0q8OBW9kQ/5oDoT2guC
   kTKXoTuSGhHPu8FIjyEG2ZdrFjWL5Z1lPXOGNUTm7H1rSWr3B5gpWYuZ8
   QZJuhjn3Hjde0ArsXkUMOuuN8n6jLf3e6r5H/ClFNRrUjO3y61ExxpntY
   avrbR7qh8Uwhwa7W3sdXD3SMFkrC60vNvLyU24096br/rK1wAYoHlalvz
   g==;
X-CSE-ConnectionGUID: uAhw+J+tQumOj+LBH8gY1Q==
X-CSE-MsgGUID: ER22sa+HRTeBL3rdB8YEPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="62632075"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="62632075"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 01:47:49 -0800
X-CSE-ConnectionGUID: TDawNHzQQjiAOSqSJUV6OQ==
X-CSE-MsgGUID: jumE+0iFT4KKytzg3OtAFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110224143"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jan 2025 01:47:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXzzz-000Pkv-28;
	Wed, 15 Jan 2025 09:47:43 +0000
Date: Wed, 15 Jan 2025 17:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.15] BUILD SUCCESS
 e2270df8cf29238c74d207c99b394dbe61cdf410
Message-ID: <202501151715.sn0zpGv8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.15
branch HEAD: e2270df8cf29238c74d207c99b394dbe61cdf410  clk: renesas: r8a779a0: Add FCPVX clocks

elapsed time: 1453m

configs tested: 107
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250114    gcc-13.2.0
arc                   randconfig-002-20250114    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                            mmp2_defconfig    gcc-14.2.0
arm                   randconfig-001-20250114    clang-15
arm                   randconfig-002-20250114    clang-20
arm                   randconfig-003-20250114    gcc-14.2.0
arm                   randconfig-004-20250114    gcc-14.2.0
arm                           u8500_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250114    clang-17
arm64                 randconfig-002-20250114    clang-19
arm64                 randconfig-003-20250114    gcc-14.2.0
arm64                 randconfig-004-20250114    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250114    gcc-14.2.0
csky                  randconfig-002-20250114    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250114    clang-20
hexagon               randconfig-002-20250114    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250114    gcc-12
i386        buildonly-randconfig-002-20250114    clang-19
i386        buildonly-randconfig-003-20250114    clang-19
i386        buildonly-randconfig-004-20250114    gcc-12
i386        buildonly-randconfig-005-20250114    clang-19
i386        buildonly-randconfig-006-20250114    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250114    gcc-14.2.0
loongarch             randconfig-002-20250114    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250114    gcc-14.2.0
nios2                 randconfig-002-20250114    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250114    gcc-14.2.0
parisc                randconfig-002-20250114    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250114    gcc-14.2.0
powerpc               randconfig-002-20250114    clang-20
powerpc               randconfig-003-20250114    gcc-14.2.0
powerpc64             randconfig-001-20250114    clang-20
powerpc64             randconfig-002-20250114    clang-15
powerpc64             randconfig-003-20250114    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250115    gcc-14.2.0
riscv                 randconfig-002-20250115    clang-16
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250115    clang-20
s390                  randconfig-002-20250115    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250115    gcc-14.2.0
sh                    randconfig-002-20250115    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250115    gcc-14.2.0
sparc                 randconfig-002-20250115    gcc-14.2.0
sparc64               randconfig-001-20250115    gcc-14.2.0
sparc64               randconfig-002-20250115    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250115    clang-18
um                    randconfig-002-20250115    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250114    clang-19
x86_64      buildonly-randconfig-002-20250114    clang-19
x86_64      buildonly-randconfig-003-20250114    clang-19
x86_64      buildonly-randconfig-004-20250114    clang-19
x86_64      buildonly-randconfig-005-20250114    clang-19
x86_64      buildonly-randconfig-006-20250114    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250115    gcc-14.2.0
xtensa                randconfig-002-20250115    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

