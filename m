Return-Path: <linux-renesas-soc+bounces-22472-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F116BBABC65
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 09:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC2783B18A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 07:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E543594A;
	Tue, 30 Sep 2025 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3RMBQ3J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC49D2BE041
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 07:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759216456; cv=none; b=qt6OPjm5b6A7bHY2/LuwpSBe6kQlEPnhqvXxIRyPjBTu/R5/p39rrppSTugxR8DnruCZwBH/Ddv8VYa0Xg6lx/+DDnRymHA82kaR8Q/nF07zDyt/+5ZaHdyuSjuslEVZvijlFs2MzRX6CgL+EDpco7ca2eu6rKAkjfv47SeJGT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759216456; c=relaxed/simple;
	bh=j1DIupi5O/vHXNRa1oQEzjkNoZEZwh+OXSZaa23wql0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=THyWl9J8pj8xqwX/96T/C/NmcWFRLRkuWK30oUgbjFbH01u9DRdxGhCAEoHTgoOCXpRCiabWeL6nl45ykG1KcFVboJ4wUuAO26LKxi283OFgPR3QF7WaIPjU6OKjM4ukqy8huIME20H4SjMpVjmuaUqzUj/3s+w/MOkIXSp//7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3RMBQ3J; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759216454; x=1790752454;
  h=date:from:to:cc:subject:message-id;
  bh=j1DIupi5O/vHXNRa1oQEzjkNoZEZwh+OXSZaa23wql0=;
  b=X3RMBQ3JrC1YqZeUQv9KzxjvZqQr812KDPwUV8potzlRXuYcHbKkQc0W
   spOKFmcLCcRheqzJ76QsX+wTjeDNiJJceg+np5XNqHLx3FgYgsx7CUsXj
   Y4TteGeUadbQMwNyrnim+TiEpTYyb0q1qJ4KhoegCERVzxSBf46nFX65r
   Gz8nf92DlznGTdb/llymwNRUuVfKLOQEVHmGsWUH47X/4k5sqq6K0pnYu
   WoFePARrlOgk18xjHoi63W2jridytsCUuQV4NeuUjCr9c89GVrxeqKRfl
   Z538dEIpZGPSwW5ciyzBuVxOwyC8LaEUs4vocZBeIfqHEz98xJlOSV5aw
   A==;
X-CSE-ConnectionGUID: CBu+eEtBRciP2B8Bz5TWgg==
X-CSE-MsgGUID: omepWZqoTOSynCEVVa3Nrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="71712852"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="71712852"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 00:14:13 -0700
X-CSE-ConnectionGUID: Hp5OY+ufT0CZ9erFJCht1A==
X-CSE-MsgGUID: pivvbu6sR2GXNM//qUZkGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="182728752"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Sep 2025 00:14:11 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3UYr-0000zl-0Z;
	Tue, 30 Sep 2025 07:14:09 +0000
Date: Tue, 30 Sep 2025 15:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 65df7254d5f637ccd6718a90cf78dc5f62afabd2
Message-ID: <202509301506.yB76mg1M-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 65df7254d5f637ccd6718a90cf78dc5f62afabd2  Merge tag 'v6.17' into topic/renesas-defconfig

elapsed time: 1246m

configs tested: 213
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250929    gcc-8.5.0
arc                   randconfig-001-20250930    gcc-10.5.0
arc                   randconfig-002-20250929    gcc-8.5.0
arc                   randconfig-002-20250930    gcc-10.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   randconfig-001-20250929    gcc-8.5.0
arm                   randconfig-001-20250930    gcc-10.5.0
arm                   randconfig-002-20250929    gcc-14.3.0
arm                   randconfig-002-20250930    gcc-10.5.0
arm                   randconfig-003-20250929    clang-22
arm                   randconfig-003-20250930    gcc-10.5.0
arm                   randconfig-004-20250929    gcc-10.5.0
arm                   randconfig-004-20250930    gcc-10.5.0
arm                       spear13xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250929    gcc-8.5.0
arm64                 randconfig-001-20250930    gcc-10.5.0
arm64                 randconfig-002-20250929    gcc-13.4.0
arm64                 randconfig-002-20250930    gcc-10.5.0
arm64                 randconfig-003-20250929    clang-22
arm64                 randconfig-003-20250930    gcc-10.5.0
arm64                 randconfig-004-20250929    clang-22
arm64                 randconfig-004-20250930    gcc-10.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250929    gcc-9.5.0
csky                  randconfig-002-20250929    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250929    clang-22
hexagon               randconfig-002-20250929    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250929    gcc-14
i386        buildonly-randconfig-001-20250930    clang-20
i386        buildonly-randconfig-002-20250929    clang-20
i386        buildonly-randconfig-002-20250930    clang-20
i386        buildonly-randconfig-003-20250929    gcc-14
i386        buildonly-randconfig-003-20250930    clang-20
i386        buildonly-randconfig-004-20250929    gcc-14
i386        buildonly-randconfig-004-20250930    clang-20
i386        buildonly-randconfig-005-20250929    gcc-14
i386        buildonly-randconfig-005-20250930    clang-20
i386        buildonly-randconfig-006-20250929    gcc-14
i386        buildonly-randconfig-006-20250930    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250930    gcc-14
i386                  randconfig-002-20250930    gcc-14
i386                  randconfig-003-20250930    gcc-14
i386                  randconfig-004-20250930    gcc-14
i386                  randconfig-005-20250930    gcc-14
i386                  randconfig-006-20250930    gcc-14
i386                  randconfig-007-20250930    gcc-14
i386                  randconfig-011-20250930    gcc-14
i386                  randconfig-012-20250930    gcc-14
i386                  randconfig-013-20250930    gcc-14
i386                  randconfig-014-20250930    gcc-14
i386                  randconfig-015-20250930    gcc-14
i386                  randconfig-016-20250930    gcc-14
i386                  randconfig-017-20250930    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250929    gcc-12.5.0
loongarch             randconfig-002-20250929    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    clang-22
mips                           xway_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250929    gcc-11.5.0
nios2                 randconfig-002-20250929    gcc-9.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250929    gcc-14.3.0
parisc                randconfig-002-20250929    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 mpc837x_rdb_defconfig    clang-22
powerpc               randconfig-001-20250929    gcc-15.1.0
powerpc               randconfig-002-20250929    gcc-8.5.0
powerpc               randconfig-003-20250929    gcc-13.4.0
powerpc64             randconfig-001-20250929    clang-18
powerpc64             randconfig-002-20250929    clang-22
powerpc64             randconfig-003-20250929    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250929    gcc-9.5.0
riscv                 randconfig-002-20250929    gcc-11.5.0
s390                             alldefconfig    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250929    gcc-11.5.0
s390                  randconfig-002-20250929    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250929    gcc-15.1.0
sh                    randconfig-002-20250929    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250929    gcc-8.5.0
sparc                 randconfig-002-20250929    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250929    clang-22
sparc64               randconfig-002-20250929    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250929    gcc-14
um                    randconfig-002-20250929    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250929    gcc-14
x86_64      buildonly-randconfig-001-20250930    gcc-14
x86_64      buildonly-randconfig-002-20250929    gcc-14
x86_64      buildonly-randconfig-002-20250930    gcc-14
x86_64      buildonly-randconfig-003-20250929    clang-20
x86_64      buildonly-randconfig-003-20250930    gcc-14
x86_64      buildonly-randconfig-004-20250929    gcc-14
x86_64      buildonly-randconfig-004-20250930    gcc-14
x86_64      buildonly-randconfig-005-20250929    gcc-14
x86_64      buildonly-randconfig-005-20250930    gcc-14
x86_64      buildonly-randconfig-006-20250929    gcc-14
x86_64      buildonly-randconfig-006-20250930    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250930    clang-20
x86_64                randconfig-002-20250930    clang-20
x86_64                randconfig-003-20250930    clang-20
x86_64                randconfig-004-20250930    clang-20
x86_64                randconfig-005-20250930    clang-20
x86_64                randconfig-006-20250930    clang-20
x86_64                randconfig-007-20250930    clang-20
x86_64                randconfig-008-20250930    clang-20
x86_64                randconfig-071-20250930    gcc-12
x86_64                randconfig-072-20250930    gcc-12
x86_64                randconfig-073-20250930    gcc-12
x86_64                randconfig-074-20250930    gcc-12
x86_64                randconfig-075-20250930    gcc-12
x86_64                randconfig-076-20250930    gcc-12
x86_64                randconfig-077-20250930    gcc-12
x86_64                randconfig-078-20250930    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250929    gcc-8.5.0
xtensa                randconfig-002-20250929    gcc-13.4.0
xtensa                    smp_lx200_defconfig    clang-22
xtensa                    xip_kc705_defconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

