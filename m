Return-Path: <linux-renesas-soc+bounces-22483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E14BAC91F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 12:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95D37188CD34
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 10:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4902F6193;
	Tue, 30 Sep 2025 10:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFGbcO3w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96D3221557
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759229764; cv=none; b=HZ/XuzoUFc0wevhMVJfaJXyb13g5zlQc1LADEMy6zpQaal2PgAHWl/uxo4Si48xUeVBQv1dbk1QrWnR9WoP4OHnoxf/wMruM+SVETaW4DjenmZSMiUszB+m9RaJ9xiQxqJahLB5jjGPQ1ZpgqbuAP4xtuTIw0iWJ4wQ6At68ewQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759229764; c=relaxed/simple;
	bh=FCfaJsHWnUbkPglmmgpYFq9DS+PDsz2JBfn83audUb0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kbC6phLz29rRvftzP7g3pvyL1WmnJo3ddy+hNhv/HMSWmkCr1ewleZdOUiHbCrkjdVzS1rUA7/dAmTieHRmeRDMbAdI0MCl03cwGnicqnYowlzWXj4R0d88zeAcZhfX5r96ZQBsPe7yiJ7RiCWhmCFhInyTc3Fwz7MzHadrGu0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFGbcO3w; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759229762; x=1790765762;
  h=date:from:to:cc:subject:message-id;
  bh=FCfaJsHWnUbkPglmmgpYFq9DS+PDsz2JBfn83audUb0=;
  b=OFGbcO3wfX0gn2//DgsIpZmkscdk1LKoK/qes6oFYDdS85Bc0L7N2sF1
   gIQjMp2tBjny61+9cDR0oVMMCZuBcvbCzc/aWI7QYNGw4Pv8qaZ0eyaUo
   K2z30OZLOiaPIoUaH9xlLsItcFP+MxV6OMsFegHTbwjGRh7dT+wQmDhlr
   ornpDBwepF/tFxhx8MV3BljHRPPwYZwwUxsA3Xaw3r7PoIlGOqWrD6reX
   6ZQez5FsU99oDMtetIHfBRe+PxIjnoYxeohCTXCebQ/7lns0EGYcyVTH4
   KTq1Zegs5k4ajP29NgaYniHxhCwPWY/KJ9GDU7ZzAR7+ieMLERbaVpE8j
   w==;
X-CSE-ConnectionGUID: oIThWbxCTdKqioUQoiPBJQ==
X-CSE-MsgGUID: Y4TYSALfSFauEkJAXd0ZMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65121116"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="65121116"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 03:56:01 -0700
X-CSE-ConnectionGUID: cTpMFv+HSV62xkPoksN/JQ==
X-CSE-MsgGUID: PyZViGUjQ52DRpkLOOmnyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="179261419"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Sep 2025 03:56:00 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3Y1W-0001Br-08;
	Tue, 30 Sep 2025 10:55:58 +0000
Date: Tue, 30 Sep 2025 18:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 a117ce19232292415e400e67c626fc5318c5562d
Message-ID: <202509301810.AcZDmulS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: a117ce19232292415e400e67c626fc5318c5562d  Merge branch 'renesas-dts-for-v6.19' into renesas-devel

elapsed time: 1469m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250929    gcc-8.5.0
arc                   randconfig-002-20250929    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250929    gcc-8.5.0
arm                   randconfig-002-20250929    gcc-14.3.0
arm                   randconfig-003-20250929    clang-22
arm                   randconfig-004-20250929    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250929    gcc-8.5.0
arm64                 randconfig-002-20250929    gcc-13.4.0
arm64                 randconfig-003-20250929    clang-22
arm64                 randconfig-004-20250929    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250929    gcc-9.5.0
csky                  randconfig-002-20250929    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250929    clang-22
hexagon               randconfig-002-20250929    clang-22
i386        buildonly-randconfig-001-20250929    gcc-14
i386        buildonly-randconfig-002-20250929    clang-20
i386        buildonly-randconfig-003-20250929    gcc-14
i386        buildonly-randconfig-004-20250929    gcc-14
i386        buildonly-randconfig-005-20250929    gcc-14
i386        buildonly-randconfig-006-20250929    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250929    gcc-12.5.0
loongarch             randconfig-002-20250929    gcc-15.1.0
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
nios2                 randconfig-001-20250929    gcc-11.5.0
nios2                 randconfig-002-20250929    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250929    gcc-14.3.0
parisc                randconfig-002-20250929    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250929    gcc-15.1.0
powerpc               randconfig-002-20250929    gcc-8.5.0
powerpc               randconfig-003-20250929    gcc-13.4.0
powerpc64             randconfig-001-20250929    clang-18
powerpc64             randconfig-002-20250929    clang-22
powerpc64             randconfig-003-20250929    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250929    gcc-9.5.0
riscv                 randconfig-002-20250929    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250929    gcc-11.5.0
s390                  randconfig-002-20250929    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250929    gcc-15.1.0
sh                    randconfig-002-20250929    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250929    gcc-8.5.0
sparc                 randconfig-002-20250929    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250929    clang-22
sparc64               randconfig-002-20250929    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250929    gcc-14
um                    randconfig-002-20250929    gcc-14
um                           x86_64_defconfig    clang-22
x86_64      buildonly-randconfig-001-20250929    gcc-14
x86_64      buildonly-randconfig-002-20250929    gcc-14
x86_64      buildonly-randconfig-003-20250929    clang-20
x86_64      buildonly-randconfig-004-20250929    gcc-14
x86_64      buildonly-randconfig-005-20250929    gcc-14
x86_64      buildonly-randconfig-006-20250929    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250929    gcc-8.5.0
xtensa                randconfig-002-20250929    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

