Return-Path: <linux-renesas-soc+bounces-11696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4159FB9C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Dec 2024 07:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EBC6161E5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Dec 2024 06:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB5B4438B;
	Tue, 24 Dec 2024 06:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTECzGBd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FA91E517
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Dec 2024 06:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735021067; cv=none; b=KyYD4weEmPCCwhk/TzB/QSdj2IygF+ZdHsiGEGwiXBG2x13O1J0nWvvSOk71Cr/nBzCRsamSCR+n+n04ju7kEx3NdCf8BAR9ooqdX5nkQ4YoE1USxqYYHGkX83PdMYb2zsosviJ1X5aB+KZrMn2Ir2e/dDyP1ZrBeluMYKuFxLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735021067; c=relaxed/simple;
	bh=WPi8fH6PTrIS72vnepAeWXTgR6T+OD026lRoa4cuChM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R0mu3qR8jdN9KX+RL4HAhO929aVIeFuNGWt/o3z7ikDQDx05rS19jhPLDpYhEzNEbW3DAztubu576Krusgg7c4A0ph5e+afYU5TWmfJtBKGxI/s2rKsOnxfJomktrcjZWu2tPojfPEVT6CGDw96KK0GoPNrQ28YeRvttq2RDRo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTECzGBd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735021065; x=1766557065;
  h=date:from:to:cc:subject:message-id;
  bh=WPi8fH6PTrIS72vnepAeWXTgR6T+OD026lRoa4cuChM=;
  b=RTECzGBdHUfVk6E/6u5UP0a9lANVIP7qkn8In+gAj/POAGgd/LkQW05P
   p7bi8pRcQ6ywqUUxNqL91MIvi1SqAaRSASBO3TnkgHbIYJNNmabQzwI8S
   GNsLADfXRW6RxIp4lOjet7MvL200WOsqlv5jp8WUqOjquY3JPeTz1+Uav
   V7I6uF+Uh5VNKsWa1ad+YctpbDQCTu5MN3xbwwpwGUAlCrD9aJMScDnED
   SKyi1ttID/08r6Q79vGsoqMokQYw+b35GE6hC+UHhfpafEKq6Fh/E89AS
   r3VItzvdTkdGos5c8C0bCgztvVRTNZQnA5uzuBvCrD50yu/Uyvq/9et6Z
   A==;
X-CSE-ConnectionGUID: V8zrTclKSdOK+eelCi3CAA==
X-CSE-MsgGUID: Q4DQWZbiQlmsTfINZUQvJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46175091"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="46175091"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 22:17:44 -0800
X-CSE-ConnectionGUID: SDIeU79kQJWSoWMwvGP4Sg==
X-CSE-MsgGUID: XXDSXMt7SzSKSwCsIfCWkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99880537"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Dec 2024 22:17:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPyEf-0000uZ-0C;
	Tue, 24 Dec 2024 06:17:41 +0000
Date: Tue, 24 Dec 2024 14:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 6e4c3012f4ecfc5b22bc587cbdd5c5062bbdaf1f
Message-ID: <202412241458.Hcc74kRj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 6e4c3012f4ecfc5b22bc587cbdd5c5062bbdaf1f  Merge tag 'v6.13-rc4' into renesas-devel

elapsed time: 1129m

configs tested: 211
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20241223    gcc-13.2.0
arc                   randconfig-002-20241223    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                            mmp2_defconfig    gcc-14.2.0
arm                             pxa_defconfig    gcc-14.2.0
arm                   randconfig-001-20241223    gcc-14.2.0
arm                   randconfig-002-20241223    clang-16
arm                   randconfig-003-20241223    clang-20
arm                   randconfig-004-20241223    gcc-14.2.0
arm                        spear3xx_defconfig    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241223    gcc-14.2.0
arm64                 randconfig-002-20241223    clang-18
arm64                 randconfig-003-20241223    gcc-14.2.0
arm64                 randconfig-004-20241223    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241223    gcc-14.2.0
csky                  randconfig-002-20241223    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241223    clang-19
hexagon               randconfig-002-20241223    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241223    clang-19
i386        buildonly-randconfig-002-20241223    clang-19
i386        buildonly-randconfig-003-20241223    clang-19
i386        buildonly-randconfig-004-20241223    gcc-12
i386        buildonly-randconfig-005-20241223    clang-19
i386        buildonly-randconfig-006-20241223    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241224    clang-19
i386                  randconfig-002-20241224    clang-19
i386                  randconfig-003-20241224    clang-19
i386                  randconfig-004-20241224    clang-19
i386                  randconfig-005-20241224    clang-19
i386                  randconfig-006-20241224    clang-19
i386                  randconfig-007-20241224    clang-19
i386                  randconfig-011-20241224    gcc-12
i386                  randconfig-012-20241224    gcc-12
i386                  randconfig-013-20241224    gcc-12
i386                  randconfig-014-20241224    gcc-12
i386                  randconfig-015-20241224    gcc-12
i386                  randconfig-016-20241224    gcc-12
i386                  randconfig-017-20241224    gcc-12
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241223    gcc-14.2.0
loongarch             randconfig-002-20241223    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-18
mips                          eyeq5_defconfig    gcc-14.2.0
mips                           ip27_defconfig    gcc-14.2.0
mips                      maltaaprp_defconfig    clang-20
mips                           mtx1_defconfig    clang-20
nios2                            allmodconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                            allyesconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241223    gcc-14.2.0
nios2                 randconfig-002-20241223    gcc-14.2.0
openrisc                         allmodconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241223    gcc-14.2.0
parisc                randconfig-002-20241223    gcc-14.2.0
parisc64                            defconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      katmai_defconfig    clang-18
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241223    clang-18
powerpc               randconfig-002-20241223    clang-16
powerpc               randconfig-003-20241223    clang-20
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241223    gcc-14.2.0
powerpc64             randconfig-002-20241223    clang-18
powerpc64             randconfig-003-20241223    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241223    clang-20
riscv                 randconfig-002-20241223    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241223    clang-20
s390                  randconfig-002-20241223    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20241223    gcc-14.2.0
sh                    randconfig-002-20241223    gcc-14.2.0
sh                          rsk7203_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                            allyesconfig    gcc-14.2.0
sparc                 randconfig-001-20241223    gcc-14.2.0
sparc                 randconfig-002-20241223    gcc-14.2.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                          allmodconfig    gcc-14.2.0
sparc64                          allyesconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241223    gcc-14.2.0
sparc64               randconfig-002-20241223    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241223    clang-16
um                    randconfig-002-20241223    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241223    gcc-12
x86_64      buildonly-randconfig-002-20241223    clang-19
x86_64      buildonly-randconfig-003-20241223    clang-19
x86_64      buildonly-randconfig-004-20241223    gcc-12
x86_64      buildonly-randconfig-005-20241223    gcc-12
x86_64      buildonly-randconfig-006-20241223    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241224    clang-19
x86_64                randconfig-002-20241224    clang-19
x86_64                randconfig-003-20241224    clang-19
x86_64                randconfig-004-20241224    clang-19
x86_64                randconfig-005-20241224    clang-19
x86_64                randconfig-006-20241224    clang-19
x86_64                randconfig-007-20241224    clang-19
x86_64                randconfig-008-20241224    clang-19
x86_64                randconfig-071-20241224    clang-19
x86_64                randconfig-072-20241224    clang-19
x86_64                randconfig-073-20241224    clang-19
x86_64                randconfig-074-20241224    clang-19
x86_64                randconfig-075-20241224    clang-19
x86_64                randconfig-076-20241224    clang-19
x86_64                randconfig-077-20241224    clang-19
x86_64                randconfig-078-20241224    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                           allyesconfig    gcc-14.2.0
xtensa                randconfig-001-20241223    gcc-14.2.0
xtensa                randconfig-002-20241223    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

