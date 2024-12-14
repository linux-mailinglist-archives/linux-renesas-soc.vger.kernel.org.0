Return-Path: <linux-renesas-soc+bounces-11341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE339F1E53
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 12:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF9A5166D83
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 11:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB78188733;
	Sat, 14 Dec 2024 11:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPR1tjQf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4BF186287
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Dec 2024 11:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734176684; cv=none; b=ciCdGqem1v1If06ylG/csYOKfyuXLlt3BOUNKp2JoHGmT+9BUG23CjXV6zCQrsIe9uSmLcI2K28oWQi/+XsACRzJAC0nfH8DulO+kAj2R+PF+Vhy7gsOzgptOPurcrAc5hhlnWYTy7MGXZRCLp1mx52mrlh0xVY6zY89igokLUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734176684; c=relaxed/simple;
	bh=mtyJpJF62mQ+AMOwRxOuOIgMUmQ3Dwh1MnROArtVIJY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I1teTq0JhGk0R4vX3ULBIIee9auv1T8FoBkj8XjO2+cHHbGh7Vwc5J9au96K7nckMJ/gHHvFFO8ZyWBZcmzuSfgXH9Dea2XCEKNAeZ7I0NnuYiyQ/v0/tnn3O2FecF/OJ6Un2eCDexOXtt9m+bu5V0Qa/hsfuCcxUYG4QYMQsyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPR1tjQf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734176682; x=1765712682;
  h=date:from:to:cc:subject:message-id;
  bh=mtyJpJF62mQ+AMOwRxOuOIgMUmQ3Dwh1MnROArtVIJY=;
  b=FPR1tjQfreoo46Brw7ZJlMTY21UeguqHF8B/o/RqegAHUlSBpgIrVAhT
   v2yrT+pO7mD/p0CYyLdtilX1LpIJXWJ+6NlNcCFg8B/iMyZoDwbXJi65Y
   4rFV+MDTbOyzPl3Y9UGKtB7oJz78XZXyiAUJR3/9xh5vVIHt1KOXLmKom
   Z+HgLwRg3BRyDP7I0uDRwba7k1YSA0Qpqp3UUZOR4VCsAR5pWKhS9T+po
   yoRIwW9c/57rRqK74E5wwefn8+gQxpTZoeeWY1c8Az00WtiSop0yWy6G/
   5FunJ0GmSgEM4e62C7+Z4h/pAFcBvEyQq9yLa0mn1zi3l7l/eq8QcLuVi
   A==;
X-CSE-ConnectionGUID: UTNRWRz9SJGat+GeYNKdzQ==
X-CSE-MsgGUID: uVSJ91U/TNeLSgpVHP+30g==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34769714"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34769714"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 03:44:41 -0800
X-CSE-ConnectionGUID: m6bXQe+NQqKajAgdJC/4dg==
X-CSE-MsgGUID: VPLTGzGERCGBImeR0IImeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="97178952"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Dec 2024 03:44:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMQZa-000Csp-1Q;
	Sat, 14 Dec 2024 11:44:38 +0000
Date: Sat, 14 Dec 2024 19:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.14] BUILD
 SUCCESS 12e0bd600e3c2f33f9db0e3b91f6b8d8d95b7dbe
Message-ID: <202412141913.oywz0mOP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.14
branch HEAD: 12e0bd600e3c2f33f9db0e3b91f6b8d8d95b7dbe  soc: renesas: Add RZ/G3E (R9A09G047) config option

elapsed time: 1460m

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

