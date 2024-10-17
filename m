Return-Path: <linux-renesas-soc+bounces-9810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED36C9A1CAF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 10:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A11DB2849E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 08:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BE21C1AB1;
	Thu, 17 Oct 2024 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCWzcgwM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1C41D63E4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Oct 2024 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729152608; cv=none; b=fIwDOytrMNLdUkyBHAkChLgfvIuFc58sl+XFTLQE8LkszQI87TXBVoawoQldi1iIT/bP7wID5gTGYtIS7H7v34RuSZQ6CTq/bXl36SjYd3Mc3AXUWA6y7ZVlpRwTfJiiaSBIlKQY09xK6Mve/xv/qOnqqd8UfZuSm/slAZGrru0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729152608; c=relaxed/simple;
	bh=QdGykWpN2CnRWvlENdyar8B7UNJzUcJUHjZ6SF2Dv74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VGoMBvhmX9QmYyx7/7fNGYa63tyrDrqZ0x1fV5qSAl4nPtM3oeEet9R1VdhsiMMecbhXk48i+nERo2zQBicKjdmF+VlxHtLcmAoNxRhrXHONTVdMz5gjmHF6HpBa5zTp0XOFDcsCt64wHEPf8KBUHh/gZmaTm1GOVnR6tUyhTUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iCWzcgwM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729152607; x=1760688607;
  h=date:from:to:cc:subject:message-id;
  bh=QdGykWpN2CnRWvlENdyar8B7UNJzUcJUHjZ6SF2Dv74=;
  b=iCWzcgwMGobxd6QvKYeihgsPe7qQVKnHwUknumdDw8bKkedifoUwMmPn
   Hfr6nx+9jy1LkgnhebvcHNrqjSe0jIwINQFSXd0tuUQWWHfea1V2aEyXw
   CgZPELWFOwvo5OK8JS+PnRF1TZXB+XOT2Arbh6KDi/bOLnnK92FrIROjE
   CLvliH+b+ya5M5V72Ck1FSivXjd2C5Jcn3y4kYPPtRWkz6BqJ9PPJCZdr
   9BzOVAYWnjtqtwR8igL7yojWmNZgyHZN2IDWtS5NEhFlxh5kAnlr8heEO
   moy/yDDNWQlEinoiuRT4E+aqwOXe/+q2BIfR2NF2DVtRbN+TO1ZsDGj+c
   w==;
X-CSE-ConnectionGUID: WVMEbwG9SwOFtdZvZHte/w==
X-CSE-MsgGUID: HLBcCPLGSJipL4TBl1A7KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28510073"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="28510073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 01:10:07 -0700
X-CSE-ConnectionGUID: qfdZoFpATcaJMD0BTE89rQ==
X-CSE-MsgGUID: PRNu1snFRce4OLMKMYWECA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78508877"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Oct 2024 01:10:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1La7-000Lvp-1x;
	Thu, 17 Oct 2024 08:10:03 +0000
Date: Thu, 17 Oct 2024 16:09:20 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 ba98a369a15432bf8d9b8e079b37982f66da7c82
Message-ID: <202410171612.zRV74YhV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: ba98a369a15432bf8d9b8e079b37982f66da7c82  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 2607m

configs tested: 107
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241017    clang-18
i386        buildonly-randconfig-002-20241017    clang-18
i386        buildonly-randconfig-003-20241017    clang-18
i386        buildonly-randconfig-004-20241017    clang-18
i386        buildonly-randconfig-005-20241017    clang-18
i386        buildonly-randconfig-006-20241017    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241017    clang-18
i386                  randconfig-002-20241017    clang-18
i386                  randconfig-003-20241017    clang-18
i386                  randconfig-004-20241017    clang-18
i386                  randconfig-005-20241017    clang-18
i386                  randconfig-006-20241017    clang-18
i386                  randconfig-011-20241017    clang-18
i386                  randconfig-012-20241017    clang-18
i386                  randconfig-013-20241017    clang-18
i386                  randconfig-014-20241017    clang-18
i386                  randconfig-015-20241017    clang-18
i386                  randconfig-016-20241017    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
powerpc                           allnoconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241017    gcc-12
x86_64      buildonly-randconfig-002-20241017    gcc-12
x86_64      buildonly-randconfig-003-20241017    gcc-12
x86_64      buildonly-randconfig-004-20241017    gcc-12
x86_64      buildonly-randconfig-005-20241017    gcc-12
x86_64      buildonly-randconfig-006-20241017    gcc-12
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                randconfig-001-20241017    gcc-12
x86_64                randconfig-002-20241017    gcc-12
x86_64                randconfig-003-20241017    gcc-12
x86_64                randconfig-004-20241017    gcc-12
x86_64                randconfig-005-20241017    gcc-12
x86_64                randconfig-006-20241017    gcc-12
x86_64                randconfig-011-20241017    gcc-12
x86_64                randconfig-012-20241017    gcc-12
x86_64                randconfig-013-20241017    gcc-12
x86_64                randconfig-014-20241017    gcc-12
x86_64                randconfig-015-20241017    gcc-12
x86_64                randconfig-016-20241017    gcc-12
x86_64                randconfig-071-20241017    gcc-12
x86_64                randconfig-072-20241017    gcc-12
x86_64                randconfig-073-20241017    gcc-12
x86_64                randconfig-074-20241017    gcc-12
x86_64                randconfig-075-20241017    gcc-12
x86_64                randconfig-076-20241017    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

