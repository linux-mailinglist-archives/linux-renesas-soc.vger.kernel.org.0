Return-Path: <linux-renesas-soc+bounces-18594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A96AE2346
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 22:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87D983B5F97
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 20:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C0222576E;
	Fri, 20 Jun 2025 20:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2oFOu8L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10321FBEA6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jun 2025 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750450271; cv=none; b=U1KGdBv9IvpOTBP2WmQk3d13OV+44ZQmOv0/MTEqF3W/5+otKtrC0JQ/vyv4l5oo8xPd21TpsNU99Wu/ba2h+j2GmM/Mzs79ouvI5/ohx/brMwcGvnmlJo8m97iki9TLr+hLloDFajjag4t8DCzB5dgJV/mowIOnmsOzxw6J9F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750450271; c=relaxed/simple;
	bh=MjfWV1a+8bX4kQiBiSni2V5W9XpcOkXUDj+W4N7OBYM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=byyR9eT0X9GzSY/wJ7YY1SA6vFIb7/4CNi+AIOIWA1zQPvXSTE8Lbifhx5UzOcu6vd8p3T9pZb/v4jgU/n+POGDqQWwvutm5UfDawyFEqcde2EGos4yCF/seShDBpetl62RgvZIdcFPW4ft6KuP6oVDbSupJ6SIyP/Zn/Z2zTMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2oFOu8L; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750450270; x=1781986270;
  h=date:from:to:cc:subject:message-id;
  bh=MjfWV1a+8bX4kQiBiSni2V5W9XpcOkXUDj+W4N7OBYM=;
  b=M2oFOu8LGinFbvWIGJOuBofg7LABXuX25hdVVobo6ImsMqnOkGuZrAle
   2T1ZqzAXCUXhJTy0V1+zbUB2pwdkXOfcXaLKCTOgIe2MndvstmEoOLSSh
   Oew/InvjtnyWbDwnSbsv1fbVr60xkhj4U5nAf/cLyScq7XR8zy2A4t8BE
   8q6W0IhHtvG7eujDHclUJIQAlD5x43VKsmeNeDR6Ctj0rhERP7eav1L00
   59pcoLyssQs2GwJ2JexTO2x3kYrSAp+TjqOZE5/f6mmwMqcGFT0KAmNeq
   tah2Mfwl57EU57AT154+FdxiEizOJ2DsdHtUtGF3jmx5H9gzL2zmawPTn
   Q==;
X-CSE-ConnectionGUID: +zRdNC4ERVqzcUNr/1dMhw==
X-CSE-MsgGUID: 37hbuT3KQY2yQWBt+rkcXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52865474"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="52865474"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 13:11:09 -0700
X-CSE-ConnectionGUID: ZxL2NBk+QYS2YfIs49i2WQ==
X-CSE-MsgGUID: 4IRS+dd9SL2OozSN9GQORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="151212785"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jun 2025 13:11:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSi4n-000M7m-30;
	Fri, 20 Jun 2025 20:11:05 +0000
Date: Sat, 21 Jun 2025 04:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.17] BUILD
 SUCCESS 910aa7765a7a12a5b485547de924fa97a21eb779
Message-ID: <202506210437.UwCwcS9y-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.17
branch HEAD: 910aa7765a7a12a5b485547de924fa97a21eb779  ARM: shmobile: defconfig: Refresh for v6.16-rc2

elapsed time: 1458m

configs tested: 69
configs skipped: 105

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                   randconfig-001-20250620    clang-21
arm                   randconfig-002-20250620    clang-21
arm                   randconfig-003-20250620    clang-21
arm                   randconfig-004-20250620    clang-21
arm                           sama7_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250620    gcc-9.5.0
arm64                 randconfig-002-20250620    gcc-8.5.0
arm64                 randconfig-003-20250620    gcc-11.5.0
arm64                 randconfig-004-20250620    clang-21
csky                              allnoconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250620    clang-20
i386        buildonly-randconfig-002-20250620    clang-20
i386        buildonly-randconfig-003-20250620    clang-20
i386        buildonly-randconfig-004-20250620    clang-20
i386        buildonly-randconfig-005-20250620    clang-20
i386        buildonly-randconfig-006-20250620    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250620    gcc-12
i386                  randconfig-002-20250620    gcc-12
i386                  randconfig-003-20250620    gcc-12
i386                  randconfig-004-20250620    gcc-12
i386                  randconfig-005-20250620    gcc-12
i386                  randconfig-006-20250620    gcc-12
i386                  randconfig-007-20250620    gcc-12
i386                  randconfig-011-20250620    gcc-12
i386                  randconfig-012-20250620    gcc-12
i386                  randconfig-013-20250620    gcc-12
i386                  randconfig-014-20250620    gcc-12
i386                  randconfig-015-20250620    gcc-12
i386                  randconfig-016-20250620    gcc-12
i386                  randconfig-017-20250620    gcc-12
loongarch                         allnoconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
powerpc                       eiger_defconfig    gcc-15.1.0
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                           se7751_defconfig    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20250620    clang-20
x86_64                randconfig-072-20250620    clang-20
x86_64                randconfig-073-20250620    clang-20
x86_64                randconfig-074-20250620    clang-20
x86_64                randconfig-075-20250620    clang-20
x86_64                randconfig-076-20250620    clang-20
x86_64                randconfig-077-20250620    clang-20
x86_64                randconfig-078-20250620    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

