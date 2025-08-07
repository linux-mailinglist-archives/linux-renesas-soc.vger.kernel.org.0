Return-Path: <linux-renesas-soc+bounces-20074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EE2B1D186
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 06:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43EC8189D548
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 04:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C314199FB0;
	Thu,  7 Aug 2025 04:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VdCQLAio"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B5C15624D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Aug 2025 04:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754541300; cv=none; b=rUNDwjK6tIZLxlbPAe/QW7GbfZU+FgBHkOxOoPJnq/RmiAETj/ZRUW2qIn0cd1Ig3zG0HWcbVp4JGqWVcf96VlBQChH8xFv3cFl3KCQD/tZHb/PSU9lEW4j/uAdLTMbFVAc2+IESY7nzyQ3liDymCzGs63ic077Qq2hlrTzXC9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754541300; c=relaxed/simple;
	bh=7IKKdD5+9vq1ID+HKEap+w2lhVEuBAO2w0jtHa7BreU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rEL+Y1uBrIdAPOsY8mSmF9HyYh7qhBZhpMkk5SFYmkhOR1A2NPInUi5v3eER7ddEfk4bmxRIS3c/w/R/drAWnTuh70BZNrKbJuoQz3JyUBitqdH5NKt2P54swbIfFEDMOTY90KqzA5fQTZ34bA5banlk6dMl6+UWbDY6FUj9S88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VdCQLAio; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754541298; x=1786077298;
  h=date:from:to:cc:subject:message-id;
  bh=7IKKdD5+9vq1ID+HKEap+w2lhVEuBAO2w0jtHa7BreU=;
  b=VdCQLAioZd4hREvTqWhUtWtbfTzkW24m0Y5ZiBmdj85aG4Zto5bHw+lZ
   hFzaz8uEDtb7c5uX9JJXJ5Iv82YsT8V7NUe97ivIN9A2a1JDCvR2FOREi
   jwZj8MxD4B86V/i1rOKCscTLZEsWddcaotAttbRA+ZK8MEkpZOQK3NFFm
   qCfOhz8VVtugRvwSR2OAF9TwgEDtTHHO8BMTincHiuKPRDI49IZSGrTcH
   uJaZmHnbbtMd3bFnvP+LUpAcvZdolAGXRzjmVWI5eXu2b4iPgpecPnn/f
   haKsFdhaN0AHnYcMBFkqZ2njoINdArVl0i3sBmf8YUY25PwvwiC2trPmJ
   A==;
X-CSE-ConnectionGUID: 7ZFx7J29SzyEKfifOF0O+g==
X-CSE-MsgGUID: I4mj3tlnShW9Y35K/NB5fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60677347"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60677347"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 21:34:58 -0700
X-CSE-ConnectionGUID: 31C3BlWnSaibFbz5DW3mNg==
X-CSE-MsgGUID: gg7vCLhuS3eKUu4e1D5rew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164477665"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2025 21:34:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujsL8-0002N4-2i;
	Thu, 07 Aug 2025 04:34:54 +0000
Date: Thu, 07 Aug 2025 12:34:28 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.18] BUILD
 SUCCESS 24b1a5e815942c39dd6cd864b1bc814ac5f97a98
Message-ID: <202508071218.7IZ4pYrg-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.18
branch HEAD: 24b1a5e815942c39dd6cd864b1bc814ac5f97a98  arm64: defconfig: Enable the RZ/V2H(P) RSPI driver

elapsed time: 732m

configs tested: 72
configs skipped: 117

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
arc                               allnoconfig    clang-22
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         axm55xx_defconfig    clang-22
arm                      jornada720_defconfig    clang-22
arm                   randconfig-001-20250807    clang-22
arm                   randconfig-002-20250807    gcc-10.5.0
arm                   randconfig-003-20250807    clang-22
arm                   randconfig-004-20250807    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250807    gcc-8.5.0
arm64                 randconfig-002-20250807    gcc-8.5.0
arm64                 randconfig-003-20250807    clang-22
arm64                 randconfig-004-20250807    gcc-14.3.0
csky                              allnoconfig    clang-22
csky                                defconfig    clang-22
hexagon                           allnoconfig    clang-22
i386        buildonly-randconfig-001-20250807    gcc-12
i386        buildonly-randconfig-002-20250807    gcc-12
i386        buildonly-randconfig-003-20250807    gcc-12
i386        buildonly-randconfig-004-20250807    gcc-12
i386        buildonly-randconfig-005-20250807    gcc-12
i386        buildonly-randconfig-006-20250807    gcc-12
i386                  randconfig-001-20250807    gcc-12
i386                  randconfig-002-20250807    gcc-12
i386                  randconfig-003-20250807    gcc-12
i386                  randconfig-004-20250807    gcc-12
i386                  randconfig-005-20250807    gcc-12
i386                  randconfig-006-20250807    gcc-12
i386                  randconfig-007-20250807    gcc-12
loongarch                         allnoconfig    clang-22
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                            alldefconfig    clang-22
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                    amigaone_defconfig    clang-22
powerpc                       ppc64_defconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                    nommu_virt_defconfig    clang-22
s390                              allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                           se7721_defconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
um                                allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20250807    gcc-11
x86_64      buildonly-randconfig-002-20250807    gcc-11
x86_64      buildonly-randconfig-003-20250807    gcc-11
x86_64      buildonly-randconfig-004-20250807    gcc-11
x86_64      buildonly-randconfig-005-20250807    gcc-11
x86_64      buildonly-randconfig-006-20250807    gcc-11
x86_64                randconfig-001-20250807    gcc-12
x86_64                randconfig-002-20250807    gcc-12
x86_64                randconfig-003-20250807    gcc-12
x86_64                randconfig-004-20250807    gcc-12
x86_64                randconfig-005-20250807    gcc-12
x86_64                randconfig-006-20250807    gcc-12
x86_64                randconfig-007-20250807    gcc-12
x86_64                randconfig-008-20250807    gcc-12
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

