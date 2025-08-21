Return-Path: <linux-renesas-soc+bounces-20824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BB3B2F029
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 09:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE5247AC564
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 07:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9EC28312B;
	Thu, 21 Aug 2025 07:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bms0Ga6b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082E3188906
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 07:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755762879; cv=none; b=CNpV7JLxyQ53sH/qNx6tT23Kc1OloilBUdFs8hTp7LdiSiGZ7MUCE1WWYjGWoPWLsEJxoxYGnKRPGWIhxnw/UQy2Z8+8b4UbFGzJAqy0P2q5pUyAx046W2DiYaZ73bZRS7deO+G2wv7KsJmeb5KAXZ0JVVcD55ME89IeDCo2Jl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755762879; c=relaxed/simple;
	bh=vdX17xZy6+ODWdR3+BNbFIdPeIZLqsRajsxtolcPOuo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OjaGZuhBI9/BCQL8aCYL0U/4YnD16DHNH8mKisiCJ+WWMqJLRMZBiHa0mJoxmA7MzLgrj68ZhZf8JaGuwtHZgRABTTsZeglzivMOiHoeys54WgVcjM8d1i7wKSjm0FH9f8qbo7VPogquHSEeYR1glSjRknp9miWOIZX9oKuJODE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bms0Ga6b; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755762878; x=1787298878;
  h=date:from:to:cc:subject:message-id;
  bh=vdX17xZy6+ODWdR3+BNbFIdPeIZLqsRajsxtolcPOuo=;
  b=Bms0Ga6blJx7SIxdHkgYjARf3cq/UrVZzxjKZe2tyTMXRxczMTz5ZvV4
   UHXUW7hrujBRBps2xy6/T9pOt0mz2TqDJxH8oJHkoyKwGvrSKT47UiW6k
   rqUI75GHbbdSJ0aEZqPvSquGb/AkOKebsqWpdZnMImLsupXG1psWpAVcH
   UGykkjbpO30uCM+EU/S1dnOS0xvajOw7nK8zAu1JbBsQHooHCGNaQVW6r
   gZuaeVWMEv9wTtpgPLONDeepMA6oSkgfcBOzV7QOYToaWws3a2UPKbAE1
   OnprejXpM+EsGDC5Fsle1mAcubcnJFjqV+ExKlnOc8C6EMnZurXO2QJe8
   Q==;
X-CSE-ConnectionGUID: E/gRMgfaSu+bE5jT6RI1Yw==
X-CSE-MsgGUID: NFx3G6v6R9qV2sJ9Mit6xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69144309"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="69144309"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 00:54:31 -0700
X-CSE-ConnectionGUID: rUUFuOteRCyOFeGWfSsn3w==
X-CSE-MsgGUID: 0NFWKi3oTJ+k78v4GMF8Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="167572674"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 Aug 2025 00:54:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up07v-000K3f-1b;
	Thu, 21 Aug 2025 07:54:27 +0000
Date: Thu, 21 Aug 2025 15:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 d1d31e2739ff063da1e85cd9b44316ca5cccdba8
Message-ID: <202508211528.HLkoRwFR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: d1d31e2739ff063da1e85cd9b44316ca5cccdba8  pinctrl: renesas: rzt2h: Add support for RZ/N2H

elapsed time: 1463m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250820    gcc-8.5.0
arc                   randconfig-002-20250820    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250820    gcc-8.5.0
arm                   randconfig-002-20250820    gcc-15.1.0
arm                   randconfig-003-20250820    gcc-13.4.0
arm                   randconfig-004-20250820    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250820    gcc-14.3.0
arm64                 randconfig-002-20250820    gcc-14.3.0
arm64                 randconfig-003-20250820    gcc-8.5.0
arm64                 randconfig-004-20250820    gcc-14.3.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250820    gcc-15.1.0
csky                  randconfig-002-20250820    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250820    clang-22
hexagon               randconfig-002-20250820    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250820    clang-20
i386        buildonly-randconfig-002-20250820    gcc-12
i386        buildonly-randconfig-003-20250820    gcc-12
i386        buildonly-randconfig-004-20250820    clang-20
i386        buildonly-randconfig-005-20250820    gcc-12
i386        buildonly-randconfig-006-20250820    gcc-11
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250820    clang-18
loongarch             randconfig-002-20250820    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250820    gcc-11.5.0
nios2                 randconfig-002-20250820    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250820    gcc-8.5.0
parisc                randconfig-002-20250820    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250820    gcc-12.5.0
powerpc               randconfig-002-20250820    gcc-8.5.0
powerpc               randconfig-003-20250820    gcc-13.4.0
powerpc64             randconfig-001-20250820    clang-22
powerpc64             randconfig-002-20250820    clang-22
powerpc64             randconfig-003-20250820    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250820    clang-20
riscv                 randconfig-002-20250820    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250820    clang-18
s390                  randconfig-002-20250820    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250820    gcc-15.1.0
sh                    randconfig-002-20250820    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250820    gcc-8.5.0
sparc                 randconfig-002-20250820    gcc-12.5.0
sparc64               randconfig-001-20250820    clang-22
sparc64               randconfig-002-20250820    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250820    gcc-12
um                    randconfig-002-20250820    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250820    clang-20
x86_64      buildonly-randconfig-002-20250820    gcc-11
x86_64      buildonly-randconfig-003-20250820    clang-20
x86_64      buildonly-randconfig-004-20250820    gcc-12
x86_64      buildonly-randconfig-005-20250820    clang-20
x86_64      buildonly-randconfig-006-20250820    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250820    gcc-8.5.0
xtensa                randconfig-002-20250820    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

