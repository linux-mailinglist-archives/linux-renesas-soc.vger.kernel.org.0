Return-Path: <linux-renesas-soc+bounces-1688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE69F838D1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 12:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D4111C21A3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 11:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DCD5C90B;
	Tue, 23 Jan 2024 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cbb1c8QT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A9D4E1A2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706008458; cv=none; b=ts29YfZVrODeOFh0LXgn9IwTFlxWbVYhAPO9G0OEoJShODNLVvc4NnRQjBL5vcKHrW9LGKGAMEn7zqYEhfu/zUle5n2t0jjHEgcAcIscKdbkssckVwakUfS2XOSW5VV8fNotJtCfFoDYYnpMjo0MkeoDrFApvDa1x5eKabInweM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706008458; c=relaxed/simple;
	bh=Mz3HC+Ost1DGoX65n7bZ9lR3sYM8V8MnNUHP36caDcE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W0IXqDNiiW3Nn3r77u7pc/eoLpCGfprujEQyX2Nx2YhMjZMQGiR+YuR/OGCDSJqxu+TQbRq5vIqubHWnmpa0lbOOmJKSxUyVBL4Ip5lLbqr3nxNyIC72bZ5+2rBZAQMOB9XPdEfH+Lgoa4PDwErBeY0XaEhs7RKoA3Dq8Z/4iYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cbb1c8QT; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706008456; x=1737544456;
  h=date:from:to:cc:subject:message-id;
  bh=Mz3HC+Ost1DGoX65n7bZ9lR3sYM8V8MnNUHP36caDcE=;
  b=cbb1c8QT33+eH2CfgwRWnJcQEMb4kYwCjjtdBhx2Z3hKysY1jQT/vGRC
   jl3iE1/4SnJqc3P/1hA88MvldO2TlvdPpo/BUvlQfdjcWvLXP/G0cS3LZ
   m/K/VY/YfUuTjfQDLZRtfarl4ngHfqADU/Jv279oi9I26losk1BDH7T50
   z4QEbXuAgIY/lyT2wbYP+SHs1kLNAdfyKRFM4SD6diRaQcEv30ua0SxKh
   T0hAT8iofvVQEVZdv4CObCQKb5O6HWLNtYIuvjms0dquW0rVsB3KZJHZ2
   2TTP5D5RQCtEuRilnFCEUPxEDPWyG8bYUu2DISpJD1ynfTenCD74WJlYz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="465752117"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="465752117"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 03:14:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="1621326"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jan 2024 03:14:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSEjM-0007N6-2u;
	Tue, 23 Jan 2024 11:14:12 +0000
Date: Tue, 23 Jan 2024 19:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.9] BUILD SUCCESS
 8b93657c976a61726d7ffbe8d019b84b4abfb673
Message-ID: <202401231939.oXq2hwXS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.9
branch HEAD: 8b93657c976a61726d7ffbe8d019b84b4abfb673  arm64: dts: renesas: r8a779g0: Restore sort order

elapsed time: 1528m

configs tested: 64
configs skipped: 160

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
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                       imx_v6_v7_defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                            mmp2_defconfig   clang
arm                        neponset_defconfig   clang
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20240123   gcc  
arm                   randconfig-002-20240123   gcc  
arm                   randconfig-003-20240123   gcc  
arm                   randconfig-004-20240123   gcc  
arm                          sp7021_defconfig   clang
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240123   gcc  
arm64                 randconfig-002-20240123   gcc  
arm64                 randconfig-003-20240123   gcc  
arm64                 randconfig-004-20240123   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
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

