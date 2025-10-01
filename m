Return-Path: <linux-renesas-soc+bounces-22509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9981BB01B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 13:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6DED1711BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 11:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CA52D0606;
	Wed,  1 Oct 2025 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkoBN+Tx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709A72D0298
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 11:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759317233; cv=none; b=Mp2btQ2BEMwCATkcrgbTWQ+bjcVLpyvdGzmJXsGSs9s4yesmxXVp99abiYZ/kHT/gNRzL0OG/R/VjG+6OVTrdU/D4nm5/gEamaRW0cbY+tCHh0Mvk1OIza9CzXHHgl2mrhnkNenNdPenyPqTpyRPR/LTftGdOKAgQGqkwNPPjWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759317233; c=relaxed/simple;
	bh=4T22JMtgqarEMWXRAQakf9B7UUIq4/JXpDmECCYoc2E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HkH5CMSNpoC5lQacDmzXF/dBBRl5+1EN9q+MldOoe8ZUP+X5rgBBwZaKQGmFNLWCfc696LRjP3+djCgdzSE0VguO+g5Wwcq0OrMrB2D67XX9DQMpeyHZLUo8fWv9mwKY11nvuLTAzBeGIV2z7Fs76lSgewm2RzsfQKcdYslHeWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkoBN+Tx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759317231; x=1790853231;
  h=date:from:to:cc:subject:message-id;
  bh=4T22JMtgqarEMWXRAQakf9B7UUIq4/JXpDmECCYoc2E=;
  b=PkoBN+TxLQ3VrG+f6XXlUWTYuweuiy6T3zDeOo3v7UDz3k1k3lnUDCKY
   7XphBZP535K9EkI8Q1Raf9/KovwdtuUNeYFZbAL9aLsVCyArah5I/0C44
   qiMHrnWLjzncwo3/AMkAmbVVZ+dEoIjHJg8ET4idArOp21rcYFTDahJH0
   kw13go4CaQdbYdmERtUtFl9oqJ5960oXsuy0wsg+WVGBRzixWNk0oIs0K
   GAFK0REtLRz2L4e7gxK+5YcUUaMY+oRHMwPd4Z7KSkfe2tl62MqJdut8P
   tQzOForHbElkgggAPsMkfU78i35njksIlwZiGL11KduWkzCKvIAFWtaOv
   Q==;
X-CSE-ConnectionGUID: rt3HGXn3Tiid44RzNm4lrA==
X-CSE-MsgGUID: ruipMnJrSB+0OhNlpjo2Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72261764"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="72261764"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 04:13:51 -0700
X-CSE-ConnectionGUID: OhhAOM1YRQieTriqyoFHCQ==
X-CSE-MsgGUID: /eGQkKuMT3qQW6xdXih71Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="179175842"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Oct 2025 04:13:50 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3umJ-0002w5-2k;
	Wed, 01 Oct 2025 11:13:47 +0000
Date: Wed, 01 Oct 2025 19:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.19] BUILD SUCCESS
 57a08c4f69fdad91b1cfd4c13f8cee5270c1e3f9
Message-ID: <202510011912.yZpL1LD9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.19
branch HEAD: 57a08c4f69fdad91b1cfd4c13f8cee5270c1e3f9  ARM: dts: renesas: gose: Remove superfluous port property

elapsed time: 1456m

configs tested: 127
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250930    gcc-9.5.0
arc                   randconfig-002-20250930    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         assabet_defconfig    clang-18
arm                        keystone_defconfig    gcc-15.1.0
arm                   randconfig-001-20250930    gcc-13.4.0
arm                   randconfig-002-20250930    gcc-8.5.0
arm                   randconfig-003-20250930    gcc-8.5.0
arm                   randconfig-004-20250930    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250930    clang-18
arm64                 randconfig-002-20250930    clang-22
arm64                 randconfig-003-20250930    clang-18
arm64                 randconfig-004-20250930    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250930    gcc-13.4.0
csky                  randconfig-002-20250930    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250930    clang-22
hexagon               randconfig-002-20250930    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250930    gcc-12
i386        buildonly-randconfig-002-20250930    gcc-14
i386        buildonly-randconfig-003-20250930    clang-20
i386        buildonly-randconfig-004-20250930    gcc-14
i386        buildonly-randconfig-005-20250930    clang-20
i386        buildonly-randconfig-006-20250930    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250930    clang-22
loongarch             randconfig-002-20250930    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-22
mips                        vocore2_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250930    gcc-8.5.0
nios2                 randconfig-002-20250930    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250930    gcc-12.5.0
parisc                randconfig-002-20250930    gcc-9.5.0
parisc64                         alldefconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      mgcoge_defconfig    clang-22
powerpc               randconfig-001-20250930    gcc-8.5.0
powerpc               randconfig-002-20250930    gcc-14.3.0
powerpc               randconfig-003-20250930    gcc-15.1.0
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250930    gcc-14.3.0
powerpc64             randconfig-002-20250930    gcc-12.5.0
powerpc64             randconfig-003-20250930    gcc-11.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250930    gcc-10.5.0
riscv                 randconfig-002-20250930    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250930    gcc-12.5.0
s390                  randconfig-002-20250930    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          r7780mp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250930    gcc-15.1.0
sh                    randconfig-002-20250930    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250930    gcc-11.5.0
sparc                 randconfig-002-20250930    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250930    clang-22
sparc64               randconfig-002-20250930    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250930    gcc-14
um                    randconfig-002-20250930    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250930    clang-20
x86_64      buildonly-randconfig-002-20250930    gcc-14
x86_64      buildonly-randconfig-003-20250930    gcc-14
x86_64      buildonly-randconfig-004-20250930    clang-20
x86_64      buildonly-randconfig-005-20250930    gcc-14
x86_64      buildonly-randconfig-006-20250930    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250930    gcc-12.5.0
xtensa                randconfig-002-20250930    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

