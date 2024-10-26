Return-Path: <linux-renesas-soc+bounces-10170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBCF9B14E2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2024 06:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68EF01C20E57
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2024 04:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E25F15C139;
	Sat, 26 Oct 2024 04:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ae1gaCCs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBED42CA8
	for <linux-renesas-soc@vger.kernel.org>; Sat, 26 Oct 2024 04:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729917890; cv=none; b=Ei06z+P2EST/i1Aln54KBn11f2xgSVv/abrMEWlWxX4RH5vaPZnFm3XGICRWV5QzdDIKzG0ANVP8heSmMb/bYAl5PZcHdE1ITwIF4TazpdNJkbeqdLVL/UYZcDNtp6g+t5Icxr2B++c992YQga/o8gR6zao6F/uWPa3roB0I0Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729917890; c=relaxed/simple;
	bh=T8XEWeO17P3CKcwXOiXP577GDRQc507KbqJv4A+OYzs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qtLOaGzoGrodfOaGZpsXA4XszQGgG7XVEmp5mxgnMuimMHykflSNhTloNV9WR8fMHQhaFzPqUqJJmJbqq3GNjaBKDoGo9mGHX4tdreQ4VYzQq/BY8M+xRicjR9sb7tJMOGl+PlHHABbgemb2IRl+WHfSJlqrnmlH5lAZJtNtnGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ae1gaCCs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729917887; x=1761453887;
  h=date:from:to:cc:subject:message-id;
  bh=T8XEWeO17P3CKcwXOiXP577GDRQc507KbqJv4A+OYzs=;
  b=Ae1gaCCsj4iy8ybrl7nMUozoxJFu+ve90grZ+jknxJOXWqd/bJVlHTtX
   grhc+ftjz+V6HhTlVlGuLcB97FaRwARrUZ4cUKiR+BVZfYxe5TO0SP0WA
   2tEc4vE2VBKynNOa/EI/vrBebSRepsDU7dtQ2e5euCI++4WVhmXslg710
   mry8rIGjY9tNE2fLO6ILkRV3B73rtOZ7JK89AxtuSxERT8eGB6x/gui2P
   1dC1nSSp1uASOAxnooAqoT8zBm2pGpme5fMj+Jlnx+2fzeqplRZWdhb4R
   Ez3bUw8xdlUAkhdPy9am3suF0rdQks6k74zULjrKfVcFS7x+QdJLAefJm
   g==;
X-CSE-ConnectionGUID: kN4EzRKATmObUCotDI19Tw==
X-CSE-MsgGUID: xPMKwDPBQ0SpSgpJfVYvAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40138667"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40138667"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 21:44:47 -0700
X-CSE-ConnectionGUID: c/vjGzXOT4CBHua69QG3nQ==
X-CSE-MsgGUID: 59cf+QBHT+estngkyfM/sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="85714851"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Oct 2024 21:44:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4YfM-000ZHk-0t;
	Sat, 26 Oct 2024 04:44:44 +0000
Date: Sat, 26 Oct 2024 12:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 d682897e743407a59f056bb20d4bb38a9fd8710f
Message-ID: <202410261211.LOOZ4bHp-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: d682897e743407a59f056bb20d4bb38a9fd8710f  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1101m

configs tested: 131
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                     allnoconfig    gcc-14.1.0
alpha                    allyesconfig    clang-20
arc                      allmodconfig    clang-20
arc                       allnoconfig    gcc-14.1.0
arc                      allyesconfig    clang-20
arc              axs103_smp_defconfig    clang-20
arc         nsimosci_hs_smp_defconfig    clang-20
arc           randconfig-001-20241026    gcc-14.1.0
arc           randconfig-002-20241026    gcc-14.1.0
arm                      allmodconfig    clang-20
arm                       allnoconfig    gcc-14.1.0
arm                      allyesconfig    clang-20
arm                     mxs_defconfig    clang-20
arm           randconfig-001-20241026    gcc-14.1.0
arm           randconfig-002-20241026    gcc-14.1.0
arm           randconfig-003-20241026    gcc-14.1.0
arm           randconfig-004-20241026    gcc-14.1.0
arm               versatile_defconfig    clang-20
arm                 vf610m4_defconfig    clang-20
arm64                    allmodconfig    clang-20
arm64                     allnoconfig    gcc-14.1.0
arm64         randconfig-001-20241026    gcc-14.1.0
arm64         randconfig-002-20241026    gcc-14.1.0
arm64         randconfig-003-20241026    gcc-14.1.0
arm64         randconfig-004-20241026    gcc-14.1.0
csky                      allnoconfig    gcc-14.1.0
csky          randconfig-001-20241026    gcc-14.1.0
csky          randconfig-002-20241026    gcc-14.1.0
hexagon                  allmodconfig    clang-20
hexagon                   allnoconfig    gcc-14.1.0
hexagon                  allyesconfig    clang-20
hexagon       randconfig-001-20241026    gcc-14.1.0
hexagon       randconfig-002-20241026    gcc-14.1.0
i386                     allmodconfig    clang-19
i386                     allmodconfig    gcc-12
i386                      allnoconfig    clang-19
i386                      allnoconfig    gcc-12
i386                     allyesconfig    clang-19
i386                     allyesconfig    gcc-12
i386                        defconfig    clang-19
loongarch                allmodconfig    gcc-14.1.0
loongarch                 allnoconfig    gcc-14.1.0
loongarch     randconfig-001-20241026    gcc-14.1.0
loongarch     randconfig-002-20241026    gcc-14.1.0
m68k                     allmodconfig    gcc-14.1.0
m68k                      allnoconfig    gcc-14.1.0
m68k                     allyesconfig    gcc-14.1.0
m68k                  multi_defconfig    clang-20
microblaze               allmodconfig    gcc-14.1.0
microblaze                allnoconfig    gcc-14.1.0
microblaze               allyesconfig    gcc-14.1.0
mips                      allnoconfig    gcc-14.1.0
mips                   ci20_defconfig    clang-20
mips                   ip30_defconfig    clang-20
mips                qi_lb60_defconfig    clang-20
nios2                     allnoconfig    gcc-14.1.0
nios2         randconfig-001-20241026    gcc-14.1.0
nios2         randconfig-002-20241026    gcc-14.1.0
openrisc                  allnoconfig    clang-20
openrisc                  allnoconfig    gcc-14.1.0
openrisc                 allyesconfig    gcc-14.1.0
openrisc                    defconfig    gcc-12
openrisc         simple_smp_defconfig    clang-20
parisc                   allmodconfig    gcc-14.1.0
parisc                    allnoconfig    clang-20
parisc                    allnoconfig    gcc-14.1.0
parisc                   allyesconfig    gcc-14.1.0
parisc                      defconfig    gcc-12
parisc        randconfig-001-20241026    gcc-14.1.0
parisc        randconfig-002-20241026    gcc-14.1.0
powerpc                  allmodconfig    gcc-14.1.0
powerpc                   allnoconfig    clang-20
powerpc                   allnoconfig    gcc-14.1.0
powerpc                  allyesconfig    gcc-14.1.0
powerpc              katmai_defconfig    clang-20
powerpc       randconfig-001-20241026    gcc-14.1.0
powerpc       randconfig-002-20241026    gcc-14.1.0
powerpc       randconfig-003-20241026    gcc-14.1.0
powerpc64     randconfig-001-20241026    gcc-14.1.0
powerpc64     randconfig-002-20241026    gcc-14.1.0
powerpc64     randconfig-003-20241026    gcc-14.1.0
riscv                    allmodconfig    gcc-14.1.0
riscv                     allnoconfig    clang-20
riscv                     allnoconfig    gcc-14.1.0
riscv                    allyesconfig    gcc-14.1.0
riscv                       defconfig    gcc-12
riscv         randconfig-001-20241026    gcc-14.1.0
riscv         randconfig-002-20241026    gcc-14.1.0
s390                     allmodconfig    gcc-14.1.0
s390                      allnoconfig    clang-20
s390                     allyesconfig    gcc-14.1.0
s390                  debug_defconfig    clang-20
s390                        defconfig    gcc-12
s390          randconfig-001-20241026    gcc-14.1.0
s390          randconfig-002-20241026    gcc-14.1.0
sh                       allmodconfig    gcc-14.1.0
sh                        allnoconfig    gcc-14.1.0
sh                       allyesconfig    gcc-14.1.0
sh                          defconfig    gcc-12
sh                       j2_defconfig    clang-20
sh            randconfig-001-20241026    gcc-14.1.0
sh            randconfig-002-20241026    gcc-14.1.0
sparc                    allmodconfig    gcc-14.1.0
sparc64                     defconfig    gcc-12
sparc64       randconfig-001-20241026    gcc-14.1.0
sparc64       randconfig-002-20241026    gcc-14.1.0
um                       allmodconfig    clang-20
um                        allnoconfig    clang-17
um                        allnoconfig    clang-20
um                       allyesconfig    clang-20
um                          defconfig    gcc-12
um                     i386_defconfig    clang-20
um                     i386_defconfig    gcc-12
um            randconfig-001-20241026    gcc-14.1.0
um            randconfig-002-20241026    gcc-14.1.0
um                   x86_64_defconfig    gcc-12
x86_64                    allnoconfig    clang-19
x86_64                   allyesconfig    clang-19
x86_64                      defconfig    clang-19
x86_64                      defconfig    gcc-11
x86_64                          kexec    clang-19
x86_64                          kexec    gcc-12
x86_64                       rhel-8.3    gcc-12
x86_64                   rhel-8.3-bpf    clang-19
x86_64                 rhel-8.3-kunit    clang-19
x86_64                   rhel-8.3-ltp    clang-19
x86_64                  rhel-8.3-rust    clang-19
xtensa                    allnoconfig    gcc-14.1.0
xtensa        randconfig-001-20241026    gcc-14.1.0
xtensa        randconfig-002-20241026    gcc-14.1.0
xtensa                 virt_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

