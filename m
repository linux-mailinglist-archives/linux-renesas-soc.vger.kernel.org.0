Return-Path: <linux-renesas-soc+bounces-7220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F15092CDE6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 11:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D46A0280A04
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 09:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDB283A17;
	Wed, 10 Jul 2024 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgEwjBuT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF83C39
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jul 2024 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720602446; cv=none; b=WkzJfWGXbXTVw30oaIVifwgvkHUTfdt3JiKiDx6pEbtMmfEK51JwEZncBJUFGbK6aQivRocNn5gHXgozHVFzABc3p5VKhU5zzyaaYRIrUVcuN7MBbG1mCwUceeaqzpO/DqPMrcr8vttFrfKEwmS+IS8V2BRPnGerN8LvLv3dnTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720602446; c=relaxed/simple;
	bh=TNSSDNSOOxdLGV/BiABocraA8+uwprI1M/etGRYjXtY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oxmRJg2CLdOgShFZOVlYMIYMwz35s6knKkptGavXht+oV409MbkFmQUN78NN6DZw2ulWWxMvRcTUbZxhWBvjcKhyYfm44ljo0GcYOEGpoKftHfzy5tinzsF1lhMG5In5/JnKVstpS2XHsbOPy0HtHGZxpeav6l3dEUmNeDIMElk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgEwjBuT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720602445; x=1752138445;
  h=date:from:to:cc:subject:message-id;
  bh=TNSSDNSOOxdLGV/BiABocraA8+uwprI1M/etGRYjXtY=;
  b=DgEwjBuTbZmPTiPcF2rJOSK2ukbL/ScdtyZaiVMp8Cr8i0BcxaFURd6v
   er/SXjPGMCvjeR1vXehj4I2Ids5aEZd8LZd78VSYK0m/Q2lX2uL3K6SUB
   bGNjTowVCZ+lyoL7tD6wqAJgEnW4DqZafKwzi/YDVFfdTjNPfPCbLZUpd
   rAwxM3OrWB7Znp/YN2htkIJ7kuRCOhwqqD7DfuyE2mO3MDb6t/KzYAbYT
   T1fzi7euMjreuRj49seA7sVQbUCZzjB0AwSObJdz0YS/LR16bAkvvfQRD
   PWksuTJFKqf13OWbAUIX2qqOd/KWZJTmcmc+zOijArxEBwJBKCGh6GVuv
   g==;
X-CSE-ConnectionGUID: GIEbH1p9ShCqAvQwAK0MxA==
X-CSE-MsgGUID: +b31r++xRrW7/UKMdq5hyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="18048423"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="18048423"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 02:07:24 -0700
X-CSE-ConnectionGUID: +KdblAHYTba4JxFSt0oGVg==
X-CSE-MsgGUID: JaTi027RRrCQiY2hNnuKVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="52745395"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jul 2024 02:07:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRTIG-000XgC-0F;
	Wed, 10 Jul 2024 09:07:20 +0000
Date: Wed, 10 Jul 2024 17:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 bbf0b241d2544f4c172cb6c223541011a12a5fc6
Message-ID: <202407101732.UGPTMwJH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: bbf0b241d2544f4c172cb6c223541011a12a5fc6  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Unverified Error/Warning (likely false positive, please contact us if interested):

arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: smsm: 'anyOf' conditional failed, one must be fixed:
arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: smsm: 'mboxes' does not match any of the regexes: '@[0-9a-f]$', '^qcom,ipc-[1-4]$', 'pinctrl-[0-9]+'
drivers/gpu/drm/stm/lvds.c:1212:12: error: incompatible function pointer types initializing 'void (*)(struct platform_device *)' with an expression of type 'int (struct platform_device *)' [-Wincompatible-function-pointer-types]
drivers/gpu/drm/stm/lvds.c:1212:19: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- arc-allmodconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- arc-allyesconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- arm-allmodconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- arm64-allmodconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- arm64-randconfig-001-20240710
|   `-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- arm64-randconfig-051-20240709
|   |-- arch-arm64-boot-dts-qcom-apq8016-sbc-usb-host.dtb:smsm:anyOf-conditional-failed-one-must-be-fixed:
|   `-- arch-arm64-boot-dts-qcom-apq8016-sbc-usb-host.dtb:smsm:mboxes-does-not-match-any-of-the-regexes:9a-f-qcom-ipc-pinctrl
|-- hexagon-allmodconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- hexagon-allyesconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- hexagon-randconfig-001-20240710
|   `-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- i386-allmodconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- i386-allyesconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- loongarch-allmodconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- microblaze-allmodconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- microblaze-allyesconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- mips-allyesconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- openrisc-allyesconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- parisc-allmodconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- parisc-allyesconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- powerpc-allmodconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- powerpc-allyesconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- powerpc-randconfig-001-20240710
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- powerpc64-randconfig-001-20240710
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- riscv-allmodconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- riscv-allyesconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- s390-allmodconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- s390-allyesconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- um-allmodconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- um-allyesconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
`-- xtensa-allyesconfig
    `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)

elapsed time: 1161m

configs tested: 141
configs skipped: 1

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240710   gcc-13.2.0
arc                   randconfig-002-20240710   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-13.3.0
arm                          ixp4xx_defconfig   gcc-13.3.0
arm                          pxa910_defconfig   gcc-13.3.0
arm                   randconfig-001-20240710   clang-19
arm                   randconfig-002-20240710   gcc-13.2.0
arm                   randconfig-003-20240710   clang-19
arm                   randconfig-004-20240710   gcc-13.2.0
arm                        realview_defconfig   clang-19
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240710   clang-19
arm64                 randconfig-002-20240710   clang-19
arm64                 randconfig-003-20240710   clang-17
arm64                 randconfig-004-20240710   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240710   gcc-13.2.0
csky                  randconfig-002-20240710   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240710   clang-19
hexagon               randconfig-002-20240710   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240710   clang-18
i386         buildonly-randconfig-002-20240710   gcc-13
i386         buildonly-randconfig-003-20240710   gcc-11
i386         buildonly-randconfig-004-20240710   gcc-11
i386         buildonly-randconfig-005-20240710   clang-18
i386         buildonly-randconfig-006-20240710   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240710   clang-18
i386                  randconfig-002-20240710   gcc-11
i386                  randconfig-003-20240710   gcc-13
i386                  randconfig-004-20240710   clang-18
i386                  randconfig-005-20240710   clang-18
i386                  randconfig-006-20240710   clang-18
i386                  randconfig-011-20240710   gcc-13
i386                  randconfig-012-20240710   gcc-12
i386                  randconfig-013-20240710   gcc-12
i386                  randconfig-014-20240710   gcc-13
i386                  randconfig-015-20240710   gcc-8
i386                  randconfig-016-20240710   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240710   gcc-13.2.0
loongarch             randconfig-002-20240710   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                       m5249evb_defconfig   gcc-13.3.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240710   gcc-13.2.0
nios2                 randconfig-002-20240710   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                randconfig-001-20240710   gcc-13.2.0
parisc                randconfig-002-20240710   gcc-13.2.0
parisc64                         alldefconfig   gcc-13.3.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc               randconfig-001-20240710   gcc-13.2.0
powerpc               randconfig-002-20240710   clang-19
powerpc               randconfig-003-20240710   gcc-13.2.0
powerpc                     tqm8548_defconfig   clang-19
powerpc64             randconfig-001-20240710   gcc-13.2.0
powerpc64             randconfig-002-20240710   clang-15
powerpc64             randconfig-003-20240710   clang-19
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                 randconfig-001-20240710   clang-19
riscv                 randconfig-002-20240710   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                  randconfig-001-20240710   gcc-13.2.0
s390                  randconfig-002-20240710   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                    randconfig-001-20240710   gcc-13.2.0
sh                    randconfig-002-20240710   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc64               randconfig-001-20240710   gcc-13.2.0
sparc64               randconfig-002-20240710   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                    randconfig-001-20240710   gcc-13
um                    randconfig-002-20240710   clang-19
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240710   clang-18
x86_64       buildonly-randconfig-002-20240710   clang-18
x86_64       buildonly-randconfig-003-20240710   clang-18
x86_64       buildonly-randconfig-004-20240710   clang-18
x86_64       buildonly-randconfig-005-20240710   gcc-13
x86_64       buildonly-randconfig-006-20240710   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240710   gcc-13
x86_64                randconfig-002-20240710   clang-18
x86_64                randconfig-003-20240710   gcc-12
x86_64                randconfig-004-20240710   clang-18
x86_64                randconfig-005-20240710   clang-18
x86_64                randconfig-006-20240710   gcc-13
x86_64                randconfig-011-20240710   clang-18
x86_64                randconfig-012-20240710   clang-18
x86_64                randconfig-013-20240710   clang-18
x86_64                randconfig-014-20240710   clang-18
x86_64                randconfig-015-20240710   clang-18
x86_64                randconfig-016-20240710   gcc-13
x86_64                randconfig-071-20240710   gcc-13
x86_64                randconfig-072-20240710   clang-18
x86_64                randconfig-073-20240710   clang-18
x86_64                randconfig-074-20240710   gcc-7
x86_64                randconfig-075-20240710   clang-18
x86_64                randconfig-076-20240710   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240710   gcc-13.2.0
xtensa                randconfig-002-20240710   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

