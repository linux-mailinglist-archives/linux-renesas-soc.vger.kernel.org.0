Return-Path: <linux-renesas-soc+bounces-9573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBAA993A93
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 00:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B782D1F23772
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 22:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE0D18CC15;
	Mon,  7 Oct 2024 22:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GS5gAJZB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1476B18BC19
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Oct 2024 22:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728341664; cv=none; b=QYJzK6URJS7wUL/wbTHRlSTp7njdlx1Ss9DhkJ/lLCgrWR8pNjMYdUbM5gytqE7kk7AcEWcqJtYIYXkviZ08Gl8NLBwl08i9l+MCw3FC/Gvf7UvBqkAH7x5htSz4rWP41itGRhEp1mzgYj09TjN+hqGJnGF7WmBk9BuU6KhHAbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728341664; c=relaxed/simple;
	bh=BPxN6rmFHK0UsRxx+dYZrRvzY9v0pflKXGuBqJaEU30=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aGcCWrYCu1Ija/iXoX9zl7TtTN2nrjkorxLZOXYvErDwVWthpSOYrAvsIMQx3a15FJ1V77j9D+zQzklWowk21xmP1eFUKbkvYZIh74Hjy1h+Gx1JkmPprAT4fs7UU1cQEwjr0mJTtj8rvuCVe2Ci1t6yhoeIVoyyhORd8Q8Hi5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GS5gAJZB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728341663; x=1759877663;
  h=date:from:to:cc:subject:message-id;
  bh=BPxN6rmFHK0UsRxx+dYZrRvzY9v0pflKXGuBqJaEU30=;
  b=GS5gAJZBVmVWTLcqnV/4uHMx6VCLWArA8TawKzy6046usyAJIJz3s9Rt
   SUFFVDQHKzFwt9/7RXpAeqp3uHdriq/SUIOkx806ePsW+bxUNyaHPmaUT
   8EoptqAGCmFSwfskOoRiTKsJKNZ2raXEtviQT4CUB2CLX2IlkKKIoQaIV
   gq3GV1vy33w/KAe23xIB4TV7zMYS6h8TeEjUv23OyEQcIwNwtQFARUE6H
   b15zjj4cpSR227EGWKrbEr+nydpFFDAvhPRryBH3osCtjd39IqxI78w8V
   6OdnABUBUsqCTv1Bzh199Xko/n+9a4Z4e6E/eXy3ww6IZkW9uuPm+C3z4
   Q==;
X-CSE-ConnectionGUID: VuZTeHt7TrSoV00Dy0mFwA==
X-CSE-MsgGUID: M6lMTysdTAGh0tO1jmzF+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27320292"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="27320292"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 15:54:23 -0700
X-CSE-ConnectionGUID: Pf9MyxwcQyeETFTeO8u8xw==
X-CSE-MsgGUID: 8s+N/vv7STKCaz5y4Eui8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="76061450"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Oct 2024 15:54:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxwcN-0005do-1h;
	Mon, 07 Oct 2024 22:54:19 +0000
Date: Tue, 08 Oct 2024 06:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 d3e4a4cb9c36653a9994425f39ce3c8a262764da
Message-ID: <202410080626.hBAdS9TZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: d3e4a4cb9c36653a9994425f39ce3c8a262764da  Merge branch 'renesas-dts-for-v6.13' into renesas-next

elapsed time: 771m

configs tested: 132
configs skipped: 95

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241008    gcc-14.1.0
arc                   randconfig-002-20241008    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                   randconfig-001-20241008    gcc-14.1.0
arm                   randconfig-002-20241008    gcc-14.1.0
arm                   randconfig-003-20241008    gcc-14.1.0
arm                   randconfig-004-20241008    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241008    gcc-14.1.0
arm64                 randconfig-002-20241008    gcc-14.1.0
arm64                 randconfig-003-20241008    gcc-14.1.0
arm64                 randconfig-004-20241008    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241008    gcc-14.1.0
csky                  randconfig-002-20241008    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241008    gcc-14.1.0
hexagon               randconfig-002-20241008    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241008    clang-18
i386        buildonly-randconfig-002-20241008    clang-18
i386        buildonly-randconfig-003-20241008    clang-18
i386        buildonly-randconfig-004-20241008    clang-18
i386        buildonly-randconfig-005-20241008    clang-18
i386        buildonly-randconfig-006-20241008    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241008    clang-18
i386                  randconfig-002-20241008    clang-18
i386                  randconfig-003-20241008    clang-18
i386                  randconfig-004-20241008    clang-18
i386                  randconfig-005-20241008    clang-18
i386                  randconfig-006-20241008    clang-18
i386                  randconfig-011-20241008    clang-18
i386                  randconfig-012-20241008    clang-18
i386                  randconfig-013-20241008    clang-18
i386                  randconfig-014-20241008    clang-18
i386                  randconfig-015-20241008    clang-18
i386                  randconfig-016-20241008    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241008    gcc-14.1.0
loongarch             randconfig-002-20241008    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241008    gcc-14.1.0
nios2                 randconfig-002-20241008    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241008    gcc-14.1.0
parisc                randconfig-002-20241008    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc               randconfig-001-20241008    gcc-14.1.0
powerpc               randconfig-002-20241008    gcc-14.1.0
powerpc               randconfig-003-20241008    gcc-14.1.0
powerpc64             randconfig-001-20241008    gcc-14.1.0
powerpc64             randconfig-002-20241008    gcc-14.1.0
powerpc64             randconfig-003-20241008    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241008    gcc-14.1.0
riscv                 randconfig-002-20241008    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241008    gcc-14.1.0
s390                  randconfig-002-20241008    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20241008    gcc-14.1.0
sh                    randconfig-002-20241008    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241008    gcc-14.1.0
sparc64               randconfig-002-20241008    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241008    gcc-14.1.0
um                    randconfig-002-20241008    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241008    gcc-14.1.0
xtensa                randconfig-002-20241008    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

