Return-Path: <linux-renesas-soc+bounces-7383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7C4933571
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2024 04:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF7231C21183
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2024 02:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC699320F;
	Wed, 17 Jul 2024 02:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZ7W8+sn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD31320B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jul 2024 02:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721183497; cv=none; b=E4OXgEVSMWeVsWQ89vBGlSGYMmuR9J4UXBxqh3e2z659VyzFwBwl3hUAIbmNk1eqecIsOUW4Wr3J8XP4LhF8naROttaSTeyt2tJQ1rXGXuhi7irrQ5YQ5WHTRreUcgCKVjHfyi7cT80OxEWF5L/tOXQZH9upZXDLq54ceXScUwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721183497; c=relaxed/simple;
	bh=Rqyqgf1ZL4Rzk4PVpviXb9ibQ86cLFGwawtW8U6WVro=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bZT9nUnTWjQDed0QLz6vyLlzuz6qr6ZJFJfdUpdNeBkzwenCeLun46Fe1ts1mWHeJU7zHHVpSBX8RY5aM5W+xQ2R36tEHWit1CCHQFS00Nl9JN60Zr5688T4qpyQiDYj+3PS3JQjizUQANJYZYHLpbjolwD0TxE38KWii3zVGOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZ7W8+sn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721183496; x=1752719496;
  h=date:from:to:cc:subject:message-id;
  bh=Rqyqgf1ZL4Rzk4PVpviXb9ibQ86cLFGwawtW8U6WVro=;
  b=DZ7W8+snkczCcqn2Jv1dOThWajlav6XVtM+NujqQXsTjO+RoQeWh4xB1
   mUbrYiqLXDO1aApMXV6wXvIpTC5bMuhsCr1ntY+/SCvZeeMUPMMTTG2MS
   8hg1Rr9cIScw43VB0bTJXJGwjSpPAtWfIR2gqhJ0sadzec6LnHUi+i6YH
   +FuxpDqFE09Cr2nXd83emWTfu/BGSBbrObiYERpuyKMfL2b8sPmIJxich
   yIk3pOYQtVTx6dBqnzLd8lNggdv7ZzYITnhvNIO/CHOCICbwzlLZIjZTd
   cRErzZKdLLxsWIGVGIx/ziaiyFiq8ChKvKw4rWjuPLKAfYWXJVmRH+7/w
   Q==;
X-CSE-ConnectionGUID: AQTdU19IRw6BmXFvY6HxUg==
X-CSE-MsgGUID: A5ls4otvRZuhHS1tQJ+TXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29248211"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="29248211"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 19:31:35 -0700
X-CSE-ConnectionGUID: 3CvSXWp1QaKryBTVKdGbcw==
X-CSE-MsgGUID: lFxjuayxSuWxLbfHNBibsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="55376466"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Jul 2024 19:31:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTuS2-000fte-2e;
	Wed, 17 Jul 2024 02:31:30 +0000
Date: Wed, 17 Jul 2024 10:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 a8a63c1aacb72fa278746c12fbf708af474eeb41
Message-ID: <202407171026.dWZCjlu4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: a8a63c1aacb72fa278746c12fbf708af474eeb41  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:13: error: incompatible function pointer types initializing 'void (*)(struct platform_device *)' with an expression of type 'int (struct platform_device *)' [-Wincompatible-function-pointer-types]
drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Wincompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- arc-allmodconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- arm64-allmodconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- arm64-randconfig-004-20240717
|   `-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- hexagon-allmodconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- hexagon-allyesconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- hexagon-randconfig-002-20240717
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- i386-allmodconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- loongarch-allmodconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- m68k-allmodconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- m68k-allyesconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- microblaze-allmodconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- microblaze-allyesconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- openrisc-allyesconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- parisc-allmodconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- parisc-allyesconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- powerpc-allyesconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- riscv-allyesconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- riscv-randconfig-002-20240717
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- s390-allmodconfig
|   `-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- sh-allmodconfig
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- sh-allyesconfig
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- sparc-allmodconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- um-allmodconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|-- um-allyesconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-stm-lvds.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
|   `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:incompatible-function-pointer-types-initializing-void-(-)(struct-platform_device-)-with-an-expression-of-type-int-(struct-platform_device-)
`-- xtensa-allyesconfig
    |-- drivers-gpu-drm-stm-lvds.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)
    `-- drivers-media-platform-raspberrypi-pisp_be-pisp_be.c:error:initialization-of-void-(-)(struct-platform_device-)-from-incompatible-pointer-type-int-(-)(struct-platform_device-)

elapsed time: 733m

configs tested: 118
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240717   gcc-13.2.0
arc                   randconfig-002-20240717   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240717   gcc-14.1.0
arm                   randconfig-002-20240717   gcc-14.1.0
arm                   randconfig-003-20240717   gcc-14.1.0
arm                   randconfig-004-20240717   clang-19
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240717   gcc-14.1.0
arm64                 randconfig-002-20240717   clang-19
arm64                 randconfig-003-20240717   clang-16
arm64                 randconfig-004-20240717   clang-19
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240717   gcc-14.1.0
csky                  randconfig-002-20240717   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240717   clang-19
hexagon               randconfig-002-20240717   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240716   clang-18
i386         buildonly-randconfig-002-20240716   clang-18
i386         buildonly-randconfig-003-20240716   clang-18
i386         buildonly-randconfig-004-20240716   clang-18
i386         buildonly-randconfig-005-20240716   clang-18
i386         buildonly-randconfig-006-20240716   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240716   clang-18
i386                  randconfig-002-20240716   clang-18
i386                  randconfig-003-20240716   gcc-9
i386                  randconfig-004-20240716   gcc-7
i386                  randconfig-005-20240716   clang-18
i386                  randconfig-006-20240716   gcc-9
i386                  randconfig-011-20240716   gcc-8
i386                  randconfig-012-20240716   clang-18
i386                  randconfig-013-20240716   gcc-8
i386                  randconfig-014-20240716   clang-18
i386                  randconfig-015-20240716   clang-18
i386                  randconfig-016-20240716   gcc-10
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240717   gcc-14.1.0
loongarch             randconfig-002-20240717   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240717   gcc-14.1.0
nios2                 randconfig-002-20240717   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240717   gcc-14.1.0
parisc                randconfig-002-20240717   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc               randconfig-001-20240717   clang-19
powerpc               randconfig-002-20240717   gcc-14.1.0
powerpc               randconfig-003-20240717   clang-19
powerpc64             randconfig-001-20240717   gcc-14.1.0
powerpc64             randconfig-002-20240717   gcc-14.1.0
powerpc64             randconfig-003-20240717   gcc-14.1.0
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240717   clang-19
riscv                 randconfig-002-20240717   clang-17
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
s390                  randconfig-001-20240717   gcc-14.1.0
s390                  randconfig-002-20240717   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240717   gcc-14.1.0
sh                    randconfig-002-20240717   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240717   gcc-14.1.0
sparc64               randconfig-002-20240717   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240717   gcc-8
um                    randconfig-002-20240717   gcc-13
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-002-20240717   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

