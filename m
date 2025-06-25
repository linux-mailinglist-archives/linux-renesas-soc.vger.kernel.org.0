Return-Path: <linux-renesas-soc+bounces-18701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE55AE7DA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 11:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0F643A9615
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 09:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471692820BA;
	Wed, 25 Jun 2025 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FmAfV+/K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DF21FBCB2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jun 2025 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843941; cv=none; b=qTWanaIcyrdbGf6j/uO0PU8Ajs+j2b/nRxsPHVynKKD+Z1O3RISkRcg5AXGm5fWNf/nD8GyQ00CWdzhBuvxiAkZqk7GYmH5fletairs+OsMUKCNkh9uTXs5uywwZqwKim2PySLHpd3Gh/B3i5McguiBxYiO4lRwCYqpALquE8f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843941; c=relaxed/simple;
	bh=ww0uEB6W+HPc9qLYyHwJqFlOPkXiObxePXv/4ia9ZTI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nKIRqg1EbXDer8lWFzqQoV/qB6XrTr0OW5WYbcf6RCjnLu5EoSw+8gdLYF1yW+Dqd7xxzJ9Kkj2MBEuocBvnAxQwDLSgwR6wlUbnZvp1dAR+hWbFydsXdln9Eg/A7js9Va6c1NTX/hqe35jjyXUQs24uIANH/PcELVDq2iWxHqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FmAfV+/K; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750843940; x=1782379940;
  h=date:from:to:cc:subject:message-id;
  bh=ww0uEB6W+HPc9qLYyHwJqFlOPkXiObxePXv/4ia9ZTI=;
  b=FmAfV+/KEn0afT9LG9eFNhY2QHOkm00LJdKW54Rzi6cjJCmEF5kzdCHJ
   IqAhUakSAZFHIYoEIQKOuwMgb6SmtyH4vTOrybic8CS8v9qHKsyF930tv
   jtVWRrOErxOWWZbkuDh8NsQiIGEhOqVymtQ6OAgcuFomtFaAK6uu2LdXe
   9z4NLU7cUGoyJ5J4Rux1apuWAtaY5BnVEayv/M8Y688k+xzykIqm6CZEf
   IYTDX7XOwxXOpZMuLuEPyYbQUoDNBs8MxM4/kSGaAwEWrik08cQ2ZLiAd
   CFcbuVu2rtiaFOutHY5Yev1fVb1IaQv7hXa6IH0+MbUfqNKld6vmy5+4S
   w==;
X-CSE-ConnectionGUID: SfuMe6WoT0C+3+GM6HEc9Q==
X-CSE-MsgGUID: mr/5bWVuSzy74RviIDVj3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70538570"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="70538570"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 02:32:18 -0700
X-CSE-ConnectionGUID: UCbAr/MiSau6X5fiWjHuVg==
X-CSE-MsgGUID: iQwNSL+aTEOFhwZ/9KuhPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="189341865"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jun 2025 02:32:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUMUI-000SxK-35;
	Wed, 25 Jun 2025 09:32:14 +0000
Date: Wed, 25 Jun 2025 17:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 28755d9cd1a63d2a5492ab66742d2d8636c6cbbf
Message-ID: <202506251758.7RusuNOQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 28755d9cd1a63d2a5492ab66742d2d8636c6cbbf  Merge branch 'renesas-dt-bindings-for-v6.17' into renesas-next

elapsed time: 1450m

configs tested: 64
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250624    gcc-12.4.0
arc                   randconfig-002-20250624    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250624    gcc-13.3.0
arm                   randconfig-002-20250624    gcc-8.5.0
arm                   randconfig-003-20250624    gcc-12.4.0
arm                   randconfig-004-20250624    clang-17
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250624    clang-21
arm64                 randconfig-002-20250624    gcc-10.5.0
arm64                 randconfig-003-20250624    clang-21
arm64                 randconfig-004-20250624    clang-21
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250624    clang-20
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-003-20250624    clang-20
i386        buildonly-randconfig-004-20250624    clang-20
i386        buildonly-randconfig-005-20250624    clang-20
i386        buildonly-randconfig-006-20250624    gcc-12
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
parisc                            allnoconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
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
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250624    clang-20
x86_64      buildonly-randconfig-002-20250624    gcc-12
x86_64      buildonly-randconfig-003-20250624    clang-20
x86_64      buildonly-randconfig-004-20250624    clang-20
x86_64      buildonly-randconfig-005-20250624    clang-20
x86_64      buildonly-randconfig-006-20250624    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

