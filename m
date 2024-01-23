Return-Path: <linux-renesas-soc+bounces-1681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA2B838A7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 10:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF8E61F22849
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 09:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FFE5A0E6;
	Tue, 23 Jan 2024 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frPNY/aI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EA75A0E1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 09:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706002934; cv=none; b=H0GWrUKtD3sU8xFGcv3WsY/OtSs7hQio13CtBxM4dbGcm4WjBMOBIDgdaixaSj023AEtnEX1GhulS1GunqqUIC5veyDG18ne61XjOSrKhxZepSWNdYLKAT/p0KPME8SaCoV4m5y0UruNOM9CbaiX5AAucfbIKKdg57H2z04taIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706002934; c=relaxed/simple;
	bh=+0Fxf0qWMp7IoJr4A3h5K4mNi0iV8ipEhDT3587eLsg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uN/hFtA8C3G7nB88Jhh+VozSmr1N7FKZTSbhT1Q1c1lKpMCRjnzy89RAsQOG76c5QvhPkFHjWPGvfVWoBOIeL2Dy+6iNo1wTqrTmTZzMcRaVOhgpr+mPzPyQVrzqbwb2xLl9NSzK0nI5G+arTWJEqvlsF3gZQgxHuuB6HKfQ8WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frPNY/aI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706002933; x=1737538933;
  h=date:from:to:cc:subject:message-id;
  bh=+0Fxf0qWMp7IoJr4A3h5K4mNi0iV8ipEhDT3587eLsg=;
  b=frPNY/aIeA4wF6uRXABET6/ay5RutlO8NUPZ6SJ8p0Ftvo/piV3pgKPi
   iF89ePJ8wftcI/y9RoXEP/hV5FEH5S0rq7auVC01S1aCzxf5yfwZ7GGiB
   TvRe656NWaNIXMXkx8HuLW3DQ9LpmbAdV0BfDBLMhZkM+0R7PKFnPmvZi
   KDgkqyGHqv0qJzdzYWuf1wPbhfkvtTiDZySW26hgJDWcrrUsiRowB1ECw
   PFga6hYf8AYbITbXomFKMVgaMsmzjWztIzO0p8qeDpVP7tgq/WitYzKV/
   6ZuyyAC//sU5BTfveFZ4IJF0hAIgwWXCwuigFAQKDi+xb1gQjlTMgGVBe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="362509"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="362509"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 01:42:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="1601898"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jan 2024 01:42:10 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSDIF-0007K3-1O;
	Tue, 23 Jan 2024 09:42:07 +0000
Date: Tue, 23 Jan 2024 17:41:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 6251f25da3c72088c750c8f5ce28c3a23d69c1a7
Message-ID: <202401231725.e8WnZxsZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 6251f25da3c72088c750c8f5ce28c3a23d69c1a7  Merge branch 'renesas-dts-for-v6.9' into renesas-next

elapsed time: 1436m

configs tested: 56
configs skipped: 161

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
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                          ixp4xx_defconfig   clang
arm                            mps2_defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240123   gcc  
arm                   randconfig-002-20240123   gcc  
arm                   randconfig-003-20240123   gcc  
arm                   randconfig-004-20240123   gcc  
arm                       versatile_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240123   gcc  
arm64                 randconfig-002-20240123   gcc  
arm64                 randconfig-003-20240123   gcc  
arm64                 randconfig-004-20240123   gcc  
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

