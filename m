Return-Path: <linux-renesas-soc+bounces-15986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAB3A899F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 12:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DDB517147E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 10:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C94628B505;
	Tue, 15 Apr 2025 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RuqcEed+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9970127EC9A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Apr 2025 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712794; cv=none; b=dPxBfxkdAIne8XE5AKUpx990IUhu6txFYV6kNwvRTXhqK/OiV1xK9xHDOEuy/+39c6Iz7kOlty346bcpmD5/YlrFBMHXrFtVuTPifXhgomQlSf9JTk+12BZLuqX7arlJAXt1bhQlhsynX1upOA5aMxcZ5a56lYrglcYD0iQEX/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712794; c=relaxed/simple;
	bh=rvUSHM7jcw2XiV3W+oue8j3XELZyqWZOOcxaRsPiiy0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hjqsTxO7jwHM0kQLfOM8HtqSIttPQLLTwAB/tqGemwy26CZMK2WKI0Ys+VxYF9u9uAvyp5qdtiBU4/bqVVldKmd0ZWD9Oih+8nUEoAEOmPwlhvGKPnDOlYACls2bfZR2OxVGd5tjo80ET54Vmu2a6HF2G1FyB8dWqmhUHcJ7c1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RuqcEed+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744712792; x=1776248792;
  h=date:from:to:cc:subject:message-id;
  bh=rvUSHM7jcw2XiV3W+oue8j3XELZyqWZOOcxaRsPiiy0=;
  b=RuqcEed+Ous0oT5Qs1BCWcLDtrf4iLsyC2XaS7iOZrelTOZutuOx3xLu
   gYPncf4vjMLSy7j1lxxCn25+P9CAehXLSwCjs/ecVmSnL+aTtN2fg+CHC
   03+JhKRgh+ciOFnKZYQAzSBzwznspV6WDZ4LwjQH7x2cLV3fO7n3wkxuA
   KhtOrZw6WEvemSzXkSEJNgwbLuxfU//xmixchXIojN7jnZKDXKHMkvR8N
   v3QleERhSZXa+/J1nHXOaPsz2rQEap1BxIhqofkVSooXsks4V/Pk63UjS
   7hMGpiH4XCFBX0SKChsH44va7IM4ojqwXRE1oymQlsDvIDQuEALlmwTof
   Q==;
X-CSE-ConnectionGUID: 9SYE5FhrT+ie6iZWlceYqg==
X-CSE-MsgGUID: ee4GtnLlSoaT/TyO/ACrYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="50015695"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="50015695"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 03:26:32 -0700
X-CSE-ConnectionGUID: llCesk14SeixDmzG4aN7Cg==
X-CSE-MsgGUID: oZ27CMDBR4COB8AuoqPAkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="129935654"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Apr 2025 03:26:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4dUq-000Fd4-2v;
	Tue, 15 Apr 2025 10:26:28 +0000
Date: Tue, 15 Apr 2025 18:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.16] BUILD
 SUCCESS 31d358e611b7cc21349da58dd2c9118c84b0859f
Message-ID: <202504151832.cqM71K8S-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.16
branch HEAD: 31d358e611b7cc21349da58dd2c9118c84b0859f  soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC

elapsed time: 1456m

configs tested: 106
configs skipped: 2

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
arm                         assabet_defconfig    clang-18
arm                           h3600_defconfig    gcc-14.2.0
arm                   randconfig-001-20250414    clang-18
arm                   randconfig-002-20250414    gcc-7.5.0
arm                   randconfig-003-20250414    gcc-7.5.0
arm                   randconfig-004-20250414    gcc-8.5.0
arm                         wpcm450_defconfig    gcc-14.2.0
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
loongarch             randconfig-001-20250414    gcc-12.4.0
loongarch             randconfig-002-20250414    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
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
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250414    clang-20
s390                  randconfig-002-20250414    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250414    gcc-6.5.0
sh                    randconfig-002-20250414    gcc-10.5.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                           se7751_defconfig    gcc-14.2.0
sh                             shx3_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250414    gcc-11.5.0
sparc                 randconfig-002-20250414    gcc-13.3.0
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

