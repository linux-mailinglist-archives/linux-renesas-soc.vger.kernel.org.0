Return-Path: <linux-renesas-soc+bounces-16780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D1DAAF2C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 07:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A44A517BD1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 05:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8611F3BAC;
	Thu,  8 May 2025 05:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfCa2JMw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DC986323
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 05:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746681544; cv=none; b=n3aeKZ1d4mQ+6VQ/X509Q6iLEwvAe6yG2Lehj3htBQBQVt9EnWx8uBvacILUfYxa4cuINrmevSdu7VbDsiKBUQDrSSdkiK3wOSXHNIj9BAWzaRJsuX69j5d40WjDk5Bm0Go9c3mnyffeV6SFq97RMh8V7XhUIvMfHh2sEHUy5j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746681544; c=relaxed/simple;
	bh=dOvnoXerf2bw+rujERjdjuU2TxjlXaJSdEhRcPwVt4Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NIBhVEuc85B/bowNGaNad4TEm4DJJ7urkU4IdCN2dtj5tuTHJHvXItDwXTSoiDAi3h70/HvbElHFjnH+5IGTXxlBAq0h4L+3zAzOTddkjuSCbkRsEUBGJt62Vgyts5lFL1WECcDPNxOtnZaGjEsI7+sROHG4Blx5V522bWty5ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfCa2JMw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746681543; x=1778217543;
  h=date:from:to:cc:subject:message-id;
  bh=dOvnoXerf2bw+rujERjdjuU2TxjlXaJSdEhRcPwVt4Q=;
  b=NfCa2JMweys7X76y62SFZzRlFxyrksF15inl+Xsd6+ah+GMoBdeuUlDF
   9SH1fpL+fTHdkWGjm6t0+BYGI9qdob6r2F0xDwZsmiWoMlaaTSikZ0lW7
   DTfE6Bt08qu5vVgB4PxNInhwjahW7i506ea9F4aD4c3bDmRsZn6SdUEKS
   BsnaDupiH557YQLHY1FO9q/bg0U4ukn5z7qxKC2u3H9IxETUxu2n4DsaU
   yJ67UxYlH3zJVD3ZvDoPa6NxLghYgqJ9jTfAWqE2qmYZMJjgy1fcIYNGx
   EihRVRqgjCP7F1Fz00MFC4TVYE9znzEZnfQJUBgyEkBXL6EPDajUUTL3e
   A==;
X-CSE-ConnectionGUID: x3k5CKviQl+PyT4gkva8HQ==
X-CSE-MsgGUID: HaOAep/5RvCj1gh33C7/YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="73827602"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="73827602"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:19:02 -0700
X-CSE-ConnectionGUID: Oxg60brKQhK0gPgrYoiLWg==
X-CSE-MsgGUID: fA+4FIY3TMC9ZZ3BG6gC0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="159498359"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 May 2025 22:19:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCtes-000AJ7-2L;
	Thu, 08 May 2025 05:18:58 +0000
Date: Thu, 08 May 2025 13:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/msiof-fifo] BUILD SUCCESS
 ea0b0c13af38da57a973b3c0f37e54595546ea2d
Message-ID: <202505081354.fevd7lvJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/msiof-fifo
branch HEAD: ea0b0c13af38da57a973b3c0f37e54595546ea2d  [TEST] spi: sh-msiof: Add FIFO test code

elapsed time: 2415m

configs tested: 110
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.2.0
alpha                  allyesconfig    clang-19
alpha                  allyesconfig    gcc-14.2.0
alpha                     defconfig    gcc-14.2.0
arc                    allmodconfig    clang-19
arc                     allnoconfig    gcc-14.2.0
arc                    allyesconfig    clang-19
arc                       defconfig    gcc-14.2.0
arc         randconfig-001-20250506    gcc-8.5.0
arc         randconfig-002-20250506    gcc-12.4.0
arm                    allmodconfig    clang-19
arm                     allnoconfig    clang-21
arm                     allnoconfig    gcc-14.2.0
arm                    allyesconfig    clang-19
arm                       defconfig    gcc-14.2.0
arm         randconfig-001-20250506    clang-21
arm         randconfig-002-20250506    clang-21
arm         randconfig-003-20250506    clang-17
arm         randconfig-004-20250506    clang-21
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-14.2.0
arm64                     defconfig    gcc-14.2.0
arm64       randconfig-001-20250506    clang-21
csky                    allnoconfig    gcc-14.2.0
csky                      defconfig    gcc-14.2.0
csky        randconfig-001-20250506    gcc-14.2.0
csky        randconfig-002-20250506    gcc-14.2.0
hexagon                allmodconfig    clang-17
hexagon                allmodconfig    clang-19
hexagon                 allnoconfig    clang-21
hexagon                 allnoconfig    gcc-14.2.0
hexagon                allyesconfig    clang-19
hexagon                allyesconfig    clang-21
hexagon                   defconfig    gcc-14.2.0
hexagon     randconfig-001-20250506    clang-21
hexagon     randconfig-002-20250506    clang-21
i386                   allmodconfig    clang-20
i386                   allmodconfig    gcc-12
i386                    allnoconfig    clang-20
i386                    allnoconfig    gcc-12
i386                   allyesconfig    clang-20
i386                   allyesconfig    gcc-12
i386                      defconfig    clang-20
loongarch              allmodconfig    gcc-14.2.0
loongarch               allnoconfig    gcc-14.2.0
loongarch                 defconfig    gcc-14.2.0
loongarch   randconfig-001-20250506    gcc-14.2.0
loongarch   randconfig-002-20250506    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                    allnoconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
m68k                      defconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze              allnoconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
microblaze                defconfig    gcc-14.2.0
mips                    allnoconfig    gcc-14.2.0
nios2                   allnoconfig    gcc-14.2.0
nios2                     defconfig    gcc-14.2.0
nios2       randconfig-001-20250506    gcc-8.5.0
nios2       randconfig-002-20250506    gcc-6.5.0
openrisc                allnoconfig    clang-21
openrisc                allnoconfig    gcc-14.2.0
openrisc               allyesconfig    gcc-14.2.0
parisc                 allmodconfig    gcc-14.2.0
parisc                  allnoconfig    clang-21
parisc                  allnoconfig    gcc-14.2.0
parisc                 allyesconfig    gcc-14.2.0
parisc      randconfig-001-20250506    gcc-11.5.0
parisc      randconfig-002-20250506    gcc-5.5.0
parisc64                  defconfig    gcc-14.2.0
powerpc                allmodconfig    gcc-14.2.0
powerpc                 allnoconfig    clang-21
powerpc                 allnoconfig    gcc-14.2.0
powerpc                allyesconfig    gcc-14.2.0
powerpc     randconfig-001-20250506    clang-21
riscv                  allmodconfig    gcc-14.2.0
riscv                   allnoconfig    clang-21
riscv                   allnoconfig    gcc-14.2.0
riscv                  allyesconfig    gcc-14.2.0
riscv       randconfig-001-20250506    clang-19
s390                   allmodconfig    clang-18
s390                   allmodconfig    gcc-14.2.0
s390                    allnoconfig    clang-21
s390                   allyesconfig    gcc-14.2.0
s390        randconfig-001-20250506    gcc-9.3.0
s390        randconfig-002-20250506    clang-21
sh                     allmodconfig    gcc-14.2.0
sh                      allnoconfig    gcc-14.2.0
sh                     allyesconfig    gcc-14.2.0
sh          randconfig-001-20250506    gcc-12.4.0
sh          randconfig-002-20250506    gcc-12.4.0
sparc                  allmodconfig    gcc-14.2.0
sparc                   allnoconfig    gcc-14.2.0
sparc       randconfig-002-20250506    gcc-6.5.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-21
um                     allyesconfig    clang-19
um                     allyesconfig    gcc-12
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    clang-20
x86_64                    defconfig    gcc-11
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    clang-18
x86_64               rhel-9.4-kunit    clang-18
x86_64                 rhel-9.4-ltp    clang-18
x86_64                rhel-9.4-rust    clang-18
xtensa                  allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

