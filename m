Return-Path: <linux-renesas-soc+bounces-5971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAA69011B0
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Jun 2024 15:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45527B2155E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Jun 2024 13:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72576156220;
	Sat,  8 Jun 2024 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5ZTaZ9K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A2C157E91
	for <linux-renesas-soc@vger.kernel.org>; Sat,  8 Jun 2024 13:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717853684; cv=none; b=sszUHU+U148cHd2wtdwqTfzWJHiMtpohdCsrI0jkrDEi7zfZ2cDdxCUua7iDJ+h5hkcl44fx1FCiY7ZpFO3AL40IbILQU3V0v8G0NLeM9NQDmS405aMNI7oQ24P8vQgoRPKalTpDERktfzkQs9+TuAyMHVKI6m2JXd0pX/gkI7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717853684; c=relaxed/simple;
	bh=4yBXIkI4fui3gF3GtuAstoHxx8Hyudk7bQEa2LuAxNo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B+D2jkK6FZf8IywixowBTw/QcmMALqZYv3TQSdWwkHLOkGJ9OHMqhFB3tOTqpJFhxGzCGJw1TVmENph65FaVmT5LuLsGO6aSHjlBFfbgOdEVgjrJJorL1pjjcJFsyh3SkSGKSPwn9LdWcJM17kOk2XVMfVJoRfTvFeNKiyhVC1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5ZTaZ9K; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717853683; x=1749389683;
  h=date:from:to:cc:subject:message-id;
  bh=4yBXIkI4fui3gF3GtuAstoHxx8Hyudk7bQEa2LuAxNo=;
  b=i5ZTaZ9KuNKabUULRK44JEX7CxaO6TCKLJU2+mJAi3D2mldhyE+tRjFL
   TYXoCvXJ4cRKLJ4Yd6i+UsGo0WdUtgNLmeM4Di+EGNbaNFlHWuP1Ddm2a
   9PkWTNXp4600B5t++8/2lsQhjG4gCAvP1p4oMi8sdC1gSCP3YXpixbAXC
   8hYc2bWtX/jIg03AOtnATdRmI+d6OgTw901lOEMNKNfASW59iWDllF7EK
   uBltbcDVLB3herCfsOU9zmzhAjxrAMD8sGUoU9XgjVyYdzd/DOW/oPBCn
   Kk8ILvb71lduEjy81heIdQKfGHLkUzJGOmVQMcJmYmSkngF9t0o8OdMPd
   Q==;
X-CSE-ConnectionGUID: hDne0yc0SxWdJBx1wuocWQ==
X-CSE-MsgGUID: U0bRjyHRSZK70Hsd5QofWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="25676857"
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="25676857"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 06:34:42 -0700
X-CSE-ConnectionGUID: ji5DrupJTE+kHwooo2ssWQ==
X-CSE-MsgGUID: sXls3G0JSniXGMszXc4VXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="39034711"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Jun 2024 06:34:42 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFwDP-0001dc-0T;
	Sat, 08 Jun 2024 13:34:39 +0000
Date: Sat, 08 Jun 2024 21:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.11] BUILD SUCCESS
 ec902716f22bdbbf8e66304c72fa74e02fec5ae4
Message-ID: <202406082155.p97JE4Es-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.11
branch HEAD: ec902716f22bdbbf8e66304c72fa74e02fec5ae4  clk: renesas: r8a779h0: Add VIN clocks

elapsed time: 1464m

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

