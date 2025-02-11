Return-Path: <linux-renesas-soc+bounces-13038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC0CA307C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 10:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEEC61888807
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 09:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B6C1C5F1A;
	Tue, 11 Feb 2025 09:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezovALmo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993191EF092
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739267752; cv=none; b=uwxG3qwhbJAiaZ5YL2kre2MJUok5OLgalo/m5IFOqnkVQfA6LJU4iu+Awmgf8+b/sRyJaReizxc0TbYm8smpSCPTnJfXAxYLI0oMzaAsJNT/ks4NpjGk7MDpSaPnbCd6uPZ20vFi2MQINCcpvaBhhzgksULObDgWeTIV3ksSZJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739267752; c=relaxed/simple;
	bh=yYjWE9eCEljU7Ck9jbZks0lcwTLRng65CrcSG0N+3Ro=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ICLvcGPjfdnWSXZ7AVSKueCRfk/BBrhUKh15h1/TVPRydZyFx73iGcW6i9Ng6PH7GPEomor0r6cg2prJqn7Cenc6RMcVX44qpmPZOYV/kr5STzzB2GHyacYDh9G76QYIy3fx5Rz8KbdvU7Ye4hbPstKs8OhsMesZDe94P6tWR4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezovALmo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739267750; x=1770803750;
  h=date:from:to:cc:subject:message-id;
  bh=yYjWE9eCEljU7Ck9jbZks0lcwTLRng65CrcSG0N+3Ro=;
  b=ezovALmoeJkSaUdiTEN1dAHCar93udq2mWgENxVNjqln7UMGUmcwxhtW
   DLT5dTvoyAbV00V/5gq3SbCC9/j3YemcCswwUlT1+Cam0VceRDN0jNxj6
   HOuU561Qz4UgcPRnktdRcpVvfuogSzZbB4WOPYQeVBCSM5W9KXslPBbRn
   ixiIJYHWDFUZDw+HXTi/elSx6QmqrEph+6+hx+SJ1tOnJyMhhoKY5ke0q
   yb3+HDfL+QiA+9tMrUa08xdptA8wx3rPABtHEy4ob8XEoFXlpQ9P+lpeQ
   iLpNzbK69RCYVDr1eL4m0tpfJ9SAccS2OEH28gyu0nMMAmIDGFuGqF7L1
   A==;
X-CSE-ConnectionGUID: vyK0rVNARYOGaXz31AjYkQ==
X-CSE-MsgGUID: butUAPWXR92JM5Drz8cFBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43536081"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="43536081"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 01:55:50 -0800
X-CSE-ConnectionGUID: JOjpfEx+QT2c9A775Vy6tQ==
X-CSE-MsgGUID: X7bGxnj8QnCi03Sfmlu9pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135714028"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2025 01:55:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thmzZ-0013zb-27;
	Tue, 11 Feb 2025 09:55:45 +0000
Date: Tue, 11 Feb 2025 17:55:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 5cefe14b0de46cb28c5417846b93cc17b97ba3bf
Message-ID: <202502111721.7bchzhkx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 5cefe14b0de46cb28c5417846b93cc17b97ba3bf  Merge branch 'topic/renesas-defconfig' into renesas-devel

elapsed time: 1457m

configs tested: 159
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-13.2.0
arc                   randconfig-001-20250210    gcc-13.2.0
arc                   randconfig-001-20250211    clang-19
arc                   randconfig-002-20250210    gcc-13.2.0
arc                   randconfig-002-20250211    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    clang-21
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250210    clang-16
arm                   randconfig-001-20250211    clang-19
arm                   randconfig-002-20250210    gcc-14.2.0
arm                   randconfig-002-20250211    clang-19
arm                   randconfig-003-20250210    clang-16
arm                   randconfig-003-20250211    clang-19
arm                   randconfig-004-20250210    gcc-14.2.0
arm                   randconfig-004-20250211    clang-19
arm                             rpc_defconfig    clang-17
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250210    gcc-14.2.0
arm64                 randconfig-001-20250211    clang-19
arm64                 randconfig-002-20250210    clang-21
arm64                 randconfig-002-20250211    clang-19
arm64                 randconfig-003-20250210    clang-21
arm64                 randconfig-003-20250211    clang-19
arm64                 randconfig-004-20250210    gcc-14.2.0
arm64                 randconfig-004-20250211    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250210    gcc-14.2.0
csky                  randconfig-002-20250210    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250210    clang-21
hexagon               randconfig-002-20250210    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250210    gcc-12
i386        buildonly-randconfig-001-20250211    gcc-12
i386        buildonly-randconfig-002-20250210    gcc-12
i386        buildonly-randconfig-002-20250211    gcc-12
i386        buildonly-randconfig-003-20250210    clang-19
i386        buildonly-randconfig-003-20250211    gcc-12
i386        buildonly-randconfig-004-20250210    gcc-12
i386        buildonly-randconfig-004-20250211    gcc-12
i386        buildonly-randconfig-005-20250210    gcc-12
i386        buildonly-randconfig-005-20250211    gcc-12
i386        buildonly-randconfig-006-20250210    gcc-12
i386        buildonly-randconfig-006-20250211    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250210    gcc-14.2.0
loongarch             randconfig-002-20250210    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250210    gcc-14.2.0
nios2                 randconfig-002-20250210    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250210    gcc-14.2.0
parisc                randconfig-002-20250210    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250210    clang-21
powerpc               randconfig-002-20250210    clang-21
powerpc               randconfig-003-20250210    gcc-14.2.0
powerpc                     tqm8541_defconfig    clang-15
powerpc64             randconfig-001-20250210    gcc-14.2.0
powerpc64             randconfig-002-20250210    gcc-14.2.0
powerpc64             randconfig-003-20250210    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250210    clang-21
riscv                 randconfig-001-20250211    clang-15
riscv                 randconfig-002-20250210    gcc-14.2.0
riscv                 randconfig-002-20250211    clang-15
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250210    gcc-14.2.0
s390                  randconfig-001-20250211    clang-15
s390                  randconfig-002-20250210    clang-19
s390                  randconfig-002-20250211    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250210    gcc-14.2.0
sh                    randconfig-001-20250211    clang-15
sh                    randconfig-002-20250210    gcc-14.2.0
sh                    randconfig-002-20250211    clang-15
sh                          rsk7264_defconfig    gcc-14.2.0
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250210    gcc-14.2.0
sparc                 randconfig-001-20250211    clang-15
sparc                 randconfig-002-20250210    gcc-14.2.0
sparc                 randconfig-002-20250211    clang-15
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250210    gcc-14.2.0
sparc64               randconfig-001-20250211    clang-15
sparc64               randconfig-002-20250210    gcc-14.2.0
sparc64               randconfig-002-20250211    clang-15
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250210    clang-18
um                    randconfig-001-20250211    clang-15
um                    randconfig-002-20250210    clang-16
um                    randconfig-002-20250211    clang-15
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250210    clang-19
x86_64      buildonly-randconfig-002-20250210    gcc-12
x86_64      buildonly-randconfig-003-20250210    clang-19
x86_64      buildonly-randconfig-004-20250210    clang-19
x86_64      buildonly-randconfig-005-20250210    clang-19
x86_64      buildonly-randconfig-006-20250210    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250210    gcc-14.2.0
xtensa                randconfig-001-20250211    clang-15
xtensa                randconfig-002-20250210    gcc-14.2.0
xtensa                randconfig-002-20250211    clang-15

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

