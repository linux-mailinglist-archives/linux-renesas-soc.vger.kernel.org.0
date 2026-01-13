Return-Path: <linux-renesas-soc+bounces-26667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA999D189C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 13:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ABE0301FB55
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 11:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCEB349B18;
	Tue, 13 Jan 2026 11:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgvqAoKD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E06A340A62
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305541; cv=none; b=DXEaa8sjJnlYXBYQKhhsolGTcJFFy5QLUvNdhmlJOXQv86gRLSwC/dar2bNsjjf2EOTxnZSmnXdAnVXSn/eE0DfwJWvPDGCVXAg56lSOoElj2xZ4dy/i/X2Fzn6i014bCJr37Y7UgNB78ikt2jwWTcJMvkQ95tyG8/DrDHAgbwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305541; c=relaxed/simple;
	bh=Ckcilk7FnKmHf2mtTOAp7Matr02fbMgGYqSYWqAa+eI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b3Nos0OfFx3pQaKd00d2DIsEXIqDTMheXP8zEbay9HjUPAhK1bik/0oXuSfcynsG86CxXDeeQFwRbMMiT6fX69HQdv0oum+S7Pi1u2mYOWCpwr4AlP/xzyoMLwfO2Ca2zVKXdIopD2+xlwpd7ULty9Eh/dDHfvJTuQ1dS2Nb0Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgvqAoKD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768305540; x=1799841540;
  h=date:from:to:cc:subject:message-id;
  bh=Ckcilk7FnKmHf2mtTOAp7Matr02fbMgGYqSYWqAa+eI=;
  b=CgvqAoKDER6xCyCulLUGXJfUVFnW1TWVarwtAT+P0U1xjJ25SkN7+TrC
   7uCvGNgs9Ne9bhAAU/D1F9k3YG1S3e4ib7B0kIXjBciWOPZx5aZ2UF0iX
   MJBazy30EMkD8Nu0PBTEwHf4LOTwglg7EMqouJ19/wiFQRyDOeC7KgMcJ
   xwrE7dOpjcn5TSIjKnX+aGXv3CdyxjrcejPcSlaxEeFB6f1VeCsRPo6F0
   LQRt0feA0WGiakxwD79LepfKh+YKbSITbl+W43uCOnne/rhiFKH8eAec2
   evd6Tzuwmaqmzs/11TiMJG1bk2BmHhWrrGeDvoiUzD6yZo3ODogQmNPj3
   A==;
X-CSE-ConnectionGUID: 49sOnTcFTIKZLWFK2XWm9Q==
X-CSE-MsgGUID: p2SbHEYJQFCVT3xAylvVVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="87003836"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="87003836"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:59:00 -0800
X-CSE-ConnectionGUID: 9B5LkpQ6S6qxT3RuChr0tw==
X-CSE-MsgGUID: V4iF+r7xRYCvlcAAoGH7NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204382348"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jan 2026 03:58:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfd32-00000000EhM-0gi0;
	Tue, 13 Jan 2026 11:58:56 +0000
Date: Tue, 13 Jan 2026 19:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v6.20] BUILD
 SUCCESS 8b12070746854a70bd43d5763562561efc1840de
Message-ID: <202601131924.HEh99OLn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v6.20
branch HEAD: 8b12070746854a70bd43d5763562561efc1840de  dt-bindings: pinctrl: renesas,r9a09g077-pinctrl: Document GPIO IRQ

elapsed time: 5780m

configs tested: 85
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                   randconfig-001-20260113    clang-22
arc                   randconfig-002-20260113    clang-22
arm                               allnoconfig    clang-22
arm                   milbeaut_m10v_defconfig    gcc-15.2.0
arm                        mvebu_v7_defconfig    gcc-15.2.0
arm                   randconfig-001-20260113    clang-22
arm                   randconfig-002-20260113    clang-22
arm                   randconfig-003-20260113    clang-22
arm                   randconfig-004-20260113    clang-22
arm                           sunxi_defconfig    gcc-15.2.0
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260113    clang-22
arm64                 randconfig-002-20260113    clang-22
arm64                 randconfig-003-20260113    clang-22
arm64                 randconfig-004-20260113    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260113    clang-22
csky                  randconfig-002-20260113    clang-22
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20260113    clang-20
i386        buildonly-randconfig-002-20260113    clang-20
i386        buildonly-randconfig-003-20260113    clang-20
i386        buildonly-randconfig-004-20260113    clang-20
i386        buildonly-randconfig-005-20260113    clang-20
i386        buildonly-randconfig-006-20260113    clang-20
i386                  randconfig-011-20260113    gcc-14
i386                  randconfig-012-20260113    gcc-14
i386                  randconfig-013-20260113    gcc-14
i386                  randconfig-014-20260113    gcc-14
i386                  randconfig-015-20260113    gcc-14
i386                  randconfig-016-20260113    gcc-14
i386                  randconfig-017-20260113    gcc-14
loongarch                         allnoconfig    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     cu1000-neo_defconfig    gcc-15.2.0
nios2                             allnoconfig    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                generic-32bit_defconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                     tqm8560_defconfig    gcc-15.2.0
riscv                             allnoconfig    gcc-15.2.0
riscv                 randconfig-001-20260113    gcc-15.2.0
riscv                 randconfig-002-20260113    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                  randconfig-001-20260113    gcc-15.2.0
s390                  randconfig-002-20260113    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                    randconfig-001-20260113    gcc-15.2.0
sh                    randconfig-002-20260113    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20260113    clang-20
x86_64      buildonly-randconfig-002-20260113    clang-20
x86_64      buildonly-randconfig-003-20260113    clang-20
x86_64      buildonly-randconfig-004-20260113    clang-20
x86_64      buildonly-randconfig-005-20260113    clang-20
x86_64      buildonly-randconfig-006-20260113    clang-20
x86_64                randconfig-001-20260113    gcc-14
x86_64                randconfig-002-20260113    gcc-14
x86_64                randconfig-003-20260113    gcc-14
x86_64                randconfig-004-20260113    gcc-14
x86_64                randconfig-005-20260113    gcc-14
x86_64                randconfig-006-20260113    gcc-14
xtensa                           alldefconfig    gcc-15.2.0
xtensa                            allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

