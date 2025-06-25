Return-Path: <linux-renesas-soc+bounces-18704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48129AE7DB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 11:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFEA51C2377E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 09:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7494B2DAFD3;
	Wed, 25 Jun 2025 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A84zPqsw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D121E1FAC4D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jun 2025 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750844000; cv=none; b=Lec0j9NoEsrcrOs28PKl2SpkAdOprCmx58c43VaiFW3Zl7fD5oDQj+ggz7Jw7/smzTAl0YVUUnVAIh+LKtcXjBRsl42fD/jel8bo/7w5WUAyEYPavKpRcPDTr/rhoefPR+Z2mG2v2YoKAxlhxSr9NjvPQWW2qD1wD5nYTn3aTrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750844000; c=relaxed/simple;
	bh=pLtLQLmSTRTmoTasq4NWzIKNTpuS3Hb5rj4GsVu5EfY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BSOaulVpn0nLj331kN6O05RDws54dJOIe2LU7eP0+pBTmHjPd8csdTiG2/lILIVEgRrDELMuovsyyAFEEWiO+YlBX8szZdiSmnlAJRLwRWtZfDGEUPp9/SfZSFhQEjMoJb56ENvskGuu1OjyQpeQq4lc5f0LJ8lFSMkxKvipne4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A84zPqsw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750843999; x=1782379999;
  h=date:from:to:cc:subject:message-id;
  bh=pLtLQLmSTRTmoTasq4NWzIKNTpuS3Hb5rj4GsVu5EfY=;
  b=A84zPqswuXi5Y6iUKaBflw1u+e+h9KYWVNRgo07iDc5eyKG5HKeSNIr3
   SZLRw9450S3Zc3RByuLgiEQHsPlywgSrwdjhU4XQSU6LMMvam0HG1PfrD
   7VnBPAt8pCSmtuQsrxmNESqHqRAAtrWuRVK6k1YJyUPOD6gl3EqYA6RN9
   OIE65zjn1bmRxeWAhV2mZ2pAu59IJQNovPGL0iNU+xPIN/wVbj0mxCg04
   dyJcqNGMrKvlpkgDCC1sy/0ZuBZ6F5I2LXMCLk9jsdaJCZCgcSCfFpZZt
   ysZWVKBA+8GyCtVhMGRkO1964CA1uaU9YMacpmtdkxR67zAtnYDf8rf9Q
   A==;
X-CSE-ConnectionGUID: x4VenG9HTZ+CeNjC9qkV9g==
X-CSE-MsgGUID: COhj3rS+TpiU6FuOodV33A==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70538631"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="70538631"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 02:33:18 -0700
X-CSE-ConnectionGUID: hWmFLw3mQD2OE8H9FvcyTA==
X-CSE-MsgGUID: C6w7GmGIRr+yEncEgKYWqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="189342017"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jun 2025 02:33:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUMVH-000SxX-0Y;
	Wed, 25 Jun 2025 09:33:15 +0000
Date: Wed, 25 Jun 2025 17:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 6d64c2b433b3cabd4c47ee709b25c29b665783cb
Message-ID: <202506251736.B0Xz50DE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 6d64c2b433b3cabd4c47ee709b25c29b665783cb  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1451m

configs tested: 58
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250624    gcc-12.4.0
arc                   randconfig-002-20250624    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250624    gcc-13.3.0
arm                   randconfig-002-20250624    gcc-8.5.0
arm                   randconfig-003-20250624    gcc-12.4.0
arm                   randconfig-004-20250624    clang-17
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250624    clang-21
arm64                 randconfig-002-20250624    gcc-10.5.0
arm64                 randconfig-003-20250624    clang-21
arm64                 randconfig-004-20250624    clang-21
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
i386        buildonly-randconfig-001-20250624    clang-20
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-003-20250624    clang-20
i386        buildonly-randconfig-004-20250624    clang-20
i386        buildonly-randconfig-005-20250624    clang-20
i386        buildonly-randconfig-006-20250624    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250624    clang-20
x86_64      buildonly-randconfig-002-20250624    gcc-12
x86_64      buildonly-randconfig-003-20250624    clang-20
x86_64      buildonly-randconfig-004-20250624    clang-20
x86_64      buildonly-randconfig-005-20250624    clang-20
x86_64      buildonly-randconfig-006-20250624    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

