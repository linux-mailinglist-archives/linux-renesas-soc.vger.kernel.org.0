Return-Path: <linux-renesas-soc+bounces-23711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CBCC12238
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 01:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 12CB55007B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 00:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFE6189;
	Tue, 28 Oct 2025 00:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ja6oWVEn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D342678F3A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 00:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761609774; cv=none; b=Ff8D+p1z0mD9llWT8kManbNckAW3hU1jwpqOVK4LvqIFauHBW9J8TvN66ozIAKw29udWbJUSuG/V5gJ7RJ6qfCZljt/BKzlAD+lCV/t6CPMVnXRrCppgHIkXdlrkI2q3Cs2LdjhxUbWgecPZUZDmmMJx1uJePEdQ1U5tIrLn8v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761609774; c=relaxed/simple;
	bh=neKK3Y+R8oSY36wuI/0ShHTQEKFtWAZ5cYF/LSylaTQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=axvrGJ3SpKKfgeXZk84HxPSxXV7W89DPdkjDNlG1VnIVSKcTQTTULV5AXSF30fAVmcS6b0sPag0o/Dyz1T0VzOOLyJ4I5CmZnwK/AlyqYZqAcAhdG8pCAAQdk7+bynq2iD7jYmNPkNe+DeyV/cxkDI7AcsNrOIB2CBiOT8q1ZRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ja6oWVEn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761609773; x=1793145773;
  h=date:from:to:cc:subject:message-id;
  bh=neKK3Y+R8oSY36wuI/0ShHTQEKFtWAZ5cYF/LSylaTQ=;
  b=Ja6oWVEnwM269nn3/6EFmRN4E8B+PBzHyo5uh1JMclSTAjzSFz0NH0VA
   wBWl2r4MnfH/fMfj1edU0x4CNSqaHQXIBwVgFWFAs+iPf3nVLtJeXFord
   Ch8PvulQ7aLwjvmXmSz1PIByBsTBLdmp38EBfNSjRZdigo5jSjGsRceLf
   XHxOVpF7yYP72+k1iAp4wdKEhgvFfnYREzb+q+P+kTxIV6ZO2csXnHcso
   e7mlA5P0PIZ0DjgKkMB8dgOMO9GDDuxrvkYjLfWjGEGTgHjuUn7YSmUaa
   +CfiYlUncvOabevha9bg1yK70auHJp8FE6lqoaQzi799YdX+kFUnmbT94
   g==;
X-CSE-ConnectionGUID: iUra6cnmT8aG4ZJltZZ7DQ==
X-CSE-MsgGUID: venOjHZVR26XNKG6lXPEKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75146567"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="75146567"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 17:02:53 -0700
X-CSE-ConnectionGUID: 8y4RhpVQTSSnG4o+2+SnwQ==
X-CSE-MsgGUID: 1zeg7mt3QBKx7KiWpH16OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="215848477"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Oct 2025 17:02:51 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDXAm-000IaT-2L;
	Tue, 28 Oct 2025 00:02:48 +0000
Date: Tue, 28 Oct 2025 08:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 af5b4c056dfdcac220b4302d46550cd22f109ed0
Message-ID: <202510280814.j9NPmfPc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: af5b4c056dfdcac220b4302d46550cd22f109ed0  Merge tag 'v6.18-rc3' into renesas-devel

elapsed time: 804m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251027    gcc-8.5.0
arc                   randconfig-002-20251027    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                            dove_defconfig    gcc-15.1.0
arm                   randconfig-001-20251027    clang-22
arm                   randconfig-002-20251027    clang-22
arm                   randconfig-003-20251027    gcc-8.5.0
arm                   randconfig-004-20251027    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251027    clang-22
arm64                 randconfig-002-20251027    gcc-12.5.0
arm64                 randconfig-003-20251027    gcc-9.5.0
arm64                 randconfig-004-20251027    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251027    gcc-14.3.0
csky                  randconfig-002-20251027    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251027    clang-22
hexagon               randconfig-002-20251027    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251027    gcc-13
i386        buildonly-randconfig-002-20251027    clang-20
i386        buildonly-randconfig-003-20251027    clang-20
i386        buildonly-randconfig-004-20251027    gcc-14
i386        buildonly-randconfig-005-20251027    clang-20
i386        buildonly-randconfig-006-20251027    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251027    gcc-15.1.0
loongarch             randconfig-002-20251027    gcc-13.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251027    gcc-8.5.0
nios2                 randconfig-002-20251027    gcc-8.5.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251027    gcc-8.5.0
parisc                randconfig-002-20251027    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                     asp8347_defconfig    clang-22
powerpc                   motionpro_defconfig    clang-22
powerpc               randconfig-001-20251027    clang-22
powerpc               randconfig-002-20251027    clang-22
powerpc               randconfig-003-20251027    gcc-8.5.0
powerpc64             randconfig-001-20251027    gcc-8.5.0
powerpc64             randconfig-002-20251027    gcc-10.5.0
powerpc64             randconfig-003-20251027    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20251027    gcc-13.4.0
riscv                 randconfig-002-20251027    clang-22
s390                             allmodconfig    clang-18
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251027    clang-22
s390                  randconfig-002-20251027    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20251027    gcc-12.5.0
sh                    randconfig-002-20251027    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251027    gcc-12.5.0
sparc                 randconfig-002-20251027    gcc-8.5.0
sparc64               randconfig-001-20251027    gcc-14.3.0
sparc64               randconfig-002-20251027    gcc-15.1.0
um                               allmodconfig    clang-19
um                               allyesconfig    gcc-14
um                    randconfig-001-20251027    clang-22
um                    randconfig-002-20251027    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251027    gcc-14
x86_64      buildonly-randconfig-002-20251027    gcc-14
x86_64      buildonly-randconfig-003-20251027    gcc-14
x86_64      buildonly-randconfig-004-20251027    gcc-14
x86_64      buildonly-randconfig-005-20251027    gcc-14
x86_64      buildonly-randconfig-006-20251027    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251027    gcc-12.5.0
xtensa                randconfig-002-20251027    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

