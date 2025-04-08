Return-Path: <linux-renesas-soc+bounces-15551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7C8A80086
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 13:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBE533BE359
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 11:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4F9268FF0;
	Tue,  8 Apr 2025 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRKEQgea"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E2268FD2
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Apr 2025 11:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744111489; cv=none; b=p8JuVM6dqQFXxREu9JJUIFwRUkfnf7qB3ZQ/gUdhCTJzmi3VV8VJRjxWCbnuEEMC3hgufY6RZaN/RvGG8EakzrJXsKgA9tRbv6yYrNiwb6Zg0rmOWxfJ7Z1LxlU0Pm6vP6z01b28cemJ+UdLo8dIiCbx7NCo2wWKS+Zx9FwmnTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744111489; c=relaxed/simple;
	bh=PE3TcFOND5CYbpX2jnR41312JSwyvdUoqfmiCfFHXgk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jwYtPjQFVm0/eomx5crOfZaOFmejYlX5WxydnaUU8tJsNZ3ykltmm0QxHAbCUTfZyoucxstBAabs+SIfftpzicJZMAF1Cezpk1r/gXHaprGCgw4l8NmcxG7nWrEmShwDpvqlmOqtYFcN9YHlzk0GKLU+RDi+VMzcJKHSQY3k2vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRKEQgea; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744111488; x=1775647488;
  h=date:from:to:cc:subject:message-id;
  bh=PE3TcFOND5CYbpX2jnR41312JSwyvdUoqfmiCfFHXgk=;
  b=DRKEQgeaKUlpDwxxfhFiPePUEIrY3uYOlvzcGATxxt19FMZ+AkKHYJC2
   +brfK+PeH3DZjezyKEG+wxIxXkevsKQQ0E1yrvBPLpg8vsxjs06XyFmDF
   lERcsbxfUd/dVILLu1Ab6av+wHivpvyU4p4UqcEidrmF3Y8x6xQ8dlEsE
   HwmukbtxsewLJmIZC7fuQKPzUknNDoLLQMiXskscNLJq13z4eefREoCyG
   /naxVHJoyHRD+LLWyc9+oCUKN+NV0Om6P2EuwKuVjX4aANTVYyGtgMu/h
   pjiJ+Msy8AZZj/iy8DBIl2qvwUgLIWWrX+7CbEMxrLZ/ymhOGVgE4kNyC
   w==;
X-CSE-ConnectionGUID: AmcvJ9l6QMC7hoJeidpM4g==
X-CSE-MsgGUID: W/fjzihYRDqCFNMUOvI5tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="68011183"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="68011183"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:24:47 -0700
X-CSE-ConnectionGUID: kKly+9YrQSOHEGGUZuPFeg==
X-CSE-MsgGUID: u9k2AgBAQVyecQoRumyB0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128135897"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Apr 2025 04:24:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u274N-0004yQ-2O;
	Tue, 08 Apr 2025 11:24:43 +0000
Date: Tue, 08 Apr 2025 19:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 c7809387a532c50b23c7993ba55e22b613566fe4
Message-ID: <202504081918.yDVaYDuH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: c7809387a532c50b23c7993ba55e22b613566fe4  Merge branch 'topic/renesas-defconfig' into renesas-devel

elapsed time: 1471m

configs tested: 118
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250407    gcc-12.4.0
arc                   randconfig-002-20250407    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250407    gcc-8.5.0
arm                   randconfig-002-20250407    clang-21
arm                   randconfig-003-20250407    gcc-8.5.0
arm                   randconfig-004-20250407    gcc-8.5.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250407    clang-21
arm64                 randconfig-002-20250407    gcc-6.5.0
arm64                 randconfig-003-20250407    gcc-8.5.0
arm64                 randconfig-004-20250407    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250407    gcc-14.2.0
csky                  randconfig-002-20250407    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250407    clang-21
hexagon               randconfig-002-20250407    clang-15
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250407    gcc-12
i386        buildonly-randconfig-002-20250407    gcc-12
i386        buildonly-randconfig-003-20250407    gcc-12
i386        buildonly-randconfig-004-20250407    clang-20
i386        buildonly-randconfig-005-20250407    gcc-12
i386        buildonly-randconfig-006-20250407    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250407    gcc-14.2.0
loongarch             randconfig-002-20250407    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                        mvme147_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
mips                           mtx1_defconfig    clang-21
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250407    gcc-6.5.0
nios2                 randconfig-002-20250407    gcc-8.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250407    gcc-7.5.0
parisc                randconfig-002-20250407    gcc-7.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250407    clang-21
powerpc               randconfig-002-20250407    clang-21
powerpc               randconfig-003-20250407    gcc-6.5.0
powerpc64             randconfig-001-20250407    clang-21
powerpc64             randconfig-002-20250407    clang-17
powerpc64             randconfig-003-20250407    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250407    gcc-8.5.0
riscv                 randconfig-002-20250407    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250407    gcc-9.3.0
s390                  randconfig-002-20250407    clang-15
s390                       zfcpdump_defconfig    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250407    gcc-12.4.0
sh                    randconfig-002-20250407    gcc-10.5.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250407    gcc-13.3.0
sparc                 randconfig-002-20250407    gcc-10.3.0
sparc64               randconfig-001-20250407    gcc-7.5.0
sparc64               randconfig-002-20250407    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250407    clang-18
um                    randconfig-002-20250407    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250407    gcc-11
x86_64      buildonly-randconfig-002-20250407    clang-20
x86_64      buildonly-randconfig-003-20250407    clang-20
x86_64      buildonly-randconfig-004-20250407    clang-20
x86_64      buildonly-randconfig-005-20250407    clang-20
x86_64      buildonly-randconfig-006-20250407    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250407    gcc-9.3.0
xtensa                randconfig-002-20250407    gcc-7.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

