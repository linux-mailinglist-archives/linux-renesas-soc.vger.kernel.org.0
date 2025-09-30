Return-Path: <linux-renesas-soc+bounces-22482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C309BAC90A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 12:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 382A11C81B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 10:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389DC221FCF;
	Tue, 30 Sep 2025 10:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n99TgezT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A6AFC0A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 10:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759229523; cv=none; b=ZlsMMR2rWcZgpYbgLWav29QuJ4Y8v/LSowmiUcNAYu0gmOms5KxYneSSKapH8W0QLIvFGi6sU3S+XeXKMmMqG3o3uWIlhItZ/OAVAwsYiYrUD8AG7G2Hd3QjDhkjV5yzGaOgDO1pLKh0gu0F4kN6HmaLyROimrTbOzwcHKO2/3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759229523; c=relaxed/simple;
	bh=62MZ9ysG1WldcFCKkV9yQlNIGbDnQaB8WjafAcHafy0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pLHrUg3g2GfhKdBnYHr+Us5jpA5ABZRztBQfYI5Sa3o1izz/JtQTQlqdKaqgCYrNeV4TEVcR7EzgLrLhfTZnwWTEG2DkaQlsbSFIOY4Z8lkKbP7NP1fg4Y6FECuP+mEqbGPIsMxLwRqM2N3eg7DuEIHu29iY5AFL38FCbpnK2kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n99TgezT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759229521; x=1790765521;
  h=date:from:to:cc:subject:message-id;
  bh=62MZ9ysG1WldcFCKkV9yQlNIGbDnQaB8WjafAcHafy0=;
  b=n99TgezThQ/MR9NuoXBNfzrv+BwJxJ/CQiscwjomhxEWRxis8IGc+Pdi
   5Waw1B53l9J3Q+NXhB1GOJcSMU49MwW9aZVvxhT1d/8/aKmACESfQ25yy
   LoVj76Ca4qEMulrN/QMXizBe3176bbOaIWNnmU9/U048L5ChbSOhTrWkS
   d27BML8Pu38KW2r61PSetsYPJ2mtPHpis7MrQKnDDH9+A4j2E+zUJSjNy
   fF8tGqqPSbzjRbembv9RGmylDyiCdnUt5Cxa0SQ0SqzeG470XBgWzg4fy
   5Fpgujzt5f6iBb+iTTYhUJbq9EDeHGAgXBpKpk8ADH/fZM+N8cb4CStTl
   A==;
X-CSE-ConnectionGUID: m0l/qFc6R06U/0d8TdVxow==
X-CSE-MsgGUID: BsDf8mMvTkW194XcBrINHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65120886"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="65120886"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 03:52:00 -0700
X-CSE-ConnectionGUID: 3/r5j6Z0Tt+nAPIwW5I4pg==
X-CSE-MsgGUID: EAOL5MV5RxWgNt907p4RvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="179260947"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Sep 2025 03:51:59 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3Xxd-0001BV-1m;
	Tue, 30 Sep 2025 10:51:57 +0000
Date: Tue, 30 Sep 2025 18:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.19] BUILD SUCCESS
 a9aff62b92522fb21fd0399e79d78b443c6f2ea1
Message-ID: <202509301834.KOo0Ympf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.19
branch HEAD: a9aff62b92522fb21fd0399e79d78b443c6f2ea1  arm64: dts: renesas: sparrow-hawk: Add overlay for Argon40 fan HAT

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: dsi@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells', '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
    arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: dsi@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells', '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'

Warning ids grouped by kconfigs:

recent_errors
`-- arm64-randconfig-051-20250930
    |-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-5in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl
    `-- arch-arm64-boot-dts-renesas-r8a779g3-sparrow-hawk-rpi-display-7in.dtb:dsi-fed80000-(renesas-r8a779g0-dsi-csi2-tx):address-cells-size-cells-panel-do-not-match-any-of-the-regexes:pinctrl

elapsed time: 1465m

configs tested: 111
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250929    gcc-8.5.0
arc                   randconfig-002-20250929    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250929    gcc-8.5.0
arm                   randconfig-002-20250929    gcc-14.3.0
arm                   randconfig-003-20250929    clang-22
arm                   randconfig-004-20250929    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250929    gcc-8.5.0
arm64                 randconfig-002-20250929    gcc-13.4.0
arm64                 randconfig-003-20250929    clang-22
arm64                 randconfig-004-20250929    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250929    gcc-9.5.0
csky                  randconfig-002-20250929    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250929    clang-22
hexagon               randconfig-002-20250929    clang-22
i386        buildonly-randconfig-001-20250929    gcc-14
i386        buildonly-randconfig-002-20250929    clang-20
i386        buildonly-randconfig-003-20250929    gcc-14
i386        buildonly-randconfig-004-20250929    gcc-14
i386        buildonly-randconfig-005-20250929    gcc-14
i386        buildonly-randconfig-006-20250929    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250929    gcc-12.5.0
loongarch             randconfig-002-20250929    gcc-15.1.0
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
nios2                 randconfig-001-20250929    gcc-11.5.0
nios2                 randconfig-002-20250929    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250929    gcc-14.3.0
parisc                randconfig-002-20250929    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250929    gcc-15.1.0
powerpc               randconfig-002-20250929    gcc-8.5.0
powerpc               randconfig-003-20250929    gcc-13.4.0
powerpc64             randconfig-001-20250929    clang-18
powerpc64             randconfig-002-20250929    clang-22
powerpc64             randconfig-003-20250929    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250929    gcc-9.5.0
riscv                 randconfig-002-20250929    gcc-11.5.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250929    gcc-11.5.0
s390                  randconfig-002-20250929    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250929    gcc-15.1.0
sh                    randconfig-002-20250929    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250929    gcc-8.5.0
sparc                 randconfig-002-20250929    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250929    clang-22
sparc64               randconfig-002-20250929    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250929    gcc-14
um                    randconfig-002-20250929    gcc-14
um                           x86_64_defconfig    clang-22
x86_64      buildonly-randconfig-001-20250929    gcc-14
x86_64      buildonly-randconfig-002-20250929    gcc-14
x86_64      buildonly-randconfig-003-20250929    clang-20
x86_64      buildonly-randconfig-004-20250929    gcc-14
x86_64      buildonly-randconfig-005-20250929    gcc-14
x86_64      buildonly-randconfig-006-20250929    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250929    gcc-8.5.0
xtensa                randconfig-002-20250929    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

