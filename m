Return-Path: <linux-renesas-soc+bounces-6112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B309056E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 17:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15120281AD5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 15:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF94C1802AF;
	Wed, 12 Jun 2024 15:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnlU9JZy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B72017FADE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2024 15:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718206258; cv=none; b=shVhjH3pYAmSR1v+7NJmWPLCXSAPfxqn2xiVPMwxWiUWPcsfBKpLun0r4b2K1I9UuvBXH7jiG7wI5fYQQH0dTFsIwge15nzk4TuUZuq8tM51WkbmqDTRMmdnicgUY9evul/UUYh8qK46ZnGi3kynX8ty7nz1b9VFfjfRf78mXso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718206258; c=relaxed/simple;
	bh=ZmxFUceaQ/kuY5b/5Lmvl2xe7fzZtk8LPGfZGtC0Ric=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l2MsXTZPAusgxuupEZ8b0Jys4TKFpbEj4t61YFX/lAaxHNy846s9FIdKNikCBEe+kACxEZCR22rVNyl6RRRhpDy+Bke5bljCu5WoPSdVQL6BM+hPzTV9ykg+K3OE3ePmFWoNgAAvKEQZyxxqYkzOi/dTfmwLivq+QPo0ghiEgAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnlU9JZy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718206257; x=1749742257;
  h=date:from:to:cc:subject:message-id;
  bh=ZmxFUceaQ/kuY5b/5Lmvl2xe7fzZtk8LPGfZGtC0Ric=;
  b=CnlU9JZyOXumtxy+6Xir5BezsExTTusixqpNsAZt3V4/SZLqCD4CjT/e
   i76M/1C1eY/lxjpf8pf5JGHEnAoM9IWFfkhQMNs2mvVbIKaDlKa5gUBfZ
   VJvEtJnMGwrAzPSGJAj9CMs7bzvxxvMFfdBhzNbDU+qV2z6I9Z90yokX5
   nHoiRX0m7Mg3dpj+8jIHwPP5fKa2Wr4P/td9pTyO34mTf+0Ov7U33K9Jy
   9Gf1jx8j+UBydQOIwz++iIBDKXkFjOkBEelT4iEHKHcOPSiL19H2kU27s
   NOhLfWHnq8kXTkJFWWMOOxXRS4wpxJ/7wAHU36CtJo2ffHbf/1YHemH6p
   Q==;
X-CSE-ConnectionGUID: HqVwlGYpQeKwQbZNwz7Gxg==
X-CSE-MsgGUID: 2SQ9sx2vSjGvlt6ZLM0n0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15105453"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="15105453"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 08:30:56 -0700
X-CSE-ConnectionGUID: K26fJ3GmRaWVPZAgjGDNpg==
X-CSE-MsgGUID: YnU6l6R9RlSdjKqHcr/oRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="44260974"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2024 08:30:55 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHPw5-0001ev-1R;
	Wed, 12 Jun 2024 15:30:53 +0000
Date: Wed, 12 Jun 2024 23:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 fdbb3ef0d4aadf9a3374c2a892098be89e9a3abb
Message-ID: <202406122349.tjM55nWi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: fdbb3ef0d4aadf9a3374c2a892098be89e9a3abb  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202406120736.5AEAsytB-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202406120838.jD62wG3D-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpio/gpio-sloppy-logic-analyzer.c:316:12: error: incompatible function pointer types initializing 'void (*)(struct platform_device *)' with an expression of type 'int (struct platform_device *)' [-Wincompatible-function-pointer-types]
drivers/gpio/gpio-sloppy-logic-analyzer.c:316:19: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- arc-allmodconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- arc-allyesconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- arm-allmodconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- i386-allmodconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- i386-allyesconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- loongarch-allmodconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- mips-allyesconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- openrisc-allyesconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- parisc-allmodconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- parisc-allyesconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- powerpc-allmodconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- s390-allyesconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- sparc-allmodconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- sparc64-allmodconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
`-- sparc64-allyesconfig
    `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
clang_recent_errors
|-- hexagon-allmodconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- powerpc-allyesconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- riscv-allmodconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- riscv-allyesconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- s390-allmodconfig
|   `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
`-- x86_64-allyesconfig
    `-- drivers-gpio-gpio-sloppy-logic-analyzer.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)

elapsed time: 1491m

configs tested: 135
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240612   gcc-13.2.0
arc                   randconfig-002-20240612   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                                 defconfig   clang-14
arm                   randconfig-001-20240612   gcc-13.2.0
arm                   randconfig-002-20240612   gcc-13.2.0
arm                   randconfig-003-20240612   clang-19
arm                   randconfig-004-20240612   clang-14
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240612   gcc-13.2.0
arm64                 randconfig-002-20240612   gcc-13.2.0
arm64                 randconfig-003-20240612   gcc-13.2.0
arm64                 randconfig-004-20240612   clang-19
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240612   gcc-13.2.0
csky                  randconfig-002-20240612   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240612   clang-19
hexagon               randconfig-002-20240612   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240612   gcc-13
i386         buildonly-randconfig-002-20240612   gcc-8
i386         buildonly-randconfig-003-20240612   gcc-13
i386         buildonly-randconfig-004-20240612   clang-18
i386         buildonly-randconfig-005-20240612   gcc-13
i386         buildonly-randconfig-006-20240612   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240612   gcc-8
i386                  randconfig-002-20240612   clang-18
i386                  randconfig-003-20240612   clang-18
i386                  randconfig-004-20240612   clang-18
i386                  randconfig-005-20240612   gcc-13
i386                  randconfig-006-20240612   clang-18
i386                  randconfig-011-20240612   clang-18
i386                  randconfig-012-20240612   clang-18
i386                  randconfig-013-20240612   clang-18
i386                  randconfig-014-20240612   gcc-7
i386                  randconfig-015-20240612   gcc-13
i386                  randconfig-016-20240612   gcc-7
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240612   gcc-13.2.0
loongarch             randconfig-002-20240612   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                             allyesconfig   gcc-13.2.0
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240612   gcc-13.2.0
nios2                 randconfig-002-20240612   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240612   gcc-13.2.0
parisc                randconfig-002-20240612   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc               randconfig-001-20240612   gcc-13.2.0
powerpc               randconfig-002-20240612   gcc-13.2.0
powerpc               randconfig-003-20240612   clang-19
powerpc64             randconfig-001-20240612   gcc-13.2.0
powerpc64             randconfig-002-20240612   gcc-13.2.0
powerpc64             randconfig-003-20240612   clang-14
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240612   gcc-13.2.0
riscv                 randconfig-002-20240612   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang-19
s390                  randconfig-001-20240612   clang-19
s390                  randconfig-002-20240612   clang-19
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240612   gcc-13.2.0
sh                    randconfig-002-20240612   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240612   gcc-13.2.0
sparc64               randconfig-002-20240612   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240612   gcc-13
um                    randconfig-002-20240612   clang-16
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240612   gcc-13.2.0
xtensa                randconfig-002-20240612   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

