Return-Path: <linux-renesas-soc+bounces-9308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3391298D103
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 12:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5D001F22A5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 10:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E495197A6B;
	Wed,  2 Oct 2024 10:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frqfXnyE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE4F1642B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Oct 2024 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727864295; cv=none; b=geFGCyWfZQgm2bIkEf+IBTPioVafpcalIp4W1Qyka0SU4MpaPjlLqpmxvHt/1e3pyeg+aBNWbeyldn21K4a58GgMKhQBr761JwXSpiqNIwOSEi8ZxvjLHv5BVEn1yK0qIuOOVgjfrpnQcwglaOveQW6S3G92TmOY2BsdtUtOYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727864295; c=relaxed/simple;
	bh=18TuqNnN1YXlYpdtJ0ylfH9+1I3oV8tBLZdhEqyxGIs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LLDtIARhzK3xYRlXAuObVIq0kEdP1IPdbuiUz/tZc1mdor5y8J7fGNJb2u/B10l2zziCtyhdbEpfwT7F49uTutdZgluJaxVJFvRCvdy6tisiYIuY1jlJPQCRqlP4Y1S3Hvsb7SoNU/f51WFbetLTflvdlFCtE76xhc6Alv3lX2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frqfXnyE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727864293; x=1759400293;
  h=date:from:to:cc:subject:message-id;
  bh=18TuqNnN1YXlYpdtJ0ylfH9+1I3oV8tBLZdhEqyxGIs=;
  b=frqfXnyEXo2zfuniphthBtbo5lCncmTcFIKk+kmEggh0veRrnH4Yj6jT
   JJPoct2Xkm7bL2RrzJ6ium+UrkWQ0LO2gZLtH+8Qvc/S4wOvyVWhtQwFs
   mqz013abGMf3sZYFzRN3PHiUx5kmYsv4KolXXGthzPjt0uN2YnqI0U5cr
   M6k02cez04rymZzhuctIoDgomOuoDWYxWWV1vwHlSIz0EyC9uhiBc06dA
   vOBhMQHv5VEUAYoV8+VphrqhPplZtsVXSXBZE6uei6bZ7m2aoZJ0dAzGy
   WbmH3TAsoRxykff03fznkz6uxwTtMzk5rwzLGpvL8EAlYPcFLmh9raDmx
   w==;
X-CSE-ConnectionGUID: Ep43hA/3TVWDTWiR+4aydg==
X-CSE-MsgGUID: rgj4B/0AQRGQR7iiYnZjNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="37614074"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="37614074"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 03:18:12 -0700
X-CSE-ConnectionGUID: FI9X5Z6PRFSXR/PQtp4fog==
X-CSE-MsgGUID: qeHQPI/UQeuDTvXTOY6YQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="78922311"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Oct 2024 03:18:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svwQr-000Rut-0O;
	Wed, 02 Oct 2024 10:18:09 +0000
Date: Wed, 02 Oct 2024 18:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 29cb4974a79bd8e380f2044811698aa2f4fc4e6d
Message-ID: <202410021842.MhDnOS0a-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 29cb4974a79bd8e380f2044811698aa2f4fc4e6d  clk: renesas: Remove duplicate and trailing empty lines

elapsed time: 1123m

configs tested: 124
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          moxart_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241002    clang-18
i386        buildonly-randconfig-002-20241002    clang-18
i386        buildonly-randconfig-003-20241002    gcc-12
i386        buildonly-randconfig-004-20241002    gcc-12
i386        buildonly-randconfig-005-20241002    gcc-12
i386        buildonly-randconfig-006-20241002    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241002    gcc-12
i386                  randconfig-002-20241002    gcc-12
i386                  randconfig-003-20241002    clang-18
i386                  randconfig-004-20241002    clang-18
i386                  randconfig-005-20241002    clang-18
i386                  randconfig-006-20241002    gcc-12
i386                  randconfig-011-20241002    clang-18
i386                  randconfig-012-20241002    clang-18
i386                  randconfig-013-20241002    gcc-12
i386                  randconfig-014-20241002    clang-18
i386                  randconfig-015-20241002    clang-18
i386                  randconfig-016-20241002    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                           sun3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm47xx_defconfig    gcc-14.1.0
mips                          malta_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                      bamboo_defconfig    gcc-14.1.0
powerpc                    mvme5100_defconfig    gcc-14.1.0
powerpc                      pcm030_defconfig    gcc-14.1.0
powerpc                      ppc6xx_defconfig    gcc-14.1.0
powerpc                     sequoia_defconfig    gcc-14.1.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                       zfcpdump_defconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                           se7343_defconfig    gcc-14.1.0
sh                           se7780_defconfig    gcc-14.1.0
sh                             sh03_defconfig    gcc-14.1.0
sh                     sh7710voipgw_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

