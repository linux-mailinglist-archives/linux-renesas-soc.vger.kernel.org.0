Return-Path: <linux-renesas-soc+bounces-21883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB5BB58963
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 02:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 684377A5D82
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 00:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544F11A9F86;
	Tue, 16 Sep 2025 00:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dv/Td6BD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9921D63F5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 00:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757982526; cv=none; b=uIRwXRKa4rahoCs3uBNOJxkK6hHLJVZYNIFWb5WUvqNzNXGPtn4KQOSyTWoucIkvem7I23d6Ych3sb5qdSw0LKwjD4hUbTFJ1F9jAKIg4GPPbQ4O3hoBfAQjGH2MQ4JQySr9j8dt63IPvFkY/TpDX2qoCR4HigproSXl2hjJdB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757982526; c=relaxed/simple;
	bh=we78nwC9k8iWxJxctPF8C4yQx/wewY4URuE+tcY1KAQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yl5v8hIrKqMps2rsfzAHcwBegYVJF3ZfQDXYA694+q6QLSISbPKYL0Ssp2L7CFJpocDQI6PlOcCT9yT1O1DD3rxtgIKuHH3sY+BU2a0eYyHcZQ4Ttet9sWdZ57Dx3OZOqAoN4qASe6bFEAATK68uN8uouPWNx5Jj7la4L/pNfk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dv/Td6BD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757982524; x=1789518524;
  h=date:from:to:cc:subject:message-id;
  bh=we78nwC9k8iWxJxctPF8C4yQx/wewY4URuE+tcY1KAQ=;
  b=dv/Td6BD6oNoUd0uE0ZmSDghDkmoBf7Snh3Tj9YDSK37XjnxCYe5cl++
   vS8gehCVfzfcJDg2w3ZzUWlt+a4OJmmdZ6DaTmmCDiQJrpPdiMJzXEAFn
   kMtN+dqMCoQe+d2XfmzOHpPWzU+Z2dRy1ngJDuhxfDfwbjZK9BfatlvIs
   189hO3duf9aPINK0EP713qrMaAEQmNHlKuEHsxhWKYt4tqIwkfH8q5IxV
   Tt1ZtPjE3dPRqNZymusdk8iHX97Hx6DSZXnDzH5MlsAgP/Uw+bemdBvZs
   fQh0mggRZNKk44PXFMBvi5QrrVJriiy4IlbRw7cg92DomXb6nRGZH8y6f
   w==;
X-CSE-ConnectionGUID: wXrMTA18Ta6+z60ob7oayQ==
X-CSE-MsgGUID: SjjCb9FBSje/yDAWTvDHSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60121671"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="60121671"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 17:28:44 -0700
X-CSE-ConnectionGUID: LFTrlQVtS1K+Vcbaeo35bQ==
X-CSE-MsgGUID: E4P+uljLSQ2MYHeBtLhFdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="173915147"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Sep 2025 17:28:43 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyJYm-0000q7-0n;
	Tue, 16 Sep 2025 00:28:40 +0000
Date: Tue, 16 Sep 2025 08:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 35083f5599e6ef1517370efdaefaa2be2074264f
Message-ID: <202509160803.pH0tdeLn-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 35083f5599e6ef1517370efdaefaa2be2074264f  Merge branches 'renesas-arm-defconfig-for-v6.18', 'renesas-arm-soc-for-v6.18', 'renesas-drivers-for-v6.18', 'renesas-dt-bindings-for-v6.18' and 'renesas-dts-for-v6.18' into renesas-next

elapsed time: 889m

configs tested: 134
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250915    gcc-9.5.0
arc                   randconfig-002-20250915    gcc-9.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20250915    gcc-13.4.0
arm                   randconfig-002-20250915    clang-20
arm                   randconfig-003-20250915    gcc-8.5.0
arm                   randconfig-004-20250915    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250915    clang-22
arm64                 randconfig-002-20250915    clang-22
arm64                 randconfig-003-20250915    gcc-8.5.0
arm64                 randconfig-004-20250915    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250915    gcc-15.1.0
csky                  randconfig-002-20250915    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250915    clang-22
hexagon               randconfig-002-20250915    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250915    clang-20
i386        buildonly-randconfig-002-20250915    gcc-14
i386        buildonly-randconfig-003-20250915    gcc-14
i386        buildonly-randconfig-004-20250915    gcc-14
i386        buildonly-randconfig-005-20250915    gcc-14
i386        buildonly-randconfig-006-20250915    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250915    clang-22
loongarch             randconfig-002-20250915    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         rt305x_defconfig    clang-22
mips                           xway_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250915    gcc-11.5.0
nios2                 randconfig-002-20250915    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250915    gcc-9.5.0
parisc                randconfig-002-20250915    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                     kmeter1_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250915    gcc-14.3.0
powerpc               randconfig-002-20250915    gcc-8.5.0
powerpc               randconfig-003-20250915    clang-22
powerpc                     redwood_defconfig    clang-22
powerpc64             randconfig-001-20250915    clang-20
powerpc64             randconfig-002-20250915    clang-22
powerpc64             randconfig-003-20250915    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250915    gcc-8.5.0
riscv                 randconfig-002-20250915    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250915    clang-22
s390                  randconfig-002-20250915    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          landisk_defconfig    gcc-15.1.0
sh                          lboxre2_defconfig    gcc-15.1.0
sh                    randconfig-001-20250915    gcc-15.1.0
sh                    randconfig-002-20250915    gcc-13.4.0
sh                          rsk7203_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250915    gcc-8.5.0
sparc                 randconfig-002-20250915    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250915    gcc-13.4.0
sparc64               randconfig-002-20250915    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250915    gcc-14
um                    randconfig-002-20250915    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250915    clang-20
x86_64      buildonly-randconfig-002-20250915    gcc-12
x86_64      buildonly-randconfig-003-20250915    gcc-14
x86_64      buildonly-randconfig-004-20250915    clang-20
x86_64      buildonly-randconfig-005-20250915    clang-20
x86_64      buildonly-randconfig-006-20250915    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250915    gcc-9.5.0
xtensa                randconfig-002-20250915    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

