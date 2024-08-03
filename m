Return-Path: <linux-renesas-soc+bounces-7712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA559468FF
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Aug 2024 12:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A9A81C20B7B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Aug 2024 10:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812AC23CB;
	Sat,  3 Aug 2024 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hv8LadVy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4752D1311B6
	for <linux-renesas-soc@vger.kernel.org>; Sat,  3 Aug 2024 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722679526; cv=none; b=p43YSkdjQwkBYYYC68KlgxPjbZOsr//zcBj68oQtf8xYex9iVVPcxMjKzhYJgGZ16fDYk37bgdBR7UPZAvyqTHX6nc7P7USAt98g5f3RWoQacJKofY57uAr235xjLgDPh6izjUcHxBkjghxw/aC9t3mIWWFtBXVsL6FVrV6SaXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722679526; c=relaxed/simple;
	bh=Ie8iJ6irakHwKgqSK54q180b0ehc72VeplFuUPPak1M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JkVvy9+lMwStfbH+WaqrSUKJvm2BovpI+yABmxvo73zq+8ARymFbdiINuIYq1Y2tFamLyCsSUYm1hOdiEGJNXPQTR4N208LIT0MxGmaHiKh+Mw1+6Z7LVC7o45amqIalSYPGDn0kzEDpBP4yXM1LSxD5fYl5RgchTsFhK8fIioc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hv8LadVy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722679524; x=1754215524;
  h=date:from:to:cc:subject:message-id;
  bh=Ie8iJ6irakHwKgqSK54q180b0ehc72VeplFuUPPak1M=;
  b=hv8LadVykzBS/Er4NvUaYMHHgSBlEy+GttAzBsOhKSOZsiio29Jc+LK8
   4CCHTaP8RvlhC/Q/aGy/XSyfeGo6WObOyynZrqGoDERd3P9Uw5TWfzN/6
   JPIc+QcPXhx7GnMx2i4cDn0hS5Pw8P6AAA3orJzbGvNVo8uNSuwzyn7gr
   uEJ4Zmclal5cUthYNqasqkOlgwpv65xusYQTA9QfVBBNMj+Kx6kyKyzDD
   0RzITSd7VOpO+nMnpJLEv6YcY62U0s4uYCAgiuRegtw6g9vg0TKaLRbOI
   JAZtZvjPr/hVr00xg6tKg2TZd1LFZOLTHlG3AxtISuqJc7yP/6b6sk1PN
   w==;
X-CSE-ConnectionGUID: rgAFucqNT1OW6pxJQ+A03Q==
X-CSE-MsgGUID: DpcyBSqFQgKpf0o3lKumUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="46098476"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="46098476"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 03:05:23 -0700
X-CSE-ConnectionGUID: 18lpF6jgRKKUjpDgaUczxA==
X-CSE-MsgGUID: rLZ4KaapSZGWg9gCaTMprw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60682995"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Aug 2024 03:05:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saBdV-0000MT-0d;
	Sat, 03 Aug 2024 10:05:18 +0000
Date: Sat, 03 Aug 2024 18:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 3f3b7f43c49ae8466bde2f92564a43b6737ebec8
Message-ID: <202408031849.P4cZl5Wb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 3f3b7f43c49ae8466bde2f92564a43b6737ebec8  Merge branches 'renesas-arm-defconfig-for-v6.12' and 'renesas-dts-for-v6.12' into renesas-next

elapsed time: 1403m

configs tested: 214
configs skipped: 10

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
arc                   randconfig-001-20240803   gcc-13.2.0
arc                   randconfig-002-20240803   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         bcm2835_defconfig   clang-20
arm                        clps711x_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                      jornada720_defconfig   clang-20
arm                        keystone_defconfig   clang-20
arm                          moxart_defconfig   clang-20
arm                            mps2_defconfig   clang-20
arm                        mvebu_v7_defconfig   gcc-13.2.0
arm                             mxs_defconfig   clang-20
arm                   randconfig-001-20240803   gcc-13.2.0
arm                   randconfig-002-20240803   gcc-13.2.0
arm                   randconfig-003-20240803   gcc-13.2.0
arm                   randconfig-004-20240803   gcc-13.2.0
arm                        realview_defconfig   gcc-13.2.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm                           sama5_defconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240803   gcc-13.2.0
arm64                 randconfig-002-20240803   gcc-13.2.0
arm64                 randconfig-003-20240803   gcc-13.2.0
arm64                 randconfig-004-20240803   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240803   gcc-13.2.0
csky                  randconfig-002-20240803   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240802   gcc-12
i386         buildonly-randconfig-001-20240803   clang-18
i386         buildonly-randconfig-002-20240802   gcc-12
i386         buildonly-randconfig-002-20240803   clang-18
i386         buildonly-randconfig-003-20240802   clang-18
i386         buildonly-randconfig-003-20240803   clang-18
i386         buildonly-randconfig-004-20240802   gcc-12
i386         buildonly-randconfig-004-20240803   clang-18
i386         buildonly-randconfig-005-20240802   gcc-12
i386         buildonly-randconfig-005-20240803   clang-18
i386         buildonly-randconfig-006-20240802   clang-18
i386         buildonly-randconfig-006-20240803   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240802   gcc-12
i386                  randconfig-001-20240803   clang-18
i386                  randconfig-002-20240802   gcc-12
i386                  randconfig-002-20240803   clang-18
i386                  randconfig-003-20240802   clang-18
i386                  randconfig-003-20240803   clang-18
i386                  randconfig-004-20240802   gcc-12
i386                  randconfig-004-20240803   clang-18
i386                  randconfig-005-20240802   gcc-12
i386                  randconfig-005-20240803   clang-18
i386                  randconfig-006-20240802   gcc-12
i386                  randconfig-006-20240803   clang-18
i386                  randconfig-011-20240802   clang-18
i386                  randconfig-011-20240803   clang-18
i386                  randconfig-012-20240802   clang-18
i386                  randconfig-012-20240803   clang-18
i386                  randconfig-013-20240802   gcc-12
i386                  randconfig-013-20240803   clang-18
i386                  randconfig-014-20240802   clang-18
i386                  randconfig-014-20240803   clang-18
i386                  randconfig-015-20240802   clang-18
i386                  randconfig-015-20240803   clang-18
i386                  randconfig-016-20240802   gcc-12
i386                  randconfig-016-20240803   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240803   gcc-13.2.0
loongarch             randconfig-002-20240803   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                            mac_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           gcw0_defconfig   clang-20
mips                           ip22_defconfig   gcc-13.2.0
mips                        maltaup_defconfig   clang-20
mips                    maltaup_xpa_defconfig   clang-20
mips                           mtx1_defconfig   gcc-13.2.0
mips                      pic32mzda_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240803   gcc-13.2.0
nios2                 randconfig-002-20240803   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240803   gcc-13.2.0
parisc                randconfig-002-20240803   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                   bluestone_defconfig   gcc-13.2.0
powerpc                      cm5200_defconfig   gcc-13.2.0
powerpc                      ep88xc_defconfig   clang-20
powerpc                        fsp2_defconfig   clang-20
powerpc                     ksi8560_defconfig   gcc-13.2.0
powerpc                 mpc8313_rdb_defconfig   clang-20
powerpc               mpc834x_itxgp_defconfig   clang-20
powerpc                      pcm030_defconfig   clang-20
powerpc               randconfig-001-20240803   gcc-13.2.0
powerpc               randconfig-003-20240803   gcc-13.2.0
powerpc                  storcenter_defconfig   gcc-13.2.0
powerpc                      tqm8xx_defconfig   clang-20
powerpc                        warp_defconfig   gcc-13.2.0
powerpc                 xes_mpc85xx_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240803   gcc-13.2.0
powerpc64             randconfig-002-20240803   gcc-13.2.0
powerpc64             randconfig-003-20240803   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240803   gcc-13.2.0
riscv                 randconfig-002-20240803   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240803   gcc-13.2.0
s390                  randconfig-002-20240803   gcc-13.2.0
s390                       zfcpdump_defconfig   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240803   gcc-13.2.0
sh                    randconfig-002-20240803   gcc-13.2.0
sh                          rsk7203_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240803   gcc-13.2.0
sparc64               randconfig-002-20240803   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240803   gcc-13.2.0
um                    randconfig-002-20240803   gcc-13.2.0
um                           x86_64_defconfig   clang-20
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240803   gcc-12
x86_64       buildonly-randconfig-002-20240803   gcc-12
x86_64       buildonly-randconfig-003-20240803   gcc-12
x86_64       buildonly-randconfig-004-20240803   gcc-12
x86_64       buildonly-randconfig-005-20240803   gcc-12
x86_64       buildonly-randconfig-006-20240803   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240803   gcc-12
x86_64                randconfig-002-20240803   gcc-12
x86_64                randconfig-003-20240803   gcc-12
x86_64                randconfig-004-20240803   gcc-12
x86_64                randconfig-005-20240803   gcc-12
x86_64                randconfig-006-20240803   gcc-12
x86_64                randconfig-011-20240803   gcc-12
x86_64                randconfig-012-20240803   gcc-12
x86_64                randconfig-013-20240803   gcc-12
x86_64                randconfig-014-20240803   gcc-12
x86_64                randconfig-015-20240803   gcc-12
x86_64                randconfig-016-20240803   gcc-12
x86_64                randconfig-071-20240803   gcc-12
x86_64                randconfig-072-20240803   gcc-12
x86_64                randconfig-073-20240803   gcc-12
x86_64                randconfig-074-20240803   gcc-12
x86_64                randconfig-075-20240803   gcc-12
x86_64                randconfig-076-20240803   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240803   gcc-13.2.0
xtensa                randconfig-002-20240803   gcc-13.2.0
xtensa                         virt_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

