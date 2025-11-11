Return-Path: <linux-renesas-soc+bounces-24466-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B58A5C4EEEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 17:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9AB53A56D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 16:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4943659F3;
	Tue, 11 Nov 2025 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjmjt+IR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC61E2D9780
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 16:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762877155; cv=none; b=K3oxmrDGZeu4aa7RZpIXoQuH7DUOcW3N4uT+vipAKEvmJkGUH02Z9cDhb9V7ZtF5w5Ud2wpTGPAB5r/8hbRNKuIZ75H1uLTH0YOHqPQuxbYQDy7WpMzWI3K+PSC5pxTHjjAySaM93fseCdYNw0WjzJ4EWogQSgx4x6VFoS51Y1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762877155; c=relaxed/simple;
	bh=p2j7qlSLGRTynsi24GKUHCoG0uydcL0gc8wS57ZnLew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NNw6K6HCIrMHaiY5aLhNP1CY8ufM/WuhPg6ROjUmY79ACfMKZpGi9ywB1F24QmUM+kKlo5cOoupLYu7b2umZ0FmyYb2gPtFbI9TMkQBj0OKZs9DfGFd7IQushyl0+aqAMBk834qcVIttcWJfCYDEWiLzl61iQmB5NEV971wCBb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjmjt+IR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762877154; x=1794413154;
  h=date:from:to:cc:subject:message-id;
  bh=p2j7qlSLGRTynsi24GKUHCoG0uydcL0gc8wS57ZnLew=;
  b=bjmjt+IRUAqZOSitNKAYA9lSrwvyih8SSRIsYnAgz267LWsf9W1NRwDq
   CLeTj6r3bTmlnzOefCtvZ9VR0TPq8VL8UdSHOVDdCKa8h9+5EASTNNyia
   zLtxmGItwrfXgiXOdJ+CEaKz5KOpu2JKBpfcoqx4veKyIClUnXtm/VRzI
   xt1Icffd3lOKqpiwMqq6szdl5uZdA7svBB8H80ZqZ3q/yJrbJ+8u3En88
   jMPbkI7Cz1TgiLIPbuSmRCT4PKswCo6djhI0NufRyiFgvocxSz+uKCA5V
   l4/RjchX2xO3299I46i4eNFRvt0ZrQts/Vme2Cl5gCzECSJ2jWNVMvyx+
   g==;
X-CSE-ConnectionGUID: YIldNhELRKKDjUybmGQaDQ==
X-CSE-MsgGUID: 8T+X5CusS7uqnq3cGuC23g==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="87571047"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="87571047"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 08:05:53 -0800
X-CSE-ConnectionGUID: bUwvUASFSzmSMaV3evrAuA==
X-CSE-MsgGUID: ovX76dCfT6+74OhxkJnh0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="189725356"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Nov 2025 08:05:52 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIqsQ-0003L1-12;
	Tue, 11 Nov 2025 16:05:50 +0000
Date: Wed, 12 Nov 2025 00:05:40 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 dd30a345f284e0d9b1755e3538f8257cf4deb79f
Message-ID: <202511120034.JZgddWA6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: dd30a345f284e0d9b1755e3538f8257cf4deb79f  Merge branch 'renesas-next', tag 'v6.18-rc5' into renesas-devel

elapsed time: 1760m

configs tested: 101
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251111    gcc-11.5.0
arc                   randconfig-002-20251111    gcc-12.5.0
arm                               allnoconfig    clang-22
arm                            hisi_defconfig    gcc-15.1.0
arm                         orion5x_defconfig    clang-22
arm                   randconfig-001-20251111    clang-22
arm                   randconfig-002-20251111    clang-17
arm                   randconfig-003-20251111    clang-22
arm                   randconfig-004-20251111    gcc-10.5.0
arm                           tegra_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251111    clang-22
arm64                 randconfig-002-20251111    gcc-11.5.0
arm64                 randconfig-003-20251111    clang-16
arm64                 randconfig-004-20251111    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251111    gcc-15.1.0
csky                  randconfig-002-20251111    gcc-15.1.0
hexagon                           allnoconfig    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251111    clang-20
i386        buildonly-randconfig-002-20251111    gcc-14
i386        buildonly-randconfig-003-20251111    gcc-14
i386        buildonly-randconfig-004-20251111    gcc-14
i386        buildonly-randconfig-005-20251111    gcc-14
i386        buildonly-randconfig-006-20251111    gcc-12
i386                  randconfig-001-20251111    gcc-14
i386                  randconfig-002-20251111    gcc-14
i386                  randconfig-003-20251111    gcc-14
i386                  randconfig-004-20251111    clang-20
i386                  randconfig-005-20251111    clang-20
i386                  randconfig-006-20251111    gcc-14
i386                  randconfig-007-20251111    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5208evb_defconfig    gcc-15.1.0
m68k                          multi_defconfig    gcc-15.1.0
microblaze                       alldefconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251111    gcc-9.5.0
parisc                randconfig-002-20251111    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251111    gcc-8.5.0
powerpc               randconfig-002-20251111    clang-22
powerpc64             randconfig-002-20251111    gcc-12.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251110    clang-22
riscv                 randconfig-002-20251110    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251110    gcc-8.5.0
s390                  randconfig-002-20251110    gcc-8.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251110    gcc-15.1.0
sh                    randconfig-002-20251110    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251111    gcc-11.5.0
sparc                 randconfig-002-20251111    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251111    clang-22
sparc64               randconfig-002-20251111    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251111    clang-19
um                    randconfig-002-20251111    clang-20
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251111    gcc-14
x86_64      buildonly-randconfig-002-20251111    clang-20
x86_64      buildonly-randconfig-003-20251111    gcc-14
x86_64      buildonly-randconfig-004-20251111    gcc-14
x86_64      buildonly-randconfig-005-20251111    gcc-14
x86_64      buildonly-randconfig-006-20251111    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20251111    gcc-14
x86_64                randconfig-072-20251111    clang-20
x86_64                randconfig-073-20251111    gcc-14
x86_64                randconfig-074-20251111    gcc-14
x86_64                randconfig-075-20251111    gcc-14
x86_64                randconfig-076-20251111    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251111    gcc-12.5.0
xtensa                randconfig-002-20251111    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

