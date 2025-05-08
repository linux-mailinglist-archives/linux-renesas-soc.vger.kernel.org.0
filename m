Return-Path: <linux-renesas-soc+bounces-16784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC2DAAF33E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 07:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DADDD1C0448D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 05:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D121B87D5;
	Thu,  8 May 2025 05:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oItdhzFw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433C115B102
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 05:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683956; cv=none; b=svcDZdhWZvW5yVTma4FX2RsgzdvBWR0eJE15Vr4gAmL+9WCiADfzQqmuSvp/RkPiCJawdFefyBrCTrV6r8hCPlWS/2EADQBfTIqXtVSiTCvi6n0iUonYyEPeKNqdxqSwJp2AHTeZMPfXIeP20nx6yvGWwU5BK4JG52hOPtYtpz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683956; c=relaxed/simple;
	bh=onDDkP8vto6L5YgJDAQ+3+eI6N0Dl8FYL38rAK/E5Ps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ldMFjYOh2/dTRaOavVHK7LXcyLCfskZxwREHaD9dkWhofxv6ZjhMMKlCjCxDp/7+LmiVm2i9MujSZBhawqHwWvUo9C1kPRO07TOw/iabLeZNL2EZkdnbbdFQ7lZjGen6H/HSSkbLKLKI7UTkUEfAryfZJIRRIFIckOVBZeEt/wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oItdhzFw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746683954; x=1778219954;
  h=date:from:to:cc:subject:message-id;
  bh=onDDkP8vto6L5YgJDAQ+3+eI6N0Dl8FYL38rAK/E5Ps=;
  b=oItdhzFwquVNC3GbekNONpluGXJC/qOnY14PdjcGQBNqd4hwbzRiAh3+
   1T0e986uk2XYtz8H97Ndirhoz5BGXnVZRH86AKjjZVwt/aWMbV+M8meBc
   4pxAHCv2R7oOmJq4eQ/G8cUwxFt3eFv0HStgwOheiF0Ik5pJ84Nlg3NSN
   VKGNemfvv58KaxJX2sJfiyLH8tZHjkR9g9u0jTgWZhf1J0e/j06tAbOpv
   9u2kjshtlG11Q5G+TXwApCSA3pedUmYsy14aX4Yrp0l7ZmoskpUv9JXH3
   4IiCGx3d+Gk6gJlTQXZ6UvIUD8lnBVwfSSFBocRe+nG3V974wQOY909lD
   w==;
X-CSE-ConnectionGUID: aRqUGCRjRJ2SS51x0XwyDg==
X-CSE-MsgGUID: b291w9+iT1SSQbRgjGdirg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="58650512"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="58650512"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:59:14 -0700
X-CSE-ConnectionGUID: +DjaPYi8Se6bnyf0GRWf8g==
X-CSE-MsgGUID: jpqxmDnxRPmvCbXQrmpVoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="141146476"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 May 2025 22:59:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCuHm-000AVk-0p;
	Thu, 08 May 2025 05:59:10 +0000
Date: Thu, 08 May 2025 13:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 388f43ad32a585e84ee9f52e118282c2014f933f
Message-ID: <202505081324.iDazCG4D-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 388f43ad32a585e84ee9f52e118282c2014f933f  arm64: renesas: defconfig: Enable more Sparrow Hawk support

elapsed time: 2753m

configs tested: 95
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250506    gcc-8.5.0
arc                   randconfig-002-20250506    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250506    clang-21
arm                   randconfig-002-20250506    clang-21
arm                   randconfig-003-20250506    clang-17
arm                   randconfig-004-20250506    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250506    clang-21
arm64                 randconfig-002-20250506    gcc-8.5.0
arm64                 randconfig-003-20250506    clang-21
arm64                 randconfig-004-20250506    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250506    gcc-14.2.0
csky                  randconfig-002-20250506    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250506    clang-21
hexagon               randconfig-002-20250506    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250506    clang-20
i386        buildonly-randconfig-002-20250506    clang-20
i386        buildonly-randconfig-003-20250506    clang-20
i386        buildonly-randconfig-004-20250506    gcc-12
i386        buildonly-randconfig-005-20250506    clang-20
i386        buildonly-randconfig-006-20250506    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250506    gcc-14.2.0
loongarch             randconfig-002-20250506    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250506    gcc-8.5.0
nios2                 randconfig-002-20250506    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250506    gcc-11.5.0
parisc                randconfig-002-20250506    gcc-5.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250506    clang-21
powerpc               randconfig-002-20250506    gcc-8.5.0
powerpc               randconfig-003-20250506    gcc-8.5.0
powerpc64             randconfig-001-20250506    clang-20
powerpc64             randconfig-002-20250506    gcc-8.5.0
powerpc64             randconfig-003-20250506    clang-18
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250506    clang-19
riscv                 randconfig-002-20250506    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250506    gcc-9.3.0
s390                  randconfig-002-20250506    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250506    gcc-12.4.0
sh                    randconfig-002-20250506    gcc-12.4.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250506    gcc-11.5.0
sparc                 randconfig-002-20250506    gcc-6.5.0
sparc64               randconfig-001-20250506    gcc-7.5.0
sparc64               randconfig-002-20250506    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250506    clang-17
um                    randconfig-002-20250506    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250506    clang-20
x86_64      buildonly-randconfig-002-20250506    gcc-12
x86_64      buildonly-randconfig-003-20250506    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250506    gcc-13.3.0
xtensa                randconfig-002-20250506    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

