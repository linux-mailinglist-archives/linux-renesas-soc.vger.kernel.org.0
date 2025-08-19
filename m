Return-Path: <linux-renesas-soc+bounces-20660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 173DAB2B65E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 03:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11314189F8D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 01:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D2B22B8B6;
	Tue, 19 Aug 2025 01:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2+bYOQE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC86820C01C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 01:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755567445; cv=none; b=lz4lQFHXIviNBsUADIEMWqakOqjWi5dIMgq6v0Rt3anFJH5xGAq4grVX3seYX2nocPsptBzzI8OTQYigmcQD9B3bg8BcdgiwnFQJoxjzgZDenDeFSJYINhIR1j7/Fm7ezga9dPJraPRVTaMF81mB/0Krve5dC/jndlzpZBh4XrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755567445; c=relaxed/simple;
	bh=A+7CjFD4gNe919YnleeQCPU4Vj7dsNv4pNpHGIKmA2c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NsCdrPrmJ6dS89rT4l1YcDHFMS1nt53C1kfWf9jQ06eDH/NhI/4evwxTUALWC4BoDCqJ+vWQETlCHwIwhjaB2VRMR27v5yZ1JzrcMNFwhsMoHuzEwlunPY/1DVONKV7LFBEXIy4J7YLDOmhjznC7Y3PtQra/08duxdpaPaN1CSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2+bYOQE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755567442; x=1787103442;
  h=date:from:to:cc:subject:message-id;
  bh=A+7CjFD4gNe919YnleeQCPU4Vj7dsNv4pNpHGIKmA2c=;
  b=R2+bYOQEcUbtBdYN6lC5+a+juFDGYoNsJnGLYNriA+lzxFvp0Hp4cnfJ
   /NvD7QX3yMFiSZ35v2Ab3Lm4r+roOm3lUVwvRkIMHiXvG0IUytfpRqMEG
   GdHMUV4ttpDwVzlslIvSoHBTdvn3uOeIZ/erELsSE6DLuRspS+ibVHsTh
   xt2JIulUp/W+x0VnSh6eNwF55k/w/cxoGOMzHsBv0R4dlEUNRy2kH3u5b
   KhePZN4qZ7I2GJgM8OmqBpkxFU7HX8n7jDl+F+QmeoDCva44OH4eg07SX
   ZqKzhQ2UOrxRvoMyIdfXBL6B+/X3AF0QoVmMYa9g8iiPiXREfi68QzXKQ
   g==;
X-CSE-ConnectionGUID: Hnuv6+Z7Qjmkd1hpgGMvCg==
X-CSE-MsgGUID: RIG7mVE6S3ONBwY45XAXSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68900010"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="68900010"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 18:37:22 -0700
X-CSE-ConnectionGUID: sqRDBH+ZQZO8wbEasZ8nXg==
X-CSE-MsgGUID: 81p+MrFhS9mkO89PMeA/9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="198580602"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Aug 2025 18:37:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoBHr-000GNv-0T;
	Tue, 19 Aug 2025 01:37:19 +0000
Date: Tue, 19 Aug 2025 09:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 505cbde9f811d5d406e8930edbc74e7d37f07b4e
Message-ID: <202508190937.TunbPFRW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 505cbde9f811d5d406e8930edbc74e7d37f07b4e  Merge branches 'renesas-next' and 'topic/renesas-defconfig', tag 'v6.17-rc2' into renesas-devel

elapsed time: 1010m

configs tested: 112
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                     nsimosci_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20250818    gcc-13.4.0
arc                   randconfig-002-20250818    gcc-12.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250818    gcc-12.5.0
arm                   randconfig-002-20250818    clang-22
arm                   randconfig-003-20250818    clang-18
arm                   randconfig-004-20250818    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250818    gcc-11.5.0
arm64                 randconfig-002-20250818    gcc-12.5.0
arm64                 randconfig-003-20250818    gcc-8.5.0
arm64                 randconfig-004-20250818    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250818    gcc-15.1.0
csky                  randconfig-002-20250818    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250818    clang-22
hexagon               randconfig-002-20250818    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250818    clang-20
i386        buildonly-randconfig-002-20250818    clang-20
i386        buildonly-randconfig-003-20250818    gcc-12
i386        buildonly-randconfig-004-20250818    clang-20
i386        buildonly-randconfig-005-20250818    gcc-12
i386        buildonly-randconfig-006-20250818    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250818    gcc-15.1.0
loongarch             randconfig-002-20250818    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250818    gcc-9.5.0
nios2                 randconfig-002-20250818    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250818    gcc-10.5.0
parisc                randconfig-002-20250818    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250818    gcc-8.5.0
powerpc               randconfig-002-20250818    gcc-9.5.0
powerpc               randconfig-003-20250818    clang-22
powerpc64             randconfig-001-20250818    gcc-8.5.0
powerpc64             randconfig-002-20250818    clang-17
powerpc64             randconfig-003-20250818    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250818    gcc-10.5.0
riscv                 randconfig-002-20250818    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250818    clang-22
s390                  randconfig-002-20250818    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250818    gcc-12.5.0
sh                    randconfig-002-20250818    gcc-13.4.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250818    gcc-12.5.0
sparc                 randconfig-002-20250818    gcc-15.1.0
sparc64               randconfig-001-20250818    clang-22
sparc64               randconfig-002-20250818    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250818    gcc-11
um                    randconfig-002-20250818    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250818    gcc-12
x86_64      buildonly-randconfig-002-20250818    gcc-12
x86_64      buildonly-randconfig-003-20250818    gcc-12
x86_64      buildonly-randconfig-004-20250818    gcc-12
x86_64      buildonly-randconfig-005-20250818    gcc-12
x86_64      buildonly-randconfig-006-20250818    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250818    gcc-14.3.0
xtensa                randconfig-002-20250818    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

