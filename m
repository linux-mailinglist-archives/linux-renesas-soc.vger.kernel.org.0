Return-Path: <linux-renesas-soc+bounces-8728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B6B96CBE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2024 02:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E02F71F25F15
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2024 00:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D6B4A1A;
	Thu,  5 Sep 2024 00:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QndT7AgU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8932621
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Sep 2024 00:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725497096; cv=none; b=enEBvDqzPg/5G8UtEziFgyfwgvb9qFSo9dNmedy9whiS9+arCf1bBDwXkdbzq8jMatIiCEb+cYfLl9/cWPm95yVDH4Td0CFyb8DkCuIpu+00C3Jpj1aJEQK2AV6XGuYAHZ4NP5d33hE60Lb5ed4AAYHXuDz250KqYZR/RCh5hp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725497096; c=relaxed/simple;
	bh=P+dUMeHmR1P3YzToP7SIiJIsngTGa98Ok/urPmzSXYs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LguQmnTnrJyYx+SPDPfx7f39WGGd5EC2VqdViCYSRf/5NdiOEjODupaJ4eB2bOpSavCOcc/TZ8j6GQ6C4i3zUDeNgBv1e4ff+UUNy2Fh6g7q6q8VHmePYJ/EBMDnpEEy1UspGFV/xLydKuw65OKK9JhVOKEfdngD3CsGK+L0GbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QndT7AgU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725497095; x=1757033095;
  h=date:from:to:cc:subject:message-id;
  bh=P+dUMeHmR1P3YzToP7SIiJIsngTGa98Ok/urPmzSXYs=;
  b=QndT7AgUWcXxCCCrbiEr1LGMyKgh6RUeGkbfK0m2h6sJL918jM3WdOEw
   8XUZDvyQs2ZzwJHSOQsoYGVYJ8fcNyawowWj2n1xKyLur7JRzs20xuNy+
   +YWudklte6ZvNslswaxchkY9IgjrYZTNfeMj2R8uyPc6B/Hl1DVU/Wizx
   SUWxA3id7lnes9tXeGWKga6nrFtC3dxHfasunkBvimW8eDWwWjGZ2Vjr1
   7iQ6R50sUzo+XxXL+ZTYtStp/H296u+5j98COyx6sraAP2aN89yaAYBhm
   /nPKkJYGOZqAUk/EWYt1fH5VKni/C6LEQdBtOtBSlh2IzJBAT8aTfQG1i
   A==;
X-CSE-ConnectionGUID: DM5+7YLQQsSXyNUgGKHLDg==
X-CSE-MsgGUID: G1/rGrJQTWSUlLhijV/AAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24050231"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="24050231"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 17:44:54 -0700
X-CSE-ConnectionGUID: hkQVoXLlQ1uLx21HHBk0vA==
X-CSE-MsgGUID: F26fhPg8SzauN2LGh0fbYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="88679007"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Sep 2024 17:44:53 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm0cF-0008kB-0R;
	Thu, 05 Sep 2024 00:44:51 +0000
Date: Thu, 05 Sep 2024 08:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/overlays-v6.11-rc5] BUILD
 SUCCESS d82dbabc2e0aca4d21447e6604915b7d11198a4a
Message-ID: <202409050806.009FgiHu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/overlays-v6.11-rc5
branch HEAD: d82dbabc2e0aca4d21447e6604915b7d11198a4a  kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used

elapsed time: 2132m

configs tested: 104
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240905   gcc-13.2.0
arc                   randconfig-002-20240905   gcc-13.2.0
arm                               allnoconfig   clang-20
arm                   randconfig-001-20240905   clang-14
arm                   randconfig-002-20240905   clang-20
arm                   randconfig-003-20240905   clang-20
arm                   randconfig-004-20240905   gcc-14.1.0
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240905   clang-20
arm64                 randconfig-002-20240905   gcc-14.1.0
arm64                 randconfig-003-20240905   clang-20
arm64                 randconfig-004-20240905   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240905   gcc-14.1.0
csky                  randconfig-002-20240905   gcc-14.1.0
hexagon                           allnoconfig   clang-20
hexagon               randconfig-001-20240905   clang-20
hexagon               randconfig-002-20240905   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240904   clang-18
i386         buildonly-randconfig-002-20240904   gcc-12
i386         buildonly-randconfig-003-20240904   clang-18
i386         buildonly-randconfig-004-20240904   clang-18
i386         buildonly-randconfig-005-20240904   clang-18
i386         buildonly-randconfig-006-20240904   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240904   clang-18
i386                  randconfig-002-20240904   clang-18
i386                  randconfig-003-20240904   clang-18
i386                  randconfig-004-20240904   clang-18
i386                  randconfig-005-20240904   gcc-12
i386                  randconfig-006-20240904   gcc-12
i386                  randconfig-011-20240904   clang-18
i386                  randconfig-012-20240904   clang-18
i386                  randconfig-013-20240904   gcc-12
i386                  randconfig-014-20240904   clang-18
i386                  randconfig-015-20240904   clang-18
i386                  randconfig-016-20240904   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240905   gcc-14.1.0
loongarch             randconfig-002-20240905   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240905   gcc-14.1.0
nios2                 randconfig-002-20240905   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                randconfig-001-20240905   gcc-14.1.0
parisc                randconfig-002-20240905   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc               randconfig-001-20240905   clang-14
powerpc               randconfig-002-20240905   clang-20
powerpc               randconfig-003-20240905   gcc-14.1.0
powerpc64             randconfig-001-20240905   gcc-14.1.0
powerpc64             randconfig-002-20240905   gcc-14.1.0
powerpc64             randconfig-003-20240905   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                 randconfig-001-20240905   gcc-14.1.0
riscv                 randconfig-002-20240905   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                  randconfig-001-20240905   clang-20
s390                  randconfig-002-20240905   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                    randconfig-001-20240905   gcc-14.1.0
sh                    randconfig-002-20240905   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64               randconfig-001-20240905   gcc-14.1.0
sparc64               randconfig-002-20240905   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                    randconfig-001-20240905   gcc-12
um                    randconfig-002-20240905   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240905   gcc-12
x86_64       buildonly-randconfig-002-20240905   clang-18
x86_64       buildonly-randconfig-003-20240905   gcc-12
x86_64       buildonly-randconfig-004-20240905   clang-18
x86_64       buildonly-randconfig-005-20240905   clang-18
x86_64       buildonly-randconfig-006-20240905   gcc-12
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240905   clang-18
x86_64                randconfig-002-20240905   gcc-12
x86_64                randconfig-003-20240905   clang-18
x86_64                randconfig-004-20240905   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240905   gcc-14.1.0
xtensa                randconfig-002-20240905   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

