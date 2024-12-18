Return-Path: <linux-renesas-soc+bounces-11527-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4FD9F623E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 10:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F28871883CD5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 09:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13553158D6A;
	Wed, 18 Dec 2024 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irneMP2q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B053194A7C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734515916; cv=none; b=Bf4PI7401GMlH9X54tvKtCVDI/fwxda15MdWFAX1pF8hK+eSyZHyrFbGWi/3rHTuROX65HODm2l3JvaARLNeeCe2xHiBjWU57SQ5dHzi3SViCBgq9R42vmwvfqMSylie04vqNa/vtM3nIBWetu9U3MbREzZtkTUDBySSD10xeKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734515916; c=relaxed/simple;
	bh=4ftIfBQ+AMW7P2WqCg02IFCYDOaL7n2W17o8L2GfNls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OQdiugi+vnwhYxpTq+US9Tq7fxRntUy7hE5IxuTuTxKvK62jyo+6lmzdk3eexecjg/qdi7ynW5hhgn5LwDpYUE575PjbiWX45EUsJmOcc9BU4gMIYbxMftpbXrEutGoBbppvkFkgKR56ZP8KgcM66/CBi5umMs4ELetj8xoLLEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irneMP2q; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734515915; x=1766051915;
  h=date:from:to:cc:subject:message-id;
  bh=4ftIfBQ+AMW7P2WqCg02IFCYDOaL7n2W17o8L2GfNls=;
  b=irneMP2qSkWUGhcf6Np/zrcTat9fwtv0Qkc7hA5lvYy3A/QTeIWufUXg
   q2G3m2a3eYg503tJuSl7KvwayGUMnMhEYTTf2EmuhQY3WTMWKf9iZSvRj
   DBrEDwIzRjrVqPWeR6TX/y3vCJo1IPGMtx3VeOtkwnjpNQEHHVW7a7q4O
   dRJoxpVmUXu2eHxeBA/iJBJ/3rlLn6NnFwk+sXxGgz/cO5jRjAxIqj/8F
   lkPkTqyOarak9AjcYOvWxy2h0O5L9LF+4vfAyRuWo5+9gpWzPd2s42uDh
   M/r6n9GutJDAh1vipCDONqLyhzHkOEvdjQlJlUaysLHPVkxObsgDRQ+ca
   w==;
X-CSE-ConnectionGUID: vqjX3d7IQHSluULjN62xcQ==
X-CSE-MsgGUID: oejdH9n3QA6rO2GL4U7WbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35111537"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="35111537"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 01:58:34 -0800
X-CSE-ConnectionGUID: 77iUDfAWRT6S41H66YPpSg==
X-CSE-MsgGUID: NbunWu7kQSq26+XS3R5qkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="102650007"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Dec 2024 01:58:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNqp4-000GGc-0q;
	Wed, 18 Dec 2024 09:58:30 +0000
Date: Wed, 18 Dec 2024 17:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.14] BUILD SUCCESS
 acb247afab5bc2b4462f4dfc17a9d930e1153e52
Message-ID: <202412181728.dhcd4Sjq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.14
branch HEAD: acb247afab5bc2b4462f4dfc17a9d930e1153e52  arm64: dts: renesas: r9a09g047: Add I2C nodes

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /soc/i2c@10090400/clock-generator@68: failed to match any schema with compatible: ['renesas,5l35023']
    arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: ssi@100a8c00: Unevaluated properties are not allowed ('compatible' was unexpected)

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20241217
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
|   `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|-- arm64-randconfig-051-20241218
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
|   `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|-- arm64-randconfig-052-20241218
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
|   `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|-- arm64-randconfig-053-20241218
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
|   `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|-- arm64-randconfig-054-20241218
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
|   `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
`-- arm64-randconfig-055-20241218
    |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
    `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)

elapsed time: 1449m

configs tested: 118
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                        nsim_700_defconfig    gcc-13.2.0
arc                   randconfig-001-20241217    gcc-13.2.0
arc                   randconfig-002-20241217    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                        keystone_defconfig    gcc-14.2.0
arm                             mxs_defconfig    clang-20
arm                   randconfig-001-20241217    clang-16
arm                   randconfig-002-20241217    gcc-14.2.0
arm                   randconfig-003-20241217    gcc-14.2.0
arm                   randconfig-004-20241217    gcc-14.2.0
arm                        realview_defconfig    clang-19
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241217    clang-20
arm64                 randconfig-002-20241217    clang-16
arm64                 randconfig-003-20241217    clang-18
arm64                 randconfig-004-20241217    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241217    gcc-14.2.0
csky                  randconfig-002-20241217    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241217    clang-20
hexagon               randconfig-002-20241217    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241217    clang-19
i386        buildonly-randconfig-002-20241217    gcc-12
i386        buildonly-randconfig-003-20241217    gcc-12
i386        buildonly-randconfig-004-20241217    clang-19
i386        buildonly-randconfig-005-20241217    clang-19
i386        buildonly-randconfig-006-20241217    gcc-11
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241217    gcc-14.2.0
loongarch             randconfig-002-20241217    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241217    gcc-14.2.0
nios2                 randconfig-002-20241217    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241217    gcc-14.2.0
parisc                randconfig-002-20241217    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20241217    clang-20
powerpc               randconfig-002-20241217    gcc-14.2.0
powerpc               randconfig-003-20241217    clang-16
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20241217    gcc-14.2.0
powerpc64             randconfig-002-20241217    gcc-14.2.0
powerpc64             randconfig-003-20241217    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241217    gcc-14.2.0
riscv                 randconfig-002-20241217    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241217    gcc-14.2.0
s390                  randconfig-002-20241217    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20241217    gcc-14.2.0
sh                    randconfig-002-20241217    gcc-14.2.0
sh                           se7206_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241217    gcc-14.2.0
sparc                 randconfig-002-20241217    gcc-14.2.0
sparc64               randconfig-001-20241217    gcc-14.2.0
sparc64               randconfig-002-20241217    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20241217    clang-20
um                    randconfig-002-20241217    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241217    clang-19
x86_64      buildonly-randconfig-002-20241217    gcc-12
x86_64      buildonly-randconfig-003-20241217    gcc-12
x86_64      buildonly-randconfig-004-20241217    clang-19
x86_64      buildonly-randconfig-005-20241217    gcc-12
x86_64      buildonly-randconfig-006-20241217    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241217    gcc-14.2.0
xtensa                randconfig-002-20241217    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

