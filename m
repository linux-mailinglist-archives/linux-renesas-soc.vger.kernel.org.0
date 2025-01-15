Return-Path: <linux-renesas-soc+bounces-12185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C933FA12B8D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 20:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D3263A649A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 19:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D191D86C7;
	Wed, 15 Jan 2025 19:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhKvWoHA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7C01D7E21
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jan 2025 19:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736968248; cv=none; b=IYYNfjiaCfvp5aW8jo+6JEZQ30cYdjR5xlKrXxdwr1CSdr4oXtCs+L18/QLxNEvYdlxi0xSCB0bQeICuGciAB39PfwbhDEuRMwM8oXmov649pRmXa1PtXWHPs/gn7e/R/vmgrLvdghkOOy7J78iwRDLJkeWlZl2pH3qGL5Hmvqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736968248; c=relaxed/simple;
	bh=ZBMJjwrWP/Vj1jE1UHNxNPypN3E4Ak4+4C8HhINVotg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dX5RjwkXMSHEFlmBaljoVeIU4EptNoqLZCK2PUm/xeHxOWCD4B9nVxyZ1U4iFlVO8/Uyr/nDm1Eazp0YvQjdcqNu6P2NLEotvB+LrqZv4pSJSi1u/8Q6IMrxau/jLgD2ZZw2pUgWsbp890zQw2goSYPJD0HC8yVGlROKvi5fQVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhKvWoHA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736968246; x=1768504246;
  h=date:from:to:cc:subject:message-id;
  bh=ZBMJjwrWP/Vj1jE1UHNxNPypN3E4Ak4+4C8HhINVotg=;
  b=YhKvWoHA2jVkQIG0IkMCX3CdlggRT+X+yfhITuxrUklmTWjH7a6DYPgE
   ByBMcE2sS65fTfattLNhSDA0IA4UDspVvDFDe8wjtuEQZHP/DmVZjz6P7
   y5RSW1yZfuSPxaa8Lvf65qFCdHjAV3cNSOqcKkdxC35kfLzuB9ZrtSfvx
   R4if0Q2JOC8RmRGesanRHQUm3TEUOK1QBKe9fPsZ7/xUT0roVX0dsqwjf
   uPgzzjmWN6EejwforLMhvsewQvNxhNt53tSnpJjkXmdO/03INW10DKu2u
   PpA5HJPsusd08VRPu49f83SikQtAvD84yYfj3pXDrNuf9dzwwMIinizvm
   g==;
X-CSE-ConnectionGUID: 1LY0PQoRQMqVmWSdPZhzog==
X-CSE-MsgGUID: ubvxXAj/Rh2qDA1+HgIC1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37477450"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="37477450"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 11:10:41 -0800
X-CSE-ConnectionGUID: rd2KmkRBSjuq0AXgzqqxGg==
X-CSE-MsgGUID: YmXorbCeQnaywPzX9zYrDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="110205952"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2025 11:10:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tY8mj-000QkB-2D;
	Wed, 15 Jan 2025 19:10:37 +0000
Date: Thu, 16 Jan 2025 03:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 d088502a519fb7834bf6e34cb4e531c1e8113bd1
Message-ID: <202501160343.rNJtZhky-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: d088502a519fb7834bf6e34cb4e531c1e8113bd1  [LOCAL] riscv: renesas: defconfig: Update rzfive_defconfig

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202501150653.OSZGL4LT-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202501150734.lfH7WaHA-lkp@intel.com

    drivers/gpu/drm/bridge/lontium-lt9611.c:1144:12: warning: 'lt9611_audio_init' defined but not used [-Wunused-function]
    drivers/gpu/drm/bridge/lontium-lt9611.c:1147:10: error: no member named 'audio_pdev' in 'struct lt9611'
    drivers/gpu/drm/bridge/lontium-lt9611.c:1147:15: error: 'struct lt9611' has no member named 'audio_pdev'
    drivers/gpu/drm/bridge/lontium-lt9611.c:1155:13: warning: 'lt9611_audio_exit' defined but not used [-Wunused-function]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- arc-allmodconfig
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- arm64-allmodconfig
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:no-member-named-audio_pdev-in-struct-lt9611
|-- arm64-randconfig-001-20250115
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:no-member-named-audio_pdev-in-struct-lt9611
|-- arm64-randconfig-003-20250115
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:no-member-named-audio_pdev-in-struct-lt9611
|-- hexagon-allmodconfig
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:no-member-named-audio_pdev-in-struct-lt9611
|-- hexagon-allyesconfig
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:no-member-named-audio_pdev-in-struct-lt9611
|-- hexagon-randconfig-001-20250115
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:no-member-named-audio_pdev-in-struct-lt9611
|-- i386-allmodconfig
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- i386-buildonly-randconfig-002-20250115
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- openrisc-allyesconfig
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- parisc-allmodconfig
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- parisc-allyesconfig
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:no-member-named-audio_pdev-in-struct-lt9611
|-- powerpc64-randconfig-003-20250115
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:no-member-named-audio_pdev-in-struct-lt9611
|-- riscv-randconfig-002-20250115
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:no-member-named-audio_pdev-in-struct-lt9611
|-- s390-allmodconfig
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:no-member-named-audio_pdev-in-struct-lt9611
|-- s390-randconfig-002-20250115
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:no-member-named-audio_pdev-in-struct-lt9611
|-- sparc-allmodconfig
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- sparc64-randconfig-001-20250115
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- sparc64-randconfig-002-20250115
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
|-- um-allmodconfig
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:no-member-named-audio_pdev-in-struct-lt9611
|-- um-allyesconfig
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:struct-lt9611-has-no-member-named-audio_pdev
|   |-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_exit-defined-but-not-used
|   `-- drivers-gpu-drm-bridge-lontium-lt9611.c:warning:lt9611_audio_init-defined-but-not-used
`-- x86_64-allyesconfig
    `-- drivers-gpu-drm-bridge-lontium-lt9611.c:error:no-member-named-audio_pdev-in-struct-lt9611

elapsed time: 1463m

configs tested: 134
configs skipped: 1

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250115    gcc-13.2.0
arc                   randconfig-002-20250115    gcc-13.2.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                   randconfig-001-20250115    clang-16
arm                   randconfig-002-20250115    clang-20
arm                   randconfig-003-20250115    clang-20
arm                   randconfig-004-20250115    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250115    clang-20
arm64                 randconfig-002-20250115    gcc-14.2.0
arm64                 randconfig-003-20250115    clang-18
arm64                 randconfig-004-20250115    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250115    gcc-14.2.0
csky                  randconfig-002-20250115    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250115    clang-20
hexagon               randconfig-002-20250115    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250115    clang-19
i386        buildonly-randconfig-001-20250116    clang-19
i386        buildonly-randconfig-002-20250115    gcc-12
i386        buildonly-randconfig-002-20250116    clang-19
i386        buildonly-randconfig-003-20250115    gcc-12
i386        buildonly-randconfig-003-20250116    clang-19
i386        buildonly-randconfig-004-20250115    gcc-12
i386        buildonly-randconfig-004-20250116    clang-19
i386        buildonly-randconfig-005-20250115    gcc-12
i386        buildonly-randconfig-005-20250116    clang-19
i386        buildonly-randconfig-006-20250115    gcc-12
i386        buildonly-randconfig-006-20250116    clang-19
i386                                defconfig    clang-19
i386                  randconfig-011-20250116    gcc-12
i386                  randconfig-012-20250116    gcc-12
i386                  randconfig-013-20250116    gcc-12
i386                  randconfig-014-20250116    gcc-12
i386                  randconfig-015-20250116    gcc-12
i386                  randconfig-016-20250116    gcc-12
i386                  randconfig-017-20250116    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250115    gcc-14.2.0
loongarch             randconfig-002-20250115    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       rbtx49xx_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250115    gcc-14.2.0
nios2                 randconfig-002-20250115    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250115    gcc-14.2.0
parisc                randconfig-002-20250115    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250115    gcc-14.2.0
powerpc               randconfig-002-20250115    gcc-14.2.0
powerpc               randconfig-003-20250115    gcc-14.2.0
powerpc64             randconfig-001-20250115    gcc-14.2.0
powerpc64             randconfig-002-20250115    gcc-14.2.0
powerpc64             randconfig-003-20250115    clang-18
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250115    gcc-14.2.0
riscv                 randconfig-002-20250115    clang-16
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250115    clang-20
s390                  randconfig-002-20250115    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250115    gcc-14.2.0
sh                    randconfig-002-20250115    gcc-14.2.0
sh                          rsk7269_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250115    gcc-14.2.0
sparc                 randconfig-002-20250115    gcc-14.2.0
sparc64               randconfig-001-20250115    gcc-14.2.0
sparc64               randconfig-002-20250115    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                    randconfig-001-20250115    clang-18
um                    randconfig-002-20250115    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250115    gcc-12
x86_64      buildonly-randconfig-001-20250116    gcc-12
x86_64      buildonly-randconfig-002-20250115    gcc-12
x86_64      buildonly-randconfig-002-20250116    gcc-12
x86_64      buildonly-randconfig-003-20250115    clang-19
x86_64      buildonly-randconfig-003-20250116    gcc-12
x86_64      buildonly-randconfig-004-20250115    clang-19
x86_64      buildonly-randconfig-004-20250116    gcc-12
x86_64      buildonly-randconfig-005-20250115    gcc-12
x86_64      buildonly-randconfig-005-20250116    gcc-12
x86_64      buildonly-randconfig-006-20250115    clang-19
x86_64      buildonly-randconfig-006-20250116    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250115    gcc-14.2.0
xtensa                randconfig-002-20250115    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

