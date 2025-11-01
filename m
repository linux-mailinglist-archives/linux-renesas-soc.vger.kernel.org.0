Return-Path: <linux-renesas-soc+bounces-23985-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D031C27B66
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 10:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 586184E21C3
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 09:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC782C158B;
	Sat,  1 Nov 2025 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NaZNJgVf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458432E413
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761990976; cv=none; b=BG13f/P7qh+3PsbJwRMnLqAKKhSHPiHX2BiGfHIw57BLNyG8wcqSKSIMDpRL2o/e0HoLMVB3wCaM5GRT72ON1gSBWPJd9pR+pS8zdn8tpYgt3YHL5IKsIN9dDubyvpn2ohxPdt9h56flYtwn1h1qwRwHtiR2TtlK7j1N9My/Ry4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761990976; c=relaxed/simple;
	bh=dlLmRywu/AYIIwlVW9rP6/Z0mKYdUasJgmHZ86ceDU8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uOwJJZxV4g8Sb7Ase7q38JNtubL3NeDGUBR6koyGdDrX93lqUQuEMaZADs4x4IIUniO+5PY4j6+IvzWdlRZfTI/vxrqLo6oRZzKjig2urOtuuxX8hxrYNwNbZHhKRrora1t7uO0tT9F8wdld8MzpLNz2Y2eU3quL0FuiVhRJXpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NaZNJgVf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761990974; x=1793526974;
  h=date:from:to:cc:subject:message-id;
  bh=dlLmRywu/AYIIwlVW9rP6/Z0mKYdUasJgmHZ86ceDU8=;
  b=NaZNJgVfyBOESrQxkGIu7tq5pChmGf2P7GsnCogIxNUdHBzKSt2TlH1x
   Qmlknq+ipCV67nP3pQR/3PJGk+xcrWDd93Qsw6/u57/cN4RtzYHuHrUT7
   YpnLFEJtrDc5si2dbo/Pjn5dH/96ImbyWc4qBKOTyF4s6OGLkuJlqOJQk
   XUpHM9jmK4SGXm/o5+p1lXCwc0YYiMrwtm+i3ddDDyYBaJlmumjHAhput
   BAfHz3gdSx3jeXnBhYlz0T1QutksjXHEpGzBDU+E8124HDKPg+pnuoLl7
   neqgtFH+fumhsofzPbggoUpghapmg2F/hehVGSsXofzQExXv1efvVirZQ
   Q==;
X-CSE-ConnectionGUID: Uq0cioYGTpKyCLMrytwgbQ==
X-CSE-MsgGUID: 4W+27c63SjiDTGepOIAW2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="68001250"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="68001250"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 02:56:14 -0700
X-CSE-ConnectionGUID: R9Ikv/xNRlamrKNOIuWN3A==
X-CSE-MsgGUID: bnDo4h14SESKlEIFRMoY4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="190780885"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Nov 2025 02:56:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF8LC-000O67-1t;
	Sat, 01 Nov 2025 09:56:10 +0000
Date: Sat, 01 Nov 2025 17:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 746635c35a1bb388630988f2f7d3c1d9161e27e4
Message-ID: <202511011717.DAqSwvsc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 746635c35a1bb388630988f2f7d3c1d9161e27e4  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1455m

configs tested: 139
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251031    gcc-8.5.0
arc                   randconfig-002-20251031    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                            mps2_defconfig    clang-22
arm                        mvebu_v7_defconfig    clang-22
arm                   randconfig-001-20251031    gcc-14.3.0
arm                   randconfig-002-20251031    clang-22
arm                   randconfig-003-20251031    gcc-11.5.0
arm                   randconfig-004-20251031    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251101    gcc-8.5.0
arm64                 randconfig-002-20251101    clang-22
arm64                 randconfig-003-20251101    clang-17
arm64                 randconfig-004-20251101    gcc-14.3.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251101    gcc-15.1.0
csky                  randconfig-002-20251101    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251031    clang-22
hexagon               randconfig-002-20251031    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251101    clang-20
i386        buildonly-randconfig-002-20251101    gcc-13
i386        buildonly-randconfig-003-20251101    clang-20
i386        buildonly-randconfig-004-20251101    gcc-14
i386        buildonly-randconfig-005-20251101    clang-20
i386        buildonly-randconfig-006-20251101    clang-20
i386                  randconfig-001-20251101    clang-20
i386                  randconfig-002-20251101    gcc-14
i386                  randconfig-003-20251101    gcc-14
i386                  randconfig-004-20251101    clang-20
i386                  randconfig-005-20251101    clang-20
i386                  randconfig-006-20251101    clang-20
i386                  randconfig-007-20251101    gcc-14
i386                  randconfig-011-20251101    gcc-14
i386                  randconfig-012-20251101    clang-20
i386                  randconfig-013-20251101    gcc-14
i386                  randconfig-014-20251101    clang-20
i386                  randconfig-015-20251101    clang-20
i386                  randconfig-016-20251101    gcc-14
i386                  randconfig-017-20251101    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251031    gcc-15.1.0
loongarch             randconfig-002-20251031    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251031    gcc-9.5.0
nios2                 randconfig-002-20251031    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251101    gcc-11.5.0
parisc                randconfig-002-20251101    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251101    gcc-11.5.0
powerpc               randconfig-002-20251101    clang-22
powerpc64             randconfig-001-20251101    gcc-11.5.0
powerpc64             randconfig-002-20251101    clang-20
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251031    gcc-8.5.0
riscv                 randconfig-002-20251031    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251031    clang-16
s390                  randconfig-002-20251031    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          kfr2r09_defconfig    gcc-15.1.0
sh                    randconfig-001-20251031    gcc-14.3.0
sh                    randconfig-002-20251031    gcc-14.3.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251101    gcc-15.1.0
sparc                 randconfig-002-20251101    gcc-14.3.0
sparc64                          allyesconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251101    gcc-15.1.0
sparc64               randconfig-002-20251101    clang-22
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251101    clang-16
um                    randconfig-002-20251101    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251101    clang-20
x86_64      buildonly-randconfig-002-20251101    gcc-14
x86_64      buildonly-randconfig-003-20251101    gcc-13
x86_64      buildonly-randconfig-004-20251101    clang-20
x86_64      buildonly-randconfig-005-20251101    gcc-13
x86_64      buildonly-randconfig-006-20251101    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251101    clang-20
x86_64                randconfig-012-20251101    gcc-14
x86_64                randconfig-013-20251101    clang-20
x86_64                randconfig-014-20251101    gcc-14
x86_64                randconfig-015-20251101    clang-20
x86_64                randconfig-016-20251101    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251101    gcc-13.4.0
xtensa                randconfig-002-20251101    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

