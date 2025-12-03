Return-Path: <linux-renesas-soc+bounces-25538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA383C9FF5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 17:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98D3330026AC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 16:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7A134A78B;
	Wed,  3 Dec 2025 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktHYlpkD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418BE34A3BC
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Dec 2025 16:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764778459; cv=none; b=FMd+MBrpvVVRHD3QJkr8mukGXB3gv8ujtsLXugFJi9ESiYaEHWXKU+SATLtMakcWBkyf8J68yo2nJn/zT3jze7E1xtk+NtgHN/WUdC7NKUh6rTrpsok0ViRNh0vxcYD303PIexjFkmEO1/R/jSzFpuk6w7GwFBcAL+4NRzW9fhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764778459; c=relaxed/simple;
	bh=J1LgHskLbX0UhfPvY4uvXSf343o3iM+y4EiJ3D7ubIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VYXiG4fKqs0ZRqp6L9VbdKQd0sbh2/g8z1E961uNueJF2uQR5Yj6DVhjTcsdiRcsHoGDkww88Vy8mZ3+cOEPxwSlv26RPQUeVz6phhLuyEAFjBgPNcDMEJynP0dSnMkHaX/auvje3II12jsdU1UhnKwNId1kMHqwrIUI+LFRvFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktHYlpkD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764778457; x=1796314457;
  h=date:from:to:cc:subject:message-id;
  bh=J1LgHskLbX0UhfPvY4uvXSf343o3iM+y4EiJ3D7ubIA=;
  b=ktHYlpkDizNMxHmwVFzd11JmdLFZ8m7NxbrJDI6cOeyGd+mOVYa4Dx9C
   3SzSE26QgV/6/ZbRTBscbaWPxuJ1GVBNa77+o5uLPi/arwCf3YD8ugpch
   RvEP1CTKJBVBDdy29bTdCxcll3Z623GsqMB2Uk+juYMphV1oK9TPtX6lj
   y8sKSJ2SMO9LLw2+ZdEScrlyziLf/oOmCZ3T3y5wYUEbFV6qePtKlcslz
   ntnQHYZOmmWD8bQCib/Aa19RESnV8EkJcGSqudUNOs5eNEzTCOwJxWV4a
   EdQPTnLWFxKkXZv2onckgfCL2gnp12QPosrLw77OirSAXDJRRwu5dCGwC
   A==;
X-CSE-ConnectionGUID: FWijFT87RXuyYTQmbRy6yQ==
X-CSE-MsgGUID: FiSXPRkjSZG1uc2bykhO3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66499000"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="66499000"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 08:14:16 -0800
X-CSE-ConnectionGUID: wjbapgn8R3e6clb1bNRQug==
X-CSE-MsgGUID: f+mfcj0rSA+3OrH6y13ZBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="193811745"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Dec 2025 08:14:15 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQpUb-00000000Blx-0due;
	Wed, 03 Dec 2025 16:14:13 +0000
Date: Thu, 04 Dec 2025 00:13:40 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 997d056cf6640ed0a7e540650b94ae0c48d06b5b
Message-ID: <202512040032.WVJ3jxJj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 997d056cf6640ed0a7e540650b94ae0c48d06b5b  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202512031131.3SHPwR3x-lkp@intel.com

    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2666:18: error: no member named 'discovery_bin' in 'struct amdgpu_mman'
    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2668:18: error: no member named 'discovery_bin' in 'struct amdgpu_mman'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- i386-randconfig-013-20251203
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:error:no-member-named-discovery_bin-in-struct-amdgpu_mman
|-- i386-randconfig-016-20251203
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:error:no-member-named-discovery_bin-in-struct-amdgpu_mman
|-- powerpc64-randconfig-002-20251203
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:error:no-member-named-discovery_bin-in-struct-amdgpu_mman
|-- s390-randconfig-001-20251203
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:error:no-member-named-discovery_bin-in-struct-amdgpu_mman
|-- sparc64-randconfig-001-20251203
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:error:no-member-named-discovery_bin-in-struct-amdgpu_mman
|-- sparc64-randconfig-002-20251203
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:error:no-member-named-discovery_bin-in-struct-amdgpu_mman
|-- x86_64-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:error:no-member-named-discovery_bin-in-struct-amdgpu_mman
|-- x86_64-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:error:no-member-named-discovery_bin-in-struct-amdgpu_mman
`-- x86_64-randconfig-075-20251203
    `-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:error:no-member-named-discovery_bin-in-struct-amdgpu_mman

elapsed time: 1455m

configs tested: 123
configs skipped: 2

tested configs:
alpha                               defconfig    gcc-15.1.0
arc                      axs103_smp_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251203    gcc-9.5.0
arc                   randconfig-002-20251203    gcc-11.5.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20251203    gcc-8.5.0
arm                   randconfig-002-20251203    clang-22
arm                   randconfig-003-20251203    clang-22
arm                   randconfig-004-20251203    clang-22
arm                           tegra_defconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251203    gcc-8.5.0
arm64                 randconfig-002-20251203    clang-17
arm64                 randconfig-003-20251203    gcc-8.5.0
arm64                 randconfig-004-20251203    gcc-8.5.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251203    gcc-15.1.0
csky                  randconfig-002-20251203    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251203    clang-22
hexagon               randconfig-002-20251203    clang-20
i386                             allmodconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251203    gcc-14
i386        buildonly-randconfig-002-20251203    gcc-14
i386        buildonly-randconfig-003-20251203    gcc-14
i386        buildonly-randconfig-004-20251203    clang-20
i386        buildonly-randconfig-005-20251203    clang-20
i386        buildonly-randconfig-006-20251203    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251203    clang-20
i386                  randconfig-002-20251203    gcc-14
i386                  randconfig-003-20251203    clang-20
i386                  randconfig-004-20251203    clang-20
i386                  randconfig-005-20251203    gcc-14
i386                  randconfig-006-20251203    gcc-14
i386                  randconfig-007-20251203    gcc-14
i386                  randconfig-011-20251203    clang-20
i386                  randconfig-012-20251203    gcc-14
i386                  randconfig-013-20251203    clang-20
i386                  randconfig-014-20251203    gcc-14
i386                  randconfig-015-20251203    gcc-13
i386                  randconfig-016-20251203    clang-20
i386                  randconfig-017-20251203    clang-20
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251203    gcc-15.1.0
loongarch             randconfig-002-20251203    gcc-14.3.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-22
mips                      maltaaprp_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251203    gcc-9.5.0
nios2                 randconfig-002-20251203    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251203    gcc-12.5.0
parisc                randconfig-002-20251203    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          g5_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251203    gcc-8.5.0
powerpc               randconfig-002-20251203    clang-22
powerpc64             randconfig-002-20251203    clang-22
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251203    gcc-14.3.0
riscv                 randconfig-002-20251203    clang-22
s390                             allmodconfig    clang-18
s390                                defconfig    clang-22
s390                  randconfig-001-20251203    clang-22
s390                  randconfig-002-20251203    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251203    gcc-15.1.0
sh                    randconfig-002-20251203    gcc-13.4.0
sh                          rsk7203_defconfig    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251203    gcc-13.4.0
sparc                 randconfig-002-20251203    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251203    clang-20
sparc64               randconfig-002-20251203    clang-20
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251203    gcc-14
um                    randconfig-002-20251203    clang-20
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251203    clang-20
x86_64      buildonly-randconfig-002-20251203    clang-20
x86_64      buildonly-randconfig-003-20251203    clang-20
x86_64      buildonly-randconfig-004-20251203    gcc-14
x86_64      buildonly-randconfig-005-20251203    clang-20
x86_64      buildonly-randconfig-006-20251203    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251203    gcc-14
x86_64                randconfig-002-20251203    gcc-14
x86_64                randconfig-003-20251203    clang-20
x86_64                randconfig-004-20251203    clang-20
x86_64                randconfig-005-20251203    gcc-14
x86_64                randconfig-006-20251203    gcc-14
x86_64                randconfig-011-20251203    gcc-14
x86_64                randconfig-012-20251203    clang-20
x86_64                randconfig-013-20251203    gcc-14
x86_64                randconfig-014-20251203    clang-20
x86_64                randconfig-015-20251203    gcc-14
x86_64                randconfig-016-20251203    clang-20
x86_64                randconfig-071-20251203    clang-20
x86_64                randconfig-072-20251203    gcc-14
x86_64                randconfig-073-20251203    clang-20
x86_64                randconfig-074-20251203    gcc-14
x86_64                randconfig-075-20251203    clang-20
x86_64                randconfig-076-20251203    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                randconfig-001-20251203    gcc-14.3.0
xtensa                randconfig-002-20251203    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

