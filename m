Return-Path: <linux-renesas-soc+bounces-4386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E0E89CEA5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 00:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5302C1F210DF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Apr 2024 22:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3972744B;
	Mon,  8 Apr 2024 22:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHfGu77t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D281171B0
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Apr 2024 22:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712617029; cv=none; b=IHntrT8VJWZsg2UL4eJfmk6zO/kf+6Hx2qqjduvC3KKmqmHfI8DyqTeOQdoyc+ZUe4YcTETfR5519CMRbuCXW2ljWTFJ2hJiTwcRV6R1OSJg7pxDMHlxXU2IlE2ghx80dBZewEAYeVdKiki5U2JAE/tHtH9nvo6VLH4T+rIT3CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712617029; c=relaxed/simple;
	bh=9X21C45uXM7yyaGcSPtL4+uVZoSzXSRzJlCAfyV8K68=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GvX6L0XWDwBhp2thaUSp9xYfVkenlnpfLbse8cryTKYK5quC1oqDqITUp8NgIo6MOWaB4Tk9qk6gpnZuy1tPAGi/wK+looIT0Ab/HuKn8Aaj+Lqf8GxjeG+rydfhjiRwEKrHfRpyr+PVvHLxu1GeuEJNFp0vDab95CMz+g0Ay9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHfGu77t; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712617027; x=1744153027;
  h=date:from:to:cc:subject:message-id;
  bh=9X21C45uXM7yyaGcSPtL4+uVZoSzXSRzJlCAfyV8K68=;
  b=OHfGu77tIQNGJvingKd/qH99dLOnWqhpie9SkMS/rDlJHeUCdW3Q/edD
   mVc345AsHM1zuU7aobAiWQ2afhI45mJBawSobD/yJtoLMM7xY7E8zmbsa
   2F5+qZkFUG56xRHgp2tBSIBs5vJMAbsBkqKxCwBcN9KmDXF3q48wluMWV
   Of7PEs6t0qJJxj04csnHxj/43Ie5YvxeAdyjL5vTKWkIAcuQXuhYBiLYo
   OuTjV5rQyPn2v5VpSQF5mo5QzZ0A+ZW+RRnSzCMfin5O85s0HvRhSMslC
   CKJm736roDM8eJN23ZaOyaNWmdALQIilpNcJsPXskwDcYFOSMqHjYW5Yv
   Q==;
X-CSE-ConnectionGUID: /cZxZ57/T7CHeEoLsCUUQg==
X-CSE-MsgGUID: 9MhenZE3RQu9mZsRvte5ug==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19348181"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19348181"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 15:57:06 -0700
X-CSE-ConnectionGUID: qgcC+0JZQMeue+BmQNHO0g==
X-CSE-MsgGUID: Qs1SBK2aQcWrNJYhETlzBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19984663"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Apr 2024 15:57:05 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtxvD-0005XG-0r;
	Mon, 08 Apr 2024 22:57:03 +0000
Date: Tue, 09 Apr 2024 06:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.10] BUILD
 SUCCESS ec78ed2e157ea6d4b66869c8a3dbe4dbac0593c6
Message-ID: <202404090658.qVrIPo7n-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.10
branch HEAD: ec78ed2e157ea6d4b66869c8a3dbe4dbac0593c6  ARM: shmobile: defconfig: Refresh for v6.9-rc1

elapsed time: 721m

configs tested: 32
configs skipped: 151

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240409   gcc  
arm                   randconfig-002-20240409   clang
arm                   randconfig-003-20240409   clang
arm                   randconfig-004-20240409   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240409   gcc  
arm64                 randconfig-002-20240409   gcc  
arm64                 randconfig-003-20240409   clang
arm64                 randconfig-004-20240409   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                                defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

