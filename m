Return-Path: <linux-renesas-soc+bounces-7713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADBE946908
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Aug 2024 12:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB5D01F216F2
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Aug 2024 10:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F4910A1A;
	Sat,  3 Aug 2024 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biKcaT6v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1434A2F
	for <linux-renesas-soc@vger.kernel.org>; Sat,  3 Aug 2024 10:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722680565; cv=none; b=S83w9SfZOsbB0p1COOdUxW7mYYkCLomQVZeiRJE1qVtkU00SmbIjgEuYb7fBzz33BT7JfyhZ8nk9cBBqULVvYcEsNO10LRSe1OlL29VMRqnwSdY973k8/wcOJqvEXK9Ag4xfsLMKPFqCUkZujU3dFu01LDWmlJqqgAtyVPrCUdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722680565; c=relaxed/simple;
	bh=1NEO7Kq95eKOgnuuVyj23+HFaz3eot5PTeE6ljSzQWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sZNlveu2veu9uS5lvzUZoRYsPjYGvAZRHaAutOLirmN3P6hUtrI+ph65pXtqM+3y0PmKreAytqeTG0/n2HXJsS3E6Sq9X/jFlUiCGN72LmWB+hHvgsfzNFh0tICqTV6nJXaSOk1Y9n6sfEdKWV67Wrngud88ZEUWVhcyM1jWcJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biKcaT6v; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722680563; x=1754216563;
  h=date:from:to:cc:subject:message-id;
  bh=1NEO7Kq95eKOgnuuVyj23+HFaz3eot5PTeE6ljSzQWg=;
  b=biKcaT6vyVVoCToaAc6idLNSJejNsViUPhkQpIqAlGB3XjGH9kRXxmT/
   CudglDPTJWWLN6Pn3xuDNaQfUX+UBrG4I0l5Kcaiqbtx7kZlFvRaJTQIO
   p6yUxzfoCR03upd16Ril6aUhDiaXHdAB9qovWIyjgdRvB64CTQbT0Hg4D
   XsqjyOzbdGM5cWjq2FZ+ytQg2vr5BkdMxQnV2X1XIhYE+Enanv3Id8Z0d
   LSOm4yBmNZQhgo6Qrkwix6drBOxEwioGQm6yH3ifwtJzxhzkBfcx5/fSI
   mug9L+uKei/gmrA3Ujmvzk8UXIfrFbUvvP37XpFJq7p31ixlq+luSw3Qn
   Q==;
X-CSE-ConnectionGUID: QSqVKyh2QRiYcVlDVhXK7w==
X-CSE-MsgGUID: uMZ+MBD7Qmi8Gtw97yBrnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="46098985"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="46098985"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 03:22:42 -0700
X-CSE-ConnectionGUID: NryNpySxQAWj1TBfGwqnMQ==
X-CSE-MsgGUID: f6qAfZ1ETZiEbW4pjZJSNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60521457"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Aug 2024 03:22:41 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saBuI-0000Mu-22;
	Sat, 03 Aug 2024 10:22:38 +0000
Date: Sat, 03 Aug 2024 18:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 f73f63b24491fa43641daf3b6162d2a451bd8481
Message-ID: <202408031847.sQo0OUIP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: f73f63b24491fa43641daf3b6162d2a451bd8481  pinctrl: renesas: rzg2l: Use dev_err_probe()

elapsed time: 1423m

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
i386         buildonly-randconfig-001-20240802   gcc-13
i386         buildonly-randconfig-001-20240803   clang-18
i386         buildonly-randconfig-002-20240802   gcc-12
i386         buildonly-randconfig-002-20240803   clang-18
i386         buildonly-randconfig-003-20240802   clang-18
i386         buildonly-randconfig-003-20240803   clang-18
i386         buildonly-randconfig-004-20240802   gcc-12
i386         buildonly-randconfig-004-20240802   gcc-13
i386         buildonly-randconfig-004-20240803   clang-18
i386         buildonly-randconfig-005-20240802   gcc-12
i386         buildonly-randconfig-005-20240802   gcc-13
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
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
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

