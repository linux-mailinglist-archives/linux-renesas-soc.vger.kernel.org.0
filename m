Return-Path: <linux-renesas-soc+bounces-12287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 252BDA17610
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2025 03:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C9BE7A048F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2025 02:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76081129A78;
	Tue, 21 Jan 2025 02:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWSS7+ES"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B4FDDBE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jan 2025 02:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737428164; cv=none; b=GsX62F+7M6T8a4rt7tDQt0jrW7B7zLY3IR8lx71fPDU6raBhTF5rDESIKFIwllKasOc0Qna5XZn5xAqyO8LcCFYbwF1hhJQg4Hw9HQZAlfimzjOTXXDArvDa6lYkC6G19hCztsdxnHZOij4OYoC07mMOX3gS1VYuEZWegk5BHwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737428164; c=relaxed/simple;
	bh=06poEtiwQb5hbI45ipbHXjR8flhXpM6u1ne47/7sgzE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PWCMelq6MVMlWO5IvtcDrENX8WQvzMbZROfc74k/i9igTorSxlGIiGmbyMSumTDq1MlizbDAbsQl72R3Usnmy21KOFC8Uhv1oUjD29W/TYsMKuDZtT9wmNLEXQVbMTyJ1WGWB/2iVlGwYIR0YFETEWBGNLtrOrvBDLq1h1Q9fWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWSS7+ES; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737428163; x=1768964163;
  h=date:from:to:cc:subject:message-id;
  bh=06poEtiwQb5hbI45ipbHXjR8flhXpM6u1ne47/7sgzE=;
  b=aWSS7+ESBK8+a8/oVXZz8pf8CHx08Vgi0RKPMGoH5agzCcp59BVSf00F
   tZA94u8dLDwVYUMjPhyFe2b7qZu+XCQeJzL2o7pswnWbnsThY5astCY/1
   U4e4Jfrq6xyd567h7zI2jlmggCKUi59wGiUZcMkgNH/y0NksL7OgZH4jx
   L10wBVP9N5tdJt5jqE9NcGxXhJlAUj0G33PixZM3FGuHE73njrGaSph4m
   VQRUXF07FMwITv165p6FQH+NqMKVEmDU9S+lQR+LAZBoHp+DpV1kax3WT
   hT2UwPJOzmDsXCpbxplph0H/6+364Z1Y+CfZz97cZZtBEUAePYYnecpCd
   w==;
X-CSE-ConnectionGUID: ZeJOc6VaQBWt3evonifTnw==
X-CSE-MsgGUID: dVj1ib7LQpiA0jykEUo/BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="41502080"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="41502080"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 18:56:02 -0800
X-CSE-ConnectionGUID: 2Pl4uTrKSJWLUzhg3f3o0A==
X-CSE-MsgGUID: IfGX61MnQfyPt5HYerdI5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="111662784"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jan 2025 18:56:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta4Qo-000XWV-0T;
	Tue, 21 Jan 2025 02:55:58 +0000
Date: Tue, 21 Jan 2025 10:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.15] BUILD SUCCESS
 9e602fc4c0ba977ee1d45fe8e1dc1ba6f6efe5d2
Message-ID: <202501211008.9wQvz64S-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.15
branch HEAD: 9e602fc4c0ba977ee1d45fe8e1dc1ba6f6efe5d2  arm64: dts: renesas: r8a779h0: Add VSPX instance

elapsed time: 1048m

configs tested: 125
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-13.2.0
arc                   randconfig-001-20250120    gcc-13.2.0
arc                   randconfig-002-20250120    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                   randconfig-001-20250120    clang-20
arm                   randconfig-002-20250120    clang-20
arm                   randconfig-003-20250120    clang-20
arm                   randconfig-004-20250120    clang-19
arm                         s3c6400_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250120    gcc-14.2.0
arm64                 randconfig-002-20250120    clang-20
arm64                 randconfig-003-20250120    clang-19
arm64                 randconfig-004-20250120    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250120    gcc-14.2.0
csky                  randconfig-002-20250120    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250120    clang-20
hexagon               randconfig-002-20250120    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250120    gcc-11
i386        buildonly-randconfig-002-20250120    clang-19
i386        buildonly-randconfig-003-20250120    gcc-12
i386        buildonly-randconfig-004-20250120    gcc-12
i386        buildonly-randconfig-005-20250120    clang-19
i386        buildonly-randconfig-006-20250120    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250120    gcc-14.2.0
loongarch             randconfig-002-20250120    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250120    gcc-14.2.0
nios2                 randconfig-002-20250120    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250120    gcc-14.2.0
parisc                randconfig-002-20250120    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                   bluestone_defconfig    clang-20
powerpc                   currituck_defconfig    clang-17
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250120    clang-20
powerpc               randconfig-002-20250120    clang-20
powerpc               randconfig-003-20250120    clang-20
powerpc64             randconfig-001-20250120    clang-19
powerpc64             randconfig-002-20250120    clang-17
powerpc64             randconfig-003-20250120    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250120    clang-20
riscv                 randconfig-002-20250120    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250120    gcc-14.2.0
s390                  randconfig-002-20250120    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250120    gcc-14.2.0
sh                    randconfig-002-20250120    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250120    gcc-14.2.0
sparc                 randconfig-002-20250120    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250120    gcc-14.2.0
sparc64               randconfig-002-20250120    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250120    clang-15
um                    randconfig-002-20250120    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250120    clang-19
x86_64      buildonly-randconfig-002-20250120    clang-19
x86_64      buildonly-randconfig-003-20250120    gcc-12
x86_64      buildonly-randconfig-004-20250120    clang-19
x86_64      buildonly-randconfig-005-20250120    clang-19
x86_64      buildonly-randconfig-006-20250120    gcc-11
x86_64                              defconfig    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250120    gcc-14.2.0
xtensa                randconfig-002-20250120    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

