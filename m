Return-Path: <linux-renesas-soc+bounces-6766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A754917263
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 22:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AB121F2232C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 20:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48ED917D353;
	Tue, 25 Jun 2024 20:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TU2UOrjp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9B6178394
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2024 20:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719346769; cv=none; b=SDrGokee0wV0iaZGnvNmIU+JK+U8dZzFZziEJ0FoJe5/DVBL4lwgvtN1bOG803uqhiPEMSOVOxlGvBIN5Mns/9C5f5tBv24j78u8cqJow45FXkr2i86VtV7z/cXM6IV/ATB8DjpDWov6wZthfrxKFQ0JlPpnF4ZRiFj/Qeu5kK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719346769; c=relaxed/simple;
	bh=emaNGM/JR9cfn6doyYLindrV0vnTXjkN8xcokX6OaiQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nps5pwGIJmm18w+ms4wkIZ7HcPx1xLNXCbNSwLRQ7WqgSUAKl+LtIn4estmSjUDQ+I2KagIMv1QZs5ermQcQXgvQLJBnvSb7xIaNTx5otj9dRnUd82l5SCiNLlZhOVOW5XJ3CqeaLLeb9dHjwpO0E0JyMP1pXba77tHOcndmUxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TU2UOrjp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719346763; x=1750882763;
  h=date:from:to:cc:subject:message-id;
  bh=emaNGM/JR9cfn6doyYLindrV0vnTXjkN8xcokX6OaiQ=;
  b=TU2UOrjpSclXC9BZsJlp+NuPUTRvFUowmKz8tTOcCu1b/SCLrDGpvPGX
   znYCBCavJjMgNG5VRqt2lOVBrjLcEvd9vLQz2Lfl1Gj+vfFSIcMH1Wuc+
   8+pSW1GIrigR1Y3vhKdSm/uIAuag71Rq4Ad2E+flBd6WTGeKPjGfwvHO1
   OZfPdURaIbBUlLIBULMzmqcYWILwBdfXF4chnDw7zMuYu68Jn9FgBQv/u
   QGuC6MMvlDcXEiGCFd+z59PrJgxxdEzAi9/RXTsGa6KS+H4vtEMi7NjCw
   lmDy6REPm48KTjOEfQ80Wc9gQHBZ0AO/DzWTm4c/fT2gjZGtJ+Phcg34m
   g==;
X-CSE-ConnectionGUID: pkgTxTPIR6aA/58dbanayg==
X-CSE-MsgGUID: wRDKhi3xSA6or89+mm1TSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16616340"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="16616340"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 13:19:23 -0700
X-CSE-ConnectionGUID: mUXa8u8ERq2VPyh/AgpjRA==
X-CSE-MsgGUID: 12iVxMcLTFG5qMUuLpEong==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="48683971"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Jun 2024 13:19:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMCdL-000EhK-1d;
	Tue, 25 Jun 2024 20:19:19 +0000
Date: Wed, 26 Jun 2024 04:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 9ba049c499cd35bb4a5add713dd768d2cea3590a
Message-ID: <202406260458.w7cYI7AV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: 9ba049c499cd35bb4a5add713dd768d2cea3590a  pinctrl: renesas: Add R-Car Gen3 fuse support

elapsed time: 1712m

configs tested: 56
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240625   gcc-13.2.0
arc                   randconfig-002-20240625   gcc-13.2.0
arm                   randconfig-003-20240625   gcc-13.2.0
arm                   randconfig-004-20240625   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240625   gcc-13.2.0
arm64                 randconfig-002-20240625   gcc-13.2.0
arm64                 randconfig-004-20240625   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240625   gcc-13.2.0
csky                  randconfig-002-20240625   gcc-13.2.0
i386         buildonly-randconfig-004-20240625   gcc-13
i386                  randconfig-001-20240625   gcc-13
i386                  randconfig-003-20240625   gcc-7
i386                  randconfig-006-20240625   gcc-13
i386                  randconfig-012-20240625   gcc-13
i386                  randconfig-015-20240625   gcc-12
i386                  randconfig-016-20240625   gcc-10
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240625   gcc-13.2.0
loongarch             randconfig-002-20240625   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240625   gcc-13.2.0
nios2                 randconfig-002-20240625   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                randconfig-001-20240625   gcc-13.2.0
parisc                randconfig-002-20240625   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-002-20240625   gcc-13.2.0
powerpc               randconfig-003-20240625   gcc-13.2.0
powerpc64             randconfig-001-20240625   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                 randconfig-001-20240625   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                    randconfig-001-20240625   gcc-13.2.0
sh                    randconfig-002-20240625   gcc-13.2.0
sparc64               randconfig-001-20240625   gcc-13.2.0
sparc64               randconfig-002-20240625   gcc-13.2.0
x86_64       buildonly-randconfig-001-20240625   gcc-13
x86_64                randconfig-002-20240625   gcc-13
x86_64                randconfig-003-20240625   gcc-13
x86_64                randconfig-006-20240625   gcc-13
x86_64                randconfig-012-20240625   gcc-13
x86_64                randconfig-015-20240625   gcc-13
x86_64                randconfig-016-20240625   gcc-11
x86_64                randconfig-071-20240625   gcc-13
x86_64                randconfig-074-20240625   gcc-13
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240625   gcc-13.2.0
xtensa                randconfig-002-20240625   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

