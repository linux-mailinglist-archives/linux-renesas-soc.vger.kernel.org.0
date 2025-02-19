Return-Path: <linux-renesas-soc+bounces-13315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE91AA3BD20
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 12:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 811DB1897D49
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 11:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83081DED5E;
	Wed, 19 Feb 2025 11:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nU7S7nq1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D1B1B0F14
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 11:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965204; cv=none; b=E3nZC4pSySQlKHxdp03o3a3RTTYSf3+LWPDEMoyTw5PGEiZVk1NI6hm4GP2s3nC+tOcWTSZdG5xns4JtswDcQU5nS0hJhAYWCG/qTcAHMy7ksNYZKRtmvVK6dwUjNp2V2rlhvmo2oOcbQDLhb6y8JZ3sdDUhggPuz8HZKec157k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965204; c=relaxed/simple;
	bh=Pdx/V145Jqd+dDFZL5qFcQyl7zIEJFc5rQi3wTjfLjc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nFdQuR7DfNz198oXEwD2horMHWyw76otXoMpTihYbZeSyABVovCPfq/Y08NGVrb5bqBcauB2uv35hc8EDGN7dfC4cflFhvmbynkLJ/pzVD6KuD9YFHm3ne2Q34Kt7971VJ5iJl8XrOK4RzOlTEO5lqtpl53q32GcDQ3Mk9m5aHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nU7S7nq1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739965203; x=1771501203;
  h=date:from:to:cc:subject:message-id;
  bh=Pdx/V145Jqd+dDFZL5qFcQyl7zIEJFc5rQi3wTjfLjc=;
  b=nU7S7nq1VcjwziBRsAepEihn+ppw3IselwvvFak1BoNQ8BchOwc1XNAD
   0OnlSJGtfhI+JSTVnAXe+gAd5LFZDUyDwgCWBm6vkWlFhYe9gL5+sXVeq
   d0k8PnId8Ft/uBj6SueOV4PTq5KMdvFNvH3jhVZoD/rWBIeMVCXesICx9
   KFmcUIFyMvpsHVtpZoA1jXV0Zpl32eSsHgY3sfBklssHMWvSPkIKVJbTn
   MREKjEgSB9GLfzUbULp1J5ZefcWPKBNxaJvACDV+pc+Gntnq33C6tgOmT
   T7MCUNXk+MsPDz1pSyr5l8XrkIiSPuNM1WYQ98iAdIuCQaa1HofQ+CHoD
   g==;
X-CSE-ConnectionGUID: Hr9zk/xkRMmd1e3HNlHQdw==
X-CSE-MsgGUID: YJrrhntzTECf7tsoaBWLyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="52100657"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="52100657"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 03:40:03 -0800
X-CSE-ConnectionGUID: +QcyVUthRfenmY+tlR+ODw==
X-CSE-MsgGUID: Cq0VjsieSTiPowuCells5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="114541966"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Feb 2025 03:40:01 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkiQp-0002rP-0J;
	Wed, 19 Feb 2025 11:39:59 +0000
Date: Wed, 19 Feb 2025 19:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 43961f7ee3f31c97209157bd19420ea8a65b1181
Message-ID: <202502191945.BFRaW7SV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 43961f7ee3f31c97209157bd19420ea8a65b1181  clk: renesas: rzv2h: Update error message

elapsed time: 1457m

configs tested: 106
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250218    gcc-13.2.0
arc                   randconfig-002-20250218    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250218    gcc-14.2.0
arm                   randconfig-002-20250218    gcc-14.2.0
arm                   randconfig-003-20250218    gcc-14.2.0
arm                   randconfig-004-20250218    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250218    clang-21
arm64                 randconfig-002-20250218    clang-21
arm64                 randconfig-003-20250218    gcc-14.2.0
arm64                 randconfig-004-20250218    clang-16
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250218    gcc-14.2.0
csky                  randconfig-002-20250218    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250218    clang-17
hexagon               randconfig-002-20250218    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250218    gcc-12
i386        buildonly-randconfig-002-20250218    gcc-12
i386        buildonly-randconfig-003-20250218    gcc-12
i386        buildonly-randconfig-004-20250218    clang-19
i386        buildonly-randconfig-005-20250218    clang-19
i386        buildonly-randconfig-006-20250218    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250218    gcc-14.2.0
loongarch             randconfig-002-20250218    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250218    gcc-14.2.0
nios2                 randconfig-002-20250218    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250218    gcc-14.2.0
parisc                randconfig-002-20250218    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250218    gcc-14.2.0
powerpc               randconfig-002-20250218    gcc-14.2.0
powerpc               randconfig-003-20250218    clang-21
powerpc64             randconfig-001-20250218    gcc-14.2.0
powerpc64             randconfig-002-20250218    clang-16
powerpc64             randconfig-003-20250218    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250218    gcc-14.2.0
riscv                 randconfig-002-20250218    clang-21
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250218    clang-21
s390                  randconfig-002-20250218    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250218    gcc-14.2.0
sh                    randconfig-002-20250218    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250218    gcc-14.2.0
sparc                 randconfig-002-20250218    gcc-14.2.0
sparc64               randconfig-001-20250218    gcc-14.2.0
sparc64               randconfig-002-20250218    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250218    clang-21
um                    randconfig-002-20250218    gcc-11
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250218    clang-19
x86_64      buildonly-randconfig-002-20250218    gcc-12
x86_64      buildonly-randconfig-003-20250218    clang-19
x86_64      buildonly-randconfig-004-20250218    gcc-12
x86_64      buildonly-randconfig-005-20250218    clang-19
x86_64      buildonly-randconfig-006-20250218    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250218    gcc-14.2.0
xtensa                randconfig-002-20250218    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

