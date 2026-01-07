Return-Path: <linux-renesas-soc+bounces-26349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E7FCFDE91
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 14:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 507693040672
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 13:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C501B320A20;
	Wed,  7 Jan 2026 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtvfK3Lq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CC631985D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791750; cv=none; b=Dh1uFL5bdWym+g2Nyhhik2IZ3x/sLvTRqc+gXIS3Isc6n79tU0YWacGju86VqakfNY1dk8D+gsPsQ3/31xVZgTUZWMpP6CqQU4yIpK573gxOGvlrlkF6gP7b0QtX/ubOyD43K+wm+dUzhOnK8NUP/wjr/savB0PpEUjSVfHMMwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791750; c=relaxed/simple;
	bh=ZH5c7KEtTVdOvn2Jx4zlryX1HlaS8tsIaA33hFphBQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bB6N9YXmFukjCEkV77jHTEDB5yfpJn9uZx9fKsYM2/ME8U10E1OVyQ9AMQVExwNgl4Svjxek5Z2uWHUyvc6Y26nAi+ol+p4DJaw0CqAaHjxItK7aIPV0m08M/6O99BqWVZMCMC+ulwHynUW8ypzn5fBCfs8k0HcB2BkXGZCfiIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtvfK3Lq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767791749; x=1799327749;
  h=date:from:to:cc:subject:message-id;
  bh=ZH5c7KEtTVdOvn2Jx4zlryX1HlaS8tsIaA33hFphBQQ=;
  b=MtvfK3LqtnA++nJ/6NsZhyAdOj8UTenTEXML29GO9+RBIR30jlQKvcsl
   JG5fC59FgzKUDjSRo7HhsFN1lO73z4lWJDt8PNQ4FF7FvMQqYs3/2kPTu
   VhoSxz7lkMja0EuzPIUj3tBpZttjEWHIy5kF7nwnv5fa5uJpC4lNF6t1y
   DNjDlXLuds7aQuRluAyMqhgDvjgYa7OrieK84WQ4LO+drN1x0sQraZHb2
   gSHRG8Dlx8TV6srGPdIK7FSc1WpSnywsi6mYDmc7LUbtvH9B8kMrK2+tc
   HKPEDy3PqtJqhnFpT5B1HHpi+ZvMT84SC4gXe1YFQhFWgfBTNJBB/KaUK
   w==;
X-CSE-ConnectionGUID: 9jNe+1eTQZ6zSsg29ay8jw==
X-CSE-MsgGUID: xSIDFzc9TVqhz84OPSqj8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69318930"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="69318930"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 05:15:47 -0800
X-CSE-ConnectionGUID: FeBoSrLgTui6LEAkldSyqA==
X-CSE-MsgGUID: +YGY16hBQUCmcj4p0+pnQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="202980812"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Jan 2026 05:15:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdTO3-000000003p5-3JOk;
	Wed, 07 Jan 2026 13:15:43 +0000
Date: Wed, 07 Jan 2026 21:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 7e792d0c61346438612a18842e2672b097ad594a
Message-ID: <202601072140.KDdZRhUO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 7e792d0c61346438612a18842e2672b097ad594a  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1577m

configs tested: 165
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20260106    gcc-13.4.0
arc                   randconfig-001-20260107    gcc-14.3.0
arc                   randconfig-002-20260106    gcc-8.5.0
arc                   randconfig-002-20260107    gcc-14.3.0
arm                               allnoconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20260106    gcc-11.5.0
arm                   randconfig-001-20260107    gcc-14.3.0
arm                   randconfig-002-20260106    clang-22
arm                   randconfig-002-20260107    gcc-14.3.0
arm                   randconfig-003-20260106    gcc-10.5.0
arm                   randconfig-003-20260107    gcc-14.3.0
arm                   randconfig-004-20260106    gcc-8.5.0
arm                   randconfig-004-20260107    gcc-14.3.0
arm                         socfpga_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20260106    clang-22
arm64                 randconfig-002-20260106    gcc-8.5.0
arm64                 randconfig-003-20260106    gcc-9.5.0
arm64                 randconfig-004-20260106    gcc-10.5.0
csky                             alldefconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20260106    gcc-10.5.0
csky                  randconfig-002-20260106    gcc-11.5.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20260106    clang-22
hexagon               randconfig-002-20260106    clang-17
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20260106    clang-20
i386        buildonly-randconfig-002-20260106    clang-20
i386        buildonly-randconfig-003-20260106    gcc-14
i386        buildonly-randconfig-004-20260106    clang-20
i386        buildonly-randconfig-005-20260106    gcc-14
i386        buildonly-randconfig-006-20260106    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20260106    clang-20
i386                  randconfig-001-20260107    gcc-14
i386                  randconfig-002-20260106    gcc-14
i386                  randconfig-002-20260107    gcc-14
i386                  randconfig-003-20260106    clang-20
i386                  randconfig-003-20260107    gcc-14
i386                  randconfig-004-20260106    clang-20
i386                  randconfig-004-20260107    gcc-14
i386                  randconfig-005-20260106    clang-20
i386                  randconfig-005-20260107    gcc-14
i386                  randconfig-006-20260107    gcc-14
i386                  randconfig-007-20260107    clang-20
i386                  randconfig-011-20260106    clang-20
i386                  randconfig-012-20260106    gcc-14
i386                  randconfig-013-20260106    gcc-14
i386                  randconfig-014-20260106    clang-20
i386                  randconfig-015-20260106    gcc-14
i386                  randconfig-016-20260106    clang-20
i386                  randconfig-017-20260106    gcc-14
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260106    gcc-15.1.0
loongarch             randconfig-002-20260106    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260106    gcc-8.5.0
nios2                 randconfig-002-20260106    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260106    gcc-8.5.0
parisc                randconfig-002-20260106    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                       ebony_defconfig    clang-22
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20260106    clang-22
powerpc               randconfig-002-20260106    gcc-8.5.0
powerpc64             randconfig-001-20260106    gcc-8.5.0
powerpc64             randconfig-002-20260106    gcc-8.5.0
riscv                             allnoconfig    clang-22
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20260106    gcc-8.5.0
riscv                 randconfig-001-20260107    clang-22
riscv                 randconfig-002-20260106    clang-22
riscv                 randconfig-002-20260107    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20260106    gcc-8.5.0
s390                  randconfig-001-20260107    clang-22
s390                  randconfig-002-20260106    gcc-14.3.0
s390                  randconfig-002-20260107    clang-22
sh                                allnoconfig    clang-22
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                        edosk7705_defconfig    gcc-15.1.0
sh                    randconfig-001-20260106    gcc-15.1.0
sh                    randconfig-001-20260107    clang-22
sh                    randconfig-002-20260106    gcc-10.5.0
sh                    randconfig-002-20260107    clang-22
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260106    clang-22
um                    randconfig-002-20260106    clang-22
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260106    clang-20
x86_64      buildonly-randconfig-001-20260107    gcc-14
x86_64      buildonly-randconfig-002-20260106    gcc-14
x86_64      buildonly-randconfig-002-20260107    gcc-14
x86_64      buildonly-randconfig-003-20260106    clang-20
x86_64      buildonly-randconfig-003-20260107    gcc-14
x86_64      buildonly-randconfig-004-20260106    gcc-14
x86_64      buildonly-randconfig-004-20260107    gcc-14
x86_64      buildonly-randconfig-005-20260106    clang-20
x86_64      buildonly-randconfig-005-20260107    gcc-14
x86_64      buildonly-randconfig-006-20260106    gcc-14
x86_64      buildonly-randconfig-006-20260107    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260106    gcc-14
x86_64                randconfig-002-20260106    gcc-14
x86_64                randconfig-003-20260106    clang-20
x86_64                randconfig-004-20260106    clang-20
x86_64                randconfig-005-20260106    gcc-14
x86_64                randconfig-006-20260106    gcc-14
x86_64                randconfig-011-20260106    gcc-14
x86_64                randconfig-012-20260106    gcc-13
x86_64                randconfig-013-20260106    gcc-14
x86_64                randconfig-014-20260106    gcc-14
x86_64                randconfig-015-20260106    clang-20
x86_64                randconfig-016-20260106    clang-20
x86_64                randconfig-071-20260106    gcc-14
x86_64                randconfig-072-20260106    clang-20
x86_64                randconfig-073-20260106    clang-20
x86_64                randconfig-074-20260106    clang-20
x86_64                randconfig-075-20260106    gcc-14
x86_64                randconfig-076-20260106    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                randconfig-001-20260106    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

