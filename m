Return-Path: <linux-renesas-soc+bounces-11921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AED1DA0407E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 14:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9854C161D7B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 13:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B28A1F1909;
	Tue,  7 Jan 2025 13:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KeUqlJoc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEFB1F1316
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jan 2025 13:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736255448; cv=none; b=koUWaJNk9lSZYjUsrVRtxF1M5rFGvABt9bBDTt4K4d6qKLoXtwqwJqLZn/MmC4t/2wBjkJymtjYgtqKjBkOorJ/LRMujGddvLmDUSHezF8g/TsSinOXEXF3R7L/VXzTeJfAeY2O8mQqboQfsw72XGsye5aNIisYP1fWZxnuvuak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736255448; c=relaxed/simple;
	bh=CLWlVckHEpbqJ9Gm8bMaU1xzl3GqLgU7GjyzVYqOzs4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ksCAa07PL800zhSv7QTOhCiinzCbHr3J04cyzFwk3H+aPdrHCjynnQr1ZUKXwJTA5ke6UOaicmYUxv/mXjAT6uqh4u9UzA1DvjRkO6qbrAMFk4MbXtcTm7DDTzsJ6Clz06LHvYyFcA5FNfIts9ZbuXys8r7NPLE0TMZ7cs9k/Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KeUqlJoc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736255446; x=1767791446;
  h=date:from:to:cc:subject:message-id;
  bh=CLWlVckHEpbqJ9Gm8bMaU1xzl3GqLgU7GjyzVYqOzs4=;
  b=KeUqlJocgRwjiQWb30vUvgCucnVLB2WrBhLHdd+F4WkgpfdS2jQdU7HJ
   m3R8c3TNuInYxvQhkZ0Z5EPBZSgeDY4RPjoB2PE3gu2kDutkTBNFedtCR
   LcRQDoZ45Yxi4QThJ00t/P2Oat21zEWSPMML3gOprXRMeb4gqsDOaC9x1
   cCCK0H6yWx1kjG0PkTuE1KNBAYAGmCi97jHJEilSwd5CPblJQUZcIJ2IY
   G9G/nHqIgA8jgj578Ho8W96DvUAWBtK+Z9PeK33x4S8OPZ6xCr+3leWLE
   uAc1I6bSxdvtlhHpGKH1Lx9d7+S46ujc4t6qjHqCcbuEz5XDUzBqxhpXq
   g==;
X-CSE-ConnectionGUID: 1aoysRb8Rmm6/cNHXF/AIg==
X-CSE-MsgGUID: qlcAWr35QBewDg77tWzEBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40383524"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="40383524"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 05:10:37 -0800
X-CSE-ConnectionGUID: cVEEVKY5TDSrBQt/gY3HIA==
X-CSE-MsgGUID: 0idRg6SGTiqPsUWD1NWLgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106784872"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jan 2025 05:10:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV9Ls-000EiF-2U;
	Tue, 07 Jan 2025 13:10:32 +0000
Date: Tue, 07 Jan 2025 21:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.14] BUILD SUCCESS
 c357e2295b7880b1d9d365c3389f06ef2eb464d0
Message-ID: <202501072137.4h3518c1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.14
branch HEAD: c357e2295b7880b1d9d365c3389f06ef2eb464d0  arm64: dts: renesas: white-hawk-csi-dsi: Define CSI-2 data line orders

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20250107
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
|   `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|-- arm64-randconfig-052-20250107
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
|   `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|-- arm64-randconfig-053-20250107
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
|   `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|-- arm64-randconfig-054-20250107
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
|   `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
`-- arm64-randconfig-055-20250107
    |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
    `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)

elapsed time: 1242m

configs tested: 129
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250107    gcc-13.2.0
arc                   randconfig-002-20250107    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250107    clang-20
arm                   randconfig-002-20250107    clang-19
arm                   randconfig-003-20250107    clang-20
arm                   randconfig-004-20250107    gcc-14.2.0
arm                        realview_defconfig    clang-19
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250107    clang-15
arm64                 randconfig-002-20250107    clang-20
arm64                 randconfig-003-20250107    gcc-14.2.0
arm64                 randconfig-004-20250107    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250107    gcc-14.2.0
csky                  randconfig-002-20250107    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250107    clang-20
hexagon               randconfig-002-20250107    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250107    clang-19
i386        buildonly-randconfig-002-20250107    clang-19
i386        buildonly-randconfig-003-20250107    clang-19
i386        buildonly-randconfig-004-20250107    gcc-12
i386        buildonly-randconfig-005-20250107    gcc-12
i386        buildonly-randconfig-006-20250107    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250107    gcc-14.2.0
loongarch             randconfig-002-20250107    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-18
mips                        vocore2_defconfig    clang-15
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250107    gcc-14.2.0
nios2                 randconfig-002-20250107    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250107    gcc-14.2.0
parisc                randconfig-002-20250107    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 canyonlands_defconfig    clang-19
powerpc                      katmai_defconfig    clang-18
powerpc                   motionpro_defconfig    clang-17
powerpc                     mpc83xx_defconfig    clang-20
powerpc               randconfig-001-20250107    gcc-14.2.0
powerpc               randconfig-002-20250107    gcc-14.2.0
powerpc               randconfig-003-20250107    clang-20
powerpc64             randconfig-001-20250107    clang-15
powerpc64             randconfig-002-20250107    clang-20
powerpc64             randconfig-003-20250107    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250107    clang-15
riscv                 randconfig-002-20250107    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250107    gcc-14.2.0
s390                  randconfig-002-20250107    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250107    gcc-14.2.0
sh                    randconfig-002-20250107    gcc-14.2.0
sh                           se7751_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250107    gcc-14.2.0
sparc                 randconfig-002-20250107    gcc-14.2.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250107    gcc-14.2.0
sparc64               randconfig-002-20250107    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250107    gcc-12
um                    randconfig-002-20250107    clang-20
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250107    clang-19
x86_64      buildonly-randconfig-002-20250107    gcc-12
x86_64      buildonly-randconfig-003-20250107    clang-19
x86_64      buildonly-randconfig-004-20250107    gcc-12
x86_64      buildonly-randconfig-005-20250107    clang-19
x86_64      buildonly-randconfig-006-20250107    clang-19
x86_64                              defconfig    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250107    gcc-14.2.0
xtensa                randconfig-002-20250107    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

