Return-Path: <linux-renesas-soc+bounces-6765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 755A2917250
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 22:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D9E0282B40
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 20:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD3E17D88C;
	Tue, 25 Jun 2024 20:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VetLV8ci"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38AA1779AE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2024 20:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719346272; cv=none; b=WF6hv/qNuwpLSDDnRc8lsq0Bu7cPnUgLYMlGmfO8tZ0XNQV0Q7EnQkQjZbpVBWh/hggPlGAGxe0u4ktZjpR438C9PnYsO/AX8q0kHbQwL9stjA+80VtYJUOJb71CQ1D8KDJtX2kG/CVYrRIKr84fmiocFs2xo0tUN/DYA25aS1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719346272; c=relaxed/simple;
	bh=9ChsJfl17AkLb2aXqNQxIctmkuPxhPjAHqiPU2tRQ54=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X4mAs8aZtGxPnyZI6uCUgYlcAjV7Qi/XP2hpFdUnoJ4Cci2Pnq2PSQz5aMOb/h3miAX5ZU24KShFd24K7gb4GKzrPTzQWe3TYvGl01LMf79pHMGT9qvr2fFLGHhUp2sg0iTL1V0SLLvZy6sryF+4ElPX8twiz/Icc/pgEIsxuXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VetLV8ci; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719346270; x=1750882270;
  h=date:from:to:cc:subject:message-id;
  bh=9ChsJfl17AkLb2aXqNQxIctmkuPxhPjAHqiPU2tRQ54=;
  b=VetLV8cigvzrXxJ+gouoktz6fMSYu0N33vgWe7P+S9GP2wSvYn4sttUW
   3TnFAB7qA+T60ftq5YAM6GjXE/7mkysqCGDDDXiVtkgyZKmkT1VvX6r9m
   kAMhRXC7Z9HTncd5+DmLF/L+9TAVvzUxqqyTKkOTOZkEJF9gukdoJcXdc
   3IqI8yhzVSekvMsyYJE0ZAX5JDekS0qSkPKORCZSEntsp2Ls2CSVj0vjI
   JB8qZ7fSkvycBu+nLyTykh86v4VeU8wKiID+GKVUPdziSWE9UBIOpCrum
   k6edgQ2V2tG48CBaUWY5SRquc4ILL4+X+W2Sz3rpXkylZR/8guErV9vnd
   A==;
X-CSE-ConnectionGUID: rnwY546lTRyUTTPAxuhx7g==
X-CSE-MsgGUID: yIXcknm+Sfy3VgFqz8SzrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16214301"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="16214301"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 13:11:10 -0700
X-CSE-ConnectionGUID: V9+xpafXRSayeNHFc05A1A==
X-CSE-MsgGUID: +C4XAR+wT3id+JDu0Af7rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="43832283"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Jun 2024 13:11:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMCVP-000Eh8-01;
	Tue, 25 Jun 2024 20:11:07 +0000
Date: Wed, 26 Jun 2024 04:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.11] BUILD SUCCESS
 d6c5fc9add9eb7a0d5bd179ab07cbf43e32b28d8
Message-ID: <202406260449.YvwJzzNP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.11
branch HEAD: d6c5fc9add9eb7a0d5bd179ab07cbf43e32b28d8  dt-bindings: clock: rcar-gen2: Remove obsolete header files

elapsed time: 1776m

configs tested: 61
configs skipped: 2

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
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240625   gcc-13.2.0
parisc                randconfig-002-20240625   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-002-20240625   gcc-13.2.0
powerpc               randconfig-003-20240625   gcc-13.2.0
powerpc64             randconfig-001-20240625   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                 randconfig-001-20240625   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240625   gcc-13.2.0
sh                    randconfig-002-20240625   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240625   gcc-13.2.0
sparc64               randconfig-002-20240625   gcc-13.2.0
um                             i386_defconfig   gcc-13
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

