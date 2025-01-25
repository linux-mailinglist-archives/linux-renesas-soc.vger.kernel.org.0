Return-Path: <linux-renesas-soc+bounces-12507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E5FA1C512
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 20:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF5C9167DEC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 19:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952FF84D2B;
	Sat, 25 Jan 2025 19:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4QDBRGA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A45CA4E
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 19:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737834943; cv=none; b=cGPEKidmS4H153OCC/c71HM8wgwTFzfJDvWmhx+Uf3BnKEJak9b/o5m/Qt8fFqY6gccEry1Vz8Xqarm6FLF0WhuqKfjLc99pGSUF/Goa1GiFUlYuQGfoeCEn2IqthmfpSwSpskcL/+IV6VKND8Oq+NmDv63BQh6qmKEyHnBxst0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737834943; c=relaxed/simple;
	bh=Ck1z9ZN+E8G8AFBMRFC8MoKHPZgPHoTfmfvmwPIwfDg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PwU5sDg8GwOaK7ipT8QudlC/fy8I1UyMiBy9RG8/VoA+/q6gJI2t2zf9Be6+JqKrK4pq9xJiuuJHYtW41PoGFKqyhhEmJiPqx3uO4AswJSlU7wcJTtahuk0vfAOpLZ4zj/b0q/xQoXfP7vKD1OD3IbHwXdY7hv4FsYVvlvQ4YKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4QDBRGA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737834941; x=1769370941;
  h=date:from:to:cc:subject:message-id;
  bh=Ck1z9ZN+E8G8AFBMRFC8MoKHPZgPHoTfmfvmwPIwfDg=;
  b=l4QDBRGAxJ1X3byy4qyh/aF1s1ivEsA/y2mw6nwce9bxXSU2W7s6L0wJ
   NTrm+sk0FPCDuIToB7PwkW35ajaCWS8lN8SKrz4u0D1z+sl4MIpq7390C
   14sSjBQjpmAswKm3ykkJlfXIOP3td7ttYlyLgXgyIafPmQHJBDLOLKyJ5
   lpwubEAIEVF4ydQmeSr4A+uauWJPOb53kgECyRNZZLx3D/bDYbf699Azj
   EPafz+y2AU91lUQUQU7Umf4eOUQgx0WUUkRhNY8VeL6A26i7msvMi2qur
   guI6pbJvTw2jVWkKWz8i3Np7eX47kfqEsqTH+IcI51Uq04xhf18PVWbVF
   w==;
X-CSE-ConnectionGUID: zuRunADYQYS7eqogMWTDYQ==
X-CSE-MsgGUID: wR5jDC/cQBuzGDj41THFBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="41184691"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="41184691"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 11:55:40 -0800
X-CSE-ConnectionGUID: e8M9x0nhTCiH4o9BzDNLxg==
X-CSE-MsgGUID: OHFpGA2QTeGoofdFi7JYHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="108044993"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Jan 2025 11:55:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbmFk-000eAN-2v;
	Sat, 25 Jan 2025 19:55:36 +0000
Date: Sun, 26 Jan 2025 03:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v6.15] BUILD
 SUCCESS f88fd3ffca71af74604cff803060c565ad6fa1ca
Message-ID: <202501260330.GeDs4vJy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.15
branch HEAD: f88fd3ffca71af74604cff803060c565ad6fa1ca  dt-bindings: soc: renesas: Add RZ/G3E variant SYS binding

elapsed time: 1444m

configs tested: 207
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250125    gcc-13.2.0
arc                   randconfig-002-20250125    gcc-13.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    gcc-14.1.0
arm                          pxa168_defconfig    gcc-14.1.0
arm                   randconfig-001-20250125    gcc-14.2.0
arm                   randconfig-002-20250125    gcc-14.2.0
arm                   randconfig-003-20250125    clang-18
arm                   randconfig-004-20250125    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250125    gcc-14.2.0
arm64                 randconfig-002-20250125    gcc-14.2.0
arm64                 randconfig-003-20250125    gcc-14.2.0
arm64                 randconfig-004-20250125    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250125    gcc-14.2.0
csky                  randconfig-002-20250125    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
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
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250125    gcc-14.2.0
loongarch             randconfig-002-20250125    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.1.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
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
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
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
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
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

