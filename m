Return-Path: <linux-renesas-soc+bounces-5972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB23E9011B1
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Jun 2024 15:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BBDC1C20F4E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Jun 2024 13:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5D3157E91;
	Sat,  8 Jun 2024 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyXIpQ4L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FED156220
	for <linux-renesas-soc@vger.kernel.org>; Sat,  8 Jun 2024 13:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717853744; cv=none; b=PHfmLwNk6ybCHedC3a2qtxD/l6s+3JlUR1O0vauiOZ6Twgegl7UQU4tCAw1cRz90UOuha/7yiy7OLRiq1ol7pXSar9sg1fvjjZqqFO6x7lhMJ3KeJlFKYqxth9MYmcZYKcNuvYIWbPemT3JfFLJcsivtQJ7DUi+RTreMBhh96VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717853744; c=relaxed/simple;
	bh=u0LjzLP8QsMRaQ07oMyyESKqBD6AhPS1XbvCjTjEpKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RmaqSGKI7Zf2hg4iyzp6isPuklcJxBlyRWDbjJuq/kFnKMXuiBDwbUrgwhy6jf+DQJ2QUY2UFz9XcRupsNdL1mIpyMMOP2sWx5XA6C9z16TTKTd/11DRNrurwzeT0BKrhSQ+QMWg9b4u5qk9TYKeJmGomp77NK83flr9zrIikto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyXIpQ4L; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717853743; x=1749389743;
  h=date:from:to:cc:subject:message-id;
  bh=u0LjzLP8QsMRaQ07oMyyESKqBD6AhPS1XbvCjTjEpKY=;
  b=HyXIpQ4LVOErX2nRlsgLrOrRhkArqqHpro1NgQXmD0wiojzrIrhK5gN8
   6Lk+0YQGlrScKeK1RPP/OeXgft9F8gETuGm/TuWP4PzwNhlxTo5US2uDz
   J/0cFFry7aU1lgRiPTwis4MaseHWw8DVZ4TNLxB4Oved8qaolX9owooXT
   HeQ0tiKMzK3MYMw0n0EphYieo5LW9h8U6ydXEHuzj2UTt9N+XKqRQ4igE
   rsd0kE/uqfp1YPSejoT9iX3hsMg84z1ybW7ME5B5yfj83iESMFqGlQJ8r
   dEf5sLLfexKe4Qos+s2KXqV1G4SVmcgbCr2CsJ4qMKBD3+rPiB+a2a0rf
   w==;
X-CSE-ConnectionGUID: l6Gn7DThQ1eE1MPQT/iIzA==
X-CSE-MsgGUID: JktcD5kaSrOqNVtIO4mwrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="18426189"
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="18426189"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 06:35:42 -0700
X-CSE-ConnectionGUID: tK9q6JrDSa2gHoUcHGa4bA==
X-CSE-MsgGUID: PaFBV+XBT2iojrJ9YOO9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="43155565"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2024 06:35:41 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFwEN-0001dr-0i;
	Sat, 08 Jun 2024 13:35:39 +0000
Date: Sat, 08 Jun 2024 21:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 be50c8bfe910c3277c2c0b1bf008b64e4603dab8
Message-ID: <202406082108.do0dqTX1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: be50c8bfe910c3277c2c0b1bf008b64e4603dab8  pinctrl: renesas: rzg2l: Add support for RZ/V2H SoC

elapsed time: 1465m

configs tested: 25
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
s390                              allnoconfig   clang
s390                                defconfig   clang
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

