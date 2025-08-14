Return-Path: <linux-renesas-soc+bounces-20493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 879FAB26039
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 11:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50D76A21E28
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 09:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C892E9723;
	Thu, 14 Aug 2025 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loTEN1Iy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C3E2E7F18
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Aug 2025 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161985; cv=none; b=Q6LDv1OutfWMihjJ/qj8RumfUWCKv5fpnt87Ie3mnudENR7CHp6aWo3gUPE9Q9a5waMO4QFJo2hF+P9AD2ou1NZciQlFMXX0JVvkS3VO9nlUFeiPjy/u3UFG2rj7z2lHPuBGS/yojSQXuuiWQXdYyfh3C4SOw/nxDiC/JmZjt2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161985; c=relaxed/simple;
	bh=BDnf1WtUZNX6WkyBKmv64fzfv/gK/OX0PQX6WQRByIk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jfdC4XT/eGatoDE8rELpNvD+lPr2DoYcJYZq+NE4NxgmiRfqR/JzdLkFNlvFDXkk0iG5LHxDOatZqErJHfqyeZmUehMwkAMNd2S1rmXWrDpZDSSNONjWjaZc8Ds4nxkfHil6ipjOi3ObaIM4kEeWxWNt8TEBZ8h23PX4iKwni38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loTEN1Iy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755161984; x=1786697984;
  h=date:from:to:cc:subject:message-id;
  bh=BDnf1WtUZNX6WkyBKmv64fzfv/gK/OX0PQX6WQRByIk=;
  b=loTEN1Iyp8VJfZiJzM3Q9JTgGsXTooD22s8fZZ5lMTEmM25QRmCaQRiZ
   Dr6kNPwaKIozM6DmDmM+q+jaoXTAqXPdl+aX8Oq18AWxe2w6+XQMjwSGv
   /U6FBcAJ4D3L0KUT4NPLyx2dalTSn2/qVREQn/c4E0GnmBpMLcxEEQAi7
   DBuDIUgzweKYtnJ3/KzF6bMUssX6oq2TDPA+XJYXLyaUq69eWH8a4dahu
   daG03DM37vzWHhfvtUcYleWtNkhDriQ6tr76ub+XdXlQvImJWGXuAH7MO
   /SbNO4BfwSEg1/m33RSS7vWQ+0iUNN4M93jCADGXDXEPNknAi5tJclvAP
   g==;
X-CSE-ConnectionGUID: V/31F1/GSM+vb76FC/mg6w==
X-CSE-MsgGUID: C9zc4PMKQ4+PQ3/tG8siVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61314049"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="61314049"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 01:59:43 -0700
X-CSE-ConnectionGUID: kV6K1CuVTc+QLfcI/FVY/w==
X-CSE-MsgGUID: FlEglxbyT2qNUobAqgbnmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="190410175"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2025 01:59:42 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umToB-000Alu-3A;
	Thu, 14 Aug 2025 08:59:39 +0000
Date: Thu, 14 Aug 2025 16:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/overlays-v6.17-rc1] BUILD
 SUCCESS d41a94676ca4939c5f3f95c548620efd092b9516
Message-ID: <202508141657.WQa5uGhY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/overlays-v6.17-rc1
branch HEAD: d41a94676ca4939c5f3f95c548620efd092b9516  kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used

elapsed time: 1033m

configs tested: 198
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                        nsimosci_defconfig    clang-22
arc                   randconfig-001-20250814    gcc-12.5.0
arc                   randconfig-002-20250814    gcc-13.4.0
arc                    vdk_hs38_smp_defconfig    clang-22
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                            mps2_defconfig    clang-22
arm                   randconfig-001-20250814    clang-22
arm                   randconfig-002-20250814    clang-22
arm                   randconfig-003-20250814    gcc-10.5.0
arm                   randconfig-004-20250814    gcc-8.5.0
arm                           sunxi_defconfig    clang-22
arm                         vf610m4_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250814    clang-17
arm64                 randconfig-002-20250814    gcc-8.5.0
arm64                 randconfig-003-20250814    gcc-10.5.0
arm64                 randconfig-004-20250814    gcc-13.4.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250814    gcc-10.5.0
csky                  randconfig-001-20250814    gcc-15.1.0
csky                  randconfig-002-20250814    gcc-10.5.0
csky                  randconfig-002-20250814    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250814    clang-20
hexagon               randconfig-001-20250814    gcc-10.5.0
hexagon               randconfig-002-20250814    clang-22
hexagon               randconfig-002-20250814    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250814    clang-20
i386        buildonly-randconfig-002-20250814    gcc-12
i386        buildonly-randconfig-003-20250814    gcc-12
i386        buildonly-randconfig-004-20250814    clang-20
i386        buildonly-randconfig-005-20250814    gcc-12
i386        buildonly-randconfig-006-20250814    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250814    clang-20
i386                  randconfig-002-20250814    clang-20
i386                  randconfig-003-20250814    clang-20
i386                  randconfig-004-20250814    clang-20
i386                  randconfig-005-20250814    clang-20
i386                  randconfig-006-20250814    clang-20
i386                  randconfig-007-20250814    clang-20
i386                  randconfig-011-20250814    gcc-12
i386                  randconfig-012-20250814    gcc-12
i386                  randconfig-013-20250814    gcc-12
i386                  randconfig-014-20250814    gcc-12
i386                  randconfig-015-20250814    gcc-12
i386                  randconfig-016-20250814    gcc-12
i386                  randconfig-017-20250814    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250814    clang-22
loongarch             randconfig-001-20250814    gcc-10.5.0
loongarch             randconfig-002-20250814    gcc-10.5.0
loongarch             randconfig-002-20250814    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250814    gcc-10.5.0
nios2                 randconfig-002-20250814    gcc-10.5.0
nios2                 randconfig-002-20250814    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250814    gcc-10.5.0
parisc                randconfig-002-20250814    gcc-10.5.0
parisc                randconfig-002-20250814    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250814    gcc-10.5.0
powerpc               randconfig-001-20250814    gcc-8.5.0
powerpc               randconfig-002-20250814    gcc-10.5.0
powerpc               randconfig-002-20250814    gcc-8.5.0
powerpc               randconfig-003-20250814    gcc-10.5.0
powerpc                     stx_gp3_defconfig    clang-22
powerpc64             randconfig-001-20250814    clang-22
powerpc64             randconfig-001-20250814    gcc-10.5.0
powerpc64             randconfig-002-20250814    clang-22
powerpc64             randconfig-002-20250814    gcc-10.5.0
powerpc64             randconfig-003-20250814    clang-22
powerpc64             randconfig-003-20250814    gcc-10.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250814    clang-22
riscv                 randconfig-002-20250814    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250814    clang-22
s390                  randconfig-002-20250814    clang-22
s390                  randconfig-002-20250814    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250814    clang-22
sh                    randconfig-001-20250814    gcc-9.5.0
sh                    randconfig-002-20250814    clang-22
sh                    randconfig-002-20250814    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250814    clang-22
sparc                 randconfig-001-20250814    gcc-14.3.0
sparc                 randconfig-002-20250814    clang-22
sparc                 randconfig-002-20250814    gcc-12.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250814    clang-22
sparc64               randconfig-002-20250814    clang-22
sparc64               randconfig-002-20250814    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250814    clang-22
um                    randconfig-002-20250814    clang-22
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250814    clang-20
x86_64      buildonly-randconfig-002-20250814    clang-20
x86_64      buildonly-randconfig-003-20250814    clang-20
x86_64      buildonly-randconfig-003-20250814    gcc-12
x86_64      buildonly-randconfig-004-20250814    clang-20
x86_64      buildonly-randconfig-005-20250814    clang-20
x86_64      buildonly-randconfig-005-20250814    gcc-12
x86_64      buildonly-randconfig-006-20250814    clang-20
x86_64      buildonly-randconfig-006-20250814    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20250814    gcc-12
x86_64                randconfig-072-20250814    gcc-12
x86_64                randconfig-073-20250814    gcc-12
x86_64                randconfig-074-20250814    gcc-12
x86_64                randconfig-075-20250814    gcc-12
x86_64                randconfig-076-20250814    gcc-12
x86_64                randconfig-077-20250814    gcc-12
x86_64                randconfig-078-20250814    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                       common_defconfig    clang-22
xtensa                randconfig-001-20250814    clang-22
xtensa                randconfig-001-20250814    gcc-8.5.0
xtensa                randconfig-002-20250814    clang-22
xtensa                randconfig-002-20250814    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

