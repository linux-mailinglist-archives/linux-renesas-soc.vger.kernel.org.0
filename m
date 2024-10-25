Return-Path: <linux-renesas-soc+bounces-10165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD069B1349
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2024 01:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6DB528386B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 23:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C491B81DC;
	Fri, 25 Oct 2024 23:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZTB9QqCt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EC9157E99
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Oct 2024 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729899220; cv=none; b=g3J1eOaDNLK+MrqWhBxBQGBIjW0T9zESou3SwuZKdnhEBQz9DQLOy9d4ybtD5kbizjEvTQdfgkm6Pu2lMIzD6uRBByZ9ZfSZa/0nT+EO/5ZCoBAHtStkrc7IATHgQaavB7xv9Uc3eUGj7xKdRCGyGN0vCuhuudmj4w9e+bsAN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729899220; c=relaxed/simple;
	bh=R6R04W1sw+Sajn9D+y56FOZwFu2BQ7ABHR9H6PZvej4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K5xTcBKUHdUJb+VJm+488Uaj1j/ZFZVmtEyDcy7Ga3onajT9TM9KyFBOGPEeztlwU/TgDMj9VQ084oUrmU90wO1ed4noO6Gmu0VFvp6gFcN4e2LF8Xh4E0+0aRCAZx9voMl3kWRBsdJaYVoQRbAnX7laJ+6QEztcEN1ayXTe2kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZTB9QqCt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729899218; x=1761435218;
  h=date:from:to:cc:subject:message-id;
  bh=R6R04W1sw+Sajn9D+y56FOZwFu2BQ7ABHR9H6PZvej4=;
  b=ZTB9QqCt0VhOvNYztI0WNXcOhtUAHvtfdK7QXQxx5AISiwmT932W1jTX
   qGUf562JZMIPvbJJf+8S3OnZORBx3BE07BTe+V/wE8QoXfR4jY2E6oMMi
   cGX6UeLoYOI/maLM25JDjg/w8wgEIucdLCxEixQw7bMcH/cxLns8yKopz
   5VW2uKdmwwI2wOSVWOPNmQ0Jw0dPvwfSF66myWSr+TXVJackaagaw8DGH
   DCZf98VvbvrrVRK79do75mN3ChG6aj3JYkxny3qsJZC5VznkAe0hDhyc0
   LTxytFC7Q+AF8cyyZZsFt9ieZnmhh7bv0OMWiBk9WAh6v1iUUBML4eRT5
   g==;
X-CSE-ConnectionGUID: R5gAodqjRtK3wBpPPQBZ0A==
X-CSE-MsgGUID: cRH1OrZeTASaG1sdCCM/VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40971475"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="40971475"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 16:33:38 -0700
X-CSE-ConnectionGUID: JZLR+AiCTUaneepIpP2ORw==
X-CSE-MsgGUID: jLJiz1G2THmWB58KwAoXdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="81509931"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Oct 2024 16:33:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4ToE-000Z1r-0y;
	Fri, 25 Oct 2024 23:33:34 +0000
Date: Sat, 26 Oct 2024 07:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 e200b06d8ecaa70798f45f815b2cac280a7c1b20
Message-ID: <202410260759.PCQH78am-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: e200b06d8ecaa70798f45f815b2cac280a7c1b20  clk: renesas: r9a08g045: Add power domain for RTC

elapsed time: 788m

configs tested: 96
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                 allnoconfig    gcc-14.1.0
alpha                allyesconfig    clang-20
alpha                   defconfig    gcc-14.1.0
arc                  allmodconfig    clang-20
arc                   allnoconfig    gcc-14.1.0
arc                  allyesconfig    clang-20
arc                     defconfig    gcc-14.1.0
arm                  allmodconfig    clang-20
arm                   allnoconfig    gcc-14.1.0
arm                  allyesconfig    clang-20
arm                     defconfig    gcc-14.1.0
arm              sp7021_defconfig    gcc-14.1.0
arm64                allmodconfig    clang-20
arm64                 allnoconfig    gcc-14.1.0
arm64                   defconfig    gcc-14.1.0
csky                  allnoconfig    gcc-14.1.0
csky                    defconfig    gcc-14.1.0
hexagon              allmodconfig    clang-20
hexagon               allnoconfig    gcc-14.1.0
hexagon              allyesconfig    clang-20
hexagon                 defconfig    gcc-14.1.0
i386                 allmodconfig    clang-19
i386                  allnoconfig    clang-19
i386                 allyesconfig    clang-19
i386                    defconfig    clang-19
loongarch            allmodconfig    gcc-14.1.0
loongarch             allnoconfig    gcc-14.1.0
loongarch               defconfig    gcc-14.1.0
m68k                 allmodconfig    gcc-14.1.0
m68k                  allnoconfig    gcc-14.1.0
m68k                 allyesconfig    gcc-14.1.0
m68k                    defconfig    gcc-14.1.0
microblaze           allmodconfig    gcc-14.1.0
microblaze            allnoconfig    gcc-14.1.0
microblaze           allyesconfig    gcc-14.1.0
microblaze              defconfig    gcc-14.1.0
mips                  allnoconfig    gcc-14.1.0
mips              eyeq6_defconfig    gcc-14.1.0
mips               ip28_defconfig    gcc-14.1.0
nios2                 allnoconfig    gcc-14.1.0
nios2                   defconfig    gcc-14.1.0
openrisc              allnoconfig    clang-20
openrisc              allnoconfig    gcc-14.1.0
openrisc             allyesconfig    gcc-14.1.0
openrisc                defconfig    gcc-12
parisc               allmodconfig    gcc-14.1.0
parisc                allnoconfig    clang-20
parisc                allnoconfig    gcc-14.1.0
parisc               allyesconfig    gcc-14.1.0
parisc                  defconfig    gcc-12
parisc64                defconfig    gcc-14.1.0
powerpc              allmodconfig    gcc-14.1.0
powerpc               allnoconfig    clang-20
powerpc               allnoconfig    gcc-14.1.0
powerpc              allyesconfig    gcc-14.1.0
powerpc       bluestone_defconfig    gcc-14.1.0
powerpc            fsp2_defconfig    gcc-14.1.0
powerpc         ksi8560_defconfig    gcc-14.1.0
powerpc         ppa8548_defconfig    gcc-14.1.0
powerpc          ppc44x_defconfig    gcc-14.1.0
powerpc     xes_mpc85xx_defconfig    gcc-14.1.0
riscv                allmodconfig    gcc-14.1.0
riscv                 allnoconfig    clang-20
riscv                 allnoconfig    gcc-14.1.0
riscv                allyesconfig    gcc-14.1.0
riscv                   defconfig    gcc-12
s390                 allmodconfig    gcc-14.1.0
s390                  allnoconfig    clang-20
s390                 allyesconfig    gcc-14.1.0
s390                    defconfig    gcc-12
sh                   alldefconfig    gcc-14.1.0
sh                   allmodconfig    gcc-14.1.0
sh                    allnoconfig    gcc-14.1.0
sh                   allyesconfig    gcc-14.1.0
sh             apsh4a3a_defconfig    gcc-14.1.0
sh                      defconfig    gcc-12
sh                hp6xx_defconfig    gcc-14.1.0
sh              r7785rp_defconfig    gcc-14.1.0
sh              rsk7264_defconfig    gcc-14.1.0
sparc                allmodconfig    gcc-14.1.0
sparc64                 defconfig    gcc-12
um                   allmodconfig    clang-20
um                    allnoconfig    clang-17
um                    allnoconfig    clang-20
um                   allyesconfig    clang-20
um                      defconfig    gcc-12
um                 i386_defconfig    gcc-12
um               x86_64_defconfig    gcc-12
x86_64                allnoconfig    clang-19
x86_64               allyesconfig    clang-19
x86_64                  defconfig    clang-19
x86_64                      kexec    clang-19
x86_64                      kexec    gcc-12
x86_64                   rhel-8.3    gcc-12
x86_64        rhel-8.3-kselftests    gcc-12
xtensa                allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

