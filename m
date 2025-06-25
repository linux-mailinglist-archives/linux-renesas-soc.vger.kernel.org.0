Return-Path: <linux-renesas-soc+bounces-18696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBBCAE7AA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 10:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6290716C58A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 08:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936F22882D7;
	Wed, 25 Jun 2025 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X86gLdMV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC9D286888
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jun 2025 08:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841116; cv=none; b=hKMVudhAWtfOajZawhxLaPa92JR9x7JeGd0nj/BP/wbW2ObpdJy6uqwBmOXMVTblzwz0aJa5v065UT7K71sAIGfArQCAHqO/gG7oc13jqZXdBp4Pgcz9ah8WZS09mSjzQgNpTUqFy6z8jXMUwzYy4qxEVAkXGfyxt5VLrQPjVSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841116; c=relaxed/simple;
	bh=9VKZeou5QVpBgaT0e9CWhxuB7c53Gcx6bmJk4Rt3Q0o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nIIKHtxX+FgyZjEOTm+4oiPgSqGYwrcP9/MOrNWEp9LIVYQgget8cGjd38078WzeOQnk0log73yvXvkk51D1CAOhC9FtXw9oDYDoYFoqnVz7D/K4xCkKG46MEm8jyi9BkbBUKlKWp/6CtSC6Th5Ab+wOZAQ46foTX+PTdqHyUh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X86gLdMV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750841115; x=1782377115;
  h=date:from:to:cc:subject:message-id;
  bh=9VKZeou5QVpBgaT0e9CWhxuB7c53Gcx6bmJk4Rt3Q0o=;
  b=X86gLdMVHSdYUoPe99z/PqoyYeXpgiKa/mF2uitp44RTMaBCCrDeQRyv
   tsYD9lXMA8vZg9Q0RxxLNDUSF1h6v5+cublcUyfQWzwffV9bPhcdJrhnV
   g0eHGG/fIOgPCuXP/W+cZZLY+cqBH3hkaxW4T8thmt3G3NyrGGjIJSmLz
   kKXtFMnns1RWLQ8aIG2Dvbl4sQ/2TjjsZznuMI1hHMtT694Jv0F8Q3A/s
   x61HPqTkunLkGFHyMxJdytwWK0xWL9iMLv69swgcwS8wqoV8X0kpmOjpJ
   T4P0FRsP5ywVxtNPP38l6fKyl81/yZmv15t0q7dcidtaaxNkxP6kcHCfl
   g==;
X-CSE-ConnectionGUID: TXsnz1Y0TlCUnZWY35pl6A==
X-CSE-MsgGUID: tDe60cbvR8CLU+pJFX/fkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52820892"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52820892"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 01:45:14 -0700
X-CSE-ConnectionGUID: dkLGkOjwSDi3LKOsG+M8pg==
X-CSE-MsgGUID: tUKBK6RWTZaDVwW7l+NHlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152291837"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jun 2025 01:45:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uULkk-000SuE-1p;
	Wed, 25 Jun 2025 08:45:10 +0000
Date: Wed, 25 Jun 2025 16:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-r9a09g087-dt-binding-defs]
 BUILD SUCCESS 292bf6c5b8100ba4e16cd194bdc89785f6fb6f7a
Message-ID: <202506251623.Z8VgHjxD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-r9a09g087-dt-binding-defs
branch HEAD: 292bf6c5b8100ba4e16cd194bdc89785f6fb6f7a  dt-bindings: clock: renesas,cpg-mssr: Document RZ/N2H support

elapsed time: 1402m

configs tested: 122
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250624    gcc-12.4.0
arc                   randconfig-001-20250625    gcc-11.5.0
arc                   randconfig-002-20250624    gcc-15.1.0
arc                   randconfig-002-20250625    gcc-11.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250624    gcc-13.3.0
arm                   randconfig-001-20250625    gcc-11.5.0
arm                   randconfig-002-20250624    gcc-8.5.0
arm                   randconfig-002-20250625    gcc-11.5.0
arm                   randconfig-003-20250624    gcc-12.4.0
arm                   randconfig-003-20250625    gcc-11.5.0
arm                   randconfig-004-20250624    clang-17
arm                   randconfig-004-20250625    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250624    clang-21
arm64                 randconfig-001-20250625    gcc-11.5.0
arm64                 randconfig-002-20250624    gcc-10.5.0
arm64                 randconfig-002-20250625    gcc-11.5.0
arm64                 randconfig-003-20250624    clang-21
arm64                 randconfig-003-20250625    gcc-11.5.0
arm64                 randconfig-004-20250624    clang-21
arm64                 randconfig-004-20250625    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250624    clang-20
i386        buildonly-randconfig-001-20250625    gcc-12
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-002-20250625    gcc-12
i386        buildonly-randconfig-003-20250624    clang-20
i386        buildonly-randconfig-003-20250625    gcc-12
i386        buildonly-randconfig-004-20250624    clang-20
i386        buildonly-randconfig-004-20250625    gcc-12
i386        buildonly-randconfig-005-20250624    clang-20
i386        buildonly-randconfig-005-20250625    gcc-12
i386        buildonly-randconfig-006-20250624    gcc-12
i386        buildonly-randconfig-006-20250625    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250624    clang-20
x86_64      buildonly-randconfig-001-20250625    gcc-12
x86_64      buildonly-randconfig-002-20250624    gcc-12
x86_64      buildonly-randconfig-002-20250625    gcc-12
x86_64      buildonly-randconfig-003-20250624    clang-20
x86_64      buildonly-randconfig-003-20250625    gcc-12
x86_64      buildonly-randconfig-004-20250624    clang-20
x86_64      buildonly-randconfig-004-20250625    gcc-12
x86_64      buildonly-randconfig-005-20250624    clang-20
x86_64      buildonly-randconfig-005-20250625    gcc-12
x86_64      buildonly-randconfig-006-20250624    gcc-12
x86_64      buildonly-randconfig-006-20250625    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

