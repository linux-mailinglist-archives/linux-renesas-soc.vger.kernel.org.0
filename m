Return-Path: <linux-renesas-soc+bounces-1747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA75839F9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 03:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F12211C23031
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 02:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64171396;
	Wed, 24 Jan 2024 02:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Idz29/u1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B10BE56
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 02:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706064650; cv=none; b=m6/c3j7oSgz64nxT1BCz23uQlwE04ax3wCTBbxTkcSnSVF8SWoHJZa4caKQevh3qOrW69LlIZhJNfP9f5uUp3xwP4v/2FDMhxq+VcTbc5hcd9CiX02BI32M0L1yoTGuZL3ezsjh9+u4/zd39vmlS6GEQZ7Lg0jVjOpVfOSCsXLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706064650; c=relaxed/simple;
	bh=9uNSCGbx8d44oCXX5Jfx5fr3iLW4w6g56CHNrtbjdng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H6xU6fMAVPxEPJxUQhzMFDvJlfIOjjaXWLOE4aS9D4z8s5APXCnQAkTDe9lec7COlIxO3UoC+S5hSG4QQ5iMJ/cElbweOSoPvYAlan2gtj7KLQpGIJg/XFoMh34xe3b4KdsgwiuXkVPSP2Fd4DIYDUCJ1Su5oSEKpiPSpMwdTCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Idz29/u1; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706064649; x=1737600649;
  h=date:from:to:cc:subject:message-id;
  bh=9uNSCGbx8d44oCXX5Jfx5fr3iLW4w6g56CHNrtbjdng=;
  b=Idz29/u1DL2I+u9SIWsA0AKE9QN7wsFs1e9kd/1QykUJEoq2lRET4SnQ
   RDVbrRPfwmrAQUuXIMIU5MB+RHBoRCx2wKDk70Vmk8kiWvRGbyMBvMyCF
   zPOIvV9kG7lrq3HeSWk82HszuTXidCtpwrhxEgeCwn621djLAFrweDuoO
   zw3TCywwYAYbd55ve+pp+NS3TbDNR7zIMREj0xm7+AfWQnVXDEb9wBAmU
   LbieXWflnfEy9lgns4ONXNz43uFdKu67ALb0RWMSFnFYeOzZw8SDDR5SU
   /knPOXg4SnjoN3HTzL8MLK1/IIq1TJEMLjP5uaztEpI2IVDoKfAH7f5fp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400587940"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="400587940"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 18:50:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="20576221"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jan 2024 18:50:47 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSTLh-0007oX-0r;
	Wed, 24 Jan 2024 02:50:45 +0000
Date: Wed, 24 Jan 2024 10:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 66d34ad1da6f6b42599b3a9ccb6fee311d4f7ad8
Message-ID: <202401241016.FvxJpPii-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 66d34ad1da6f6b42599b3a9ccb6fee311d4f7ad8  Merge branch 'renesas-arm-defconfig-for-v6.9' into renesas-next

elapsed time: 1018m

configs tested: 50
configs skipped: 151

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
arm                   randconfig-001-20240123   gcc  
arm                   randconfig-002-20240123   gcc  
arm                   randconfig-003-20240123   gcc  
arm                   randconfig-004-20240123   gcc  
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

