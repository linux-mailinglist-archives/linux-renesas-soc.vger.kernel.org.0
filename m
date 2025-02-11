Return-Path: <linux-renesas-soc+bounces-13034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEBBA3026D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 05:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F2043A3761
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 04:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E6D35962;
	Tue, 11 Feb 2025 04:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMOuHeG9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56078488
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 04:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739246708; cv=none; b=VSOEry9RxdU4+d9lzL1l/873W33X8HDcp3R22uVIQcfLuqqCdElv03kx/Eq+YuoaBbIovcVIM1nPC1MUTZ18AMk5lDtwD8MnLwp4d8UfA3jjkzGpQIdR1zdrSotd7etue9mf8iQgBVOPBsTwAFSVdwmro+hGelA1HrsBKMay5OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739246708; c=relaxed/simple;
	bh=n1m/6SvpnlRQNqtQKnvoxjSwUF3sWBGd6+dTCpmneSo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PLZdJHcjd4rAhsQ4eMa6gY1fZf5Gqz9vF1usE0TvmUwe5dq8ArTyvfmrYnYuYctaaRmcVrmj37jjuN5eSyXcK0G+B6NEeXJrPMQ1xfDrlxQNUbWpt3b46+/GYtFnYL1dz2dmG/bn2AQX3fpcaVUKD0PiImVXWdQYeSVCKlBAPno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMOuHeG9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739246706; x=1770782706;
  h=date:from:to:cc:subject:message-id;
  bh=n1m/6SvpnlRQNqtQKnvoxjSwUF3sWBGd6+dTCpmneSo=;
  b=lMOuHeG9E5W18CCIV30F4DhKBHVTWwjOgXSDv9iITC5okfPuOsr3uyeD
   Jv9vvguTrnZmeS8Majh4Zs7f79K5/HsR7jmx4GLRC6Z4PcHorjBp3+BAN
   022WYlezwpXSeqShdtcXMcXUgHvs9327MEOkmR+XjxydQ0g31iDO2gjk6
   ZE1tiy+XSmqcWzX6ZH6mt/SbRjYHHpF+YJeS1/8ks6HYP3JCU9B/4tR+z
   AYK+tiwWfhF/RrSixHA1F+AQLQqy/5x2U/hzaDFPhvdIwMBTN4oOK9GAx
   rj6ZXlBqmBeQp74+92Z/8yUFQjRYRBXh8yFiU705psuzsYBE8xk50Vj5R
   Q==;
X-CSE-ConnectionGUID: nN4ZrY+/RLGjr2oPEBSTzw==
X-CSE-MsgGUID: nU6I8+AESNGftUTpGI20Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="51245282"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="51245282"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 20:05:05 -0800
X-CSE-ConnectionGUID: kKZziF9KQg+r33VhSd/0Wg==
X-CSE-MsgGUID: eo5jkSluRoGVvXHft7V5jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117005533"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Feb 2025 20:05:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thhW9-0013kg-25;
	Tue, 11 Feb 2025 04:05:01 +0000
Date: Tue, 11 Feb 2025 12:04:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 231c17e981fb135fe7ab0771cada597d09d580ef
Message-ID: <202502111252.hM1rPzWe-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 231c17e981fb135fe7ab0771cada597d09d580ef  Merge branches 'renesas-dt-bindings-for-v6.15' and 'renesas-dts-for-v6.15' into renesas-next

elapsed time: 1106m

configs tested: 105
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-13.2.0
arc                   randconfig-001-20250210    gcc-13.2.0
arc                   randconfig-002-20250210    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250210    clang-16
arm                   randconfig-002-20250210    gcc-14.2.0
arm                   randconfig-003-20250210    clang-16
arm                   randconfig-004-20250210    gcc-14.2.0
arm                             rpc_defconfig    clang-17
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250210    gcc-14.2.0
arm64                 randconfig-002-20250210    clang-21
arm64                 randconfig-003-20250210    clang-21
arm64                 randconfig-004-20250210    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250210    gcc-14.2.0
csky                  randconfig-002-20250210    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250210    clang-21
hexagon               randconfig-002-20250210    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250210    gcc-12
i386        buildonly-randconfig-002-20250210    gcc-12
i386        buildonly-randconfig-003-20250210    clang-19
i386        buildonly-randconfig-004-20250210    gcc-12
i386        buildonly-randconfig-005-20250210    gcc-12
i386        buildonly-randconfig-006-20250210    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250210    gcc-14.2.0
loongarch             randconfig-002-20250210    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250210    gcc-14.2.0
nios2                 randconfig-002-20250210    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250210    gcc-14.2.0
parisc                randconfig-002-20250210    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250210    clang-21
powerpc               randconfig-002-20250210    clang-21
powerpc               randconfig-003-20250210    gcc-14.2.0
powerpc64             randconfig-001-20250210    gcc-14.2.0
powerpc64             randconfig-002-20250210    gcc-14.2.0
powerpc64             randconfig-003-20250210    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250210    clang-21
riscv                 randconfig-002-20250210    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250210    gcc-14.2.0
s390                  randconfig-002-20250210    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250210    gcc-14.2.0
sh                    randconfig-002-20250210    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250210    gcc-14.2.0
sparc                 randconfig-002-20250210    gcc-14.2.0
sparc64               randconfig-001-20250210    gcc-14.2.0
sparc64               randconfig-002-20250210    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250210    clang-18
um                    randconfig-002-20250210    clang-16
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250210    clang-19
x86_64      buildonly-randconfig-002-20250210    gcc-12
x86_64      buildonly-randconfig-003-20250210    clang-19
x86_64      buildonly-randconfig-004-20250210    clang-19
x86_64      buildonly-randconfig-005-20250210    clang-19
x86_64      buildonly-randconfig-006-20250210    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250210    gcc-14.2.0
xtensa                randconfig-002-20250210    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

