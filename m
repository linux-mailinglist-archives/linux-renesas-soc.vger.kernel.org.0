Return-Path: <linux-renesas-soc+bounces-24465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A236BC4EDEE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 16:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B972A189901D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 15:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E0636656E;
	Tue, 11 Nov 2025 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKOcjhXY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4904258CE5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 15:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762876374; cv=none; b=MiWFYAGCaETbIocP5IpTmPgoB2RHaybawopCf9/etUFVIWuWd5Z6Tkes5CRX8tNBGWdGiz9lhevzYfVS5WpHROUmYlanhN29NxSrzp60TssXRO0uh/xbgs+2DXF4TsO9qFFe0umhjUbEX2UvyEhG8RIJ2T7Diau2A6ar/8FEewI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762876374; c=relaxed/simple;
	bh=46F8UIFQDLZdZws2qJqMU7usGSVPe9wXdQT++HSOYFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kyo4ilouDfd4zixRUopPsw6p+kNRD4OiG+cDbAZd0nFfB6zNbAO90Ll799GGaSMwCX/k422pj4R+yQLFPEEf8bHZ7+RpIOz5j9YxVtZI8GmDKcWPzQHY/zBdUVzFopfNtyJFWREpoWZzh2QTzSVwKfpYL8VHLg42JIehBqtD8Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKOcjhXY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762876373; x=1794412373;
  h=date:from:to:cc:subject:message-id;
  bh=46F8UIFQDLZdZws2qJqMU7usGSVPe9wXdQT++HSOYFY=;
  b=GKOcjhXYH/M7SQziwy5kHua0ArqdLzlP/MAfFP7cWHsuhsNdyDJQliqL
   owpGK+aeSQpNLHwv5QXuLhWWA1ppV6y4GLAlro0rwwCE9/MfBCs9Y7Zkf
   SZ80uG4FabI2mN/ksqS74Eg1YI4hk01seLh3e397SBHPA+wK0SQVyDhq+
   L+3YAX//BjL8kByIog44xxBqyNZnsLlKh4OaeCtqFkD5AVTapg8NAWiNV
   lLjU5cPxikP925CBPD4mLQzO9ogbI/1d+GmSnSfdOAHK6TGWddNOjde7Z
   aE3w7Hjv2jHJ6n679THb+g95DEWysue7j5kfG7g49EFglooa8hfwL9HBX
   w==;
X-CSE-ConnectionGUID: G9XaZ2s8R3i7fnD9Hkjy8w==
X-CSE-MsgGUID: cC0lITTrQCupdED1w2en9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="63943087"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="63943087"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 07:52:52 -0800
X-CSE-ConnectionGUID: +TpK1fl8RQGYL8Z1KtbyxA==
X-CSE-MsgGUID: 0B+YYNU4Sbi2iRB8+pVF2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="193241353"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Nov 2025 07:52:51 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIqfo-0003JL-2a;
	Tue, 11 Nov 2025 15:52:48 +0000
Date: Tue, 11 Nov 2025 23:52:16 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.19] BUILD SUCCESS
 7d41b3085b0b23a3536e2d4c964898428e9b9833
Message-ID: <202511112310.vIPyQHqA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.19
branch HEAD: 7d41b3085b0b23a3536e2d4c964898428e9b9833  arm64: dts: renesas: r8a779a0: Add GE7800 GPU node

elapsed time: 1746m

configs tested: 105
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251111    gcc-11.5.0
arc                   randconfig-002-20251111    gcc-12.5.0
arm                               allnoconfig    clang-22
arm                        clps711x_defconfig    clang-22
arm                       omap2plus_defconfig    gcc-15.1.0
arm                   randconfig-001-20251111    clang-22
arm                   randconfig-002-20251111    clang-17
arm                   randconfig-003-20251111    clang-22
arm                   randconfig-004-20251111    gcc-10.5.0
arm64                             allnoconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251110    clang-22
hexagon               randconfig-002-20251110    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251111    clang-20
i386        buildonly-randconfig-002-20251111    gcc-14
i386        buildonly-randconfig-003-20251111    gcc-14
i386        buildonly-randconfig-004-20251111    gcc-14
i386        buildonly-randconfig-005-20251111    gcc-14
i386        buildonly-randconfig-006-20251111    gcc-12
i386                  randconfig-011-20251111    clang-20
i386                  randconfig-012-20251111    clang-20
i386                  randconfig-013-20251111    gcc-14
i386                  randconfig-014-20251111    gcc-14
i386                  randconfig-015-20251111    gcc-14
i386                  randconfig-016-20251111    clang-20
i386                  randconfig-017-20251111    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251110    clang-22
loongarch             randconfig-002-20251110    clang-22
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251110    gcc-11.5.0
nios2                 randconfig-002-20251110    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251111    gcc-9.5.0
parisc                randconfig-002-20251111    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                    adder875_defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                     ksi8560_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251111    gcc-8.5.0
powerpc               randconfig-002-20251111    clang-22
powerpc                     sequoia_defconfig    clang-17
powerpc64             randconfig-002-20251111    gcc-12.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251110    clang-22
riscv                 randconfig-002-20251110    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251110    gcc-8.5.0
s390                  randconfig-002-20251110    gcc-8.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251110    gcc-15.1.0
sh                    randconfig-002-20251110    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251111    gcc-11.5.0
sparc                 randconfig-002-20251111    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251111    clang-22
sparc64               randconfig-002-20251111    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251111    clang-19
um                    randconfig-002-20251111    clang-20
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251111    gcc-14
x86_64      buildonly-randconfig-002-20251111    clang-20
x86_64      buildonly-randconfig-003-20251111    gcc-14
x86_64      buildonly-randconfig-004-20251111    gcc-14
x86_64      buildonly-randconfig-005-20251111    gcc-14
x86_64      buildonly-randconfig-006-20251111    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251111    clang-20
x86_64                randconfig-012-20251111    gcc-14
x86_64                randconfig-013-20251111    clang-20
x86_64                randconfig-014-20251111    gcc-14
x86_64                randconfig-071-20251111    gcc-14
x86_64                randconfig-072-20251111    clang-20
x86_64                randconfig-073-20251111    gcc-14
x86_64                randconfig-074-20251111    gcc-14
x86_64                randconfig-075-20251111    gcc-14
x86_64                randconfig-076-20251111    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251111    gcc-12.5.0
xtensa                randconfig-002-20251111    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

