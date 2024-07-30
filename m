Return-Path: <linux-renesas-soc+bounces-7612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAFE940255
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 02:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75E431C22907
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 00:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F9A138E;
	Tue, 30 Jul 2024 00:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhctMXuW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078DF9460
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 00:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722299414; cv=none; b=nAM1Apb9bUQqugTPyuE0P7OJBoduz99wzxSbo+t/wuXUGPzlPLulxnSpSd1yNcBZDJUNuncMuJydKlYTvMh3HM2Kbb2xinswkeVON0nlTdHbTTV72YTSJnipVTqq2V1xwVqqFQSbGGaOdwSV4tiSwJ6Jmt57eDFbLawUuUspKT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722299414; c=relaxed/simple;
	bh=J0vjTnz2NuSuDSWAaPOW+NbTPAK3EsuVcAvUJTqeY/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lftkAxQwtcPA0/HIEW4acQFELJ2tIoYf9PyDIRUnz0tMqvf/FGy5dl9MJHhOT+Dlk3F3oDMQqAU41/wB/OobjfrXMyOv1vQONkBi6O4NthtxRrQbH5rOLtssXgG9r1dkFUBL0dqKpfTYi2QYBB83muPOPdMxOK/plMjY8r2LQ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhctMXuW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722299412; x=1753835412;
  h=date:from:to:cc:subject:message-id;
  bh=J0vjTnz2NuSuDSWAaPOW+NbTPAK3EsuVcAvUJTqeY/I=;
  b=FhctMXuW8gK9CZj0lWu5xwiYIxgzygV7DmGtypXW6iDJCHknbdP7dP5z
   27QAsaP01cw/N/geRz88QKjkRXpZX9ZWgRYMdtXnGlfD4csXnaXl7NgT2
   w0u4qLofPT/XI3Sz9pfTAkxlzdCtDwPBoCbRQrN1C0NP5k0V3QhHP4gs+
   RLtnDnqStkevKp24gWBogf8gZUyb4jUiJkvUEkx66I8JrQbR69eINs5Ck
   /nlJHAsvhBiculFz8MwoQeuY1Cbn/ajcVIcH8E1ZuVMBWZpgZL0RzNiIN
   Q4F/EzhcWPIiAubgdkscGwzfhDKtPMLKZ9SwUdwqyx/mWbR2LDeI6CQ4j
   Q==;
X-CSE-ConnectionGUID: t0IF+3x6Sg6BOAbmINCz5A==
X-CSE-MsgGUID: 7BeRo3v3Req0ArstmE71xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19930822"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="19930822"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 17:30:11 -0700
X-CSE-ConnectionGUID: U7ufCODbR0K9nlGyExgQYg==
X-CSE-MsgGUID: hI8Zx3jRTLKMrb+TERRykg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54738266"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Jul 2024 17:30:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYaki-000sEV-1N;
	Tue, 30 Jul 2024 00:30:08 +0000
Date: Tue, 30 Jul 2024 08:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.12] BUILD SUCCESS
 1200525fbc958a045e71e986ee7542739542d767
Message-ID: <202407300849.E6dLUsll-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.12
branch HEAD: 1200525fbc958a045e71e986ee7542739542d767  arm64: dts: renesas: gray-hawk-single: Add GP LEDs

elapsed time: 762m

configs tested: 86
configs skipped: 114

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.3.0
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            dove_defconfig   gcc-13.3.0
arm                      integrator_defconfig   gcc-13.3.0
arm                         nhk8815_defconfig   gcc-13.3.0
arm                        shmobile_defconfig   gcc-13.3.0
arm                       spear13xx_defconfig   gcc-13.3.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
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
mips                        qi_lb60_defconfig   gcc-13.3.0
nios2                         10m50_defconfig   gcc-13.3.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-64bit_defconfig   gcc-13.3.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                       eiger_defconfig   gcc-13.3.0
powerpc                 mpc834x_itx_defconfig   gcc-13.3.0
powerpc                     rainier_defconfig   gcc-13.3.0
powerpc                     tqm5200_defconfig   gcc-13.3.0
powerpc                     tqm8541_defconfig   gcc-13.3.0
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                                defconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-13.3.0
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

