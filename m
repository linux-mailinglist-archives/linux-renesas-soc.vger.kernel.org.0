Return-Path: <linux-renesas-soc+bounces-13496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FCCA3FE1B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 19:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B8A33A10C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 18:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD51F1EB18F;
	Fri, 21 Feb 2025 18:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbGEdTU8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A64B1E5702
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2025 18:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740161024; cv=none; b=u+tCQYChYh3UUy8Hw2k0f1sQccRISeejVrkNhUpw9wt1vX6z8lEHUnCfZj2bGvXu0aQyTW/UijbiQdgTD2bVyhE72eDJMNvVmGSpAbVH26SE5xWrX2+E4AKYEBCZegzon6YMS3ga4bczfF0Wk9Whnd8P3yQtUJjUVEP5g6zfM7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740161024; c=relaxed/simple;
	bh=9PGP91ysIBpXBaREyxq06GNaqe4Ltkvf4yXt9edjogQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DVQvNB8wXr5e+98cDaDmruuzdacA6yscKTfSDGSOnW+PWVB5MNtp6u29E8WWzU4fxtTBxjSL8foLd7QHUN3Zx9pXcNkzuAxNtUD+i6xKjR+suPxtXNEf7XrCuQNcxuhuMLyMF/MsucqC0mLS8BMB3FITEa3tnE/zGXQhX3D8+N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbGEdTU8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740161022; x=1771697022;
  h=date:from:to:cc:subject:message-id;
  bh=9PGP91ysIBpXBaREyxq06GNaqe4Ltkvf4yXt9edjogQ=;
  b=PbGEdTU8UrXj77okMxOnRPbeJ0ABdx+hRZ397MrmCm0xMnSC3QzaAzn7
   +PVeFSbBZRYc7G7v2hYU97dkw02rbLbebFT7fb6pbyRZHdlKTr0ZKlH5g
   mpkFG4alrj85KVWFM5ZEVrTdeapk/KeGyel339dnUrhN3ymiYee37uBCA
   C1W7JGECK/+9HNR/EXB3UKMC4ru0YfFp3oVFdDEQcDbmZzgbSTVkQLUcG
   z0WoiCb31lW2MBtAveYh4kLAf/okBvUdq73tA72woPeKPoKvqILhPi3B5
   sKxWr+smAZ4ECxiw9xNiGYa79aO1895qBQrNxT/4InSYYHad3Lby4z/8c
   Q==;
X-CSE-ConnectionGUID: NPrg3F/7SC2Re3Kwj1aO+w==
X-CSE-MsgGUID: FbApdQRuQkaJhZFZT/oktw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="52391515"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="52391515"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 10:02:47 -0800
X-CSE-ConnectionGUID: l2gPHqLJRMGMTv5cstm+6w==
X-CSE-MsgGUID: qCsDjk+qRAmZ/q4Ln5aipA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="152627453"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Feb 2025 10:02:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlXMK-0005r5-0c;
	Fri, 21 Feb 2025 18:02:44 +0000
Date: Sat, 22 Feb 2025 02:02:18 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v6.15] BUILD
 SUCCESS ea4065345643f3163e812e58ed8add2c75c3ee46
Message-ID: <202502220213.Lx3TYeUN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v6.15
branch HEAD: ea4065345643f3163e812e58ed8add2c75c3ee46  pinctrl: renesas: rzg2l: Suppress binding attributes

elapsed time: 1448m

configs tested: 74
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250221    gcc-13.2.0
arc                  randconfig-002-20250221    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250221    gcc-14.2.0
arm                  randconfig-002-20250221    clang-19
arm                  randconfig-003-20250221    gcc-14.2.0
arm                  randconfig-004-20250221    clang-21
arm64                           allmodconfig    clang-18
arm64                randconfig-001-20250221    clang-15
arm64                randconfig-002-20250221    clang-21
arm64                randconfig-003-20250221    clang-21
arm64                randconfig-004-20250221    gcc-14.2.0
csky                 randconfig-001-20250221    gcc-14.2.0
csky                 randconfig-002-20250221    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250221    clang-21
hexagon              randconfig-002-20250221    clang-21
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250221    gcc-12
i386       buildonly-randconfig-002-20250221    gcc-12
i386       buildonly-randconfig-003-20250221    gcc-12
i386       buildonly-randconfig-004-20250221    gcc-12
i386       buildonly-randconfig-005-20250221    clang-19
i386       buildonly-randconfig-006-20250221    clang-19
i386                               defconfig    clang-19
loongarch            randconfig-001-20250221    gcc-14.2.0
loongarch            randconfig-002-20250221    gcc-14.2.0
nios2                randconfig-001-20250221    gcc-14.2.0
nios2                randconfig-002-20250221    gcc-14.2.0
parisc               randconfig-001-20250221    gcc-14.2.0
parisc               randconfig-002-20250221    gcc-14.2.0
powerpc              randconfig-001-20250221    clang-21
powerpc              randconfig-002-20250221    clang-21
powerpc              randconfig-003-20250221    clang-17
powerpc64            randconfig-001-20250221    clang-21
powerpc64            randconfig-002-20250221    clang-21
powerpc64            randconfig-003-20250221    clang-19
riscv                randconfig-001-20250221    clang-21
riscv                randconfig-002-20250221    clang-21
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250221    gcc-14.2.0
s390                 randconfig-002-20250221    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250221    gcc-14.2.0
sh                   randconfig-002-20250221    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250221    gcc-14.2.0
sparc                randconfig-002-20250221    gcc-14.2.0
sparc64              randconfig-001-20250221    gcc-14.2.0
sparc64              randconfig-002-20250221    gcc-14.2.0
um                              allmodconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250221    gcc-12
um                   randconfig-002-20250221    gcc-12
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250221    gcc-12
x86_64     buildonly-randconfig-002-20250221    clang-19
x86_64     buildonly-randconfig-003-20250221    clang-19
x86_64     buildonly-randconfig-004-20250221    clang-19
x86_64     buildonly-randconfig-005-20250221    clang-19
x86_64     buildonly-randconfig-006-20250221    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250221    gcc-14.2.0
xtensa               randconfig-002-20250221    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

