Return-Path: <linux-renesas-soc+bounces-24588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A4BC59374
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 18:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C24383A5659
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 17:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814542727F3;
	Thu, 13 Nov 2025 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Azm8JOFJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B51B23D7D0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763053424; cv=none; b=UzxLqKgRRQmESkW0HmTFjtBB/fuQ3qvcXAjTJU0oxEfybyfXqviKhis45ibhB2yyi57GV91ggnyG8AoiYQFvXRQ6kpEl+sMRC3BL4ovjbt3UK3zLYsVH/ap0MjyfjKDHqcMYR21GC0RT45MLvDKDIFoNGwryFEfbl5p2xQ+KXg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763053424; c=relaxed/simple;
	bh=JHhbB829jjztkkyytYyDPZh84R98eJkBVHL+3tOUjnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qi7Q34TfZ3quTPDFv2C5AGueSFNuTeD/CFRsijDrvlE2BzkFQoOjekfDDCrfR6WXw8uxmPVuvTDyPTWp95HtcMQUqU5DljjACpH+VZecJQb9QybyilXt441g6HFnCprUQXTC613EzH5AFh9ZuSozZD3F8oYEML7o9TErxtdJKzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Azm8JOFJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763053423; x=1794589423;
  h=date:from:to:cc:subject:message-id;
  bh=JHhbB829jjztkkyytYyDPZh84R98eJkBVHL+3tOUjnQ=;
  b=Azm8JOFJKbPAZWLeOVk5EMDINB0v7CEvv+lp1wr7oUFAwmBsULxHjv3H
   0tIwnwSVPQvjl/Ru5u70KUcpiTtdi+ov8fk//LHQSf47mV/l9lkobX+dk
   SwBfeWrn3m0yefzuLzk7iJskKyqcce4I06ZQLQvbtrsyRPppsyDuCiG+w
   f12y/7JDOin3UTWlf20bHUBO5uKEtOGWBuLkTXvcw3iuv/JU0HpOz50G9
   lbXJbcm+zntJ27VgmH+m342YQMSagUeQguYJfeP59KP7QwNkdM49PJuPh
   gfyLm6eHtcat/BS0HrnqOpaSpZttF0DFbgQ7DNfVopwYFkYtgvt/tC5cr
   Q==;
X-CSE-ConnectionGUID: pYGx2iZSTvSzf+D+7DMlQA==
X-CSE-MsgGUID: uK9z3sJSTyO0ZL34S2SQ9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69006969"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="69006969"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 09:03:42 -0800
X-CSE-ConnectionGUID: +/tYo7AjSoiCbc7EIHJf6w==
X-CSE-MsgGUID: 3+gxQ1D2SGiOAESPiL+sQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="212949083"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2025 09:03:40 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJajS-0005d5-20;
	Thu, 13 Nov 2025 17:03:38 +0000
Date: Fri, 14 Nov 2025 01:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 6d56e1c3ccef35c3454f2aa6da13cef7cf041a87
Message-ID: <202511140106.VaEx2KC9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 6d56e1c3ccef35c3454f2aa6da13cef7cf041a87  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1762m

configs tested: 108
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251113    gcc-8.5.0
arc                   randconfig-002-20251113    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251113    gcc-10.5.0
arm                   randconfig-002-20251113    clang-22
arm                   randconfig-003-20251113    clang-22
arm                   randconfig-004-20251113    clang-22
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251113    clang-16
arm64                 randconfig-002-20251113    clang-22
arm64                 randconfig-003-20251113    gcc-8.5.0
arm64                 randconfig-004-20251113    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251113    gcc-9.5.0
csky                  randconfig-002-20251113    gcc-14.3.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251113    clang-22
hexagon               randconfig-002-20251113    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251113    clang-20
i386        buildonly-randconfig-002-20251113    gcc-14
i386        buildonly-randconfig-003-20251113    gcc-14
i386        buildonly-randconfig-004-20251113    gcc-12
i386        buildonly-randconfig-005-20251113    gcc-14
i386                  randconfig-001-20251113    gcc-14
i386                  randconfig-002-20251113    clang-20
i386                  randconfig-003-20251113    clang-20
i386                  randconfig-004-20251113    gcc-14
i386                  randconfig-005-20251113    clang-20
i386                  randconfig-006-20251113    clang-20
i386                  randconfig-007-20251113    gcc-14
i386                  randconfig-012-20251113    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251113    gcc-15.1.0
loongarch             randconfig-002-20251113    clang-22
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251113    gcc-8.5.0
nios2                 randconfig-002-20251113    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251113    gcc-8.5.0
parisc                randconfig-002-20251113    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc                      ppc6xx_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251113    clang-22
powerpc               randconfig-002-20251113    clang-22
powerpc64             randconfig-001-20251113    clang-22
powerpc64             randconfig-002-20251113    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251113    gcc-8.5.0
riscv                 randconfig-002-20251113    gcc-11.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251113    clang-22
s390                  randconfig-002-20251113    clang-17
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251113    gcc-15.1.0
sh                    randconfig-002-20251113    gcc-11.5.0
sh                           se7206_defconfig    gcc-15.1.0
sh                        sh7785lcr_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251113    gcc-8.5.0
sparc                 randconfig-002-20251113    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251113    clang-20
sparc64               randconfig-002-20251113    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251113    gcc-14
um                    randconfig-002-20251113    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251113    gcc-14
x86_64      buildonly-randconfig-002-20251113    clang-20
x86_64      buildonly-randconfig-003-20251113    clang-20
x86_64      buildonly-randconfig-004-20251113    gcc-14
x86_64      buildonly-randconfig-005-20251113    gcc-12
x86_64      buildonly-randconfig-006-20251113    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20251113    gcc-14
x86_64                randconfig-072-20251113    gcc-12
x86_64                randconfig-073-20251113    gcc-12
x86_64                randconfig-074-20251113    gcc-14
x86_64                randconfig-075-20251113    gcc-14
x86_64                randconfig-076-20251113    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251113    gcc-15.1.0
xtensa                randconfig-002-20251113    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

