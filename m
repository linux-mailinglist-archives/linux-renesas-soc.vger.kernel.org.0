Return-Path: <linux-renesas-soc+bounces-18703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3DEAE7D8D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 11:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5AC97ACE53
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 09:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F75C29A9E9;
	Wed, 25 Jun 2025 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HET7eelc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D4B2BD58A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jun 2025 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750844000; cv=none; b=hlPr/1l/LJV8ZvwlovIE9KYpiuJdP3O0cUC0UQTtzMNez6EkChT0LNU/K6nWVl+BleqmhbykbyXcjukvZUcxw5zE84S9E2u99FlvJ0aU5kcI7yRSetABcmtWHOUbHQnOGVKM4JYQSU7+w8EQDkHYuJrZqe3foxlVIptTx6x71rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750844000; c=relaxed/simple;
	bh=xGyk1MADcj2xOYBJ0+q4dew17+kcNs+NNV0S0Z4sb/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AQHFnw+6/l0xfRM627S7tJ4fH0lFYRViXMh1sBdiUES+zakXAsfBlxsFGZxeKNmtnq+8XRKYpqic18FAE5q0csK847V7htuAjmUvhLb42IH4RQfsTX5IqI+fWEqXDK/xNaawQ+cdPxrMmA80fcL7frD5jKWUzmgTlsmhxHPzTn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HET7eelc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750843998; x=1782379998;
  h=date:from:to:cc:subject:message-id;
  bh=xGyk1MADcj2xOYBJ0+q4dew17+kcNs+NNV0S0Z4sb/c=;
  b=HET7eelcPG2r4WVgTlZPfiVMsMsGMZ6QtgK27wNQENF8BuGncx9hazju
   ryN4j8zk84n1wNfTuZhmSqTHX3sbQDHo0xCeYOF5VNi+2Wukko31JVKEE
   1T4+pxRJEJCgoyHAgYdorxy8d4u3Bom/NByFn3fhnqRqj3xbM928RmpaT
   JZyt6SVRAX7/5CYIbxF04vKWdqu2YocOFijL5iYqbeWyHAQdRoIe0b3CO
   QErGGZ3bWMKFS4P2ynWina29RVXkGXKpPC0qZAcxjdG4DgeShIFniwlqe
   EVJKnTnsurpxLrkzH9Q46cWvM5Fbdi2Nzs5K+5ythr4CfPaU54UUoprz2
   w==;
X-CSE-ConnectionGUID: uZwyUfZATeWJlhIvd4oSSA==
X-CSE-MsgGUID: dY+KCTxDRmScRR8vydacqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63369145"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="63369145"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 02:33:18 -0700
X-CSE-ConnectionGUID: znALWDOIStShNCth0L3tmg==
X-CSE-MsgGUID: oOGW++7oR0ap2sTaRr0UoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152459310"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Jun 2025 02:33:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUMVH-000Sxa-0c;
	Wed, 25 Jun 2025 09:33:15 +0000
Date: Wed, 25 Jun 2025 17:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v6.17] BUILD
 SUCCESS 37c78e3a456fc754e6b9aa7d94365017a33de8f8
Message-ID: <202506251747.PluH0GH5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.17
branch HEAD: 37c78e3a456fc754e6b9aa7d94365017a33de8f8  dt-bindings: soc: renesas: Document RZ/T2H Evaluation Board part number

elapsed time: 1451m

configs tested: 126
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
arc                   randconfig-002-20250624    gcc-8.5.0
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
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
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

