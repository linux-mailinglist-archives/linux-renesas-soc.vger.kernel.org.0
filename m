Return-Path: <linux-renesas-soc+bounces-1792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7F683B144
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 19:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1AEA1C22E7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 18:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B2F13173D;
	Wed, 24 Jan 2024 18:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtbkQgMn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBFD13174C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 18:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706121434; cv=none; b=gIc1yjoXODfd9deTAN2snFKoSJn/jkW+Wmja3jgC7kj/ukX+DI/v628UXZcVbh698DcXm/SsLfYeWk5OrJ2JfA2Zl7UFX8Ya5WyLvrV2dapBuQ7KTY38y4gwNnITl8O7+09vb9pZfZa9c4Nix7sCGcW0YGjKgjW0Ulv8ChOitIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706121434; c=relaxed/simple;
	bh=RxKnQTn/neG4dBpz32S5uYHDDH+eG4O3MYE8uUA1p80=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mYDNa+E5/EKvt68sCzo5NRU1BEDvul41rEy5g7iyqMQFGf7JuebQ5+rNDCiDbfdQ74MF/eoaMf4idg0N2xMcMThcXBRtURwIiyQigZ+xGSR11Grnt+km3i+Kc9/w8XxauAc2pH3oG4UtK/n+63JmqSNQkSPTSURebC9lmCCiXoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtbkQgMn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706121433; x=1737657433;
  h=date:from:to:cc:subject:message-id;
  bh=RxKnQTn/neG4dBpz32S5uYHDDH+eG4O3MYE8uUA1p80=;
  b=EtbkQgMnptpXRUA6EY0W3XuwODI6k/T9bEJ6OubrW6HmaIheYZgWineX
   EJ2iHcV+TsDRhrD27IQUormTXcizGhN9E8sg6qzwvmyLF8UEvdVJTNYDi
   jKKLNPAtdbN2H6pURBHYyeJOUs54y45h0Dkx7fLAzP2/no1i9mv38fk4H
   KnuBowGBjuAhAxf2KdORLf3nsMgVL9U9Y0TfeZFIUM8/L6J7gdzrbYHO8
   kaMyRDz/3sPHEzsxbs/AGnm/XiqxxcA0whhjDEppr6Q8OCHRXZ6TnBXhc
   bCVG39u4Tro3F2ixEzqG2wHmpGu0rD8+akf8/rTlbBM1FihB1C78FAhAv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9309339"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9309339"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 10:37:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905706838"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="905706838"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2024 10:37:11 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSi7Y-0008L7-2K;
	Wed, 24 Jan 2024 18:37:08 +0000
Date: Thu, 25 Jan 2024 02:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.9] BUILD
 SUCCESS 9317322218102c7ad0a1a155b8e779c7cd8a93bd
Message-ID: <202401250212.CQpS4lqg-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.9
branch HEAD: 9317322218102c7ad0a1a155b8e779c7cd8a93bd  ARM: multi_v7_defconfig: Disable board staging

elapsed time: 1314m

configs tested: 45
configs skipped: 158

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240124   clang
arm                   randconfig-002-20240124   clang
arm                   randconfig-003-20240124   clang
arm                   randconfig-004-20240124   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                                defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
s390                              allnoconfig   gcc  
s390                                defconfig   gcc  
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc64                             defconfig   gcc  
um                                allnoconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

