Return-Path: <linux-renesas-soc+bounces-5974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66099901463
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Jun 2024 05:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22B8DB2128B
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Jun 2024 03:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49217484;
	Sun,  9 Jun 2024 03:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TyUJ3svJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289F6613D
	for <linux-renesas-soc@vger.kernel.org>; Sun,  9 Jun 2024 03:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717904633; cv=none; b=SQ2DzQkBgVz6tFTw7ZomndrbgY9VOIDAuUI8sBX12Lp7GQsLzDEjQyAozzG3ot9xszt33wsPuKRKYPSOAYYnDcAc+yjV+UHEGmYtWpvfDo25gGacNtoEPOTAldygJP/QiyP834v+KHjkQwf70EqnaYUjpkND4ytM5OcVFFydUsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717904633; c=relaxed/simple;
	bh=Vvxao1aIYWQcXgwdGac2u2YMsiH+VmmpOPFRAAw1bNw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tr+i0xNLjkvwyvXijlg4ZYx9Vds/daOYSIyDyuzq+ymWrd0M4wc8ZBxfdc+s+1Pgq4AnQzo5RRRi+TkhAvQujWI7q863BJ9ip7uHyYrEH1/pk4lQtsd3VkXD/JxNvkfwiuJtop+Th91zbc85jNJcj4QjdFLuVwy137i5fVbIsDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TyUJ3svJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717904631; x=1749440631;
  h=date:from:to:cc:subject:message-id;
  bh=Vvxao1aIYWQcXgwdGac2u2YMsiH+VmmpOPFRAAw1bNw=;
  b=TyUJ3svJlcYGVkjIo8h1a4zWn+0xCdkac3TWCEDAM562+tpaFEb6yIc1
   p+KG8SevlBflz8mVOsDULNnrBgEwOqUnomNLqCtbXADmJHgn15wUCRpQt
   ob0DoX0QjitSx8or3WJ/JSQgj+iLc0z4Jr9/c1uVDeeHd41L1xrZn5Uyc
   IrJM/XZOVUhaPVjyJTtOMAZHIsJHVOJm2iOlFxGey8GKJZLDgmXb9D4Td
   3/0nrV/y9WF1nM8FvrJv35j+PuJ/XE6WGOV8RSfe3NttNkbAhplc69h0/
   AkX5c7kZQxN9+md2tlee8feXWzn0kjz3ZmtzJvGCqtx6ez29G+muwO5Hg
   g==;
X-CSE-ConnectionGUID: Zw0L9u0USbWILD4+oFtOBQ==
X-CSE-MsgGUID: 1vXUo7goQGqy24mILQwkWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14711348"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14711348"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 20:43:51 -0700
X-CSE-ConnectionGUID: c2ahM0oSSEWUpw+0d2SDCg==
X-CSE-MsgGUID: xBTmHz8aRgSENzVcFZ+6xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="38649631"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Jun 2024 20:43:50 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG9T9-0000oq-1N;
	Sun, 09 Jun 2024 03:43:47 +0000
Date: Sun, 09 Jun 2024 11:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 d1ef2e3bcb03040dfe57f59896a00a69a5eb4b54
Message-ID: <202406091101.tEOzj6qw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: d1ef2e3bcb03040dfe57f59896a00a69a5eb4b54  Merge branch 'renesas-dts-for-v6.11' into renesas-next

elapsed time: 2313m

configs tested: 44
configs skipped: 151

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240609   clang
arm                   randconfig-002-20240609   gcc  
arm                   randconfig-003-20240609   gcc  
arm                   randconfig-004-20240609   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240609   gcc  
arm64                 randconfig-002-20240609   clang
arm64                 randconfig-003-20240609   gcc  
arm64                 randconfig-004-20240609   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                                defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
riscv                               defconfig   clang
s390                              allnoconfig   clang
s390                                defconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                           x86_64_defconfig   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

