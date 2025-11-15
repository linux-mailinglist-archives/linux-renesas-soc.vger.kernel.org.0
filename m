Return-Path: <linux-renesas-soc+bounces-24670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D73C60319
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Nov 2025 11:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 276DA358662
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Nov 2025 10:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B98283FDF;
	Sat, 15 Nov 2025 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AY35a/tr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEFF274B23
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Nov 2025 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763201092; cv=none; b=EW4Tr5ANzqClN+AmkEJgv/8IL0FAxUYlXinF/JsXmEEz7OmTKle01zEJ52YdfQilpl+/+RLloJfF8W6ntzfn/F66Mu2/AkEjg/MK+MCbSn5qA1mL9tf4kdJ2Z4j7udiKQcPas07ezT+MHQBrs+ewr8KGu9PJbopYbaZjYsMPOfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763201092; c=relaxed/simple;
	bh=wmJtS/j3ZAvmP2dgJwttfQqGueQzqCZ3PMDhRaGsR1M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DsjSm5V5n/vHPvvjCgWWcX6SYdQsVkLXF5silbaqJXcdwLuuTjJRf1zHv8h1XVXk5VN9mmPpybLhEXti838+EOl9JEgh0GUlcYUhotUVRhPd5yE/aiO7+iDg4LBcTRSvPp6RF5PKtRiTb7nX4ds8Nl0CS1dGdaNZLobI3vTwDMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AY35a/tr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763201090; x=1794737090;
  h=date:from:to:cc:subject:message-id;
  bh=wmJtS/j3ZAvmP2dgJwttfQqGueQzqCZ3PMDhRaGsR1M=;
  b=AY35a/trHiHBY0457C/IRXAxOutsPkuSRhox9Me5Gcr6aPHx6AnfYBlc
   LigKY13Uze12mch5X/rCRpdlo5/rzZxEMTdGX9QtQ4vJuSM+5dl7UwsVb
   yJQ8eLS4H5Z/hFReTDX4iTuH9lfckl5dkB5CWaHZ56lKyaTvXjlMSfeSp
   K/3x27zTN1KmO+zx89vrDGtYRtODbMwnY3FHRfZLpYrtO9R9573dv2edZ
   21OpdbHPQslEAdf0AN4/DDTFCaprv8Md+V6K6cwjIR0oAt0SXmSW6NwLP
   If0IV8cf6ZvEqF8cVJNcpAf8nVpiCiovUV6lhu/4uGsCmwDkM5qvOyTRJ
   w==;
X-CSE-ConnectionGUID: 7I5f0HWVS8GDh7UKOqvStQ==
X-CSE-MsgGUID: kd0iZAVISICAC0l9b9No2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65186475"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="65186475"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 02:04:48 -0800
X-CSE-ConnectionGUID: sCHJSKBKQpqX5APMzgupxQ==
X-CSE-MsgGUID: /p8hU6bSSAOEVoqKdWWG5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="189819354"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Nov 2025 02:04:46 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKD9A-0007sB-1u;
	Sat, 15 Nov 2025 10:04:44 +0000
Date: Sat, 15 Nov 2025 18:04:07 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 5fb2f67341bd4b7c482f2bbda6b78244a51c3923
Message-ID: <202511151802.RdxQCDsJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 5fb2f67341bd4b7c482f2bbda6b78244a51c3923  clk: renesas: r9a09g077: Add SPI module clocks

elapsed time: 2184m

configs tested: 115
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251114    gcc-8.5.0
arc                   randconfig-002-20251114    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                       omap2plus_defconfig    gcc-15.1.0
arm                   randconfig-001-20251114    gcc-15.1.0
arm                   randconfig-002-20251114    gcc-14.3.0
arm                   randconfig-003-20251114    clang-22
arm                   randconfig-004-20251114    clang-22
arm                           tegra_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251115    gcc-8.5.0
arm64                 randconfig-002-20251115    clang-18
arm64                 randconfig-003-20251115    gcc-13.4.0
arm64                 randconfig-004-20251115    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251115    gcc-15.1.0
csky                  randconfig-002-20251115    gcc-9.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251115    clang-16
hexagon               randconfig-002-20251115    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251115    gcc-14
i386        buildonly-randconfig-002-20251115    gcc-14
i386        buildonly-randconfig-003-20251115    clang-20
i386        buildonly-randconfig-004-20251115    clang-20
i386        buildonly-randconfig-005-20251115    clang-20
i386        buildonly-randconfig-006-20251115    clang-20
i386                  randconfig-001-20251115    gcc-14
i386                  randconfig-002-20251115    clang-20
i386                  randconfig-003-20251115    clang-20
i386                  randconfig-004-20251115    clang-20
i386                  randconfig-005-20251115    gcc-14
i386                  randconfig-006-20251115    gcc-14
i386                  randconfig-007-20251115    gcc-14
i386                  randconfig-011-20251115    clang-20
i386                  randconfig-012-20251115    gcc-14
i386                  randconfig-013-20251115    gcc-14
i386                  randconfig-014-20251115    clang-20
i386                  randconfig-015-20251115    clang-20
i386                  randconfig-016-20251115    clang-20
i386                  randconfig-017-20251115    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch                 loongson3_defconfig    clang-22
loongarch             randconfig-001-20251115    clang-18
loongarch             randconfig-002-20251115    gcc-13.4.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        vocore2_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251115    gcc-8.5.0
nios2                 randconfig-002-20251115    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251114    gcc-12.5.0
parisc                randconfig-002-20251114    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251114    clang-17
powerpc               randconfig-002-20251114    clang-22
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251114    gcc-8.5.0
powerpc64             randconfig-002-20251114    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251114    gcc-13.4.0
riscv                 randconfig-002-20251114    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251114    gcc-8.5.0
s390                  randconfig-002-20251114    gcc-11.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          lboxre2_defconfig    gcc-15.1.0
sh                    randconfig-001-20251114    gcc-10.5.0
sh                    randconfig-002-20251114    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251115    gcc-13.4.0
sparc                 randconfig-002-20251115    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251115    gcc-9.5.0
sparc64               randconfig-002-20251115    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251115    gcc-14
um                    randconfig-002-20251115    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251115    gcc-14
x86_64      buildonly-randconfig-002-20251115    gcc-12
x86_64      buildonly-randconfig-003-20251115    gcc-14
x86_64      buildonly-randconfig-004-20251115    gcc-14
x86_64      buildonly-randconfig-005-20251115    gcc-12
x86_64      buildonly-randconfig-006-20251115    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20251115    gcc-14
x86_64                randconfig-072-20251115    clang-20
x86_64                randconfig-073-20251115    gcc-14
x86_64                randconfig-074-20251115    clang-20
x86_64                randconfig-075-20251115    clang-20
x86_64                randconfig-076-20251115    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251115    gcc-8.5.0
xtensa                randconfig-002-20251115    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

