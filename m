Return-Path: <linux-renesas-soc+bounces-5798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 539B88FA8ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 06:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B81F2B225C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 04:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0183D62;
	Tue,  4 Jun 2024 04:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKkfsxRL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5587A38B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Jun 2024 04:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717473735; cv=none; b=fXEaX646rmMQS8XyBcas0Ri7lqlxNmNhAj0uLsGicgsnW9RDo3x7XBH53+Ndiegqlnsmb8d/jsXLEj+t2xyiTa2gvy8+5sqzucgnG7g1Dm6Q8zcacXwmQH73T7NlbpDHlREzyHXbTMCUSAjQ9vruFya3f42M/iiBWRfbS9r1Vig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717473735; c=relaxed/simple;
	bh=y2MbT5IaKSzrJWbvuOppuC4/iF277MR0X+qBpXZXS+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aoVIWVPq0yCjevV0iTaOv2XeAPSupqSw7PBs3uuAhxaSGiic6X+6bSiEitavfuxalmU072JVV2+BrP9ugNMBZ7xagHxQKfKbwMdL5kRIF4uDvAcS2ZW42ahTLh8HtKFQNx03UKBRIY/TOLO6YeJ+kexMKban7K0v+jcztJdJ0wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKkfsxRL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717473733; x=1749009733;
  h=date:from:to:cc:subject:message-id;
  bh=y2MbT5IaKSzrJWbvuOppuC4/iF277MR0X+qBpXZXS+4=;
  b=IKkfsxRLhh2iBfEC5qGN8OVaRA6ubhaKwnVdxR9d/hvbUAS0JpIf4OXV
   wURnm7dCsKgZJaaFhhVvns2eMlpeFzOaM61Ac1K65i6/uwrBEDIRvofXr
   5+bgcUqn89y71ivkTniEfqaDvP+X5X3wvaUcu4/8753L3BqlHSa9bsu+i
   neHNh+800mGn/LEVmUTIyBZJMG7t0Iu1oEK3gXiMIYrHbtmB3uaPXNlZG
   0BUMMWIpiX1GT8Mt5kZq32FOSjmoODAOF18Fkkaa0xpx41Opju94HejfG
   fTaPyHr5b3V64aXAx8WJBByCxRRD07cQip08vs0mgvsJN3dggUGQWVJ/J
   A==;
X-CSE-ConnectionGUID: pocUmQA4QsyOqBHoTTb74g==
X-CSE-MsgGUID: u+c1/bcGR2evXrsYwCpCQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="31496780"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="31496780"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 21:02:13 -0700
X-CSE-ConnectionGUID: S37RmOz1StCG2HKnzliTtg==
X-CSE-MsgGUID: c5+TDmMoSjCJlVx7ovelHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37160096"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 03 Jun 2024 21:02:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sELNB-000MXv-28;
	Tue, 04 Jun 2024 04:02:09 +0000
Date: Tue, 04 Jun 2024 12:02:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.11] BUILD
 SUCCESS 4b45a978b25da1d4de051ed8e91e669e3701d780
Message-ID: <202406041202.RCNtebRe-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.11
branch HEAD: 4b45a978b25da1d4de051ed8e91e669e3701d780  arm64: defconfig: Enable Marvell 88Q2XXX PHY support

elapsed time: 1104m

configs tested: 124
configs skipped: 142

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240603   gcc  
arc                   randconfig-002-20240603   gcc  
arm                   randconfig-001-20240603   gcc  
arm                   randconfig-002-20240603   gcc  
arm                   randconfig-003-20240603   gcc  
arm                   randconfig-004-20240603   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240603   gcc  
arm64                 randconfig-002-20240603   gcc  
arm64                 randconfig-004-20240603   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240603   gcc  
csky                  randconfig-002-20240603   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-003-20240603   gcc  
i386         buildonly-randconfig-004-20240603   gcc  
i386         buildonly-randconfig-005-20240603   gcc  
i386                                defconfig   clang
i386                  randconfig-002-20240603   gcc  
i386                  randconfig-003-20240603   gcc  
i386                  randconfig-006-20240603   gcc  
i386                  randconfig-016-20240603   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240603   gcc  
loongarch             randconfig-002-20240603   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240603   gcc  
nios2                 randconfig-002-20240603   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240603   gcc  
parisc                randconfig-002-20240603   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       holly_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc               randconfig-001-20240603   gcc  
powerpc               randconfig-002-20240603   gcc  
powerpc               randconfig-003-20240603   gcc  
powerpc64             randconfig-001-20240603   gcc  
powerpc64             randconfig-002-20240603   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
s390                             allyesconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240603   gcc  
sh                    randconfig-002-20240603   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240603   gcc  
sparc64               randconfig-002-20240603   gcc  
um                               alldefconfig   clang
um                               allmodconfig   clang
um                               allyesconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-002-20240603   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240604   clang
x86_64       buildonly-randconfig-002-20240604   clang
x86_64       buildonly-randconfig-004-20240604   clang
x86_64       buildonly-randconfig-006-20240604   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240604   clang
x86_64                randconfig-011-20240604   clang
x86_64                randconfig-012-20240604   clang
x86_64                randconfig-013-20240604   clang
x86_64                randconfig-014-20240604   clang
x86_64                randconfig-015-20240604   clang
x86_64                randconfig-016-20240604   clang
x86_64                randconfig-071-20240604   clang
x86_64                randconfig-074-20240604   clang
x86_64                randconfig-075-20240604   clang
x86_64                randconfig-076-20240604   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240603   gcc  
xtensa                randconfig-002-20240603   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

