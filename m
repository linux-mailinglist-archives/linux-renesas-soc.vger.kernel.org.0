Return-Path: <linux-renesas-soc+bounces-25407-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD4EC94FA0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 13:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63F1B3A386B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 12:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6BC1A8F97;
	Sun, 30 Nov 2025 12:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmJTKfbL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557B519A288
	for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Nov 2025 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764507003; cv=none; b=IwGtw5gVr95kgKkHxIOnTOdRjoMEwMjQqPZzBkLhfUPZkZtqsoy/VtANV/BoKjNqeSiW05FYlhgTpJ12ukZMHAwP0/FqL+cj4grsAk9jkV5dKzUzXpcN+HRF0xEN38Xhp9QKJT06qMFznqyfcXjhYtRd+f7cCy0mSmJeZRre5x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764507003; c=relaxed/simple;
	bh=D5MFqb5wfqbKHVHRBknRZlu/44DoWiW5pcNSjXonNvg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u0AuBEjgIkk+u3QGDRJLCyWI3YZjW76DuO+cUpyWsIqEkCsqaSuSoBK7zJlTqlCB38Z0OPBNA9/fm2MTvEcPZ2JzgXg4/XkP6x298Zes7d98I0rfYf/9/mllRk6lh4gLh2m3wlBXsL22nGClApODZkX878G/J7MIarPjsuiyClM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmJTKfbL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764507001; x=1796043001;
  h=date:from:to:cc:subject:message-id;
  bh=D5MFqb5wfqbKHVHRBknRZlu/44DoWiW5pcNSjXonNvg=;
  b=MmJTKfbLlQdpJGuv48qJGdo3K17uGRayfKAUn9Cj8f1v8DAx2OB5acSw
   baJoMYwxaxjZ08GZFDJtGD4ap2sNz6dyqN8ENnIdQBxKgZUDmWfkH3Bq1
   newGssxcycZhK816OeAa2vO6i7qY3SdvDVHGhbfTdip3cCDnxrVg7c5Bs
   9vfi9FygRRE1oCUHZo7N99zVJkY3vyYHUFjpKTQSqlLVf62Po/8e4OhPr
   AaJ3LK8dwYqYCi3TBvhWMmC5urN5BcVkpg6OG0s02WynGEAZn558ahHqW
   WOItWkLuiy+u0Uhl1SzygXcC8fitvj9Y3nZ21aSS0kjHLKy447GaOAiqc
   g==;
X-CSE-ConnectionGUID: 7uaCGs0AQDmw6t1kl0N2+Q==
X-CSE-MsgGUID: l6hkii/1SMKD2k8Q56v9dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66487169"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="66487169"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 04:49:56 -0800
X-CSE-ConnectionGUID: OVWtFtR1SrSbs3wvO9V3WA==
X-CSE-MsgGUID: Z8lSWcVPTIalPWCjyMNc3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="194625242"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Nov 2025 04:49:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPgsB-000000007xd-3BzU;
	Sun, 30 Nov 2025 12:49:51 +0000
Date: Sun, 30 Nov 2025 20:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.20] BUILD SUCCESS
 e450630112fa72ed6046c76f7b4481d00e702e3a
Message-ID: <202511302007.UTjwf5m0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.20
branch HEAD: e450630112fa72ed6046c76f7b4481d00e702e3a  ARM: dts: renesas: r9a06g032: Add Ethernet switch interrupts

elapsed time: 2893m

configs tested: 77
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
alpha                     defconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arc                       defconfig    gcc-15.1.0
arc         randconfig-001-20251129    gcc-8.5.0
arc         randconfig-002-20251129    gcc-8.5.0
arm                     allnoconfig    clang-22
arm           am200epdkit_defconfig    gcc-15.1.0
arm             aspeed_g5_defconfig    gcc-15.1.0
arm                       defconfig    clang-22
arm         randconfig-001-20251129    clang-20
arm         randconfig-002-20251129    gcc-10.5.0
arm         randconfig-003-20251129    gcc-13.4.0
arm         randconfig-004-20251129    gcc-8.5.0
arm               s3c6400_defconfig    gcc-15.1.0
arm                 u8500_defconfig    gcc-15.1.0
arm64                   allnoconfig    gcc-15.1.0
arm64                     defconfig    gcc-15.1.0
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky                      defconfig    gcc-15.1.0
csky        randconfig-001-20251129    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon                   defconfig    clang-22
hexagon     randconfig-001-20251129    clang-22
hexagon     randconfig-002-20251129    clang-22
i386                    allnoconfig    gcc-14
i386                      defconfig    clang-20
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch   randconfig-002-20251129    gcc-14.3.0
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251129    gcc-11.5.0
openrisc                allnoconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
parisc      generic-64bit_defconfig    gcc-15.1.0
parisc      randconfig-001-20251129    gcc-10.5.0
parisc      randconfig-002-20251129    gcc-13.4.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc            pcm030_defconfig    clang-22
powerpc     randconfig-001-20251129    gcc-8.5.0
powerpc     randconfig-002-20251129    clang-22
powerpc64   randconfig-001-20251129    gcc-8.5.0
powerpc64   randconfig-002-20251129    gcc-13.4.0
riscv                   allnoconfig    gcc-15.1.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sh                        defconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc64                   defconfig    clang-20
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
um                        defconfig    clang-22
x86_64                  allnoconfig    clang-20
x86_64                    defconfig    gcc-14
xtensa                  allnoconfig    gcc-15.1.0
xtensa          xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

