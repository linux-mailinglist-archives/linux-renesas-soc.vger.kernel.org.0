Return-Path: <linux-renesas-soc+bounces-14148-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EEEA56D38
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 17:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B38F3B79EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 16:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2909227E97;
	Fri,  7 Mar 2025 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7jhNvp5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4DF226D1A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Mar 2025 16:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741363767; cv=none; b=EDv9sD27ZfoVgnEmC747u3+jvhVcclEhaFbpfn+goujZWh4dbemShwCPPKiiL3kkV1Hr7S/WiRorGF6BC3KjzVk43Sf/mToewnhYAH+TZbC6B5LT2tVMb8gewwz5oWAbWtAgLoMzjDqZlCiWrqIWRgWm/1lYpLC4KfCVJ/scnco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741363767; c=relaxed/simple;
	bh=l8HkmGrKcW78g+dolA2UqEvxmbd6ku/AT3JdwSRqSbk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TByulYsjPrqTfinaeU/XNejXj35K/LpzoJLZlKjDc881UIMRY3yaZmBZ+OygeoV3ukZIPFn/7Vkvuq9YsaIdU1/35968E3yTdzoeTBAsuqUiphFvmnNqUsWKKm8ih3wGVmNJRC4+F/5UrgC/mhDKLpr0rsbzCt2li62D0tO+ez0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7jhNvp5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741363766; x=1772899766;
  h=date:from:to:cc:subject:message-id;
  bh=l8HkmGrKcW78g+dolA2UqEvxmbd6ku/AT3JdwSRqSbk=;
  b=U7jhNvp5IeBkP6fHGeWdRsfWSWv3ymZ+bqN14CTZbuf+KiLgjlCrTK7D
   LzyYelSB5VuvMv5wHZ4xTzusTpk/xSzaBKOEv9xvQvZmM1+ANFZhSb9wZ
   aofmMXYaZe5a58LJJjJ6d/NvfeaR9UdMsyFJYPZ1uBZO5L58uIICTlkAm
   FWCj0kFeFMnGmBbexhFMcdlyJnFCEr+psiizMouoB5jvv+GLbMAxrw14R
   H1+HvMNTLwTVQYyPy/qb181l9Oy4hbmmIg1a44X5nfBw4ekKhfax5P5jT
   U06gaLcgQufyTkJnuDZw2m0tSlNEaULMCa7COyGBda7N0BSTS9Sz7vU84
   w==;
X-CSE-ConnectionGUID: lc10QBLwSKCpNN0m4r8xkg==
X-CSE-MsgGUID: 43wvUGkjQK2OEu0peTG8og==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41669551"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="41669551"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 08:09:25 -0800
X-CSE-ConnectionGUID: 1nWc4qPySMCg/pOJ8Zzifw==
X-CSE-MsgGUID: 3eRV/TqKQ2W2TS8N0qPJ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119531044"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 07 Mar 2025 08:09:24 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqaGI-0000iR-1D;
	Fri, 07 Mar 2025 16:09:22 +0000
Date: Sat, 08 Mar 2025 00:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v6.15] BUILD
 SUCCESS abcdeb4e299a11ecb5a3ea0cce00e68e8f540375
Message-ID: <202503080000.fK1mArWX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v6.15
branch HEAD: abcdeb4e299a11ecb5a3ea0cce00e68e8f540375  pinctrl: renesas: rza2: Fix missing of_node_put() call

elapsed time: 1447m

configs tested: 108
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250307    gcc-13.2.0
arc                   randconfig-002-20250307    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250307    clang-21
arm                   randconfig-002-20250307    gcc-14.2.0
arm                   randconfig-003-20250307    clang-19
arm                   randconfig-004-20250307    clang-21
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250307    gcc-14.2.0
arm64                 randconfig-002-20250307    clang-15
arm64                 randconfig-003-20250307    gcc-14.2.0
arm64                 randconfig-004-20250307    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250307    gcc-14.2.0
csky                  randconfig-002-20250307    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250307    clang-21
hexagon               randconfig-002-20250307    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250307    clang-19
i386        buildonly-randconfig-002-20250307    clang-19
i386        buildonly-randconfig-003-20250307    gcc-11
i386        buildonly-randconfig-004-20250307    clang-19
i386        buildonly-randconfig-005-20250307    gcc-12
i386        buildonly-randconfig-006-20250307    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250307    gcc-14.2.0
loongarch             randconfig-002-20250307    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         rt305x_defconfig    clang-19
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250307    gcc-14.2.0
nios2                 randconfig-002-20250307    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250307    gcc-14.2.0
parisc                randconfig-002-20250307    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250307    gcc-14.2.0
powerpc               randconfig-002-20250307    clang-21
powerpc               randconfig-003-20250307    clang-19
powerpc64             randconfig-001-20250307    clang-21
powerpc64             randconfig-002-20250307    gcc-14.2.0
powerpc64             randconfig-003-20250307    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250307    gcc-14.2.0
riscv                 randconfig-002-20250307    clang-19
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250307    gcc-14.2.0
s390                  randconfig-002-20250307    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250307    gcc-14.2.0
sh                    randconfig-002-20250307    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250307    gcc-14.2.0
sparc                 randconfig-002-20250307    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250307    gcc-14.2.0
sparc64               randconfig-002-20250307    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250307    clang-17
um                    randconfig-002-20250307    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250307    clang-19
x86_64      buildonly-randconfig-002-20250307    gcc-12
x86_64      buildonly-randconfig-003-20250307    clang-19
x86_64      buildonly-randconfig-004-20250307    clang-19
x86_64      buildonly-randconfig-005-20250307    clang-19
x86_64      buildonly-randconfig-006-20250307    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250307    gcc-14.2.0
xtensa                randconfig-002-20250307    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

