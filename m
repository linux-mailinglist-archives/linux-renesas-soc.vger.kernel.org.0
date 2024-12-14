Return-Path: <linux-renesas-soc+bounces-11342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A7F9F1E57
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 12:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 677351886CFF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 11:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B360218E76F;
	Sat, 14 Dec 2024 11:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIRIOaqg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B7218DF6D
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Dec 2024 11:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734176804; cv=none; b=tzJdQnE+CBh4OOFHWXs/kvWbtB07UGyG4vi5pJf+qBqx3q/hvmXMCMCirtBGQkwPXidKTmSOERFLFbVXWn7oPrYPNXzDu+mxZ3EAeCaQOhLkT+qfdRIT7JguXO4stcUBv36y8kHfGff5CLF7IpprkyUyKy/yMjKB64wymPdTHgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734176804; c=relaxed/simple;
	bh=J+8pRb8isDmSVIs0tlYTN0fkCrxqr5TJU5wcrF9rMbs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V+S3g59YMqp2qicJEfZqVvUtJG6pTlUYaZjPyV0YQCPln0NvESbM5VMDjURBIH/+ClgE8bS+5G6RcQGHbLQUmHbEUc+Rb71rx0kE7s8GEzsWL/fCdHdC4hrkb57+w2Xa4Vga1rPj0r7vEbCy7koj5ewIfCmrufia3/29PQBMncc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIRIOaqg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734176802; x=1765712802;
  h=date:from:to:cc:subject:message-id;
  bh=J+8pRb8isDmSVIs0tlYTN0fkCrxqr5TJU5wcrF9rMbs=;
  b=WIRIOaqg8J1Wygo+rE1ajq9fDSHKldGuYXYYClhwfjbuYqgOP0/ghu/9
   V3y4BQz5pZFCWNGBA7+ZQMgYk7R09//OubH58pmoelnacsochhOUUdTHc
   N5xBanEbQoY09rLEHyxe0Ra20jvM3W81M6/cKmP4LqfFF0hzRwQTp92RS
   x5a1f4s1GyWsQWjgmE+HjsI+Bec4ocIPQxFQ3ODcDmTaErEAkHF2ZnrJx
   /C90PqXEAmoCuUvReS/3MWyFn80dcTjGIIGc3HpPdQIfTwet7pKN2K1b8
   qB4hqLsIanpg73XTUcRBm2e+SQ+qYxqdW0MPQz7jg8rB60gvJSIVBH+X2
   A==;
X-CSE-ConnectionGUID: 6dBHaISPSRiWE3btVXXv2g==
X-CSE-MsgGUID: y97CPYTITSuU2HV5iRelRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34769776"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34769776"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 03:46:42 -0800
X-CSE-ConnectionGUID: GNsdnb9OTFOa+MY96L6pzQ==
X-CSE-MsgGUID: p863QgaESxWZKKPb+CWF5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="97179170"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Dec 2024 03:46:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMQbX-000Csx-0Q;
	Sat, 14 Dec 2024 11:46:39 +0000
Date: Sat, 14 Dec 2024 19:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.14] BUILD SUCCESS
 24bfc042ba3dc3692e206ff060eb22733b6d3ac0
Message-ID: <202412141942.ZJVLYOgq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.14
branch HEAD: 24bfc042ba3dc3692e206ff060eb22733b6d3ac0  arm64: dts: renesas: rzg3s-smarc: Add sound card

elapsed time: 1461m

configs tested: 56
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20241213    gcc-13.2.0
arc                  randconfig-002-20241213    gcc-13.2.0
arm                  randconfig-001-20241213    clang-16
arm                  randconfig-002-20241213    clang-18
arm                  randconfig-003-20241213    gcc-14.2.0
arm                  randconfig-004-20241213    clang-18
arm64                randconfig-001-20241213    gcc-14.2.0
arm64                randconfig-002-20241213    gcc-14.2.0
arm64                randconfig-003-20241213    clang-18
arm64                randconfig-004-20241213    gcc-14.2.0
csky                 randconfig-001-20241214    gcc-14.2.0
csky                 randconfig-002-20241214    gcc-14.2.0
hexagon              randconfig-001-20241214    clang-20
hexagon              randconfig-002-20241214    clang-14
i386       buildonly-randconfig-001-20241213    clang-19
i386       buildonly-randconfig-002-20241213    gcc-12
i386       buildonly-randconfig-003-20241213    gcc-12
i386       buildonly-randconfig-004-20241213    clang-19
i386       buildonly-randconfig-005-20241213    gcc-12
i386       buildonly-randconfig-006-20241213    gcc-12
loongarch            randconfig-001-20241214    gcc-14.2.0
loongarch            randconfig-002-20241214    gcc-14.2.0
nios2                randconfig-001-20241214    gcc-14.2.0
nios2                randconfig-002-20241214    gcc-14.2.0
parisc               randconfig-001-20241214    gcc-14.2.0
parisc               randconfig-002-20241214    gcc-14.2.0
powerpc              randconfig-001-20241214    clang-20
powerpc              randconfig-002-20241214    clang-15
powerpc              randconfig-003-20241214    clang-20
powerpc64            randconfig-001-20241214    gcc-14.2.0
powerpc64            randconfig-003-20241214    clang-20
riscv                randconfig-001-20241213    gcc-14.2.0
riscv                randconfig-002-20241213    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241213    gcc-14.2.0
s390                 randconfig-002-20241213    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241213    gcc-14.2.0
sh                   randconfig-002-20241213    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20241213    gcc-14.2.0
sparc                randconfig-002-20241213    gcc-14.2.0
sparc64              randconfig-001-20241213    gcc-14.2.0
sparc64              randconfig-002-20241213    gcc-14.2.0
um                   randconfig-001-20241213    gcc-12
um                   randconfig-002-20241213    clang-16
x86_64     buildonly-randconfig-001-20241213    gcc-12
x86_64     buildonly-randconfig-002-20241213    gcc-12
x86_64     buildonly-randconfig-003-20241213    gcc-12
x86_64     buildonly-randconfig-004-20241213    gcc-12
x86_64     buildonly-randconfig-005-20241213    gcc-12
x86_64     buildonly-randconfig-006-20241213    clang-19
xtensa               randconfig-001-20241213    gcc-14.2.0
xtensa               randconfig-002-20241213    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

