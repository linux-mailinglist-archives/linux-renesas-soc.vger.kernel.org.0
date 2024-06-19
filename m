Return-Path: <linux-renesas-soc+bounces-6509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA19C90F5A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 20:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 237B828333A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 18:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA19F157A59;
	Wed, 19 Jun 2024 18:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxja9tQv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06914D8B4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2024 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718820037; cv=none; b=iaHrABUCsGmBaKo8obncuXTF32hakK9r7I22B5aZvJClFIgHgUMtnlr2/cdpe1XM26+3ogO0sFJ85Rf4NKM64g5NaKGX1dob3XalzhRKvyx/6ChKrpr7RmH76qajm+fyUDCQGuDl1/9bdotoDcV/GYaujEaRCFvtJKHDsB1anFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718820037; c=relaxed/simple;
	bh=UcpOqLYPZxWo66f7WEQG9Q+e/Ue21qMQ7CkTnNma2fs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cVapgJc5zfKc4P7U98l7viXvg20FBdGh5/8G/Ug6tVTPdsLcCFtDsZibjz9ubRNSlyKaGz4xJ/t/84bWv7F/MvBf3o3EEyoumRRLGoDjwdG0tG0lzBT8uWnUeHObakqkTCsY5RD6Zs72oGE1FPag5Q1/ohLW18rrnS3RACSmUuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxja9tQv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718820036; x=1750356036;
  h=date:from:to:cc:subject:message-id;
  bh=UcpOqLYPZxWo66f7WEQG9Q+e/Ue21qMQ7CkTnNma2fs=;
  b=nxja9tQvkxBC5O4fXwHFY83gGfkV72osdFZDZJbYRvuUUKdf/6e3kvA9
   YPAxoh54fz40Yct1Vx8lxq/hBqzEk8KkTTqutUBfUe4YbkTPLgyviwjF3
   Hs4uipJm9h3dqiVJxwU4EDipJDP1Y9sftWJ8kr8h54YlTNkwKoqDKccny
   Vwz5xYrTNgWu/jIr06vQZch/CNRQWZCGtt6jO8xmpcral5HJu6I45YioD
   f3UUvXT00XYBg4QgNdVkL+PM1c9YgpbiYZclh04+R1sLOKKTwLkGIMya/
   CH7jpT5kLysUKoruMGb0+kmvmKTtyPfPagstVW+nzMBMZQUUNDw6AoLWr
   Q==;
X-CSE-ConnectionGUID: FUWoYU8JTmeQ9AATKlcapA==
X-CSE-MsgGUID: kL41oFAoRFSLSvikQzfKsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15486210"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15486210"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 11:00:35 -0700
X-CSE-ConnectionGUID: K7XrFLZqRcmx3O/GpT7Ehw==
X-CSE-MsgGUID: bIPjpO/ZSAulM4ZjFsw/UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42691515"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jun 2024 11:00:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJzbj-0006qM-29;
	Wed, 19 Jun 2024 18:00:31 +0000
Date: Thu, 20 Jun 2024 02:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 d94f2b83d8f763608dc1f5c5cdd5e4d262663292
Message-ID: <202406200221.sG7Hpqne-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: d94f2b83d8f763608dc1f5c5cdd5e4d262663292  Merge tag 'v6.10-rc4' into renesas-devel

elapsed time: 3455m

configs tested: 117
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig   gcc-13.2.0
arc                              alldefconfig   gcc-13.2.0
arc                   randconfig-001-20240617   gcc-13.2.0
arc                   randconfig-002-20240617   gcc-13.2.0
arm                         axm55xx_defconfig   clang-19
arm                     davinci_all_defconfig   clang-19
arm                   randconfig-001-20240617   clang-19
arm                   randconfig-002-20240617   clang-19
arm                   randconfig-003-20240617   gcc-13.2.0
arm                   randconfig-004-20240617   gcc-13.2.0
arm                         s5pv210_defconfig   gcc-13.2.0
arm                           stm32_defconfig   gcc-13.2.0
arm                    vt8500_v6_v7_defconfig   gcc-13.2.0
arm64                 randconfig-001-20240617   clang-15
arm64                 randconfig-002-20240617   gcc-13.2.0
arm64                 randconfig-003-20240617   gcc-13.2.0
arm64                 randconfig-004-20240617   clang-15
csky                  randconfig-001-20240617   gcc-13.2.0
csky                  randconfig-002-20240617   gcc-13.2.0
hexagon               randconfig-001-20240617   clang-19
hexagon               randconfig-002-20240617   clang-14
i386         buildonly-randconfig-001-20240617   gcc-13
i386         buildonly-randconfig-002-20240617   gcc-9
i386         buildonly-randconfig-003-20240617   gcc-9
i386         buildonly-randconfig-004-20240617   clang-18
i386         buildonly-randconfig-005-20240617   clang-18
i386         buildonly-randconfig-006-20240617   clang-18
i386                  randconfig-001-20240617   clang-18
i386                  randconfig-002-20240617   clang-18
i386                  randconfig-003-20240617   gcc-11
i386                  randconfig-004-20240617   clang-18
i386                  randconfig-005-20240617   clang-18
i386                  randconfig-006-20240617   gcc-11
i386                  randconfig-011-20240617   clang-18
i386                  randconfig-012-20240617   gcc-13
i386                  randconfig-013-20240617   clang-18
i386                  randconfig-014-20240617   gcc-10
i386                  randconfig-015-20240617   gcc-13
i386                  randconfig-016-20240617   gcc-13
loongarch             randconfig-001-20240617   gcc-13.2.0
loongarch             randconfig-002-20240617   gcc-13.2.0
m68k                       m5475evb_defconfig   gcc-13.2.0
mips                          ath25_defconfig   clang-19
mips                      pic32mzda_defconfig   gcc-13.2.0
mips                           rs90_defconfig   gcc-13.2.0
nios2                 randconfig-001-20240617   gcc-13.2.0
nios2                 randconfig-002-20240617   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240617   gcc-13.2.0
parisc                randconfig-002-20240617   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                      katmai_defconfig   clang-19
powerpc                       maple_defconfig   clang-19
powerpc                    mvme5100_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240617   clang-19
powerpc               randconfig-002-20240617   clang-19
powerpc               randconfig-003-20240617   clang-19
powerpc                     tqm8540_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240617   clang-19
powerpc64             randconfig-002-20240617   gcc-13.2.0
powerpc64             randconfig-003-20240617   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240617   gcc-13.2.0
riscv                 randconfig-002-20240617   gcc-13.2.0
s390                              allnoconfig   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240617   clang-17
s390                  randconfig-002-20240617   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240617   gcc-13.2.0
sh                    randconfig-002-20240617   gcc-13.2.0
sh                              ul2_defconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240617   gcc-13.2.0
sparc64               randconfig-002-20240617   gcc-13.2.0
um                                allnoconfig   clang-17
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240617   clang-19
um                    randconfig-002-20240617   gcc-7
um                           x86_64_defconfig   clang-15
x86_64       buildonly-randconfig-001-20240617   gcc-13
x86_64       buildonly-randconfig-002-20240617   clang-18
x86_64       buildonly-randconfig-003-20240617   gcc-13
x86_64       buildonly-randconfig-004-20240617   gcc-13
x86_64       buildonly-randconfig-005-20240617   gcc-11
x86_64       buildonly-randconfig-006-20240617   clang-18
x86_64                randconfig-001-20240617   clang-18
x86_64                randconfig-002-20240617   gcc-8
x86_64                randconfig-003-20240617   gcc-13
x86_64                randconfig-004-20240617   clang-18
x86_64                randconfig-005-20240617   clang-18
x86_64                randconfig-006-20240617   gcc-13
x86_64                randconfig-011-20240617   clang-18
x86_64                randconfig-012-20240617   clang-18
x86_64                randconfig-013-20240617   clang-18
x86_64                randconfig-014-20240617   clang-18
x86_64                randconfig-015-20240617   clang-18
x86_64                randconfig-016-20240617   clang-18
x86_64                randconfig-071-20240617   gcc-9
x86_64                randconfig-072-20240617   clang-18
x86_64                randconfig-073-20240617   clang-18
x86_64                randconfig-074-20240617   clang-18
x86_64                randconfig-075-20240617   clang-18
x86_64                randconfig-076-20240617   gcc-13
xtensa                            allnoconfig   gcc-13.2.0
xtensa                       common_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240617   gcc-13.2.0
xtensa                randconfig-002-20240617   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

