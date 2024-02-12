Return-Path: <linux-renesas-soc+bounces-2630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E806851840
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 16:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7121F21CE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 15:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517B125740;
	Mon, 12 Feb 2024 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7BiaGgh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321DA3C6BA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 15:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707752301; cv=none; b=uNS2N4Jv6zPTC+8Bre6CJhLXxLGmTRnSCGVBk1v40Hjaop3PXji3tzTtOKULYHsF3wEmeq2hrfjqvZmWN+Ak3Ef/zIvCdyA3pvy8ydnJv56yc2Igp63c//h6PWnMVNodcBfpHmLSOFHqOo6IzkBGjUkipI3P4vgaBUuYLwYacbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707752301; c=relaxed/simple;
	bh=b1U1607FLwBqI0MwC1IXwcyHS1QiUFUxG/YMLClY8Ao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RLPopzrvX/wvD+YNTEBZ6C3W/+MQiaNe06F9WP8MC7RgEg7dH4n1rLc+2DgGihUBsrZJ6ykJBeCkWYElvGuLYMljLoEbllG2P3NG70Alv5AMCN4046HZK0M5ws3a7qJJeU7UMRlzmJWxu1Qk9gF68XhTCmuXNdNg8xjK+EyWUFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7BiaGgh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707752298; x=1739288298;
  h=date:from:to:cc:subject:message-id;
  bh=b1U1607FLwBqI0MwC1IXwcyHS1QiUFUxG/YMLClY8Ao=;
  b=F7BiaGghjtY4KQ/drGQ3Byo/lMaB9N3KPxm0yZicGhe/fOD+13w0uaOD
   CuDvc1zub8BlVkKACukb1meoq42gePckrhS390lpkdz/YZbJTDFeDzvV0
   VbChL6m5S0O3ibQP2JWcA72EbyTIlHCiwzqykFj6Xx4ZYkZsl/nsh0sbS
   exVg5uzybmTiZCBghfi/AibavQ4RfHqNRCcrWtnD1QcvNez3WUy6GM3pA
   WoNoIViBMMt3sesV53zlfRnEoFJh2oN0EKFydyhIhWzWzdSA9ni41lqyK
   A6yg50FOPpmMfD1psHFLowXf+4se/Cqij7PUAlvm/8W3LoTD2kPu9Aebe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1639230"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="1639230"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 07:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="2587227"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Feb 2024 07:38:15 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZYNp-0007DO-02;
	Mon, 12 Feb 2024 15:38:13 +0000
Date: Mon, 12 Feb 2024 23:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/v4m-gray-hawk-single-v2] BUILD
 SUCCESS 9c01d01a114b35cee589d7e2eb6a1e5aa1fb52b2
Message-ID: <202402122305.LrpPdKq5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/v4m-gray-hawk-single-v2
branch HEAD: 9c01d01a114b35cee589d7e2eb6a1e5aa1fb52b2  arm64: dts: renesas: gray-hawk-single: Add Ethernet support

elapsed time: 1447m

configs tested: 175
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20240211   gcc  
arc                   randconfig-002-20240211   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                        mvebu_v5_defconfig   gcc  
arm                        mvebu_v7_defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240211   clang
arm                   randconfig-002-20240211   clang
arm                   randconfig-003-20240211   gcc  
arm                   randconfig-004-20240211   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240211   clang
arm64                 randconfig-002-20240211   gcc  
arm64                 randconfig-003-20240211   gcc  
arm64                 randconfig-004-20240211   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240211   gcc  
csky                  randconfig-002-20240211   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240211   clang
hexagon               randconfig-002-20240211   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240211   clang
i386         buildonly-randconfig-002-20240211   gcc  
i386         buildonly-randconfig-003-20240211   clang
i386         buildonly-randconfig-004-20240211   gcc  
i386         buildonly-randconfig-005-20240211   gcc  
i386         buildonly-randconfig-006-20240211   clang
i386                                defconfig   clang
i386                  randconfig-001-20240211   gcc  
i386                  randconfig-002-20240211   gcc  
i386                  randconfig-003-20240211   gcc  
i386                  randconfig-004-20240211   clang
i386                  randconfig-005-20240211   gcc  
i386                  randconfig-006-20240211   clang
i386                  randconfig-011-20240211   clang
i386                  randconfig-012-20240211   gcc  
i386                  randconfig-013-20240211   clang
i386                  randconfig-014-20240211   clang
i386                  randconfig-015-20240211   clang
i386                  randconfig-016-20240211   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240211   gcc  
loongarch             randconfig-002-20240211   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240211   gcc  
nios2                 randconfig-002-20240211   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240211   gcc  
parisc                randconfig-002-20240211   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                  mpc866_ads_defconfig   clang
powerpc                     ppa8548_defconfig   gcc  
powerpc               randconfig-001-20240211   gcc  
powerpc               randconfig-002-20240211   clang
powerpc               randconfig-003-20240211   gcc  
powerpc                     tqm8548_defconfig   clang
powerpc64             randconfig-001-20240211   clang
powerpc64             randconfig-002-20240211   gcc  
powerpc64             randconfig-003-20240211   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240211   gcc  
riscv                 randconfig-002-20240211   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240211   clang
s390                  randconfig-002-20240211   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240211   gcc  
sh                    randconfig-002-20240211   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240211   gcc  
sparc64               randconfig-002-20240211   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240211   gcc  
um                    randconfig-002-20240211   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240211   gcc  
x86_64       buildonly-randconfig-002-20240211   clang
x86_64       buildonly-randconfig-003-20240211   clang
x86_64       buildonly-randconfig-004-20240211   clang
x86_64       buildonly-randconfig-005-20240211   gcc  
x86_64       buildonly-randconfig-006-20240211   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240211   gcc  
x86_64                randconfig-002-20240211   clang
x86_64                randconfig-003-20240211   clang
x86_64                randconfig-004-20240211   clang
x86_64                randconfig-005-20240211   gcc  
x86_64                randconfig-006-20240211   clang
x86_64                randconfig-011-20240211   clang
x86_64                randconfig-012-20240211   clang
x86_64                randconfig-013-20240211   gcc  
x86_64                randconfig-014-20240211   gcc  
x86_64                randconfig-015-20240211   clang
x86_64                randconfig-016-20240211   gcc  
x86_64                randconfig-071-20240211   gcc  
x86_64                randconfig-072-20240211   gcc  
x86_64                randconfig-073-20240211   gcc  
x86_64                randconfig-074-20240211   clang
x86_64                randconfig-075-20240211   clang
x86_64                randconfig-076-20240211   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240211   gcc  
xtensa                randconfig-002-20240211   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

