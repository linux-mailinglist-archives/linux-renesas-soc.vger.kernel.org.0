Return-Path: <linux-renesas-soc+bounces-11555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ECD9F6B95
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 17:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96CCA7A1DE5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 16:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D9F1FA179;
	Wed, 18 Dec 2024 16:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k31MePum"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD451F891F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 16:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734540911; cv=none; b=Gz/I4EFsMkHog85JTLCWq2Yr9RvK+T4WPGJhUhk/tAH9kIW+ExtR3Wxh4xhX1CEry7hD9dzMYqh9myqbkG2yWrfLUMHTTUugSKKls/KvJXKaElUmzvrCA6LIZ/vd7bYg0PiPvInL0zSwLQUsy5alRXPFOqJir6K8RncKFCUalg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734540911; c=relaxed/simple;
	bh=q9LLWo5u8GBLyB3qZgKYAVJxOruFx7NDNMVr1Vdislw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e5KmRlc2KPY9Y5a6gjeUlIdcPXuM+sa0L1EDSbxcPhLU9ZWXYwgAkiZyurWulNzFcN1bfl/jXMizTLCl2Kf7T/UArwoNBFEbSigAOTKg5E3Rkbm1ckgTiKZ8knaj2+Dz5CeyHfvs8u6WhlJtRrymNG4ssy15qet5QKuYg8WFSGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k31MePum; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734540909; x=1766076909;
  h=date:from:to:cc:subject:message-id;
  bh=q9LLWo5u8GBLyB3qZgKYAVJxOruFx7NDNMVr1Vdislw=;
  b=k31MePum/3AxuaDr04Ze9YdfnC2juKmr8PCj0Hd+2445pmmhdI2klE9z
   EIowSjryqiD/jyqeKQB2KHGR2QbZ+af9fSJ9dAQ8y1Xr7kNaFIbvc9QMG
   MUT8jN9ijwIH9Nbxg2rygcwnFfqTps8zhuFUvJupFL8b++BwS4VatyiR9
   vn5+BHh+s6owJ04FIyMYGbFM05hC9y8OBXb7mNsvKs2Jd6Nw5LCbkDRwH
   F4HY4FS1eSkQYUkHZE+8z0lDYT5gQUmjBcDXQr07jBBe0FypHDG/dtBdi
   6zMW+t6HN7z2YV9lBiO+IfpN3f3VI9kxNctREGLsUHe6p7+dsySC6bTvv
   w==;
X-CSE-ConnectionGUID: uOhXrPUIQZqDxIVuJ1Niig==
X-CSE-MsgGUID: tflLfj30RqSkyJJpIoGRJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34746844"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="34746844"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 08:55:09 -0800
X-CSE-ConnectionGUID: ZXkOLU+sR7yusynrKqYssQ==
X-CSE-MsgGUID: dUZidDJ7T/OqU4eNyNgOVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="102923115"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Dec 2024 08:55:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNxKD-000GVK-1D;
	Wed, 18 Dec 2024 16:55:05 +0000
Date: Thu, 19 Dec 2024 00:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 15db8535a3d3246fe5ac1a047e5a308ef27074c8
Message-ID: <202412190036.bEz3p7lh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 15db8535a3d3246fe5ac1a047e5a308ef27074c8  [LOCAL] riscv: renesas: defconfig: Update rzfive_defconfig

elapsed time: 1447m

configs tested: 91
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241218    gcc-13.2.0
arc                   randconfig-002-20241218    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241218    clang-20
arm                   randconfig-002-20241218    clang-19
arm                   randconfig-003-20241218    clang-17
arm                   randconfig-004-20241218    clang-19
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241218    clang-20
arm64                 randconfig-002-20241218    clang-20
arm64                 randconfig-003-20241218    gcc-14.2.0
arm64                 randconfig-004-20241218    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241218    gcc-14.2.0
csky                  randconfig-002-20241218    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241218    clang-20
hexagon               randconfig-002-20241218    clang-18
i386        buildonly-randconfig-001-20241218    clang-19
i386        buildonly-randconfig-002-20241218    clang-19
i386        buildonly-randconfig-003-20241218    gcc-12
i386        buildonly-randconfig-004-20241218    gcc-12
i386        buildonly-randconfig-005-20241218    clang-19
i386        buildonly-randconfig-006-20241218    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241218    gcc-14.2.0
loongarch             randconfig-002-20241218    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241218    gcc-14.2.0
nios2                 randconfig-002-20241218    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241218    gcc-14.2.0
parisc                randconfig-002-20241218    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20241218    gcc-14.2.0
powerpc               randconfig-002-20241218    clang-15
powerpc               randconfig-003-20241218    clang-17
powerpc64             randconfig-002-20241218    clang-20
powerpc64             randconfig-003-20241218    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20241218    gcc-14.2.0
riscv                 randconfig-002-20241218    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241218    gcc-14.2.0
s390                  randconfig-002-20241218    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241218    gcc-14.2.0
sh                    randconfig-002-20241218    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241218    gcc-14.2.0
sparc                 randconfig-002-20241218    gcc-14.2.0
sparc64               randconfig-001-20241218    gcc-14.2.0
sparc64               randconfig-002-20241218    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20241218    gcc-12
um                    randconfig-002-20241218    clang-17
x86_64      buildonly-randconfig-001-20241218    clang-19
x86_64      buildonly-randconfig-002-20241218    clang-19
x86_64      buildonly-randconfig-003-20241218    gcc-12
x86_64      buildonly-randconfig-004-20241218    gcc-12
x86_64      buildonly-randconfig-005-20241218    gcc-12
x86_64      buildonly-randconfig-006-20241218    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241218    gcc-14.2.0
xtensa                randconfig-002-20241218    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

