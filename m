Return-Path: <linux-renesas-soc+bounces-25490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B9C9B335
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 11:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95B613A3A0B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 10:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8CD30146B;
	Tue,  2 Dec 2025 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwfzWMgq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA43D30F552
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Dec 2025 10:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764672144; cv=none; b=lNfLmLLfpTbSTbDUahMIFr6UqvKfn/XHIz9tKyxke189Cy88xmiIbjGFi0Oo45tx24J2vorWZKrUbmPqbgDdm6fcu7fB4xfhRNPTErl0ubbPCWG1CXYFxqq2b2FmxnVDgQWlO55MQF5xubTwVg04jK0/IApiRRKQWE68c7H3HPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764672144; c=relaxed/simple;
	bh=q25Qag3JeEZ5zMYac6zXL7H5RCgjHMVc48pziQ0adwc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SOOAmrzWQ3RQ0RPjq38L/UwkRLSSBgpMuvdKldw59pluRzuT0D2mHdhrui1LP1x1Dn0Ue17et2p5np/7+1RDLPmR5NCVks2GFdlStQ+jZ65OM42vwnz7pNEgR/U45Bm5Z7M9NOXBN5r29WC/zEBFckYFZ5KULo/ok97wJJAhd5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwfzWMgq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764672143; x=1796208143;
  h=date:from:to:cc:subject:message-id;
  bh=q25Qag3JeEZ5zMYac6zXL7H5RCgjHMVc48pziQ0adwc=;
  b=nwfzWMgqxdiISJ1EYdyNWmNErgHJxy9lf6Dizmv1YSHgWdViuYu2ySOT
   7jnMa/qvy/bu3B3jfiWcSKOgIAv+S1cSuUJQ7VX5ZBW8+i9yO8GrTzVbV
   3kXFvQeFfho7Z6DmcE0jTI7bAjlZkjdVy5SM8QNAwQXcwrLjIMCuqVHOm
   dJQFgG5xG19bJgFqk3YJcV1IvCO8BtbBodNT7VQ613vNlg93n5Vnh744z
   TvHfs7h6jYpldQBl1gbp+e/RuJpPTows6KKl+cuoFOas6QRxejyEBIe3l
   wdjz9ljwSNXtCefEoXGukmL1XQhxD5WmfsWJK1fRq7lr1McWsJwUsHKJv
   w==;
X-CSE-ConnectionGUID: X0frHOTPRPyLy3icWlIPpg==
X-CSE-MsgGUID: vKQrzXycSqSv5Bt7vp6zuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70250077"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="70250077"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 02:42:21 -0800
X-CSE-ConnectionGUID: 6TDGuhawSQG3fQ8A8vCZhw==
X-CSE-MsgGUID: ZPBhsBNcR3ua38NMFJlSkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="194173008"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Dec 2025 02:42:19 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQNpo-000000009je-3vJg;
	Tue, 02 Dec 2025 10:42:16 +0000
Date: Tue, 02 Dec 2025 18:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 b1be60df72d281fa681ab8d34e58905906973dd3
Message-ID: <202512021854.lwGJs6cj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: b1be60df72d281fa681ab8d34e58905906973dd3  Merge tag 'v6.18' into topic/renesas-defconfig

elapsed time: 1455m

configs tested: 166
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251202    gcc-8.5.0
arc                   randconfig-002-20251202    gcc-12.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20251202    clang-17
arm                   randconfig-002-20251202    clang-22
arm                   randconfig-003-20251202    clang-22
arm                   randconfig-004-20251202    gcc-14.3.0
arm                           sama5_defconfig    gcc-15.1.0
arm                        spear6xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251201    gcc-8.5.0
arm64                 randconfig-002-20251201    clang-22
arm64                 randconfig-003-20251201    clang-18
arm64                 randconfig-004-20251201    gcc-14.3.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251201    gcc-15.1.0
csky                  randconfig-002-20251201    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251202    clang-22
hexagon               randconfig-002-20251202    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251201    clang-20
i386        buildonly-randconfig-002-20251201    clang-20
i386        buildonly-randconfig-003-20251201    clang-20
i386        buildonly-randconfig-004-20251201    clang-20
i386        buildonly-randconfig-005-20251201    clang-20
i386        buildonly-randconfig-006-20251201    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251201    gcc-14
i386                  randconfig-002-20251201    clang-20
i386                  randconfig-003-20251201    clang-20
i386                  randconfig-004-20251201    clang-20
i386                  randconfig-005-20251201    gcc-14
i386                  randconfig-006-20251201    gcc-14
i386                  randconfig-007-20251201    clang-20
i386                  randconfig-011-20251202    clang-20
i386                  randconfig-012-20251202    clang-20
i386                  randconfig-013-20251202    gcc-14
i386                  randconfig-014-20251202    gcc-14
i386                  randconfig-015-20251202    gcc-14
i386                  randconfig-016-20251202    clang-20
i386                  randconfig-017-20251202    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251202    gcc-15.1.0
loongarch             randconfig-002-20251202    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251202    gcc-8.5.0
nios2                 randconfig-002-20251202    gcc-8.5.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251201    gcc-13.4.0
parisc                randconfig-002-20251201    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251201    gcc-13.4.0
powerpc               randconfig-002-20251201    gcc-10.5.0
powerpc64             randconfig-001-20251201    gcc-14.3.0
powerpc64             randconfig-002-20251201    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251202    gcc-9.5.0
riscv                 randconfig-002-20251202    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251202    clang-17
s390                  randconfig-002-20251202    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251202    gcc-15.1.0
sh                    randconfig-002-20251202    gcc-12.5.0
sh                          rsk7203_defconfig    gcc-15.1.0
sh                           se7712_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251201    gcc-8.5.0
sparc                 randconfig-002-20251201    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251201    clang-22
sparc64               randconfig-002-20251201    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251201    gcc-14
um                    randconfig-002-20251201    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251202    gcc-14
x86_64      buildonly-randconfig-002-20251202    gcc-14
x86_64      buildonly-randconfig-003-20251202    clang-20
x86_64      buildonly-randconfig-004-20251202    gcc-13
x86_64      buildonly-randconfig-005-20251202    gcc-14
x86_64      buildonly-randconfig-006-20251202    gcc-13
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251202    clang-20
x86_64                randconfig-002-20251202    clang-20
x86_64                randconfig-003-20251202    gcc-14
x86_64                randconfig-004-20251202    gcc-14
x86_64                randconfig-005-20251202    gcc-14
x86_64                randconfig-006-20251202    clang-20
x86_64                randconfig-011-20251201    clang-20
x86_64                randconfig-012-20251201    gcc-14
x86_64                randconfig-013-20251201    gcc-14
x86_64                randconfig-014-20251201    gcc-14
x86_64                randconfig-015-20251201    clang-20
x86_64                randconfig-016-20251201    clang-20
x86_64                randconfig-071-20251202    clang-20
x86_64                randconfig-072-20251202    clang-20
x86_64                randconfig-073-20251202    clang-20
x86_64                randconfig-074-20251202    clang-20
x86_64                randconfig-075-20251202    clang-20
x86_64                randconfig-076-20251202    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251201    gcc-9.5.0
xtensa                randconfig-002-20251201    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

