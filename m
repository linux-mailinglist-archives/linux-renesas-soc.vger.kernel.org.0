Return-Path: <linux-renesas-soc+bounces-25230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF160C8CE37
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 07:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8E3A44E1E4E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 06:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B003259CBB;
	Thu, 27 Nov 2025 06:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oz/F+bsx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDFA24501B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 06:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764223310; cv=none; b=PMH29TSjetQBmiOn2kVqjzPfDAdltlF1DTzOT0+REJUVJK/0AbRtwpuBHyhZg8R1cp26BxBub4HfSfZ1aD030pr03/5KXQa3xmkUX1LL/RYl+uEzt5GHQoHcDAkpmlZ9T47LG6DCq7FpTfJfC3AX57/F8qXfHzDAwN8B5wG9CTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764223310; c=relaxed/simple;
	bh=ynv3jfdNMsk9b3drfVyeMH6h3PBY4jPs6tGk3uobnLI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QsAqNonwP94/QEHKUaXAaEGXHJ3ZUn0VZAgNYkh0JPtR6rkNHqF19utHjJ65Oh/91KkXt5beISLzm2YahlOiHoncYQ6E4R3E0xBZ1QImzWA3YIwF8bhlzF+VtlTwxabt6MjtH4u8yveT8q8O+KdEPQXQNkXsN7Ud6yeX0TToizY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oz/F+bsx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764223308; x=1795759308;
  h=date:from:to:cc:subject:message-id;
  bh=ynv3jfdNMsk9b3drfVyeMH6h3PBY4jPs6tGk3uobnLI=;
  b=Oz/F+bsxutWN7P9FlhfNEAvruQA+Nw8BJ8aG22V9DWX7gM7ZsVH/RWdc
   qGHkm3GZly+2/j1wv7M8Kz6B6KgleK1GZC+fpS8P260hzy9wvFZ0D8Cls
   qzE6YPD+QSvlHWkUMHy4ak33/gbXmJu5LxQZI5A1IevrQeAHdnN5/TwNZ
   HrZ6qYnn30UTmlmFcvG+SSS2ooML7vDlw3pA14GSe/TSyuwLBs7SOLu1c
   QQ5BvQiX4R3+1BdZAE5tkgCh/sv1g36P6M1Htq9oiB9syjQa+xIEZxBmN
   yqWMj42Cnk1h49uUKBZBfjGHP0U2xeHkXB/kvlrDuJZ+SbvsltiWpf8Vy
   g==;
X-CSE-ConnectionGUID: +Jcvg+7XTfWsHl8jUVfjuQ==
X-CSE-MsgGUID: pWTRLkrdQWmhx/7CkvgkkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83655733"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="83655733"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 22:01:48 -0800
X-CSE-ConnectionGUID: Im/EB/PGRDCT2tvOL8YDVQ==
X-CSE-MsgGUID: wkBiQeQ/TqWBMibrHj+/wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="198252772"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Nov 2025 22:01:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOV4a-000000003mJ-44Gq;
	Thu, 27 Nov 2025 06:01:44 +0000
Date: Thu, 27 Nov 2025 14:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.20] BUILD SUCCESS
 14559e819d7f01d61e34735c429e449f69a8d439
Message-ID: <202511271459.UKEiE2nv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.20
branch HEAD: 14559e819d7f01d61e34735c429e449f69a8d439  clk: renesas: r9a09g077: Propagate rate changes through mux parents

elapsed time: 2277m

configs tested: 100
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251126    gcc-13.4.0
arc                   randconfig-002-20251126    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-16
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20251126    clang-22
arm                   randconfig-002-20251126    clang-22
arm                   randconfig-003-20251126    clang-19
arm                   randconfig-004-20251126    clang-22
arm                       versatile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-16
arm64                             allnoconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251126    clang-20
i386        buildonly-randconfig-001-20251127    clang-20
i386        buildonly-randconfig-002-20251126    gcc-14
i386        buildonly-randconfig-002-20251127    clang-20
i386        buildonly-randconfig-003-20251126    clang-20
i386        buildonly-randconfig-003-20251127    clang-20
i386        buildonly-randconfig-004-20251126    clang-20
i386        buildonly-randconfig-004-20251127    clang-20
i386        buildonly-randconfig-005-20251126    clang-20
i386        buildonly-randconfig-005-20251127    clang-20
i386        buildonly-randconfig-006-20251126    gcc-14
i386        buildonly-randconfig-006-20251127    clang-20
i386                  randconfig-001-20251126    clang-20
i386                  randconfig-002-20251126    clang-20
i386                  randconfig-003-20251126    gcc-14
i386                  randconfig-004-20251126    clang-20
i386                  randconfig-005-20251126    gcc-14
i386                  randconfig-006-20251126    gcc-14
i386                  randconfig-007-20251126    clang-20
i386                  randconfig-011-20251127    clang-20
i386                  randconfig-012-20251127    clang-20
i386                  randconfig-013-20251127    clang-20
i386                  randconfig-014-20251127    clang-20
i386                  randconfig-015-20251127    clang-20
i386                  randconfig-016-20251127    clang-20
i386                  randconfig-017-20251127    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251126    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20251126    gcc-11.5.0
nios2                 randconfig-002-20251126    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251126    gcc-8.5.0
parisc                randconfig-002-20251126    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251126    gcc-10.5.0
powerpc               randconfig-002-20251126    gcc-8.5.0
powerpc64             randconfig-001-20251126    clang-19
powerpc64             randconfig-002-20251126    clang-22
riscv                            allmodconfig    clang-16
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251126    gcc-10.5.0
riscv                 randconfig-002-20251126    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251126    gcc-8.5.0
s390                  randconfig-002-20251126    gcc-8.5.0
sh                                allnoconfig    gcc-15.1.0
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                          r7780mp_defconfig    gcc-15.1.0
sh                    randconfig-001-20251126    gcc-14.3.0
sh                    randconfig-002-20251126    gcc-11.5.0
sh                          rsk7201_defconfig    gcc-15.1.0
sh                           se7750_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251126    gcc-8.5.0
sparc                 randconfig-002-20251126    gcc-14.3.0
sparc64               randconfig-001-20251126    gcc-8.5.0
sparc64               randconfig-002-20251126    clang-22
um                                allnoconfig    clang-22
um                    randconfig-001-20251126    clang-19
um                    randconfig-002-20251126    clang-22
x86_64                            allnoconfig    clang-20
x86_64                randconfig-001-20251127    gcc-14
x86_64                randconfig-002-20251127    gcc-14
x86_64                randconfig-003-20251127    gcc-14
x86_64                randconfig-004-20251127    gcc-14
x86_64                randconfig-005-20251127    gcc-14
x86_64                randconfig-006-20251127    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251126    gcc-14.3.0
xtensa                randconfig-002-20251126    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

