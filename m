Return-Path: <linux-renesas-soc+bounces-25784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3BBCC1060
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 06:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E0643007C8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 05:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775882E975E;
	Tue, 16 Dec 2025 05:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPgH5ct9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7453233506A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 05:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765863629; cv=none; b=k2UlxjGldvSkuyUYETa+RmGvV2d/0lYNOsAxWpQyk097aTPzI1/cU47xQvDeKpdIxCsY6B+BquSPKr2bzSwMZD3lQxrPk+6ufDsP+AWOBNOeep6Gy9nIvdWi+6Mw9fEsOEPMrBqDhIzVAQb2PuYQ4PN9VVANmv3mZx1RtnlSPSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765863629; c=relaxed/simple;
	bh=665gWsfyYI/x+I24r/aFa43PgqPDoNpXbrR4tg7+aZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HpNC6tw803RPge+JpwSXeJhEMMGEvvxEOTXG5hPhYpiUAe9lxNuq55I//bNzOukYlcMrEcMyQlm598/dMy2t3NRfFB0bE/fMlnhgGyN83n3zGHnIIRdkYsWj4maMzXqnGJp2C08IGx25LYcMiNdtWCLZzzYswaLg0h2RZOnM9C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPgH5ct9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765863548; x=1797399548;
  h=date:from:to:cc:subject:message-id;
  bh=665gWsfyYI/x+I24r/aFa43PgqPDoNpXbrR4tg7+aZI=;
  b=ZPgH5ct9m8VjVi4XHehaEmINJrlnxzNqOV0tv+9qGGrPHW5VREmk/Xl6
   wzi4q/KyblmPgQ5i+XBg3/uiqfGX9Rpt6E38i5ZItA8Z/IyUIuEmtkpuF
   /C9HtIQafH01M3yPwJ6zw20DZbqjfnqGrcBnCpM7q8itcztwQruklRkhk
   CR7uu5K0RP7Mx9OaKxNWrwDQe2UMvYEudGyJd6XK3mtbL5zvcHxq8xf3l
   30EszUvo5WpRp1tqgPFtFLHdnN2INyDqWKiP7bkHAzawDetKROX3QigxQ
   cMdZdimOYsY10xugWov6jDDaP/6rE8+aLTgOO5tAqsM51hN6tf9qv4ZjM
   A==;
X-CSE-ConnectionGUID: zah/ofMOTNWsIphsNpzE4g==
X-CSE-MsgGUID: ZfYGzMDZQBe9zGzHvG0s3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67529802"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67529802"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 21:39:04 -0800
X-CSE-ConnectionGUID: bTODjWwjS0aqzIRNj8IDBA==
X-CSE-MsgGUID: FbTw+VJ7RAm83gxo5g4RBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197679349"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 15 Dec 2025 21:39:02 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVNlz-000000001Cf-29dX;
	Tue, 16 Dec 2025 05:38:59 +0000
Date: Tue, 16 Dec 2025 13:38:32 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.20] BUILD SUCCESS
 d8921e42a1983024227c0e64253ea96b25a1ae9a
Message-ID: <202512161326.zpbCKZ18-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.20
branch HEAD: d8921e42a1983024227c0e64253ea96b25a1ae9a  clk: renesas: r9a09g056: Add entries for the RSPIs

elapsed time: 976m

configs tested: 246
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251216    gcc-12.5.0
arc                   randconfig-001-20251216    gcc-8.5.0
arc                   randconfig-002-20251216    gcc-12.5.0
arc                   randconfig-002-20251216    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                          collie_defconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                          exynos_defconfig    clang-22
arm                   randconfig-001-20251216    gcc-10.5.0
arm                   randconfig-001-20251216    gcc-8.5.0
arm                   randconfig-002-20251216    gcc-8.5.0
arm                   randconfig-003-20251216    gcc-11.5.0
arm                   randconfig-003-20251216    gcc-8.5.0
arm                   randconfig-004-20251216    clang-19
arm                   randconfig-004-20251216    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251216    clang-16
arm64                 randconfig-001-20251216    gcc-10.5.0
arm64                 randconfig-002-20251216    gcc-10.5.0
arm64                 randconfig-002-20251216    gcc-8.5.0
arm64                 randconfig-003-20251216    gcc-10.5.0
arm64                 randconfig-004-20251216    gcc-10.5.0
arm64                 randconfig-004-20251216    gcc-14.3.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251216    gcc-10.5.0
csky                  randconfig-001-20251216    gcc-15.1.0
csky                  randconfig-002-20251216    gcc-10.5.0
csky                  randconfig-002-20251216    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251216    clang-22
hexagon               randconfig-001-20251216    gcc-8.5.0
hexagon               randconfig-002-20251216    clang-19
hexagon               randconfig-002-20251216    gcc-8.5.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251216    clang-20
i386        buildonly-randconfig-001-20251216    gcc-14
i386        buildonly-randconfig-002-20251216    gcc-14
i386        buildonly-randconfig-003-20251216    gcc-14
i386        buildonly-randconfig-004-20251216    gcc-14
i386        buildonly-randconfig-005-20251216    clang-20
i386        buildonly-randconfig-005-20251216    gcc-14
i386        buildonly-randconfig-006-20251216    gcc-14
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251216    clang-20
i386                  randconfig-001-20251216    gcc-14
i386                  randconfig-002-20251216    clang-20
i386                  randconfig-002-20251216    gcc-14
i386                  randconfig-003-20251216    gcc-14
i386                  randconfig-004-20251216    gcc-14
i386                  randconfig-005-20251216    gcc-14
i386                  randconfig-006-20251216    gcc-14
i386                  randconfig-007-20251216    clang-20
i386                  randconfig-007-20251216    gcc-14
i386                  randconfig-011-20251216    gcc-13
i386                  randconfig-012-20251216    clang-20
i386                  randconfig-012-20251216    gcc-13
i386                  randconfig-013-20251216    gcc-13
i386                  randconfig-014-20251216    gcc-13
i386                  randconfig-015-20251216    clang-20
i386                  randconfig-015-20251216    gcc-13
i386                  randconfig-016-20251216    clang-20
i386                  randconfig-016-20251216    gcc-13
i386                  randconfig-017-20251216    clang-20
i386                  randconfig-017-20251216    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251216    gcc-15.1.0
loongarch             randconfig-001-20251216    gcc-8.5.0
loongarch             randconfig-002-20251216    clang-22
loongarch             randconfig-002-20251216    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                          multi_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                        omega2p_defconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251216    gcc-8.5.0
nios2                 randconfig-002-20251216    gcc-11.5.0
nios2                 randconfig-002-20251216    gcc-8.5.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251216    gcc-11.5.0
parisc                randconfig-002-20251216    gcc-11.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc                 mpc836x_rdk_defconfig    clang-22
powerpc               randconfig-001-20251216    clang-22
powerpc               randconfig-002-20251216    clang-19
powerpc                     sequoia_defconfig    clang-17
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc                     tqm8548_defconfig    clang-22
powerpc64             randconfig-001-20251216    clang-22
powerpc64             randconfig-002-20251216    clang-17
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251216    clang-17
riscv                 randconfig-001-20251216    gcc-9.5.0
riscv                 randconfig-002-20251216    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251216    clang-17
s390                  randconfig-001-20251216    clang-22
s390                  randconfig-002-20251216    clang-17
s390                  randconfig-002-20251216    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251216    clang-17
sh                    randconfig-001-20251216    gcc-13.4.0
sh                    randconfig-002-20251216    clang-17
sh                    randconfig-002-20251216    gcc-12.5.0
sh                           se7722_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251216    gcc-8.5.0
sparc                 randconfig-002-20251216    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251216    clang-22
sparc64               randconfig-002-20251216    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251216    gcc-12
um                    randconfig-002-20251216    gcc-14
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251216    clang-20
x86_64      buildonly-randconfig-002-20251216    clang-20
x86_64      buildonly-randconfig-002-20251216    gcc-14
x86_64      buildonly-randconfig-003-20251216    clang-20
x86_64      buildonly-randconfig-004-20251216    clang-20
x86_64      buildonly-randconfig-005-20251216    clang-20
x86_64      buildonly-randconfig-005-20251216    gcc-14
x86_64      buildonly-randconfig-006-20251216    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251216    gcc-14
x86_64                randconfig-002-20251216    clang-20
x86_64                randconfig-003-20251216    clang-20
x86_64                randconfig-004-20251216    gcc-14
x86_64                randconfig-005-20251216    clang-20
x86_64                randconfig-006-20251216    gcc-14
x86_64                randconfig-011-20251216    clang-20
x86_64                randconfig-011-20251216    gcc-14
x86_64                randconfig-012-20251216    clang-20
x86_64                randconfig-012-20251216    gcc-14
x86_64                randconfig-013-20251216    clang-20
x86_64                randconfig-014-20251216    clang-20
x86_64                randconfig-015-20251216    clang-20
x86_64                randconfig-016-20251216    clang-20
x86_64                randconfig-071-20251216    clang-20
x86_64                randconfig-071-20251216    gcc-14
x86_64                randconfig-072-20251216    gcc-14
x86_64                randconfig-073-20251216    gcc-14
x86_64                randconfig-074-20251216    gcc-12
x86_64                randconfig-074-20251216    gcc-14
x86_64                randconfig-075-20251216    clang-20
x86_64                randconfig-075-20251216    gcc-14
x86_64                randconfig-076-20251216    clang-20
x86_64                randconfig-076-20251216    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251216    gcc-8.5.0
xtensa                randconfig-002-20251216    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

