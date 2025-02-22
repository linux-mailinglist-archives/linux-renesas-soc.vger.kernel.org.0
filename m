Return-Path: <linux-renesas-soc+bounces-13517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34531A40A83
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Feb 2025 18:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83E0319C1F12
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Feb 2025 17:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989E420A5CE;
	Sat, 22 Feb 2025 17:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NU7ct7Dh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12391B2186
	for <linux-renesas-soc@vger.kernel.org>; Sat, 22 Feb 2025 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740244068; cv=none; b=tJHPzi2SAenONnC+AeW+9hfp1cjcW28/bvdZsRuvneRu9iiHuTU3Ung7tDfY+tID0OX1RTPUxTIM7Ii3FC9T/dLNfygAun7fVnX7amHbSD01mEBbqqIeUyWtG3jxj5A61EBTjHdZSZl+7rOjFV0AN14RqVJAZUjrMBTY4W0V5ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740244068; c=relaxed/simple;
	bh=/wa9UkSwLT5FBLwdtVSCk9HRDZJWo5o2Um8w10+jPA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MNfFPFAgyTE3sCrDGi6SB13PALWD3nmStYyhnjtkMkb1yx7gIjuqCRz/6lxry8BqxoAMjApDhB4eTJs9ROSswPVoIBqrCGPL/WGJdSVl4k9Ndqfp8T0z4utlftdmFhCPWoJGvbwO+N0uxxX6L6Lf4Zm7VLQbuurXsAwf7n5OTh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NU7ct7Dh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740244067; x=1771780067;
  h=date:from:to:cc:subject:message-id;
  bh=/wa9UkSwLT5FBLwdtVSCk9HRDZJWo5o2Um8w10+jPA4=;
  b=NU7ct7DhroEGh1ifyqjJGfmKOnLd7NG/SCpBBYsfEq4Zk761jmjIGEZM
   MMrdhjjcjywclEkCvBHEIcipa7AYXcFJZIz8KYDEwaN2i3kqHeEn1DsKx
   QlXEJSNo6cMfew1eVKTrwUdHf7OL+MydFDRElybF95atRh2fvp5M1vUQq
   gPZvBsweAxDtsYdgEqkWhc8re9ckvSd6RAi/YFEv5zuh3HMyDNNnHaFgR
   LVMK6hv2pZIFBQ4S23TWDXqipIPLvHgZC7Ct1TAYGQJo5p2Fu6lBTlnAd
   khkEhZ5RyLQ9fjXbqQsdxTftOz4iG8XPXdVX9Adtz7o2C/bdQ5Qwvyfqb
   w==;
X-CSE-ConnectionGUID: SZQvCgYfT06/pXovppNEMg==
X-CSE-MsgGUID: GQ/xPz23RSyyukKgoSVxnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41254962"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41254962"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 09:07:45 -0800
X-CSE-ConnectionGUID: kjH4aRrKTESuSydXIA7+ZA==
X-CSE-MsgGUID: nN0MMBQ4S7mefXqBOpNTjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116141518"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Feb 2025 09:07:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlsyb-0006kR-1a;
	Sat, 22 Feb 2025 17:07:41 +0000
Date: Sun, 23 Feb 2025 01:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 b91c46c7949788ff9b0bf3c8f6cb276bd2a3e973
Message-ID: <202502230113.GuV9vx7g-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: b91c46c7949788ff9b0bf3c8f6cb276bd2a3e973  Merge branches 'renesas-arm-defconfig-for-v6.15', 'renesas-arm-soc-for-v6.15', 'renesas-drivers-for-v6.15', 'renesas-dt-bindings-for-v6.15' and 'renesas-dts-for-v6.15' into renesas-next

elapsed time: 1453m

configs tested: 61
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                  randconfig-001-20250222    gcc-13.2.0
arc                  randconfig-002-20250222    gcc-13.2.0
arm                  randconfig-001-20250222    gcc-14.2.0
arm                  randconfig-002-20250222    gcc-14.2.0
arm                  randconfig-003-20250222    clang-16
arm                  randconfig-004-20250222    gcc-14.2.0
arm64                randconfig-001-20250222    gcc-14.2.0
arm64                randconfig-002-20250222    clang-21
arm64                randconfig-003-20250222    clang-18
arm64                randconfig-004-20250222    clang-21
csky                 randconfig-001-20250222    gcc-14.2.0
csky                 randconfig-002-20250222    gcc-14.2.0
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250222    clang-17
hexagon              randconfig-002-20250222    clang-19
i386       buildonly-randconfig-001-20250222    clang-19
i386       buildonly-randconfig-002-20250222    gcc-12
i386       buildonly-randconfig-003-20250222    gcc-12
i386       buildonly-randconfig-004-20250222    clang-19
i386       buildonly-randconfig-005-20250222    gcc-12
i386       buildonly-randconfig-006-20250222    clang-19
loongarch            randconfig-001-20250222    gcc-14.2.0
loongarch            randconfig-002-20250222    gcc-14.2.0
nios2                randconfig-001-20250222    gcc-14.2.0
nios2                randconfig-002-20250222    gcc-14.2.0
parisc               randconfig-001-20250222    gcc-14.2.0
parisc               randconfig-002-20250222    gcc-14.2.0
powerpc              randconfig-001-20250222    gcc-14.2.0
powerpc              randconfig-002-20250222    gcc-14.2.0
powerpc              randconfig-003-20250222    gcc-14.2.0
powerpc64            randconfig-001-20250222    gcc-14.2.0
powerpc64            randconfig-002-20250222    clang-16
powerpc64            randconfig-003-20250222    clang-18
riscv                randconfig-001-20250222    clang-21
riscv                randconfig-002-20250222    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250222    gcc-14.2.0
s390                 randconfig-002-20250222    clang-15
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250222    gcc-14.2.0
sh                   randconfig-002-20250222    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250222    gcc-14.2.0
sparc                randconfig-002-20250222    gcc-14.2.0
sparc64              randconfig-001-20250222    gcc-14.2.0
sparc64              randconfig-002-20250222    gcc-14.2.0
um                              allmodconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250222    gcc-12
um                   randconfig-002-20250222    gcc-12
x86_64     buildonly-randconfig-001-20250222    clang-19
x86_64     buildonly-randconfig-002-20250222    gcc-12
x86_64     buildonly-randconfig-003-20250222    gcc-12
x86_64     buildonly-randconfig-004-20250222    clang-19
x86_64     buildonly-randconfig-005-20250222    clang-19
x86_64     buildonly-randconfig-006-20250222    gcc-12
xtensa               randconfig-001-20250222    gcc-14.2.0
xtensa               randconfig-002-20250222    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

