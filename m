Return-Path: <linux-renesas-soc+bounces-8624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AEB9693A8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 08:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E281284526
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 06:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDC21CEACD;
	Tue,  3 Sep 2024 06:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsaV36oB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A05CA5F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 06:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725344997; cv=none; b=VLhOZrxlvZkNJczwP8bMA+1n2lmBV9zZNpBUiC16F49js48uhzTedXRgwsqmA7zhDauRnWa3ZHp+uecnqzUEUSDUKDqZD5+fIl9yhQnCnQFPFuDbD/2T/5aON7Ax4pNWLnm2yb0741z1+xyGi1feY7z1fz98tOZjTHHPkYVTkmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725344997; c=relaxed/simple;
	bh=n2H8+7ZuiTsXIpKb2s4ZmRWSqSRlFWkx9X9SgRe0cDM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NCPlSpkEJT2ttCKerMDxYUUUSwLx5R839NLaqokY7kmm632lueWYLUfSMq5qz44WlL6XTg3lcNu3vA2m6lhBiqjLn9KQJxCwyKFY9jeOAdWCnetCVz8oNHmYWu4YPffr0Q1xa8NJj3aVHgmRKBLrWvzsuf/KMdFFEnvmb6rgXJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsaV36oB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725344996; x=1756880996;
  h=date:from:to:cc:subject:message-id;
  bh=n2H8+7ZuiTsXIpKb2s4ZmRWSqSRlFWkx9X9SgRe0cDM=;
  b=HsaV36oB73FZDD3rlj1QDhRtgfIruzwBlp8YkrQgSUpnnGnGcbTfW5z/
   q48TDSX4scAbDFWa35UZxiEa6K6hVB+naDiN2Hk0jO7SShXWaAKAFfYse
   xtmooJ98BLqYtGeZBad/sv4hx71j872LF+lUVYYiTnm/82ATzXeI3W07Y
   CDyDWzzuLOkqqC9ZAlf5Cc5r8mVKJtts+ZU9R05zgGMzqCU+dguzz4a/v
   EGofuRnfsMtt+kiRsA37Pc8hJWDgv3bGfU4SySfQqha9GqJZsQyqYtFoo
   7pYjfMeqN+gps1P/hmRgtc0cVa5hosk3BqzJjelT8jegrYrf3gRZ6durF
   A==;
X-CSE-ConnectionGUID: estxWJOxR4+PoQbly9RGTg==
X-CSE-MsgGUID: IhXlhkwoSMi1OVt9OaRiBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41419610"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="41419610"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 23:27:46 -0700
X-CSE-ConnectionGUID: RzfHCNwiS9eKSFup8IMMwg==
X-CSE-MsgGUID: PQAiYBZyTYS4Nmc2h/wJpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="65157557"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Sep 2024 23:27:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slN0v-0006J0-2g;
	Tue, 03 Sep 2024 06:27:41 +0000
Date: Tue, 03 Sep 2024 14:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.12] BUILD SUCCESS
 686bba2a17f43ddc68596a88850e6407c4829d67
Message-ID: <202409031439.nFTUCXxX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.12
branch HEAD: 686bba2a17f43ddc68596a88850e6407c4829d67  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable watchdog

elapsed time: 1195m

configs tested: 94
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240903   gcc-12
i386         buildonly-randconfig-002-20240903   gcc-12
i386         buildonly-randconfig-003-20240903   gcc-12
i386         buildonly-randconfig-004-20240903   gcc-12
i386         buildonly-randconfig-005-20240903   gcc-12
i386         buildonly-randconfig-006-20240903   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240903   gcc-12
i386                  randconfig-002-20240903   gcc-12
i386                  randconfig-003-20240903   gcc-12
i386                  randconfig-004-20240903   gcc-12
i386                  randconfig-005-20240903   gcc-12
i386                  randconfig-006-20240903   gcc-12
i386                  randconfig-011-20240903   gcc-12
i386                  randconfig-012-20240903   gcc-12
i386                  randconfig-013-20240903   gcc-12
i386                  randconfig-014-20240903   gcc-12
i386                  randconfig-015-20240903   gcc-12
i386                  randconfig-016-20240903   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

