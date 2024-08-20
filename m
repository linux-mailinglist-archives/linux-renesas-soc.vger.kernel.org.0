Return-Path: <linux-renesas-soc+bounces-7960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0972958F87
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 23:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4408A1F235A8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 21:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9EF1BD023;
	Tue, 20 Aug 2024 21:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrFQp+3G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDD71C6890
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 21:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724188437; cv=none; b=pS5rDmpfehbLsBdrL1ZKuVUbnpFC5BGI1JWNCzFT4YKCSaIuxVU2KMC0Djme+wfUGQPz8F8Qtg3KAsdoH2WLmiX9r7o6Uje8rl7vs1vYPLbecTsTZZvqDwAiZvzUbEMxoLY7KI6h2LEHPdBCqhp3O7+xURV+Lb5pWCZIQOMmO5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724188437; c=relaxed/simple;
	bh=Cns+jQcagQi9rnbB0sClpZBsP8jLTlJUPqnVekc5MHw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IJAmrKsUfy5WPNFParWAY4YKHbcYJFCTjm6muRQx0XfM1a86zSurHmB80tyrwvHGxmFzANDiyAzwyJHYO/yRLbP5OOFfVgfkhRs9EQQbeTiQQfLlBvfxvpf+K+kdLXB5TpFsl/W97tEXtUr80LP7WTURNmrLFOXjVPQGrLIKg40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FrFQp+3G; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724188436; x=1755724436;
  h=date:from:to:cc:subject:message-id;
  bh=Cns+jQcagQi9rnbB0sClpZBsP8jLTlJUPqnVekc5MHw=;
  b=FrFQp+3GTQhUrVLnZU50U2qMuWXqtU68Vcu/2W4Ze9EZJdqQgbvnEtRJ
   qrSmOWnigw9XHFeXT8Y5aK0cHIq5WjS4wU4jTBWdHV4dY720BwqSA/B6m
   u4wNUJ9Z9yQGpgtmmNriAtOg9g0RaTblLcBhUC65qlyYWriTgO1uccpg/
   /BKyknYoaYnIzpcuwn8zsEH+4tR/PXV6VdV8VyUDQ/ElGCvgZqaeEbSrc
   7Bq+wZEnl6UebK2OC0qT14hnWGO4JxzJUzYk8Ref7+wyKm/RnlQriABCx
   DVQ/S5A6g60C2MIGFYgoY15dHpLN95EHUnvlourbeMOyQu4V7Ct3o2PFV
   A==;
X-CSE-ConnectionGUID: DucwqXmQSxqfEuzyXYo+zw==
X-CSE-MsgGUID: Mo09LUVtSwuNou5GGE9OUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33934292"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="33934292"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 14:13:55 -0700
X-CSE-ConnectionGUID: zPfjFKevQ02T0Tch+X1zpQ==
X-CSE-MsgGUID: 2RkmMDQUSgeRmtjrKU/kpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="60501736"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Aug 2024 14:13:54 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgWAq-000Aco-0Z;
	Tue, 20 Aug 2024 21:13:52 +0000
Date: Wed, 21 Aug 2024 05:13:00 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.12] BUILD SUCCESS
 ab7d885a33a7ef328a97ccae0d1340b68c3db9ad
Message-ID: <202408210558.KV0iMaNx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.12
branch HEAD: ab7d885a33a7ef328a97ccae0d1340b68c3db9ad  arm64: dts: renesas: gray-hawk-single: Add CAN-FD support

elapsed time: 728m

configs tested: 113
configs skipped: 158

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                            hsdk_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         assabet_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                           sama5_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240820   clang-20
arm64                 randconfig-002-20240820   clang-20
arm64                 randconfig-003-20240820   gcc-14.1.0
arm64                 randconfig-004-20240820   clang-20
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240820   clang-18
i386         buildonly-randconfig-002-20240820   clang-18
i386         buildonly-randconfig-003-20240820   clang-18
i386         buildonly-randconfig-004-20240820   clang-18
i386         buildonly-randconfig-005-20240820   clang-18
i386         buildonly-randconfig-006-20240820   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240820   clang-18
i386                  randconfig-002-20240820   clang-18
i386                  randconfig-003-20240820   clang-18
i386                  randconfig-004-20240820   clang-18
i386                  randconfig-005-20240820   clang-18
i386                  randconfig-006-20240820   clang-18
i386                  randconfig-011-20240820   clang-18
i386                  randconfig-012-20240820   clang-18
i386                  randconfig-013-20240820   clang-18
i386                  randconfig-014-20240820   clang-18
i386                  randconfig-015-20240820   clang-18
i386                  randconfig-016-20240820   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5208evb_defconfig   gcc-13.2.0
m68k                        m5272c3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                      bmips_stb_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                 canyonlands_defconfig   gcc-13.2.0
powerpc                     ep8248e_defconfig   gcc-13.2.0
powerpc                       maple_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   gcc-13.2.0
powerpc                 mpc832x_rdb_defconfig   gcc-13.2.0
powerpc                      ppc64e_defconfig   gcc-13.2.0
powerpc                      ppc6xx_defconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-14.1.0
s390                              allnoconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                 kfr2r09-romimage_defconfig   gcc-13.2.0
sh                           se7619_defconfig   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240820   clang-18
x86_64       buildonly-randconfig-002-20240820   clang-18
x86_64       buildonly-randconfig-003-20240820   clang-18
x86_64       buildonly-randconfig-004-20240820   clang-18
x86_64       buildonly-randconfig-005-20240820   clang-18
x86_64       buildonly-randconfig-006-20240820   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240820   clang-18
x86_64                randconfig-002-20240820   clang-18
x86_64                randconfig-003-20240820   clang-18
x86_64                randconfig-004-20240820   clang-18
x86_64                randconfig-005-20240820   clang-18
x86_64                randconfig-006-20240820   clang-18
x86_64                randconfig-011-20240820   clang-18
x86_64                randconfig-012-20240820   clang-18
x86_64                randconfig-013-20240820   clang-18
x86_64                randconfig-014-20240820   clang-18
x86_64                randconfig-015-20240820   clang-18
x86_64                randconfig-016-20240820   clang-18
x86_64                randconfig-071-20240820   clang-18
x86_64                randconfig-072-20240820   clang-18
x86_64                randconfig-073-20240820   clang-18
x86_64                randconfig-074-20240820   clang-18
x86_64                randconfig-075-20240820   clang-18
x86_64                randconfig-076-20240820   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

