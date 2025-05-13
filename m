Return-Path: <linux-renesas-soc+bounces-17019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F101DAB4818
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 02:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53CA38C06B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 00:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F136367;
	Tue, 13 May 2025 00:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfUryi2b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501FA18D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 May 2025 00:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747094446; cv=none; b=u2N5DwMt7Ne0B3h/4cDMMlpEkzdnAqp2XgXf+CnFcPN768cUtEPOCAf+rEx795sjfoeqpOwdWT3FM087T4cPUhaBloRi+y7MKmSUCSmWVPpmivsOm15XGXE+SpN3v2aPJxIEABx5gl6bb8lvJFpREatyqL9M8PjvnpZRMXnVFwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747094446; c=relaxed/simple;
	bh=+UI7nPvFhF47g0TCkvlVOmdocvz9xdKn9BVS1CsAktU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KFKZPM+dLdU3ZvDcXmLq2uwKV80HVFiF1+Q3GypxEevwQrpEsZcosHIsGvdoCLhN5BNgxKWQ5nnyTwi92xVR/1cGlluGtluRRzNEAlRdzaLrgah7PKVSt9J0EkEkMLdmEMklqGhc+9I7QGXtS7WLs9jnMB1oI6xDpasr+QiQ9tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfUryi2b; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747094444; x=1778630444;
  h=date:from:to:cc:subject:message-id;
  bh=+UI7nPvFhF47g0TCkvlVOmdocvz9xdKn9BVS1CsAktU=;
  b=KfUryi2bvzQAY4rFEC9xuj95Mym5XRgKkJFrMN2BCyG8zXJKTXe+0v0Q
   Fww5tbeIetaWIUUhEJfPUluax0sgDWYZm7cvdcWJK8O0IcL1hAzN5gluU
   WjuIVkiKHZ5V5Q8aGNlXS0W52T6GZAo1pizzJyv4wJkpkYpnK1/YDppm+
   1hwJ6HGxc1neutcKJrhaelra0dlmTzQsWGzqkp2L/vgFsVYlpGbqg02Xg
   5E4fmeLe5+38jrg8AlI5zvCqmlaAr50+yHYe3rYOsPlkBiHaNIP7QLbB5
   Okj4CdzrwOna2uz57FV4fqbecgEh53/ltG55EteGAnaAI7Q9oJN75MKa/
   Q==;
X-CSE-ConnectionGUID: DYmA9w/7T96/kJsQFH1UPg==
X-CSE-MsgGUID: w+gN6bGiSEq4NY1Fld4icw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="74317494"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="74317494"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 17:00:43 -0700
X-CSE-ConnectionGUID: 4NMQh89oRAWd+vIMFY2wdA==
X-CSE-MsgGUID: NS6INBD/QEy7fObtV1IZOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="142474744"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 May 2025 17:00:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEd4W-000FXL-2O;
	Tue, 13 May 2025 00:00:36 +0000
Date: Tue, 13 May 2025 08:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 5b040bc602bc0b10c42124eaf22334a8eff0afce
Message-ID: <202505130803.OpoqO9IP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 5b040bc602bc0b10c42124eaf22334a8eff0afce  Merge branch 'topic/renesas-defconfig', tag 'v6.15-rc6' into renesas-devel

elapsed time: 915m

configs tested: 129
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250512    gcc-14.2.0
arc                   randconfig-002-20250512    gcc-11.5.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-21
arm                          exynos_defconfig    clang-21
arm                         lpc18xx_defconfig    clang-21
arm                   randconfig-001-20250512    gcc-7.5.0
arm                   randconfig-002-20250512    clang-17
arm                   randconfig-003-20250512    gcc-6.5.0
arm                   randconfig-004-20250512    clang-21
arm                         s5pv210_defconfig    gcc-14.2.0
arm                       spear13xx_defconfig    gcc-14.2.0
arm                           tegra_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250512    gcc-7.5.0
arm64                 randconfig-002-20250512    clang-21
arm64                 randconfig-003-20250512    clang-21
arm64                 randconfig-004-20250512    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250512    gcc-9.3.0
csky                  randconfig-002-20250512    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250512    clang-20
hexagon               randconfig-002-20250512    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250512    gcc-11
i386        buildonly-randconfig-002-20250512    clang-20
i386        buildonly-randconfig-003-20250512    clang-20
i386        buildonly-randconfig-004-20250512    gcc-12
i386        buildonly-randconfig-005-20250512    clang-20
i386        buildonly-randconfig-006-20250512    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250512    gcc-13.3.0
loongarch             randconfig-002-20250512    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250512    gcc-7.5.0
nios2                 randconfig-002-20250512    gcc-11.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250512    gcc-12.4.0
parisc                randconfig-002-20250512    gcc-10.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                   currituck_defconfig    clang-21
powerpc               randconfig-001-20250512    gcc-5.5.0
powerpc               randconfig-002-20250512    clang-21
powerpc               randconfig-003-20250512    gcc-7.5.0
powerpc64             randconfig-001-20250512    clang-21
powerpc64             randconfig-002-20250512    gcc-5.5.0
powerpc64             randconfig-003-20250512    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250512    gcc-7.5.0
riscv                 randconfig-002-20250512    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250512    clang-18
s390                  randconfig-002-20250512    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250512    gcc-11.5.0
sh                    randconfig-002-20250512    gcc-9.3.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sh                           se7780_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250512    gcc-10.3.0
sparc                 randconfig-002-20250512    gcc-8.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250512    gcc-6.5.0
sparc64               randconfig-002-20250512    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250512    gcc-12
um                    randconfig-002-20250512    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250512    gcc-12
x86_64      buildonly-randconfig-002-20250512    gcc-12
x86_64      buildonly-randconfig-003-20250512    clang-20
x86_64      buildonly-randconfig-004-20250512    clang-20
x86_64      buildonly-randconfig-005-20250512    clang-20
x86_64      buildonly-randconfig-006-20250512    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250512    gcc-12.4.0
xtensa                randconfig-002-20250512    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

