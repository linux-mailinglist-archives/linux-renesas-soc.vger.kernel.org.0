Return-Path: <linux-renesas-soc+bounces-20738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 017C3B2D28D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 05:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22D71588517
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 03:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF8726B75C;
	Wed, 20 Aug 2025 03:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOyLrkG4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5A0353349
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Aug 2025 03:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755660209; cv=none; b=rF6rDgTtOgTcFkKl7YwFacw55PTEv7ozavl23qvxsUZMNHAi7uitkzZl9/ORdv3j66fs0u44h5i3+gJ9DrBkMlyq4UgPNLPNCm+RBZ9QH8hm6JZjw1iu+k6RmsDcB3YPzUGxmEak+WZJQlIVMfRvmo4LY5YIYSzIq406rTIu+Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755660209; c=relaxed/simple;
	bh=bF7Hd6rs3dYfGYkJiRy6PHI5nDe6Gl8bylA+vHFFxGY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s3U+97Q3bkApclmBB6rjbhKz2RK7iZeaOY1K8ehDADamKLiF1WH3GQ9YReT3BZhbpIqOUsFX5sfvTHdNtdgJG6mrT03z1ANPFFtvzoFbdVtTGbV+xzQo+k2arIPa4hHXIcRRkgukQBoiQnwjpmX0hjrvKKZH7uGJu6dvWJbPhFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOyLrkG4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755660209; x=1787196209;
  h=date:from:to:cc:subject:message-id;
  bh=bF7Hd6rs3dYfGYkJiRy6PHI5nDe6Gl8bylA+vHFFxGY=;
  b=ZOyLrkG4LhxvvrotCtEmk6c8uhyMvlMalaOcEM3B6XswkP/elxvsYOAn
   1Ug+9Lgv2+7cBiLz/Av4X3xEmAcpHcRAADyfxg1L17njaFPA/A8/dgO63
   J6J5mxjQsoVHbsEGQLcJdm+rAC1YSPlzSqjAh/V1cxG0rqIPLzJIUFKzv
   eQxcAohrploKpHbApLQIeKb2oMRiyjGg2UHEnrYYiSeK8x2fN+ZHB8+MH
   jXySHYIlNoeJtpYdLguJ7Bo9hvV1Mz420n5k5s1SMpk/Eut4oA8XKvSKi
   uQNFjEjPzJc6fFv8VBv5ykzZjRoujRtaJnxQpBC1phzWevRqCGv9VtTgc
   A==;
X-CSE-ConnectionGUID: lQ6MsKjISBqG0kSI3g+1kw==
X-CSE-MsgGUID: jKN5qxVzReaMO3f77fqK2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61749342"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="61749342"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 20:23:28 -0700
X-CSE-ConnectionGUID: BuOG7a5ASHCeLJ22LuXdaw==
X-CSE-MsgGUID: 79hAE2BeQkGI3hS+801VvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="172261733"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Aug 2025 20:23:27 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoZPz-000I3f-0V;
	Wed, 20 Aug 2025 03:23:20 +0000
Date: Wed, 20 Aug 2025 11:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.18] BUILD SUCCESS
 6f21672c42fc432d69d8fd51e5d8cea145d5be5b
Message-ID: <202508201141.vlGxcWcS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.18
branch HEAD: 6f21672c42fc432d69d8fd51e5d8cea145d5be5b  arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Enable I2C0 and I2C1 support

elapsed time: 990m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250819    gcc-14.3.0
arc                   randconfig-002-20250819    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250819    gcc-12.5.0
arm                   randconfig-002-20250819    gcc-10.5.0
arm                   randconfig-003-20250819    gcc-10.5.0
arm                   randconfig-004-20250819    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250819    gcc-14.3.0
arm64                 randconfig-002-20250819    clang-22
arm64                 randconfig-003-20250819    gcc-8.5.0
arm64                 randconfig-004-20250819    clang-16
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250819    gcc-15.1.0
csky                  randconfig-002-20250819    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250819    clang-22
hexagon               randconfig-002-20250819    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250819    gcc-12
i386        buildonly-randconfig-002-20250819    clang-20
i386        buildonly-randconfig-003-20250819    clang-20
i386        buildonly-randconfig-004-20250819    clang-20
i386        buildonly-randconfig-005-20250819    clang-20
i386        buildonly-randconfig-006-20250819    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250819    gcc-15.1.0
loongarch             randconfig-002-20250819    clang-18
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
nios2                 randconfig-001-20250819    gcc-8.5.0
nios2                 randconfig-002-20250819    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250819    gcc-10.5.0
parisc                randconfig-002-20250819    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250819    clang-22
powerpc               randconfig-002-20250819    gcc-10.5.0
powerpc               randconfig-003-20250819    clang-22
powerpc64             randconfig-001-20250819    clang-22
powerpc64             randconfig-002-20250819    clang-22
powerpc64             randconfig-003-20250819    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250819    clang-22
riscv                 randconfig-002-20250819    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250819    gcc-8.5.0
s390                  randconfig-002-20250819    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250819    gcc-15.1.0
sh                    randconfig-002-20250819    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250819    gcc-8.5.0
sparc                 randconfig-002-20250819    gcc-11.5.0
sparc64               randconfig-001-20250819    clang-22
sparc64               randconfig-002-20250819    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250819    clang-18
um                    randconfig-002-20250819    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250819    clang-20
x86_64      buildonly-randconfig-002-20250819    clang-20
x86_64      buildonly-randconfig-003-20250819    clang-20
x86_64      buildonly-randconfig-004-20250819    clang-20
x86_64      buildonly-randconfig-005-20250819    clang-20
x86_64      buildonly-randconfig-006-20250819    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250819    gcc-8.5.0
xtensa                randconfig-002-20250819    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

