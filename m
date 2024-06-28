Return-Path: <linux-renesas-soc+bounces-6875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B281391BCB4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 12:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E999B21E13
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 10:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BFA481D7;
	Fri, 28 Jun 2024 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMcEzLYX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DED1103
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 10:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719571047; cv=none; b=P67YMFjnXqywfPWN2Xt8ZgVvuU5R2oUWo1E7DSxsFCQHQtiMI280w4ddGU8cfCF66kC2DqAMMud3aYPNaHbo90A/mBHMq0FcZ8vOgvpKBvOxp3V0XmMkhdB/yoUtqRZpS7g3tjt3uS45g4Bleq4IxHuvrFacvgfhqjgO7o0ddrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719571047; c=relaxed/simple;
	bh=usR0dd2bkhlQ2VV7P+uqjSDa9hhnFUX7dRn42CmD3mU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TsICjibH76Z2JUIoaDnGosLjmHq2z5h4bblCVfV/Vf4LJSMt81jbWwWhSUnTiZjDhssbe18FpXFAKjn40valrTFXgiRpDqyxqDmuqQfAYBGngFpjlkGiFu9ZKYHd0m4JFFi61mh9nK8tnBJl9OSkIt2npgRIv6orVHT3W7Hoh08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMcEzLYX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719571045; x=1751107045;
  h=date:from:to:cc:subject:message-id;
  bh=usR0dd2bkhlQ2VV7P+uqjSDa9hhnFUX7dRn42CmD3mU=;
  b=eMcEzLYXYhRoTUbUsSyE291sdpwLIhMRaboBlgAzYuT8VbhIcJ5F0yoh
   Up7tzFb0M5HpFZh6iL7+eVtAlXLrnD8CFmxA5q66MXi99ZslPBNCoR+tV
   EYvMQr9eQnAj9NirLjC/pGYUOQkiVFQk8LTlgx3aF5tSQ/uIONC9jpNWv
   a9XAFbDtvhL8tvB5Kr+glDMIu2JD8oba3cO71D0ZhxCHSRmN/Og8aDhVb
   fB9V7bEB28kV6HLKGC37zp6HLYb7j6dheTEy92/HDp8w3bEY4KCBPsVHn
   RsLyoR7jqMpY0VXDLBw1Y3WrjgdcS3bDH7jgKLWxdk0v3tX7joXbipzuo
   g==;
X-CSE-ConnectionGUID: QCZDkY3DRe2DSi++mBYpDA==
X-CSE-MsgGUID: nmsbfPPJSh6aZ8I6qBCy9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16582296"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="16582296"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 03:37:24 -0700
X-CSE-ConnectionGUID: GliX340iQw+aJGIX/rsWOA==
X-CSE-MsgGUID: s3XM+f/5T5CMeKzk8U1ZDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="44756397"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jun 2024 03:37:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN8yn-000H00-0X;
	Fri, 28 Jun 2024 10:37:21 +0000
Date: Fri, 28 Jun 2024 18:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-rcar-fuse] BUILD SUCCESS
 6147e4545dade50eae81ceaa1a310c59bc9f9f54
Message-ID: <202406281858.spmGfOQh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-rcar-fuse
branch HEAD: 6147e4545dade50eae81ceaa1a310c59bc9f9f54  soc: renesas: Add R-Car fuse driver

elapsed time: 5521m

configs tested: 104
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240625   gcc-13.2.0
arc                   randconfig-002-20240625   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                   randconfig-003-20240625   gcc-13.2.0
arm                   randconfig-004-20240625   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                            allyesconfig   clang-19
arm64                 randconfig-001-20240625   gcc-13.2.0
arm64                 randconfig-002-20240625   gcc-13.2.0
arm64                 randconfig-004-20240625   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240625   gcc-13.2.0
csky                  randconfig-002-20240625   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240624   gcc-8
i386         buildonly-randconfig-002-20240624   gcc-13
i386         buildonly-randconfig-004-20240624   gcc-10
i386         buildonly-randconfig-004-20240625   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240625   gcc-13
i386                  randconfig-003-20240624   gcc-13
i386                  randconfig-003-20240625   gcc-7
i386                  randconfig-004-20240624   gcc-13
i386                  randconfig-005-20240624   gcc-13
i386                  randconfig-006-20240625   gcc-13
i386                  randconfig-012-20240625   gcc-13
i386                  randconfig-013-20240624   gcc-9
i386                  randconfig-015-20240625   gcc-12
i386                  randconfig-016-20240624   gcc-9
i386                  randconfig-016-20240625   gcc-10
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240625   gcc-13.2.0
loongarch             randconfig-002-20240625   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                             allmodconfig   clang-19
mips                              allnoconfig   gcc-13.2.0
mips                             allyesconfig   clang-19
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.2.0
nios2                 randconfig-001-20240625   gcc-13.2.0
nios2                 randconfig-002-20240625   gcc-13.2.0
openrisc                         allmodconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240625   gcc-13.2.0
parisc                randconfig-002-20240625   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   gcc-13.2.0
powerpc               randconfig-002-20240625   gcc-13.2.0
powerpc               randconfig-003-20240625   gcc-13.2.0
powerpc64             randconfig-001-20240625   gcc-13.2.0
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   gcc-13.2.0
riscv                 randconfig-001-20240625   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240625   gcc-13.2.0
sh                    randconfig-002-20240625   gcc-13.2.0
sparc                            allyesconfig   gcc-13.2.0
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240625   gcc-13.2.0
sparc64               randconfig-002-20240625   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240625   gcc-13
x86_64                              defconfig   clang-18
x86_64                                  kexec   clang-18
x86_64                randconfig-002-20240625   gcc-13
x86_64                randconfig-003-20240625   gcc-13
x86_64                randconfig-006-20240625   gcc-13
x86_64                randconfig-012-20240625   gcc-13
x86_64                randconfig-015-20240625   gcc-13
x86_64                randconfig-016-20240625   gcc-11
x86_64                randconfig-071-20240625   gcc-13
x86_64                randconfig-074-20240625   gcc-13
x86_64                          rhel-8.3-func   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                           allyesconfig   gcc-13.2.0
xtensa                randconfig-001-20240625   gcc-13.2.0
xtensa                randconfig-002-20240625   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

