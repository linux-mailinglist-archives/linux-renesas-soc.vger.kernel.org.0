Return-Path: <linux-renesas-soc+bounces-20737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A6B2D25A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 05:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73481188C9BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 03:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F86522CBC0;
	Wed, 20 Aug 2025 03:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haxwiKFS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BB921CA03
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Aug 2025 03:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755659466; cv=none; b=j3ZcLgVKzuwmGlXe2jzGYuIX0yzYmB6ENmqbPRE7X0f0t3DLEIhsHVAsoINpmmlcc4dukk7B6kxlJcV4rosW/gppCemo05KmvtSe7iNEo34vlF8b3FC+6A8cTw26Ke4eGSuL3YCfCYvpr2Oyb1ubVLyyvM/lqCcE/+paRUQtPNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755659466; c=relaxed/simple;
	bh=Kn4ZrqB4PXETzTUBNyoDtHpWlKCELDRo8yC4n1HY7vI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GmhfVaCjMoFAIRSMzKa5ngkDlaeyq1XiVpdihWPNMurOJPFcd4feJ77TghtfKDrO69ENtln6O3ndJUfbLYBI4d6D9ixGsqNGQp7euHWea+Fa7L/vZ27LyAwz7x62KW5myg//3aGGPrlz/DuQtnHUnLMoVXZE4grN4uK0lOCrIyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haxwiKFS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755659463; x=1787195463;
  h=date:from:to:cc:subject:message-id;
  bh=Kn4ZrqB4PXETzTUBNyoDtHpWlKCELDRo8yC4n1HY7vI=;
  b=haxwiKFSlVJJVlzTrRg9NYaEMoOwFbGtnAwybdMOnhgIg0RLL0khSSLD
   DgwapyIpRRjseSAfAqJnqFiARoAF0oGFcZfGUa8sBF9+jRn9NrwELceZF
   n9CotSk9OyMMo2UNJM9S7HZtTo6CGiN5VbfSYO7+TQb6gOEwokszzrJzB
   QPA1PtNK8OOMWBDgAYDvzyGPOoTzT6Y/1vUVCLVVgGTI35R7FiFZJcrWm
   /LHX0QV2oBd5Xb/MIj0BTMfJ3dLcG5EI4G1xOqXGgE7SlyyF/5Uxsehr8
   kI8CsF6Yhrst8fwIYiZSoXopVtuUpfLNhdbYaxpISllq1jIsPf1WPBi63
   Q==;
X-CSE-ConnectionGUID: rT0ahSJpQ4eoPwxH78UbGg==
X-CSE-MsgGUID: SNieR9enRtqesAmnhF14nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68187203"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="68187203"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 20:10:18 -0700
X-CSE-ConnectionGUID: R0Ih/AxmRU6+VdKVIii0ew==
X-CSE-MsgGUID: xYLQjXzgSleNyRf3JHQo8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168353900"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 Aug 2025 20:10:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoZDJ-000I2f-1Y;
	Wed, 20 Aug 2025 03:10:13 +0000
Date: Wed, 20 Aug 2025 11:06:52 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.18] BUILD
 REGRESSION 75601ffaea537c3180f23912ce1d0ed5f716469d
Message-ID: <202508201137.4JOX4t3D-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.18
branch HEAD: 75601ffaea537c3180f23912ce1d0ed5f716469d  soc: renesas: rz-sysc: Add syscon/regmap support

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202508192154.jtZINmab-lkp@intel.com

    drivers/soc/renesas/rz-sysc.c:113:16: error: cleanup argument not a function
    drivers/soc/renesas/rz-sysc.c:113:24: error: incompatible integer to pointer conversion initializing 'struct regmap_config *' with an expression of type 'int' [-Wint-conversion]
    drivers/soc/renesas/rz-sysc.c:113:35: error: 'cleanup' function '__free_pages' must take 1 parameter
    drivers/soc/renesas/rz-sysc.c:113:35: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
    drivers/soc/renesas/rz-sysc.c:113:51: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    drivers/soc/renesas/rz-sysc.c:113:51: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
    drivers/soc/renesas/rz-sysc.c:113:51: error: implicit declaration of function 'kzalloc'; did you mean 'xa_alloc'? [-Werror=implicit-function-declaration]
    drivers/soc/renesas/rz-sysc.c:113:51: warning: initialization of 'struct regmap_config *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    drivers/soc/renesas/rz-sysc.c:113:58: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
    drivers/soc/renesas/rz-sysc.c:113:58: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
    drivers/soc/renesas/rz-sysc.c:113:58: error: initialization of 'struct regmap_config *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    drivers/soc/renesas/rz-sysc.c:113:58: warning: initialization of 'struct regmap_config *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    drivers/soc/renesas/rz-sysc.c:113:9: error: cleanup argument not a function

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arc-allmodconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- arc-allyesconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- arm-allmodconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- arm-allyesconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- arm-randconfig-001-20250819
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:warning:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- arm-randconfig-004-20250820
|   |-- drivers-soc-renesas-rz-sysc.c:error:call-to-undeclared-function-kzalloc-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-function-__free_pages-must-take-parameter
|   |-- drivers-soc-renesas-rz-sysc.c:error:incompatible-integer-to-pointer-conversion-initializing-struct-regmap_config-with-an-expression-of-type-int
|   `-- drivers-soc-renesas-rz-sysc.c:error:use-of-undeclared-identifier-__free_kfree
|-- csky-randconfig-002-20250819
|   `-- drivers-soc-renesas-rz-sysc.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- hexagon-allmodconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:call-to-undeclared-function-kzalloc-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-function-__free_pages-must-take-parameter
|   |-- drivers-soc-renesas-rz-sysc.c:error:incompatible-integer-to-pointer-conversion-initializing-struct-regmap_config-with-an-expression-of-type-int
|   `-- drivers-soc-renesas-rz-sysc.c:error:use-of-undeclared-identifier-__free_kfree
|-- hexagon-allyesconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:call-to-undeclared-function-kzalloc-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-function-__free_pages-must-take-parameter
|   |-- drivers-soc-renesas-rz-sysc.c:error:incompatible-integer-to-pointer-conversion-initializing-struct-regmap_config-with-an-expression-of-type-int
|   `-- drivers-soc-renesas-rz-sysc.c:error:use-of-undeclared-identifier-__free_kfree
|-- hexagon-randconfig-001-20250819
|   |-- drivers-soc-renesas-rz-sysc.c:error:call-to-undeclared-function-kzalloc-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-function-__free_pages-must-take-parameter
|   |-- drivers-soc-renesas-rz-sysc.c:error:incompatible-integer-to-pointer-conversion-initializing-struct-regmap_config-with-an-expression-of-type-int
|   `-- drivers-soc-renesas-rz-sysc.c:error:use-of-undeclared-identifier-__free_kfree
|-- i386-allmodconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:warning:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- m68k-allmodconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- m68k-allyesconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- parisc-allmodconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- parisc-allyesconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- parisc-randconfig-001-20250819
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:warning:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- parisc-randconfig-r052-20250820
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:warning:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- sh-allmodconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- sh-allyesconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- um-allmodconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:call-to-undeclared-function-kzalloc-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-function-__free_pages-must-take-parameter
|   |-- drivers-soc-renesas-rz-sysc.c:error:incompatible-integer-to-pointer-conversion-initializing-struct-regmap_config-with-an-expression-of-type-int
|   `-- drivers-soc-renesas-rz-sysc.c:error:use-of-undeclared-identifier-__free_kfree
|-- um-allyesconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:warning:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- um-randconfig-r053-20250820
|   |-- drivers-soc-renesas-rz-sysc.c:error:call-to-undeclared-function-kzalloc-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-function-__free_pages-must-take-parameter
|   |-- drivers-soc-renesas-rz-sysc.c:error:incompatible-integer-to-pointer-conversion-initializing-struct-regmap_config-with-an-expression-of-type-int
|   `-- drivers-soc-renesas-rz-sysc.c:error:use-of-undeclared-identifier-__free_kfree
|-- xtensa-allyesconfig
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:error:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- xtensa-randconfig-001-20250819
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:warning:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
|-- xtensa-randconfig-001-20250820
|   |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
|   |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
|   `-- drivers-soc-renesas-rz-sysc.c:warning:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast
`-- xtensa-randconfig-002-20250820
    |-- drivers-soc-renesas-rz-sysc.c:error:cleanup-argument-not-a-function
    |-- drivers-soc-renesas-rz-sysc.c:error:implicit-declaration-of-function-kzalloc
    `-- drivers-soc-renesas-rz-sysc.c:warning:initialization-of-struct-regmap_config-from-int-makes-pointer-from-integer-without-a-cast

elapsed time: 974m

configs tested: 252
configs skipped: 5

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                          axs101_defconfig    clang-22
arc                                 defconfig    clang-19
arc                   randconfig-001-20250819    gcc-14.3.0
arc                   randconfig-001-20250820    gcc-14.3.0
arc                   randconfig-002-20250819    gcc-11.5.0
arc                   randconfig-002-20250820    gcc-14.3.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   randconfig-001-20250819    gcc-12.5.0
arm                   randconfig-001-20250820    gcc-14.3.0
arm                   randconfig-002-20250819    gcc-10.5.0
arm                   randconfig-002-20250820    gcc-14.3.0
arm                   randconfig-003-20250819    gcc-10.5.0
arm                   randconfig-003-20250820    gcc-14.3.0
arm                   randconfig-004-20250819    clang-22
arm                   randconfig-004-20250820    gcc-14.3.0
arm                           sunxi_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250819    gcc-14.3.0
arm64                 randconfig-001-20250820    gcc-14.3.0
arm64                 randconfig-002-20250819    clang-22
arm64                 randconfig-002-20250820    gcc-14.3.0
arm64                 randconfig-003-20250819    gcc-8.5.0
arm64                 randconfig-003-20250820    gcc-14.3.0
arm64                 randconfig-004-20250819    clang-16
arm64                 randconfig-004-20250820    gcc-14.3.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250819    gcc-15.1.0
csky                  randconfig-001-20250820    clang-22
csky                  randconfig-002-20250819    gcc-15.1.0
csky                  randconfig-002-20250820    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250819    clang-22
hexagon               randconfig-001-20250820    clang-22
hexagon               randconfig-002-20250819    clang-18
hexagon               randconfig-002-20250820    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250819    gcc-12
i386        buildonly-randconfig-001-20250820    gcc-12
i386        buildonly-randconfig-002-20250819    clang-20
i386        buildonly-randconfig-002-20250820    gcc-12
i386        buildonly-randconfig-003-20250819    clang-20
i386        buildonly-randconfig-003-20250820    gcc-12
i386        buildonly-randconfig-004-20250819    clang-20
i386        buildonly-randconfig-004-20250820    gcc-12
i386        buildonly-randconfig-005-20250819    clang-20
i386        buildonly-randconfig-005-20250820    gcc-12
i386        buildonly-randconfig-006-20250819    clang-20
i386        buildonly-randconfig-006-20250820    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250820    gcc-12
i386                  randconfig-002-20250820    gcc-12
i386                  randconfig-003-20250820    gcc-12
i386                  randconfig-004-20250820    gcc-12
i386                  randconfig-005-20250820    gcc-12
i386                  randconfig-006-20250820    gcc-12
i386                  randconfig-007-20250820    gcc-12
i386                  randconfig-011-20250820    clang-20
i386                  randconfig-012-20250820    clang-20
i386                  randconfig-013-20250820    clang-20
i386                  randconfig-014-20250820    clang-20
i386                  randconfig-015-20250820    clang-20
i386                  randconfig-016-20250820    clang-20
i386                  randconfig-017-20250820    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250819    gcc-15.1.0
loongarch             randconfig-001-20250820    clang-22
loongarch             randconfig-002-20250819    clang-18
loongarch             randconfig-002-20250820    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                     loongson1b_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250819    gcc-8.5.0
nios2                 randconfig-001-20250820    clang-22
nios2                 randconfig-002-20250819    gcc-8.5.0
nios2                 randconfig-002-20250820    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250819    gcc-10.5.0
parisc                randconfig-001-20250820    clang-22
parisc                randconfig-002-20250819    gcc-8.5.0
parisc                randconfig-002-20250820    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    clang-22
powerpc               mpc834x_itxgp_defconfig    clang-22
powerpc                  mpc885_ads_defconfig    clang-22
powerpc               randconfig-001-20250819    clang-22
powerpc               randconfig-001-20250820    clang-22
powerpc               randconfig-002-20250819    gcc-10.5.0
powerpc               randconfig-002-20250820    clang-22
powerpc               randconfig-003-20250819    clang-22
powerpc               randconfig-003-20250820    clang-22
powerpc                    socrates_defconfig    clang-22
powerpc64             randconfig-001-20250819    clang-22
powerpc64             randconfig-001-20250820    clang-22
powerpc64             randconfig-002-20250819    clang-22
powerpc64             randconfig-002-20250820    clang-22
powerpc64             randconfig-003-20250819    gcc-10.5.0
powerpc64             randconfig-003-20250820    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250819    clang-22
riscv                 randconfig-001-20250820    clang-22
riscv                 randconfig-002-20250819    clang-22
riscv                 randconfig-002-20250820    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250819    gcc-8.5.0
s390                  randconfig-001-20250820    clang-22
s390                  randconfig-002-20250819    gcc-12.5.0
s390                  randconfig-002-20250820    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250819    gcc-15.1.0
sh                    randconfig-001-20250820    clang-22
sh                    randconfig-002-20250819    gcc-15.1.0
sh                    randconfig-002-20250820    clang-22
sh                             shx3_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250819    gcc-8.5.0
sparc                 randconfig-001-20250820    clang-22
sparc                 randconfig-002-20250819    gcc-11.5.0
sparc                 randconfig-002-20250820    clang-22
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250819    clang-22
sparc64               randconfig-001-20250820    clang-22
sparc64               randconfig-002-20250819    gcc-8.5.0
sparc64               randconfig-002-20250820    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250819    clang-18
um                    randconfig-001-20250820    clang-22
um                    randconfig-002-20250819    gcc-12
um                    randconfig-002-20250820    clang-22
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250819    clang-20
x86_64      buildonly-randconfig-001-20250820    clang-20
x86_64      buildonly-randconfig-002-20250819    clang-20
x86_64      buildonly-randconfig-002-20250820    clang-20
x86_64      buildonly-randconfig-003-20250819    clang-20
x86_64      buildonly-randconfig-003-20250820    clang-20
x86_64      buildonly-randconfig-004-20250819    clang-20
x86_64      buildonly-randconfig-004-20250820    clang-20
x86_64      buildonly-randconfig-005-20250819    clang-20
x86_64      buildonly-randconfig-005-20250820    clang-20
x86_64      buildonly-randconfig-006-20250819    clang-20
x86_64      buildonly-randconfig-006-20250820    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250820    gcc-12
x86_64                randconfig-002-20250820    gcc-12
x86_64                randconfig-003-20250820    gcc-12
x86_64                randconfig-004-20250820    gcc-12
x86_64                randconfig-005-20250820    gcc-12
x86_64                randconfig-006-20250820    gcc-12
x86_64                randconfig-007-20250820    gcc-12
x86_64                randconfig-008-20250820    gcc-12
x86_64                randconfig-071-20250820    gcc-12
x86_64                randconfig-072-20250820    gcc-12
x86_64                randconfig-073-20250820    gcc-12
x86_64                randconfig-074-20250820    gcc-12
x86_64                randconfig-075-20250820    gcc-12
x86_64                randconfig-076-20250820    gcc-12
x86_64                randconfig-077-20250820    gcc-12
x86_64                randconfig-078-20250820    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250819    gcc-8.5.0
xtensa                randconfig-001-20250820    clang-22
xtensa                randconfig-002-20250819    gcc-15.1.0
xtensa                randconfig-002-20250820    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

