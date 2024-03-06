Return-Path: <linux-renesas-soc+bounces-3489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18851872DDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 05:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 732251F26FEE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 04:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F43914AAD;
	Wed,  6 Mar 2024 04:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVc2hVas"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780D414280
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Mar 2024 04:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709697973; cv=none; b=T3DvkM1zUpgUW/MxeArJnC342x7hkuTmrgZmjprxkpjEtYuFSSURMdttMLKjz6z8WdltvJ9U6GVTTIwT7yhEMOZFJsFJCfpEq6kwR+fzd8Ru20EP6bVnO1YtasfnRBvv3w5Wm2fN0fJyWBcoA+anu6KeKbpjb1XU541Mer484CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709697973; c=relaxed/simple;
	bh=AWrDEotL3+QcjDAHbrPzXqr35GkeLaOa+kw7PTPEMh4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=seAz1oZoI63BQg01gqUg+wj53aWyy8A8j9ksP/Dvkqqf1ep/HDkoohGySV1xUyy6RF7ckDUiMbMEopQ+R1pjKODi1vEQcUwS1vHXyiDO3i6xvd0MjZBKvU3P/YWV5AAPwuq6rmLZOjN0lvMopYnH7tOY1Va251PwfcM0Xw9nEao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVc2hVas; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709697971; x=1741233971;
  h=date:from:to:cc:subject:message-id;
  bh=AWrDEotL3+QcjDAHbrPzXqr35GkeLaOa+kw7PTPEMh4=;
  b=HVc2hVasOkWrvf2iuDxiYAazh/JLFlqGWldOwbnpj40GO/LP5rxLjYWP
   pW0hEDW2PpJ3UJ1b3LcGLEAzs2i/hPx4BrDPbYwb+SVgbkTPi+RrV/3ZZ
   3B7eS4AqKpE1fE2wpTHNWuucaulc+7rORmIUhGT6EXkNFu8Yj1eAm5me6
   b8kArPWgmsgasORUUtt4WzxCy2LIXHoZAXvNSeCoRvbqzUC2Zp7TpWTP1
   YHCaErqi0sCvpnip+w34jMX9lMxz8fvkaQfihSeHfKjCssR7SwS01w+Xc
   Bo3EMyrCRzGg3pfYM4rYO2HoxPz/nJdZEupmsWU5Cs8G013Tla5+mW/wI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4152999"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4152999"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 20:06:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9705122"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2024 20:06:08 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhiXe-0003tZ-1B;
	Wed, 06 Mar 2024 04:06:06 +0000
Date: Wed, 06 Mar 2024 12:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 0a76003de2b9029d5898c23d23ddbb90f5a74580
Message-ID: <202403061200.irkZa4tK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 0a76003de2b9029d5898c23d23ddbb90f5a74580  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202403060928.h7xXMXHi-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202403061131.zzApAwRB-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:35: warning: initialization of 'const struct qmp_usb_offsets *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:3: error: field designator 'lanes' does not refer to any field in type 'const struct qmp_phy_cfg'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-phy-qualcomm-phy-qcom-qmp-usb.c:warning:initialization-of-const-struct-qmp_usb_offsets-from-int-makes-pointer-from-integer-without-a-cast
|-- arm-allyesconfig
|   `-- drivers-phy-qualcomm-phy-qcom-qmp-usb.c:warning:initialization-of-const-struct-qmp_usb_offsets-from-int-makes-pointer-from-integer-without-a-cast
|-- csky-allmodconfig
|   `-- drivers-phy-qualcomm-phy-qcom-qmp-usb.c:warning:initialization-of-const-struct-qmp_usb_offsets-from-int-makes-pointer-from-integer-without-a-cast
|-- csky-allyesconfig
|   `-- drivers-phy-qualcomm-phy-qcom-qmp-usb.c:warning:initialization-of-const-struct-qmp_usb_offsets-from-int-makes-pointer-from-integer-without-a-cast
|-- i386-allmodconfig
|   `-- drivers-phy-qualcomm-phy-qcom-qmp-usb.c:warning:initialization-of-const-struct-qmp_usb_offsets-from-int-makes-pointer-from-integer-without-a-cast
`-- i386-allyesconfig
    `-- drivers-phy-qualcomm-phy-qcom-qmp-usb.c:warning:initialization-of-const-struct-qmp_usb_offsets-from-int-makes-pointer-from-integer-without-a-cast
clang_recent_errors
`-- hexagon-allmodconfig
    `-- drivers-phy-qualcomm-phy-qcom-qmp-usb.c:error:field-designator-lanes-does-not-refer-to-any-field-in-type-const-struct-qmp_phy_cfg

elapsed time: 776m

configs tested: 139
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240306   gcc  
arc                   randconfig-002-20240306   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240306   gcc  
arm                   randconfig-002-20240306   clang
arm                   randconfig-003-20240306   clang
arm                   randconfig-004-20240306   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240306   gcc  
arm64                 randconfig-002-20240306   clang
arm64                 randconfig-003-20240306   gcc  
arm64                 randconfig-004-20240306   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240306   gcc  
csky                  randconfig-002-20240306   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240306   clang
hexagon               randconfig-002-20240306   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240306   clang
i386         buildonly-randconfig-002-20240306   clang
i386         buildonly-randconfig-003-20240306   gcc  
i386         buildonly-randconfig-004-20240306   clang
i386         buildonly-randconfig-005-20240306   clang
i386         buildonly-randconfig-006-20240306   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240306   gcc  
i386                  randconfig-002-20240306   clang
i386                  randconfig-003-20240306   clang
i386                  randconfig-004-20240306   clang
i386                  randconfig-005-20240306   gcc  
i386                  randconfig-006-20240306   clang
i386                  randconfig-011-20240306   clang
i386                  randconfig-012-20240306   clang
i386                  randconfig-013-20240306   gcc  
i386                  randconfig-014-20240306   gcc  
i386                  randconfig-015-20240306   clang
i386                  randconfig-016-20240306   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240306   gcc  
loongarch             randconfig-002-20240306   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240306   gcc  
nios2                 randconfig-002-20240306   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240306   gcc  
parisc                randconfig-002-20240306   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240306   gcc  
powerpc               randconfig-002-20240306   gcc  
powerpc               randconfig-003-20240306   clang
powerpc64             randconfig-001-20240306   gcc  
powerpc64             randconfig-002-20240306   clang
powerpc64             randconfig-003-20240306   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240306   clang
riscv                 randconfig-002-20240306   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240306   clang
s390                  randconfig-002-20240306   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240306   gcc  
sh                    randconfig-002-20240306   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240306   gcc  
sparc64               randconfig-002-20240306   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240306   gcc  
um                    randconfig-002-20240306   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240306   gcc  
xtensa                randconfig-002-20240306   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

