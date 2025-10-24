Return-Path: <linux-renesas-soc+bounces-23591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAEDC07C13
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 20:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E32EB4FC466
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 18:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE46348456;
	Fri, 24 Oct 2025 18:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XX6qsPw4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A762F1DF75C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 18:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761330601; cv=none; b=pnmqto+ky52yX/L3aCAmwZVHJVkUHquvwxCS6eImdzy06KILNE8KuXY/i28bOqxoJc4xQ3gDkmvRwbFKdtN79/gb53iDuum0o98Gp0uIsZvgLgKqNKjhfQDwc8BLLLABobdOoFFuJDUmiM91pm9TUigrP/tqua0F/DkHe8KPlhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761330601; c=relaxed/simple;
	bh=QbvIMrRqf4wIic6/x3+FGpUqy+VtBu8QzAy/YW+IyrU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pGGpGLiD/JNRqxyBJCtkyqifZ+R+iEuRd4a0DP+CYABi40+9JDY/1qL8HMpBJXS1oUT/IDsNh22ab+ktdyQJIIFnt9o5epyNfIHVvtDFNG+XwGgwoJdc/5KfAsSqEZWOAt6eI2Ky4MHFGhecXWQs3E6D+37qQAwO65udf+d6JAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XX6qsPw4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761330600; x=1792866600;
  h=date:from:to:cc:subject:message-id;
  bh=QbvIMrRqf4wIic6/x3+FGpUqy+VtBu8QzAy/YW+IyrU=;
  b=XX6qsPw4IJZ5JUAeoVoawD0kqqXFdhBCK68d15H6uDBept+SMBZ5YWX+
   wds/IL8TUJdZe4H48NwPMERCMhWDFJs43kAmmKAKJ7jhQDXbQy2eHz5RA
   gzUI3LtYYEoue0yCcTeP+4Wy4eCBIURkN+gENhkqx+kVqV+gDkhUwMso6
   30opZytZW4mXrAGLDYoxMBea/UefMRvBjbPXmCoPVi8fzHwYmxmYz2kAk
   UP7fCwyhp9DWxF8dLZwKQfb2zXFBcYDHEGn+bRVJxHAovmM+sDtMrsamd
   Y3X0HTj32KPs/tUfwxIqlJBy9+/0Guzph1wRUoujOCQfoKfW7B0wYsqXy
   Q==;
X-CSE-ConnectionGUID: r2oNFf04TDOJ4lXmQT5RLA==
X-CSE-MsgGUID: wLc7kDcVTVC4MWqbWrj6kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86147002"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="86147002"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 11:30:00 -0700
X-CSE-ConnectionGUID: 2uDTkA6TQvmZ3jrIH8Q+9g==
X-CSE-MsgGUID: 3EIAglAyRpGS4qdz1XwEmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="188790371"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Oct 2025 11:29:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCMXz-000En2-2q;
	Fri, 24 Oct 2025 18:29:55 +0000
Date: Sat, 25 Oct 2025 02:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 9f97f5e0be2c51770873e7481fa86ac3eb15d89e
Message-ID: <202510250249.PRPPSSjd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 9f97f5e0be2c51770873e7481fa86ac3eb15d89e  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1451m

configs tested: 111
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251024    gcc-8.5.0
arc                   randconfig-002-20251024    gcc-14.3.0
arm                               allnoconfig    clang-22
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20251024    clang-20
arm                   randconfig-002-20251024    gcc-15.1.0
arm                   randconfig-003-20251024    clang-22
arm                   randconfig-004-20251024    clang-22
arm                          sp7021_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251024    gcc-8.5.0
arm64                 randconfig-002-20251024    clang-16
arm64                 randconfig-003-20251024    gcc-13.4.0
arm64                 randconfig-004-20251024    clang-17
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251024    gcc-14.3.0
csky                  randconfig-002-20251024    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251024    clang-22
hexagon               randconfig-002-20251024    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251024    clang-20
i386        buildonly-randconfig-002-20251024    gcc-14
i386        buildonly-randconfig-003-20251024    clang-20
i386        buildonly-randconfig-004-20251024    gcc-14
i386        buildonly-randconfig-005-20251024    gcc-14
i386        buildonly-randconfig-006-20251024    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251024    gcc-15.1.0
loongarch             randconfig-002-20251024    gcc-15.1.0
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
nios2                 randconfig-001-20251024    gcc-11.5.0
nios2                 randconfig-002-20251024    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251024    gcc-9.5.0
parisc                randconfig-002-20251024    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251024    gcc-8.5.0
powerpc               randconfig-002-20251024    clang-17
powerpc               randconfig-003-20251024    clang-16
powerpc                     tqm5200_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251024    gcc-12.5.0
powerpc64             randconfig-002-20251024    gcc-14.3.0
powerpc64             randconfig-003-20251024    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251024    clang-22
riscv                 randconfig-002-20251024    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251024    gcc-13.4.0
s390                  randconfig-002-20251024    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20251024    gcc-12.5.0
sh                    randconfig-002-20251024    gcc-14.3.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251024    gcc-12.5.0
sparc                 randconfig-002-20251024    gcc-8.5.0
sparc64               randconfig-001-20251024    clang-20
sparc64               randconfig-002-20251024    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251024    gcc-14
um                    randconfig-002-20251024    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251024    clang-20
x86_64      buildonly-randconfig-002-20251024    clang-20
x86_64      buildonly-randconfig-003-20251024    clang-20
x86_64      buildonly-randconfig-004-20251024    gcc-14
x86_64      buildonly-randconfig-005-20251024    gcc-14
x86_64      buildonly-randconfig-006-20251024    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    gcc-15.1.0
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251024    gcc-11.5.0
xtensa                randconfig-002-20251024    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

