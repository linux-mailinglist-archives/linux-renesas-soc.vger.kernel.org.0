Return-Path: <linux-renesas-soc+bounces-19421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0017AFE6B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 13:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51F925A202E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 11:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8411A292B5A;
	Wed,  9 Jul 2025 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3fjD3H+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6FD292B3E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Jul 2025 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752058821; cv=none; b=XF0e+O3LX7Qecq4wXWmbM6n+FPIPp+GViQzFhJFJVM9LygusG0KbB6oDlgRUw6Cg8/e5RyfDNWJaduTrOsGw0vLUcKFKUYwh1nfnzexE8rK9Vqt3cN0YkKwTCtRCNSRNF4F/IOuNb7ggxMqoGAdtFKYGrBy5khtIzcl5S3w29yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752058821; c=relaxed/simple;
	bh=68BovJf8Z53k9GUgwzhyC2U59UZIFVV7t3vsqvGAMH4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ngW6p7FOoYbl0KgKXMb4kVQYdBBdxfIE/g0ODEv2h/yWa/uT+kslGKEk+yNlHFrSdGRRxPMjXLEnKdwF86MpQaZmassa7JQEoTitw5UTrWKYYjROV2SLVEvZwayeZso7cwUS9vUepZRHTXW0tg3Jz7MVmiqdkI3mBLWv7Sf9kGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3fjD3H+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752058819; x=1783594819;
  h=date:from:to:cc:subject:message-id;
  bh=68BovJf8Z53k9GUgwzhyC2U59UZIFVV7t3vsqvGAMH4=;
  b=D3fjD3H+1LpmX0ZuPc3cuFFICA+MjOrPyJxQciAJv+Yd3d5M6uSCvD9r
   slaDN2KoY56VYCX8eTC01GHTc4nTtvXnmbxDld/QfotbU3c/typaQPqKn
   qE0Ya9NoJdKADf8hjmnC7OH9pd2/njw2K6I+jhijGC+6W8UyHVxtJF2GN
   qDQ4osjZDHFpkC/ry1AkZPquyKYxLeZPyI/UUWTGI4sNjRFHMr6dq26Eb
   Quo1kssgKFJi0UtXCknV9T3ghnXNkl18wBxOtzM5VkJ19UK+H8pLsm4Oo
   TBQqhfgrq8+eLw5dkSn6GguOcS+KQm2v7hUzjAiHhXHjdhhyln2KMekxN
   g==;
X-CSE-ConnectionGUID: a4V0yYWUREyTRCSC5ksqcQ==
X-CSE-MsgGUID: t4O30f4oQ+uPgiekviKHxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53423557"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="53423557"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 04:00:18 -0700
X-CSE-ConnectionGUID: CIzMaS83SmenrJ/dOv3Wjg==
X-CSE-MsgGUID: 4O73tcnKQQ2KPFdZQZOrOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155165884"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2025 04:00:17 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZSX8-0003R5-2h;
	Wed, 09 Jul 2025 11:00:14 +0000
Date: Wed, 09 Jul 2025 19:00:02 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.17] BUILD
 SUCCESS 2d9f884ceae80ae5ceba90990fb8d824943602d5
Message-ID: <202507091850.nHcAYBwk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.17
branch HEAD: 2d9f884ceae80ae5ceba90990fb8d824943602d5  soc: renesas: Sort Renesas Kconfig configs

elapsed time: 1459m

configs tested: 236
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-21
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250708    gcc-13.4.0
arc                   randconfig-001-20250709    gcc-10.5.0
arc                   randconfig-002-20250708    gcc-8.5.0
arc                   randconfig-002-20250709    gcc-10.5.0
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                           imxrt_defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20250708    clang-21
arm                   randconfig-001-20250709    gcc-10.5.0
arm                   randconfig-002-20250708    clang-17
arm                   randconfig-002-20250709    gcc-10.5.0
arm                   randconfig-003-20250708    gcc-10.5.0
arm                   randconfig-003-20250709    gcc-10.5.0
arm                   randconfig-004-20250708    clang-21
arm                   randconfig-004-20250709    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250708    gcc-9.5.0
arm64                 randconfig-001-20250709    gcc-10.5.0
arm64                 randconfig-002-20250708    clang-19
arm64                 randconfig-002-20250709    gcc-10.5.0
arm64                 randconfig-003-20250708    clang-21
arm64                 randconfig-003-20250709    gcc-10.5.0
arm64                 randconfig-004-20250708    gcc-8.5.0
arm64                 randconfig-004-20250709    gcc-10.5.0
csky                              allnoconfig    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250708    gcc-13.4.0
csky                  randconfig-001-20250709    gcc-14.2.0
csky                  randconfig-002-20250708    gcc-15.1.0
csky                  randconfig-002-20250709    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250708    clang-21
hexagon               randconfig-001-20250709    gcc-14.2.0
hexagon               randconfig-002-20250708    clang-21
hexagon               randconfig-002-20250709    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250708    clang-20
i386        buildonly-randconfig-001-20250709    clang-20
i386        buildonly-randconfig-002-20250708    clang-20
i386        buildonly-randconfig-002-20250709    clang-20
i386        buildonly-randconfig-003-20250708    clang-20
i386        buildonly-randconfig-003-20250709    clang-20
i386        buildonly-randconfig-004-20250708    gcc-12
i386        buildonly-randconfig-004-20250709    clang-20
i386        buildonly-randconfig-005-20250708    clang-20
i386        buildonly-randconfig-005-20250709    clang-20
i386        buildonly-randconfig-006-20250708    clang-20
i386        buildonly-randconfig-006-20250709    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250709    clang-20
i386                  randconfig-002-20250709    clang-20
i386                  randconfig-003-20250709    clang-20
i386                  randconfig-004-20250709    clang-20
i386                  randconfig-005-20250709    clang-20
i386                  randconfig-006-20250709    clang-20
i386                  randconfig-007-20250709    clang-20
i386                  randconfig-011-20250709    clang-20
i386                  randconfig-012-20250709    clang-20
i386                  randconfig-013-20250709    clang-20
i386                  randconfig-014-20250709    clang-20
i386                  randconfig-015-20250709    clang-20
i386                  randconfig-016-20250709    clang-20
i386                  randconfig-017-20250709    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250708    clang-21
loongarch             randconfig-001-20250709    gcc-14.2.0
loongarch             randconfig-002-20250708    clang-21
loongarch             randconfig-002-20250709    gcc-14.2.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250708    gcc-8.5.0
nios2                 randconfig-001-20250709    gcc-14.2.0
nios2                 randconfig-002-20250708    gcc-8.5.0
nios2                 randconfig-002-20250709    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250708    gcc-9.3.0
parisc                randconfig-001-20250709    gcc-14.2.0
parisc                randconfig-002-20250708    gcc-14.3.0
parisc                randconfig-002-20250709    gcc-14.2.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250708    gcc-8.5.0
powerpc               randconfig-001-20250709    gcc-14.2.0
powerpc               randconfig-002-20250708    clang-19
powerpc               randconfig-002-20250709    gcc-14.2.0
powerpc               randconfig-003-20250708    clang-21
powerpc               randconfig-003-20250709    gcc-14.2.0
powerpc64             randconfig-001-20250708    clang-21
powerpc64             randconfig-001-20250709    gcc-14.2.0
powerpc64             randconfig-002-20250708    clang-21
powerpc64             randconfig-002-20250709    gcc-14.2.0
powerpc64             randconfig-003-20250708    clang-21
powerpc64             randconfig-003-20250709    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250708    clang-16
riscv                 randconfig-001-20250709    gcc-12
riscv                 randconfig-002-20250708    gcc-11.5.0
riscv                 randconfig-002-20250709    gcc-12
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250708    gcc-14.3.0
s390                  randconfig-001-20250709    gcc-12
s390                  randconfig-002-20250708    gcc-9.3.0
s390                  randconfig-002-20250709    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250708    gcc-11.5.0
sh                    randconfig-001-20250709    gcc-12
sh                    randconfig-002-20250708    gcc-15.1.0
sh                    randconfig-002-20250709    gcc-12
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250708    gcc-13.4.0
sparc                 randconfig-001-20250709    gcc-12
sparc                 randconfig-002-20250708    gcc-13.4.0
sparc                 randconfig-002-20250709    gcc-12
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250708    clang-21
sparc64               randconfig-001-20250709    gcc-12
sparc64               randconfig-002-20250708    gcc-15.1.0
sparc64               randconfig-002-20250709    gcc-12
um                               alldefconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250708    clang-21
um                    randconfig-001-20250709    gcc-12
um                    randconfig-002-20250708    clang-17
um                    randconfig-002-20250709    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250709    clang-20
x86_64      buildonly-randconfig-002-20250708    gcc-12
x86_64      buildonly-randconfig-002-20250709    clang-20
x86_64      buildonly-randconfig-003-20250708    clang-20
x86_64      buildonly-randconfig-003-20250709    clang-20
x86_64      buildonly-randconfig-004-20250709    clang-20
x86_64      buildonly-randconfig-005-20250708    clang-20
x86_64      buildonly-randconfig-005-20250709    clang-20
x86_64      buildonly-randconfig-006-20250708    clang-20
x86_64      buildonly-randconfig-006-20250709    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250709    clang-20
x86_64                randconfig-002-20250709    clang-20
x86_64                randconfig-003-20250709    clang-20
x86_64                randconfig-004-20250709    clang-20
x86_64                randconfig-005-20250709    clang-20
x86_64                randconfig-006-20250709    clang-20
x86_64                randconfig-007-20250709    clang-20
x86_64                randconfig-008-20250709    clang-20
x86_64                randconfig-071-20250709    gcc-12
x86_64                randconfig-072-20250709    gcc-12
x86_64                randconfig-073-20250709    gcc-12
x86_64                randconfig-074-20250709    gcc-12
x86_64                randconfig-075-20250709    gcc-12
x86_64                randconfig-076-20250709    gcc-12
x86_64                randconfig-077-20250709    gcc-12
x86_64                randconfig-078-20250709    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250708    gcc-8.5.0
xtensa                randconfig-001-20250709    gcc-12
xtensa                randconfig-002-20250708    gcc-9.3.0
xtensa                randconfig-002-20250709    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

