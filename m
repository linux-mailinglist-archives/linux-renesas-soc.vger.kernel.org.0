Return-Path: <linux-renesas-soc+bounces-11842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F054A01364
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jan 2025 09:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D97507A1D1C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jan 2025 08:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0321386C9;
	Sat,  4 Jan 2025 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOv5857b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAC3433B3
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jan 2025 08:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735980563; cv=none; b=oKXPgXPNwDmU8418smxD2IOEMimK0G+rDrUM9KAzlVaZZT4CPJM6rDQGcSORmH0KtvEmkKW2KuyVUbmIyojJeOrCnw04tMP0pe2ab+aqtT4JN7TbLi0RV3LbTTkbezW8WSJ9FIodm3F4YfwMP9w87+KvvfSWy4blttiDSx1nnfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735980563; c=relaxed/simple;
	bh=kTG075RFLBndMjcr5IAZHkXH+VX2fryt4cTD+4nA9Y8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XM5k7eNJWRhH/J8lzNj9mFsSPWcTjXQqU5Xib76rlTWnsa++kBkc3hjUV6bylGBzJYg/2cqCm/5Gh0EnAvSCQ9PKmki62bZshg2MoEDqOm5ddnRcaAGKTK2OQxljYUBE7mq+pl1PI/TGY+q2YvFQ0zcfJqZ5+iy8mcyZcqAPcEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOv5857b; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735980562; x=1767516562;
  h=date:from:to:cc:subject:message-id;
  bh=kTG075RFLBndMjcr5IAZHkXH+VX2fryt4cTD+4nA9Y8=;
  b=SOv5857bSdrvTZ/WYvJnPB5EVfxI0c6GxGN7GzD1hCUmlFAIK0S37KDt
   juRfKC1Fr0NUNiwtMREMgrT+CB7aaJ9Pbv4JzfHfHMKuDTZ735qEYLKEY
   1kMGYJkmm6z/GHmVMV24xIsl/YOVz4dB3aLU5XJSSh5bF69693v778R1y
   5qs/aH09DlByegKClNHrRmiSq27s01cLFBLOtTX+XJtIfFMGgsj8nE4lQ
   0SR+D+3PLlUor4lSow1yMsEG3fjSfndC4tekh7IDY4PVEaHmPPKpbpoIS
   lzj++gd5cUYuLo68s8RDVQFgULEWLVjKDFZOs4TbRGu+ucffwz5ixu3yY
   Q==;
X-CSE-ConnectionGUID: jWgGmrylSEeCMzNg72dorg==
X-CSE-MsgGUID: /h89nwE+TGul8UpJY61CuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="39031700"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="39031700"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 00:49:20 -0800
X-CSE-ConnectionGUID: OFiJ8p8ORsWHoYF37icbdw==
X-CSE-MsgGUID: B3kBgB3iTtCDDgtWPLtePQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106020657"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jan 2025 00:49:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTzqP-000AmP-0Q;
	Sat, 04 Jan 2025 08:49:17 +0000
Date: Sat, 04 Jan 2025 16:49:01 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v6.14] BUILD
 SUCCESS 829356da700bbe07e13b4403997bf8c5aac64660
Message-ID: <202501041648.vlf0jvDD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v6.14
branch HEAD: 829356da700bbe07e13b4403997bf8c5aac64660  pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC

elapsed time: 729m

configs tested: 92
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250104    gcc-13.2.0
arc                   randconfig-002-20250104    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250104    clang-20
arm                   randconfig-002-20250104    clang-20
arm                   randconfig-003-20250104    gcc-14.2.0
arm                   randconfig-004-20250104    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250104    clang-20
arm64                 randconfig-002-20250104    clang-16
arm64                 randconfig-003-20250104    gcc-14.2.0
arm64                 randconfig-004-20250104    gcc-14.2.0
csky                  randconfig-001-20250104    gcc-14.2.0
csky                  randconfig-002-20250104    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250104    clang-20
hexagon               randconfig-002-20250104    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250104    clang-19
i386        buildonly-randconfig-002-20250104    gcc-12
i386        buildonly-randconfig-003-20250104    clang-19
i386        buildonly-randconfig-004-20250104    gcc-12
i386        buildonly-randconfig-005-20250104    clang-19
i386        buildonly-randconfig-006-20250104    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250104    gcc-14.2.0
loongarch             randconfig-002-20250104    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
nios2                 randconfig-001-20250104    gcc-14.2.0
nios2                 randconfig-002-20250104    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250104    gcc-14.2.0
parisc                randconfig-002-20250104    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250104    clang-20
powerpc               randconfig-002-20250104    clang-18
powerpc               randconfig-003-20250104    gcc-14.2.0
powerpc64             randconfig-001-20250104    gcc-14.2.0
powerpc64             randconfig-002-20250104    gcc-14.2.0
powerpc64             randconfig-003-20250104    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250104    gcc-14.2.0
riscv                 randconfig-002-20250104    clang-16
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250104    clang-20
s390                  randconfig-002-20250104    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250104    gcc-14.2.0
sh                    randconfig-002-20250104    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250104    gcc-14.2.0
sparc                 randconfig-002-20250104    gcc-14.2.0
sparc64               randconfig-001-20250104    gcc-14.2.0
sparc64               randconfig-002-20250104    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250104    gcc-12
um                    randconfig-002-20250104    gcc-11
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250104    gcc-12
x86_64      buildonly-randconfig-002-20250104    clang-19
x86_64      buildonly-randconfig-003-20250104    gcc-12
x86_64      buildonly-randconfig-004-20250104    gcc-12
x86_64      buildonly-randconfig-005-20250104    clang-19
x86_64      buildonly-randconfig-006-20250104    gcc-12
x86_64                              defconfig    gcc-11
xtensa                randconfig-001-20250104    gcc-14.2.0
xtensa                randconfig-002-20250104    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

