Return-Path: <linux-renesas-soc+bounces-13184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 218DBA36CD3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Feb 2025 10:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 674293B044E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Feb 2025 09:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9236E199E89;
	Sat, 15 Feb 2025 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1kmo3MU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E677E802
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Feb 2025 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739611285; cv=none; b=fTuFIFhTMgWxs2SsdF7KE61ZXVI5bOU7UFa1OY0Va3yXDfXCyPABjRtFc5lUsd2u+Bq+Iq/0qerROtvJ7sGWtozTlvh8I3S609Mxa4S2osIRhADbqo8Vs7COo8jbvLT541nTVJZosej7FgOGt4see+OgIOhC05TYwSuKgeGXKzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739611285; c=relaxed/simple;
	bh=scCkDsC1pAVlzRX2ORORP1t5soJTkHv0jjOKSXX/2fM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j0kFneCdTlhC9BM7J9dDMTLLA1EHHkEiG8/hvRpRtb/iLDsdW6/9JG/381SLMrAUYtiTANj98OignGnMXx3QHUx1A8QVPspjesttWvwwrLqq7QNkS6kQqZcEmaWvqdssIY0XAVJciyjHuylleLIzRpZrecMKIaObqrpNO8xK+CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1kmo3MU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739611284; x=1771147284;
  h=date:from:to:cc:subject:message-id;
  bh=scCkDsC1pAVlzRX2ORORP1t5soJTkHv0jjOKSXX/2fM=;
  b=j1kmo3MU01A+kTKEJBPYru3h4n0dJ+rfKJ/sSYL3SpGs9YlmhHGeaAoI
   yiz/PvksXpazIEM2DLoKeob3N0zuoYrHyLNV46cUC/nZ7uXBMROXj8vHu
   8pN7CoqDNXKvIjVU3Y/7FYys/MgWanU1Jy7DBn5LVFyqj5TiMYrzO0FQT
   HxE56mnb+2n/+odc43oIwKvVUR2hGG30pOufjQQ5S3GWHMKXb2BXQp7jO
   mQ7nL05lcu7DQ2Dlhb6p7tz9f1akJdhn1mTyUti70J1JeHXCMYHrPxbTG
   XFDCBr6kw2Ox1lIiZWq6h9TYOVyUcLIKznFnQ0+Db0aaoRONxDt4z/U4k
   Q==;
X-CSE-ConnectionGUID: VDIvtohcSDOpysfTC5ERVg==
X-CSE-MsgGUID: jRuX3UZgQeqfTJCPkpZaLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="57886294"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="57886294"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 01:21:23 -0800
X-CSE-ConnectionGUID: RKr9avurQtmeZdgFaG6GdQ==
X-CSE-MsgGUID: Kt8VoekTQ1iYwCs1nMszNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="113648496"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Feb 2025 01:21:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjEMS-001Afr-1C;
	Sat, 15 Feb 2025 09:21:20 +0000
Date: Sat, 15 Feb 2025 17:21:12 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 2d44b3bf415349e5c05bca52888eda9d7a738b59
Message-ID: <202502151706.l4qayTE0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 2d44b3bf415349e5c05bca52888eda9d7a738b59  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1449m

configs tested: 91
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250214    gcc-13.2.0
arc                   randconfig-002-20250214    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250214    clang-16
arm                   randconfig-002-20250214    gcc-14.2.0
arm                   randconfig-003-20250214    clang-21
arm                   randconfig-004-20250214    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250214    gcc-14.2.0
arm64                 randconfig-002-20250214    gcc-14.2.0
arm64                 randconfig-003-20250214    gcc-14.2.0
arm64                 randconfig-004-20250214    gcc-14.2.0
csky                  randconfig-001-20250214    gcc-14.2.0
csky                  randconfig-002-20250214    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250214    clang-21
hexagon               randconfig-002-20250214    clang-15
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250214    gcc-12
i386        buildonly-randconfig-002-20250214    gcc-12
i386        buildonly-randconfig-003-20250214    clang-19
i386        buildonly-randconfig-004-20250214    gcc-12
i386        buildonly-randconfig-005-20250214    gcc-12
i386        buildonly-randconfig-006-20250214    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250214    gcc-14.2.0
loongarch             randconfig-002-20250214    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250214    gcc-14.2.0
nios2                 randconfig-002-20250214    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250214    gcc-14.2.0
parisc                randconfig-002-20250214    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250214    gcc-14.2.0
powerpc               randconfig-002-20250214    clang-18
powerpc               randconfig-003-20250214    clang-21
powerpc64             randconfig-001-20250214    clang-18
powerpc64             randconfig-002-20250214    gcc-14.2.0
powerpc64             randconfig-003-20250214    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250214    clang-18
riscv                 randconfig-002-20250214    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250214    gcc-14.2.0
s390                  randconfig-002-20250214    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250214    gcc-14.2.0
sh                    randconfig-002-20250214    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250214    gcc-14.2.0
sparc                 randconfig-002-20250214    gcc-14.2.0
sparc64               randconfig-001-20250214    gcc-14.2.0
sparc64               randconfig-002-20250214    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250214    gcc-12
um                    randconfig-002-20250214    clang-16
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250214    clang-19
x86_64      buildonly-randconfig-002-20250214    clang-19
x86_64      buildonly-randconfig-003-20250214    gcc-12
x86_64      buildonly-randconfig-004-20250214    clang-19
x86_64      buildonly-randconfig-005-20250214    gcc-12
x86_64      buildonly-randconfig-006-20250214    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250214    gcc-14.2.0
xtensa                randconfig-002-20250214    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

