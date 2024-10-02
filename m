Return-Path: <linux-renesas-soc+bounces-9314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EECB98D175
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 12:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CEC0B23BBB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 10:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBB4195FE3;
	Wed,  2 Oct 2024 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJoHO0nc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3011E500C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Oct 2024 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727865676; cv=none; b=r/rtSge3DU2/hIKJZlhQYEDY1AGu5DaFbZn9B94TQQpvgYw4+fF/qT2BSlQPPTMscrbhu1l/PcqdodBwPoG+GBib6nEw4nQhv5aC9tFY+efHx7jm2tNwCV21TqJD1zYskUzp/foE+7p/rb21S6074KAT3BUZnr0BqYg3bzcYL8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727865676; c=relaxed/simple;
	bh=Q5BhR+3N5fMtbUoGaWQwcFBibZHFBuHoPWLF5LWOOgo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e1Las8n+efnW7g8xA/TirDuVykQYYUOwKeV+GC6kPDLJ9NRqLTGNEDmtMgxtaX/jKFHBxTe/0Goeg3hQrco0ZVxXBpWcOBpIOSgaeDUfpW8I/2gWPwmeBCY93gWvZfA1rmxWpS2Jq/UeiHKo9FXtAQ2Auk4iwxYTn+2QxK7dwkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJoHO0nc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727865674; x=1759401674;
  h=date:from:to:cc:subject:message-id;
  bh=Q5BhR+3N5fMtbUoGaWQwcFBibZHFBuHoPWLF5LWOOgo=;
  b=XJoHO0ncu8HUgskZKZelcgUobDCace6st2KimeRLWmmlmwQOzU8sEwgt
   MDw0DAr7Z/ggDfMq4Zrz0k0JPI/c2j6mjsK+Xx5YJrieRErh546QmYqg7
   g1asEvCM/6xjRxNbnt+py1R+jlnhOxIRYfqPAhp2kgoYny8+N5E3kEIl/
   CLR+fV6qleEy8GvS5wLRcOTUs/fVcvCCXPTsnPIHI6WxV61X6ylcEe+Pp
   Zg8by8DuTRIh3AyanOOkJ7V2dLXG/OBFoe/UHznK6WG6ez7NdUhHyR1cD
   0KKusgN7o8SUdzVh+sMCumZ5n/kaqIYPS3lwBHdQOQe4J840bT8M//W85
   A==;
X-CSE-ConnectionGUID: GmI3fkhYQFmNUJXIVjO54A==
X-CSE-MsgGUID: Fa7flqsPS5SVtdxKbZ//5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26821676"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="26821676"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 03:41:13 -0700
X-CSE-ConnectionGUID: usvlY7CTSEm317n7EwoJWg==
X-CSE-MsgGUID: IGHxQo8DSPKpfmctheWysQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="97314327"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Oct 2024 03:41:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svwn8-000RwA-0b;
	Wed, 02 Oct 2024 10:41:10 +0000
Date: Wed, 02 Oct 2024 18:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.13] BUILD SUCCESS
 ddda5046e484d881563a6ad8da77f23f39f9e298
Message-ID: <202410021816.mDFDtDez-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.13
branch HEAD: ddda5046e484d881563a6ad8da77f23f39f9e298  ARM: dts: renesas: rskrza1: Enable watchdog timer

elapsed time: 1288m

configs tested: 48
configs skipped: 137

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.1.0
arc                     allnoconfig    gcc-14.1.0
arm                    allmodconfig    gcc-14.1.0
arm                     allnoconfig    clang-20
arm                     allnoconfig    gcc-14.1.0
arm                    allyesconfig    gcc-14.1.0
arm         randconfig-001-20241002    gcc-14.1.0
arm         randconfig-002-20241002    clang-20
arm         randconfig-003-20241002    clang-14
arm         randconfig-004-20241002    gcc-14.1.0
arm64                  allmodconfig    clang-20
arm64                   allnoconfig    gcc-14.1.0
arm64       randconfig-001-20241002    clang-20
arm64       randconfig-002-20241002    clang-20
arm64       randconfig-003-20241002    gcc-14.1.0
arm64       randconfig-004-20241002    gcc-14.1.0
csky                    allnoconfig    gcc-14.1.0
hexagon                 allnoconfig    gcc-14.1.0
i386                   allmodconfig    clang-18
i386                    allnoconfig    clang-18
i386                   allyesconfig    clang-18
i386                      defconfig    clang-18
loongarch               allnoconfig    gcc-14.1.0
m68k                    allnoconfig    gcc-14.1.0
microblaze              allnoconfig    gcc-14.1.0
mips                    allnoconfig    gcc-14.1.0
nios2                   allnoconfig    gcc-14.1.0
openrisc                allnoconfig    clang-20
openrisc                  defconfig    gcc-12
parisc                  allnoconfig    clang-20
parisc                    defconfig    gcc-12
powerpc                 allnoconfig    clang-20
riscv                   allnoconfig    clang-20
riscv                     defconfig    gcc-12
s390                    allnoconfig    clang-20
s390                      defconfig    gcc-12
sh                      allnoconfig    gcc-14.1.0
sh                        defconfig    gcc-12
sparc64                   defconfig    gcc-12
um                      allnoconfig    clang-20
um                        defconfig    gcc-12
um                   i386_defconfig    gcc-12
um                 x86_64_defconfig    gcc-12
x86_64                  allnoconfig    clang-18
x86_64                 allyesconfig    clang-18
x86_64                    defconfig    clang-18
x86_64                rhel-8.3-rust    clang-18
xtensa                  allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

