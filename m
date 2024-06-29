Return-Path: <linux-renesas-soc+bounces-6912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCB691CE2E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2024 18:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8515D282E8C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2024 16:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA0482889;
	Sat, 29 Jun 2024 16:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOvo/vxa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8038139ADD
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jun 2024 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719679431; cv=none; b=CJyzZMvrbs8YtAbupK1DjeTrW4cCm8zvJvLeuOihMXueBx9TodBPeKGiCbsiRtHppp9TGZFyYlUjdzMNMEh1XLuzWtXXPP495+qNSJ79q6HlGi0pljbmG5Ax6RjvuV/jIQ0LHy1HKepnn1vI5XlBk1r4wuhY47GFMP2SH+AwrUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719679431; c=relaxed/simple;
	bh=dGtMjVK6c6qZj2k1s4fKcur9yhM/nbCXfLEHHvJt5oE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cHj2eeQGJFS1u0zbdc3bCcP6pG6zdG5pyDgqVURXwhiR0Bk71zzvxU/7OcWn1oHjbf8ZdLOi64asoUdM564X1dyPdNO5rAYCE56ZbtdV2Fze2ADGlF299+HRUuvY6TgVAVOly1UBdVw/fnhlnemE9w77ErupgNhqw/Iujk/Zlnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOvo/vxa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719679430; x=1751215430;
  h=date:from:to:cc:subject:message-id;
  bh=dGtMjVK6c6qZj2k1s4fKcur9yhM/nbCXfLEHHvJt5oE=;
  b=MOvo/vxaBVRKhuouiybxompbnUtC7WJIXVyCaMg6aP4/RoTu8Y2BZMYn
   rHhrXL68FWtaI8jmAU+7pGDrxl6VGaeOVpniG9spr4j+a9uXZf9HGF1kt
   5avZdho3UJNHJO1GCC9a/DKdajFN8r2U0d0d/lPkLmwXvSuDo8+yZ8AmH
   ZPVUF/Ym12/u9ONLo5NTNjxy89mW+QO0yBcrVAD0pUnOkopkut7JSdCsr
   9+skb4chO2hW/0I7VCioH8P6aminsDeB/e/DKSyDVn8Tu1mbvICfvlRnY
   Ht7sB99jtZtClG+LITOyWKlPbZouYNNvgU6FAKjxFHLT9qLskOMtdzuU4
   w==;
X-CSE-ConnectionGUID: uWHQWvnPS82yeN04DgoAZQ==
X-CSE-MsgGUID: XlT9E3RSQw6UkKqcLCOm3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="20665928"
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="20665928"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2024 09:43:49 -0700
X-CSE-ConnectionGUID: SVv+OCdHSj+ABnPS8AYJMQ==
X-CSE-MsgGUID: Dl0pIKmITXKXMH1ck+Op2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="45800353"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Jun 2024 09:43:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNbAv-000Jpr-2i;
	Sat, 29 Jun 2024 16:43:45 +0000
Date: Sun, 30 Jun 2024 00:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/rcar-v4h-pinctrl-fixes-v1]
 BUILD SUCCESS 64999caeaefdd1b34d2618c61fabc8d3c826ef5c
Message-ID: <202406300041.SlWhPoRg-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-v4h-pinctrl-fixes-v1
branch HEAD: 64999caeaefdd1b34d2618c61fabc8d3c826ef5c  pinctrl: renesas: r8a779g0: Add INTC-EX pins, groups, and function

elapsed time: 6009m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240627   gcc-13.2.0
arc                   randconfig-002-20240627   gcc-13.2.0
arm                          collie_defconfig   gcc-13.2.0
arm                     davinci_all_defconfig   clang-19
arm                                 defconfig   clang-14
arm                           h3600_defconfig   gcc-13.2.0
arm                      integrator_defconfig   clang-19
arm                          ixp4xx_defconfig   gcc-13.2.0
arm                   randconfig-001-20240627   gcc-13.2.0
arm                   randconfig-002-20240627   clang-19
arm                   randconfig-003-20240627   gcc-13.2.0
arm                   randconfig-004-20240627   clang-19
arm                    vt8500_v6_v7_defconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240627   gcc-13.2.0
arm64                 randconfig-002-20240627   clang-19
arm64                 randconfig-003-20240627   clang-17
arm64                 randconfig-004-20240627   clang-19
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240627   gcc-13.2.0
csky                  randconfig-002-20240627   gcc-13.2.0
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240627   clang-17
hexagon               randconfig-002-20240627   clang-19
loongarch                           defconfig   gcc-13.2.0
loongarch                 loongson3_defconfig   gcc-13.2.0
loongarch             randconfig-001-20240627   gcc-13.2.0
loongarch             randconfig-002-20240627   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5272c3_defconfig   gcc-13.2.0
m68k                       m5275evb_defconfig   gcc-13.2.0
m68k                          multi_defconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240627   gcc-13.2.0
nios2                 randconfig-002-20240627   gcc-13.2.0
parisc                randconfig-001-20240627   gcc-13.2.0
parisc                randconfig-002-20240627   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                      acadia_defconfig   clang-19
powerpc                       eiger_defconfig   clang-19
powerpc                  mpc866_ads_defconfig   clang-19
powerpc               randconfig-001-20240627   gcc-13.2.0
powerpc               randconfig-002-20240627   clang-19
powerpc               randconfig-003-20240627   gcc-13.2.0
powerpc                     tqm8555_defconfig   clang-19
powerpc64             randconfig-001-20240627   gcc-13.2.0
powerpc64             randconfig-002-20240627   gcc-13.2.0
powerpc64             randconfig-003-20240627   gcc-13.2.0
riscv                 randconfig-001-20240627   gcc-13.2.0
riscv                 randconfig-002-20240627   clang-19
s390                  randconfig-001-20240627   clang-16
s390                  randconfig-002-20240627   clang-15
sh                ecovec24-romimage_defconfig   gcc-13.2.0
sh                    randconfig-001-20240627   gcc-13.2.0
sh                    randconfig-002-20240627   gcc-13.2.0
sh                      rts7751r2d1_defconfig   gcc-13.2.0
sh                           se7721_defconfig   gcc-13.2.0
sparc64               randconfig-001-20240627   gcc-13.2.0
sparc64               randconfig-002-20240627   gcc-13.2.0
um                    randconfig-001-20240627   clang-19
um                    randconfig-002-20240627   clang-19
xtensa                randconfig-001-20240627   gcc-13.2.0
xtensa                randconfig-002-20240627   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

