Return-Path: <linux-renesas-soc+bounces-26384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3851D005E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 00:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2638E300C5EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 23:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E4D296BB6;
	Wed,  7 Jan 2026 23:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4tHnfRy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C1013B293
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 23:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767827425; cv=none; b=Pw4sWqYiwEzPHz8155L9h6g6M1xLs0KjLfP2WbYxHp7woqKvtHsYj4RHf4hBig1JoXCeCyg6RsdwRx5h69yHlpiAvJGCxjiAFYJO13yVh0xQU1LYFIcwtCjXWGeTxYb8Ni6BvO53Euy4ojPW9QRSCzt4SI+MM4mG0WHgJ44QXlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767827425; c=relaxed/simple;
	bh=UScmI6ttkK/MiCkY3f7udVbTKkr8CR+N8o6GL5R0J5A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JavFQJKO0Gqo7iWYLKjYTTIEREd8uznhKUianuvH3uZXrJEWQX027+8W/K/guxlz80YOlunhKqViMXECdMyVtgHwYM0xQ96VUYPh3aqFarm7is57ckCgHXp3jeJEU/SVQLmTqV0f4IzSv/EBDOI0TFasUQgeBePfxWoII53vwbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4tHnfRy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767827424; x=1799363424;
  h=date:from:to:cc:subject:message-id;
  bh=UScmI6ttkK/MiCkY3f7udVbTKkr8CR+N8o6GL5R0J5A=;
  b=I4tHnfRyh3K37CZy10ZFAMKD/EhFVFynVNNOPHD6Q+SjaK650I2qtj2V
   yBY4VET66o5/sQIOQWTj920SOTgCYddjVUzHmhrLXSKov0u6DsVd6sRuc
   lAF6usFZGo31lIG6WaFU1HbP9VcdXLruBRV1/Fsi66FnH+PnaNCDofuHr
   l0qfotgdlTvIx0/iiZMArKryHkoETdYOWX6lTYeu0eMISeqyBM4k3PeuZ
   kH6rJzn5P9MW43Aa7MQmQBO5kBokdFVvcUg3hhxaOoZeLH2ap1ZiBLUBm
   9e2qabErel1d492ZbpOg2F1K1dWCu6Ypeo9xecb8FvQbxFgPdYmLvZnTr
   Q==;
X-CSE-ConnectionGUID: KJ3N+YK5SDCvJ24UwsY6Tg==
X-CSE-MsgGUID: 5w04XZLCRfO8Qs5U13zcjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69364742"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="69364742"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 15:10:23 -0800
X-CSE-ConnectionGUID: KXmfcZ78SVeS9tC6ai0S4A==
X-CSE-MsgGUID: Ce2PnPtkR/qBYfP7STrTsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="207527428"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jan 2026 15:10:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdcfS-000000004Ej-1srb;
	Wed, 07 Jan 2026 23:10:18 +0000
Date: Thu, 08 Jan 2026 07:09:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 469eafbe3b5472954dc9a2081b533c8093afd82b
Message-ID: <202601080711.JWjFMaQF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 469eafbe3b5472954dc9a2081b533c8093afd82b  Merge branches 'renesas-arm-defconfig-for-v6.20', 'renesas-drivers-for-v6.20' and 'renesas-dts-for-v6.20' into renesas-next

elapsed time: 2172m

configs tested: 128
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20260108    gcc-9.5.0
arc                   randconfig-002-20260108    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                          pxa168_defconfig    clang-22
arm                   randconfig-001-20260108    gcc-9.5.0
arm                   randconfig-002-20260108    gcc-9.5.0
arm                   randconfig-003-20260108    gcc-9.5.0
arm                   randconfig-004-20260108    gcc-9.5.0
arm64                            alldefconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20260108    gcc-10.5.0
arm64                 randconfig-002-20260108    gcc-10.5.0
arm64                 randconfig-003-20260108    gcc-10.5.0
arm64                 randconfig-004-20260108    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20260108    gcc-10.5.0
csky                  randconfig-002-20260108    gcc-10.5.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20260108    clang-20
i386        buildonly-randconfig-002-20260108    clang-20
i386        buildonly-randconfig-003-20260108    clang-20
i386        buildonly-randconfig-004-20260108    clang-20
i386        buildonly-randconfig-005-20260108    clang-20
i386        buildonly-randconfig-006-20260108    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-011-20260108    gcc-14
i386                  randconfig-012-20260108    gcc-14
i386                  randconfig-013-20260108    gcc-14
i386                  randconfig-014-20260108    gcc-14
i386                  randconfig-015-20260108    gcc-14
i386                  randconfig-016-20260108    gcc-14
i386                  randconfig-017-20260108    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        m5407c3_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260108    clang-22
parisc                randconfig-002-20260108    clang-22
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      pmac32_defconfig    clang-22
powerpc               randconfig-001-20260108    clang-22
powerpc               randconfig-002-20260108    clang-22
powerpc64             randconfig-001-20260108    clang-22
powerpc64             randconfig-002-20260108    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                ecovec24-romimage_defconfig    clang-22
sh                            shmin_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260108    gcc-8.5.0
sparc                 randconfig-002-20260108    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260108    gcc-8.5.0
sparc64               randconfig-002-20260108    gcc-8.5.0
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260108    gcc-8.5.0
um                    randconfig-002-20260108    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260108    gcc-14
x86_64      buildonly-randconfig-002-20260108    gcc-14
x86_64      buildonly-randconfig-003-20260108    gcc-14
x86_64      buildonly-randconfig-004-20260108    gcc-14
x86_64      buildonly-randconfig-005-20260108    gcc-14
x86_64      buildonly-randconfig-006-20260108    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260108    gcc-12
x86_64                randconfig-002-20260108    gcc-12
x86_64                randconfig-003-20260108    gcc-12
x86_64                randconfig-004-20260108    gcc-12
x86_64                randconfig-005-20260108    gcc-12
x86_64                randconfig-006-20260108    gcc-12
x86_64                randconfig-071-20260108    gcc-14
x86_64                randconfig-072-20260108    gcc-14
x86_64                randconfig-073-20260108    gcc-14
x86_64                randconfig-074-20260108    gcc-14
x86_64                randconfig-075-20260108    gcc-14
x86_64                randconfig-076-20260108    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20260108    gcc-8.5.0
xtensa                randconfig-002-20260108    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

