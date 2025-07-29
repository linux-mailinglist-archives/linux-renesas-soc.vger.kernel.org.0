Return-Path: <linux-renesas-soc+bounces-19723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B503B14712
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 06:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 343F517E9EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 04:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9BA2E3711;
	Tue, 29 Jul 2025 04:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwxx5ybf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D25A2E36E6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Jul 2025 04:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753762542; cv=none; b=Kix/VUNsRgZAFeCKYidZeAR88IBATqRPid0S3Tcifoq6SNmkqtOftFD/7rXxVFiqSabkEVY4ui2ldJ6/IL4B8j629jTt9IRimobLpK8NMtKLqLdX+KqdOlDErILM9rAoE9LSz7++E/CK9rH+D+hXYkNIMtjmlw1whTIfMbS974U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753762542; c=relaxed/simple;
	bh=bEYrOd6HPnztXPo1jJ6a2us1P+gSVeY13SxDpZBQ6HA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Os0Q8Mh2PsTzuufkpJg9zmPGMmAOWDk60M3tz5A3ll1hboZ4M8cwQ97CxKOnjJunXRFxaMu81/5GRCPMB1F+cvce5N9jBX84mI4y9KA36uNhbvYO1eMCJA+yP5QgM+a+25XUZjGxM0G/mgB/ygRPRrGaOjchVI05ZrXmo9RfgBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwxx5ybf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753762541; x=1785298541;
  h=date:from:to:cc:subject:message-id;
  bh=bEYrOd6HPnztXPo1jJ6a2us1P+gSVeY13SxDpZBQ6HA=;
  b=jwxx5ybfbSiBIhpnhTOFQPP6+FX7mj5NQdOLfIgX2zPRN3dQKrg+q8H7
   xaLhlNrST14KMwAAGjdr+H9AfK25CJNVKR/asIr49b2tbRvNGir/FlqgD
   MlA4hT7U/Rx6TeXODS8fAPbKUSUo0Q+Uee6Y4b2DHe1KZC/IQoBPpbE9c
   v+7n71P0LlrF2OjDSZxQ/nv/BaaN8LPVORBRSNcQJu2FhYR7Z1b+KIpef
   1kN3MdU/sEKig1XesiqsfhR3U5UGnHTugAzAqhncOmXMxfmFZ2dkjLZzk
   w9+o4T3e3jlpMh/LAZ+6CJv5+wpZ4maUKCcUEzVGFx2GMlpCu8IqprUos
   Q==;
X-CSE-ConnectionGUID: ADreEWrKTNSyqB9z6RxISw==
X-CSE-MsgGUID: d6cxmao4RX+WdnxlpyXGWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56171187"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="56171187"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 21:15:39 -0700
X-CSE-ConnectionGUID: CHwknxOQRW+5IHLtdPUl8g==
X-CSE-MsgGUID: pD9yCFheQBSDskH5JIIA0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="161861538"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jul 2025 21:15:35 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugbkP-0000yZ-2M;
	Tue, 29 Jul 2025 04:15:29 +0000
Date: Tue, 29 Jul 2025 12:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 f07fe1b65da62b074f2d120ea8d9544f670daea2
Message-ID: <202507291258.1shVJgQS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: f07fe1b65da62b074f2d120ea8d9544f670daea2  Merge tag 'v6.16' into topic/renesas-defconfig

elapsed time: 989m

configs tested: 149
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250728    gcc-13.4.0
arc                   randconfig-002-20250728    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250728    clang-22
arm                   randconfig-002-20250728    clang-22
arm                   randconfig-003-20250728    clang-22
arm                   randconfig-004-20250728    gcc-8.5.0
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250728    clang-22
arm64                 randconfig-002-20250728    clang-20
arm64                 randconfig-003-20250728    gcc-11.5.0
arm64                 randconfig-004-20250728    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250728    gcc-10.5.0
csky                  randconfig-002-20250728    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250728    clang-22
hexagon               randconfig-002-20250728    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250728    gcc-12
i386        buildonly-randconfig-001-20250729    gcc-12
i386        buildonly-randconfig-002-20250728    gcc-12
i386        buildonly-randconfig-002-20250729    gcc-12
i386        buildonly-randconfig-003-20250728    gcc-12
i386        buildonly-randconfig-003-20250729    gcc-12
i386        buildonly-randconfig-004-20250728    clang-20
i386        buildonly-randconfig-004-20250729    gcc-12
i386        buildonly-randconfig-005-20250728    gcc-12
i386        buildonly-randconfig-005-20250729    gcc-12
i386        buildonly-randconfig-006-20250728    clang-20
i386        buildonly-randconfig-006-20250729    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                 loongson3_defconfig    clang-22
loongarch             randconfig-001-20250728    clang-22
loongarch             randconfig-002-20250728    clang-20
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250728    gcc-11.5.0
nios2                 randconfig-002-20250728    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250728    gcc-9.5.0
parisc                randconfig-002-20250728    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                     ksi8560_defconfig    gcc-15.1.0
powerpc                      pcm030_defconfig    clang-22
powerpc               randconfig-001-20250728    gcc-10.5.0
powerpc               randconfig-002-20250728    gcc-13.4.0
powerpc               randconfig-003-20250728    gcc-8.5.0
powerpc64             randconfig-001-20250728    clang-22
powerpc64             randconfig-002-20250728    clang-22
powerpc64             randconfig-003-20250728    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250728    clang-22
riscv                 randconfig-002-20250728    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250728    clang-22
s390                  randconfig-002-20250728    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250728    gcc-14.3.0
sh                    randconfig-002-20250728    gcc-9.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250728    gcc-8.5.0
sparc                 randconfig-002-20250728    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250728    clang-20
sparc64               randconfig-002-20250728    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250728    clang-22
um                    randconfig-002-20250728    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250728    clang-20
x86_64      buildonly-randconfig-001-20250729    clang-20
x86_64      buildonly-randconfig-002-20250728    clang-20
x86_64      buildonly-randconfig-002-20250729    clang-20
x86_64      buildonly-randconfig-003-20250728    clang-20
x86_64      buildonly-randconfig-003-20250729    clang-20
x86_64      buildonly-randconfig-004-20250728    clang-20
x86_64      buildonly-randconfig-004-20250729    clang-20
x86_64      buildonly-randconfig-005-20250728    clang-20
x86_64      buildonly-randconfig-005-20250729    clang-20
x86_64      buildonly-randconfig-006-20250728    gcc-12
x86_64      buildonly-randconfig-006-20250729    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250728    gcc-8.5.0
xtensa                randconfig-002-20250728    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

