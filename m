Return-Path: <linux-renesas-soc+bounces-12500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2265A1C3C3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 15:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A32B7A3CF4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 14:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBCF208D0;
	Sat, 25 Jan 2025 14:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="laqHvenS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65488225D6
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737815412; cv=none; b=YNZ0ZEZ3BlYDY9ryNtAHubAGBMF+68MAkM+hwq3Ou3/VqBRedcymehEH3zHPzg1QIIB0eMt7yZGnGXVZ3BDzEnkRxDLXZ3XU+kGa5+fHCUUJe0IBxw0rVXO54XF+H3le4BXjQhgFZzbWG7h0qy4LX0MIfV72NMv0AtTrH03LwEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737815412; c=relaxed/simple;
	bh=NZUokMBKJZ7vuVVqEaAHg4/FP9+Ljs0gNqMBaULhb6U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pqSjIjkGUHTueDhH2oiuJ/GH9+32qAElg3LegHFpt74orR2EAl/9dJPOJvkYZiH8+lU83C11GYIGbN3PoF9acdAy3yvmbUC3ADxOa5gqDKv3Iua5BDHuQnvRQ3rMqWIRYsUA+JdEK0XROOAxVPX08U/bWP4d4ThdUWqCubTwu+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=laqHvenS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737815410; x=1769351410;
  h=date:from:to:cc:subject:message-id;
  bh=NZUokMBKJZ7vuVVqEaAHg4/FP9+Ljs0gNqMBaULhb6U=;
  b=laqHvenSOi5WM599rXE6KQ+YpyjTdHHl9QF5qSWsuISJn3b0Q7uVbLid
   XNFogW3Q5J7ICMVfynAuqBZuzxIhQW42B12z/EGQKoYffJLF06PuG+LX1
   4pTJFlYzbewNy3HRRYIqM+nFHi9L2AkgwIM0Jy/pl0fmif6T35Ktuflxg
   J7d0VCLoPxhLBsXedBzzd+Kgp2895ajSIKhhbfI5lASdM+d1AmKvpbajt
   MCjaLR+SVhGNUKOlxHssRQXmm8gMmhW0P5vPyXqeMt8EyjFAgnSSlvBci
   8H/hjsGv7UqdONIlRzOo+GdmhQ+50jSjBmn3NRbdBwFYNM98Wgke90M0m
   A==;
X-CSE-ConnectionGUID: yC0HRXL3RVqZzbat/5mB1w==
X-CSE-MsgGUID: E/GIJ7IoRt23+a8fu4W8ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="25935790"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="25935790"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 06:30:08 -0800
X-CSE-ConnectionGUID: O1CgJw8xRyub2kTE8lvcVQ==
X-CSE-MsgGUID: i9luszOKQlmx7gqaUs0SEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113168454"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Jan 2025 06:30:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbhAi-000dsp-2S;
	Sat, 25 Jan 2025 14:30:04 +0000
Date: Sat, 25 Jan 2025 22:29:36 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 9ee9793f46d8aed95d9955e924355d231fe60eb0
Message-ID: <202501252230.usk93gSR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 9ee9793f46d8aed95d9955e924355d231fe60eb0  Merge branches 'renesas-dt-bindings-for-v6.15' and 'renesas-dts-for-v6.15' into renesas-devel

elapsed time: 1118m

configs tested: 193
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250125    gcc-13.2.0
arc                   randconfig-002-20250125    gcc-13.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    gcc-14.1.0
arm                          pxa168_defconfig    gcc-14.1.0
arm                   randconfig-001-20250125    gcc-14.2.0
arm                   randconfig-002-20250125    gcc-14.2.0
arm                   randconfig-003-20250125    clang-18
arm                   randconfig-004-20250125    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250125    gcc-14.2.0
arm64                 randconfig-002-20250125    gcc-14.2.0
arm64                 randconfig-003-20250125    gcc-14.2.0
arm64                 randconfig-004-20250125    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250125    gcc-14.2.0
csky                  randconfig-002-20250125    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20250125    clang-20
hexagon               randconfig-001-20250125    gcc-14.2.0
hexagon               randconfig-002-20250125    clang-20
hexagon               randconfig-002-20250125    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250125    gcc-12
i386        buildonly-randconfig-002-20250125    clang-19
i386        buildonly-randconfig-003-20250125    gcc-12
i386        buildonly-randconfig-004-20250125    clang-19
i386        buildonly-randconfig-005-20250125    clang-19
i386        buildonly-randconfig-006-20250125    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250125    clang-19
i386                  randconfig-002-20250125    clang-19
i386                  randconfig-003-20250125    clang-19
i386                  randconfig-004-20250125    clang-19
i386                  randconfig-005-20250125    clang-19
i386                  randconfig-006-20250125    clang-19
i386                  randconfig-007-20250125    clang-19
i386                  randconfig-011-20250125    gcc-12
i386                  randconfig-012-20250125    gcc-12
i386                  randconfig-013-20250125    gcc-12
i386                  randconfig-014-20250125    gcc-12
i386                  randconfig-015-20250125    gcc-12
i386                  randconfig-016-20250125    gcc-12
i386                  randconfig-017-20250125    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250125    gcc-14.2.0
loongarch             randconfig-002-20250125    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.1.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250125    gcc-14.2.0
nios2                 randconfig-002-20250125    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250125    gcc-14.2.0
parisc                randconfig-002-20250125    gcc-14.2.0
parisc64                         alldefconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     mpc512x_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250125    clang-18
powerpc               randconfig-001-20250125    gcc-14.2.0
powerpc               randconfig-002-20250125    gcc-14.2.0
powerpc               randconfig-003-20250125    gcc-14.2.0
powerpc                    sam440ep_defconfig    gcc-14.1.0
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250125    gcc-14.2.0
powerpc64             randconfig-002-20250125    clang-20
powerpc64             randconfig-002-20250125    gcc-14.2.0
powerpc64             randconfig-003-20250125    clang-16
powerpc64             randconfig-003-20250125    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250125    gcc-14.2.0
riscv                 randconfig-002-20250125    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                                defconfig    gcc-14.2.0
s390                  randconfig-001-20250125    clang-19
s390                  randconfig-001-20250125    gcc-14.2.0
s390                  randconfig-002-20250125    clang-20
s390                  randconfig-002-20250125    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                    randconfig-001-20250125    gcc-14.2.0
sh                    randconfig-002-20250125    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250125    gcc-14.2.0
sparc                 randconfig-002-20250125    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250125    gcc-14.2.0
sparc64               randconfig-002-20250125    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250125    clang-20
um                    randconfig-001-20250125    gcc-14.2.0
um                    randconfig-002-20250125    gcc-11
um                    randconfig-002-20250125    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250125    clang-19
x86_64      buildonly-randconfig-002-20250125    clang-19
x86_64      buildonly-randconfig-002-20250125    gcc-11
x86_64      buildonly-randconfig-003-20250125    clang-19
x86_64      buildonly-randconfig-004-20250125    clang-19
x86_64      buildonly-randconfig-004-20250125    gcc-12
x86_64      buildonly-randconfig-005-20250125    clang-19
x86_64      buildonly-randconfig-006-20250125    clang-19
x86_64      buildonly-randconfig-006-20250125    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250125    clang-19
x86_64                randconfig-002-20250125    clang-19
x86_64                randconfig-003-20250125    clang-19
x86_64                randconfig-004-20250125    clang-19
x86_64                randconfig-005-20250125    clang-19
x86_64                randconfig-006-20250125    clang-19
x86_64                randconfig-007-20250125    clang-19
x86_64                randconfig-008-20250125    clang-19
x86_64                randconfig-071-20250125    clang-19
x86_64                randconfig-072-20250125    clang-19
x86_64                randconfig-073-20250125    clang-19
x86_64                randconfig-074-20250125    clang-19
x86_64                randconfig-075-20250125    clang-19
x86_64                randconfig-076-20250125    clang-19
x86_64                randconfig-077-20250125    clang-19
x86_64                randconfig-078-20250125    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250125    gcc-14.2.0
xtensa                randconfig-002-20250125    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

