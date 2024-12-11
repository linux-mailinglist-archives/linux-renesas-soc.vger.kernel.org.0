Return-Path: <linux-renesas-soc+bounces-11207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CBF9EC422
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 06:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E0E2188B075
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 05:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4B01BFE00;
	Wed, 11 Dec 2024 05:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODpwic3B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB9F1BDAA0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Dec 2024 05:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733893669; cv=none; b=YRL7ApW6DXNTbTvENxu7h3GAepSBbPym4pHmnzxImmmMB1/Pd6Lnys014BRvN/L5nFPYrQKL6uFmikUMhAliqCD5ZF5JV+vI+GzkLxodCh5HrW0NypUdeB4BKleqXTLzcXFtLl0vhXLdo4bi33p/v3Kv29Ko17OoAAJ94czTopM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733893669; c=relaxed/simple;
	bh=fj5X/A4BlVV0G80kWSLnfTjeKDRBNXxsU1yoNos7NEY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fuV5JvVhvQywNn6aY9TSqItiFz4JMiS67sa10ttzdoH6fQiUqWud+y+CUoX8pGuZ1fzlDaAY9CwQqGznRHStepmQAxV4CRUUxyBLYvbKG20T6d6AqTGjd8nbxjRoAUnn3M5wAXs5CxI1hek2MsOjNq77rofrqZuwxJCoSepbTW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODpwic3B; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733893667; x=1765429667;
  h=date:from:to:cc:subject:message-id;
  bh=fj5X/A4BlVV0G80kWSLnfTjeKDRBNXxsU1yoNos7NEY=;
  b=ODpwic3BxFWah4oDMYKu1msE7UPyf9Q6kEYnjIJAjW8edZtTnpKa/uAx
   70ZRrnUR1eehrpw0e6FSrW136p+Fx0hPvUDkQwNkNSO0lPSPlh9zB5ZHH
   zFE0SpDe5jTkS4VC1lg1qad0qQwIAEz89peG5dqxmaQ9jD20gHn0JiLK6
   CDpAfziBkNI8aERFPIuNabp4KVXumYCCoQY1fbS1hXcN8cBrJHBSvUndC
   71J3ottrEiiEwrsKDlmSY5evdUaWMVIxXR2Fp0FvtMGZViroymwRr6/d6
   QBxxVZPi81Q85AR/Y1akwn8kZrzyeR7KhxS2xQG0BmRcVtpdUoR7W2AH5
   w==;
X-CSE-ConnectionGUID: XzQCixJYTbusqinJ5OcQFg==
X-CSE-MsgGUID: 3QXT0JRjTR+h95AtsSqMJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="56739365"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="56739365"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 21:07:47 -0800
X-CSE-ConnectionGUID: IHw5MQjNRkmwo6j8BE25lw==
X-CSE-MsgGUID: 50fZA8/xQq2MT0FE422Dvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95527820"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Dec 2024 21:07:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLEwo-0006Iz-2S;
	Wed, 11 Dec 2024 05:07:42 +0000
Date: Wed, 11 Dec 2024 13:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.14] BUILD
 SUCCESS 5b192d06f381ed5508851f1d47768c2e2f8fbcad
Message-ID: <202412111343.8N9i2v82-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.14
branch HEAD: 5b192d06f381ed5508851f1d47768c2e2f8fbcad  ARM: shmobile: defconfig: Refresh for v6.13-rc1

elapsed time: 987m

configs tested: 154
configs skipped: 116

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                   randconfig-001-20241211    gcc-14.2.0
arc                   randconfig-002-20241211    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                        keystone_defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                            qcom_defconfig    gcc-14.2.0
arm                   randconfig-001-20241210    clang-20
arm                   randconfig-001-20241211    gcc-14.2.0
arm                   randconfig-002-20241210    gcc-14.2.0
arm                   randconfig-002-20241211    gcc-14.2.0
arm                   randconfig-003-20241210    clang-20
arm                   randconfig-003-20241211    gcc-14.2.0
arm                   randconfig-004-20241210    clang-20
arm                   randconfig-004-20241211    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241210    clang-20
arm64                 randconfig-001-20241211    gcc-14.2.0
arm64                 randconfig-002-20241210    clang-20
arm64                 randconfig-002-20241211    gcc-14.2.0
arm64                 randconfig-003-20241210    clang-20
arm64                 randconfig-003-20241211    gcc-14.2.0
arm64                 randconfig-004-20241210    clang-20
arm64                 randconfig-004-20241211    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241211    gcc-14.2.0
csky                  randconfig-002-20241211    gcc-14.2.0
hexagon                           allnoconfig    gcc-14.2.0
hexagon               randconfig-001-20241211    gcc-14.2.0
hexagon               randconfig-002-20241211    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241211    clang-19
i386        buildonly-randconfig-002-20241211    clang-19
i386        buildonly-randconfig-003-20241211    clang-19
i386        buildonly-randconfig-004-20241211    clang-19
i386        buildonly-randconfig-005-20241211    clang-19
i386        buildonly-randconfig-006-20241211    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241211    gcc-12
i386                  randconfig-002-20241211    gcc-12
i386                  randconfig-003-20241211    gcc-12
i386                  randconfig-004-20241211    gcc-12
i386                  randconfig-005-20241211    gcc-12
i386                  randconfig-006-20241211    gcc-12
i386                  randconfig-007-20241211    gcc-12
i386                  randconfig-011-20241211    gcc-12
i386                  randconfig-012-20241211    gcc-12
i386                  randconfig-013-20241211    gcc-12
i386                  randconfig-014-20241211    gcc-12
i386                  randconfig-015-20241211    gcc-12
i386                  randconfig-016-20241211    gcc-12
i386                  randconfig-017-20241211    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241211    gcc-14.2.0
loongarch             randconfig-002-20241211    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                        maltaup_defconfig    gcc-14.2.0
nios2                 randconfig-001-20241211    gcc-14.2.0
nios2                 randconfig-002-20241211    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241211    gcc-14.2.0
parisc                randconfig-002-20241211    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                       eiger_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241211    gcc-14.2.0
powerpc               randconfig-002-20241211    gcc-14.2.0
powerpc               randconfig-003-20241211    gcc-14.2.0
powerpc64             randconfig-001-20241211    gcc-14.2.0
powerpc64             randconfig-002-20241211    gcc-14.2.0
powerpc64             randconfig-003-20241211    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                 randconfig-001-20241211    clang-20
riscv                 randconfig-002-20241211    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-14.2.0
s390                  randconfig-001-20241211    clang-20
s390                  randconfig-002-20241211    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20241211    clang-20
sh                    randconfig-002-20241211    clang-20
sh                          rsk7203_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20241211    clang-20
sparc                 randconfig-002-20241211    clang-20
sparc64               randconfig-001-20241211    clang-20
sparc64               randconfig-002-20241211    clang-20
um                                allnoconfig    clang-20
um                    randconfig-001-20241211    clang-20
um                    randconfig-002-20241211    clang-20
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241211    gcc-12
x86_64      buildonly-randconfig-002-20241211    gcc-12
x86_64      buildonly-randconfig-003-20241211    gcc-12
x86_64      buildonly-randconfig-004-20241211    gcc-12
x86_64      buildonly-randconfig-005-20241211    gcc-12
x86_64      buildonly-randconfig-006-20241211    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241211    clang-19
x86_64                randconfig-002-20241211    clang-19
x86_64                randconfig-003-20241211    clang-19
x86_64                randconfig-004-20241211    clang-19
x86_64                randconfig-005-20241211    clang-19
x86_64                randconfig-006-20241211    clang-19
x86_64                randconfig-007-20241211    clang-19
x86_64                randconfig-008-20241211    clang-19
x86_64                randconfig-071-20241211    clang-19
x86_64                randconfig-072-20241211    clang-19
x86_64                randconfig-073-20241211    clang-19
x86_64                randconfig-074-20241211    clang-19
x86_64                randconfig-075-20241211    clang-19
x86_64                randconfig-076-20241211    clang-19
x86_64                randconfig-077-20241211    clang-19
x86_64                randconfig-078-20241211    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241211    clang-20
xtensa                randconfig-002-20241211    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

