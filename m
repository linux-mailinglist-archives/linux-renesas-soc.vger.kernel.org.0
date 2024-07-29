Return-Path: <linux-renesas-soc+bounces-7611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 130289401DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 01:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4431282FFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 23:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DC4145B24;
	Mon, 29 Jul 2024 23:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDzBoVvK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07A31E49E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 23:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722297552; cv=none; b=oEwiKg7kRfOLRzMzcIXEFuLeUzjbFC+AJL+zj9kG5DgCub8HNKuyzktaQl7QrJ9ww1P0JFCyCvne+NVa9NFumX9uunD9ixHGKhClMxKQZwSdcbIJwrZMCCjcKzGE4i9JAuGD04c/r5SjsC0+bm7e0WCcX2MUc+KQvlybXeo13a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722297552; c=relaxed/simple;
	bh=JeP2u8dkezxW5TrVqCO4ECcox7ZHmY/IQh/5j/HajKU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CSh5tew7cZSmqWZJeD8YogkUvYP18LaIzsFhH1wiLhidIaPUTfof8Gy6xPcHzigOH5vlfS0qM6JQoX2RCyS7lPYAwvkzjYuumi5P15rq9ZwXhj3FOLZb5Jclcc8xCWrBY5MPuCn+WpF0DTT6QloX+IdU4ugRWkcYhj5AFLoVUmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDzBoVvK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722297551; x=1753833551;
  h=date:from:to:cc:subject:message-id;
  bh=JeP2u8dkezxW5TrVqCO4ECcox7ZHmY/IQh/5j/HajKU=;
  b=NDzBoVvKeieR4Kg3PsIwVUdVh1mGWNnUjnoxMDIUXHoCnrJQWeDfxLCH
   qTZi7DEobf4r3Fdg7OiPSnnjk0ckL1AjreZo9BDmN5R6ExThr0BJ0UwYq
   XpFoICT3/m+49VsfGVDxqacsvDORh7aYnD++O/UvIwQ9qzsL+D4lbqz9J
   BWE2YYc4t4sEDt2A5PeTz14isnF3WrcdpD3kbgVcnSn+2TlN1W+hIelIh
   5D+R8ts3I6JzbSKx8Ufjdu0DNj2Hn49YfyQ1cOrUufaPH9lt9OAoT7fy6
   ScsrjcLT9f1Hne1IKj2zY1hjor0sVdLBtoT3UBrTqTSZ7Vj8ke5SR0eca
   g==;
X-CSE-ConnectionGUID: akueK0XJRVeBvQ7Xx+2iyA==
X-CSE-MsgGUID: n6e/U3aXQOy/rwkLK1oZ+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23878226"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="23878226"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 16:59:11 -0700
X-CSE-ConnectionGUID: 9d3pT3loSRualLI5U0D8Mw==
X-CSE-MsgGUID: 8y78s1nkQaSqeHLNYvmXJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="91637052"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jul 2024 16:59:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYaGh-000sCb-0S;
	Mon, 29 Jul 2024 23:59:07 +0000
Date: Tue, 30 Jul 2024 07:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.12] BUILD
 SUCCESS 4200161c564da91eefe8eeea1151a537290319c7
Message-ID: <202407300740.fO3TG8az-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.12
branch HEAD: 4200161c564da91eefe8eeea1151a537290319c7  arm64: defconfig: Enable AK4619 codec support

elapsed time: 732m

configs tested: 76
configs skipped: 158

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240730   gcc-14.1.0
arm64                 randconfig-002-20240730   clang-20
arm64                 randconfig-003-20240730   clang-20
arm64                 randconfig-004-20240730   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240730   gcc-13
i386         buildonly-randconfig-002-20240730   gcc-13
i386         buildonly-randconfig-003-20240730   gcc-13
i386         buildonly-randconfig-004-20240730   gcc-13
i386         buildonly-randconfig-005-20240730   gcc-13
i386         buildonly-randconfig-006-20240730   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240730   gcc-13
i386                  randconfig-002-20240730   gcc-13
i386                  randconfig-003-20240730   gcc-13
i386                  randconfig-004-20240730   gcc-13
i386                  randconfig-005-20240730   gcc-13
i386                  randconfig-006-20240730   gcc-13
i386                  randconfig-011-20240730   gcc-13
i386                  randconfig-012-20240730   gcc-13
i386                  randconfig-013-20240730   gcc-13
i386                  randconfig-014-20240730   gcc-13
i386                  randconfig-015-20240730   gcc-13
i386                  randconfig-016-20240730   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                                defconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                                allnoconfig   gcc-14.1.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

