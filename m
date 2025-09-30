Return-Path: <linux-renesas-soc+bounces-22492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FADDBAED4C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 02:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD1937A7D54
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 23:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B1B2D24B2;
	Tue, 30 Sep 2025 23:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FI4SIudb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8302D3A71
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 23:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759276797; cv=none; b=BrqQFduLKGGD4NNdN3JWbDMEvkgMhQy1dlX4X2/fNcLUK2cqseNohOkqm6izTyNak75FBRY/rF5xVTyJwYvUnX1yE1QLe1ols4PhZbdp7IU1KWcosP3gjiYKNp3d3qbQo9IWGm7t5VOQS7gAQqhqYmUUKSbd+lF9HQSYbFLcnVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759276797; c=relaxed/simple;
	bh=DTBhVcxIVYY7CR8v6S+op+xRL63qqP0u3OFqI2l+ez4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d3lcptEzb/iG0m2+n0nK1GVeIXKfqZbDqeF8mW1l7yOk3F1pY0cvuFBKHcyXcm7QuVdJCAWVMzrviNLatdWtZXKYRoF0y8pIrC7qCXOi83GsRUUnHDiexwgS/OGZbVBvNAmiQhVVMWmaZ25zVcaFxGGx0IArhPpLLAg8cxIPats=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FI4SIudb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759276795; x=1790812795;
  h=date:from:to:cc:subject:message-id;
  bh=DTBhVcxIVYY7CR8v6S+op+xRL63qqP0u3OFqI2l+ez4=;
  b=FI4SIudb3PtaBzjRObRsTPXf5pF4zKzJVHCBZ6RU0XbfWsSxumW07S0H
   SYklRO2Z5UzJqYf1TuUC1qOO2YRO3Mat/aKWxorvL3snhQmtgcn0ypWUP
   OBXffbAqOKX/jwxrWvIF2zAeF6GEsHRxFQ0sFyQuIgMsTmm0jG1/kjv9D
   ggT0Y9CJMXUnk6LtH28EqPxj457O+Eq2EUAJgFz0wagUUGDMtC/BecOxk
   26wLfOS48E4XHBtrEs0pBA8rjHLWl6Ci1GhgKGQ7Z9ENnYAH75/HN9fMK
   x24pydcVcBzXxUaOQm6e0W2VrrxGM2YYqVHnHy3W3NtQxqCKxDivlFiAR
   Q==;
X-CSE-ConnectionGUID: 3dJMiLahRnuiwgu80IqeKA==
X-CSE-MsgGUID: kqzLRF6sQnu7jZ6ZZ1negg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61712622"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="61712622"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 16:59:55 -0700
X-CSE-ConnectionGUID: kKe7NZBYRH+Hj0n3TVbpxQ==
X-CSE-MsgGUID: ULRzvKF4TDmGeySsnkH5Qw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2025 16:59:53 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3kG7-0002Zh-27;
	Tue, 30 Sep 2025 23:59:51 +0000
Date: Wed, 01 Oct 2025 07:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.19] BUILD
 SUCCESS 2a546062ca07be06f03215eb23f359d96b2579dd
Message-ID: <202510010742.H3WdEDOw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.19
branch HEAD: 2a546062ca07be06f03215eb23f359d96b2579dd  arm64: defconfig: Enable the Renesas RZ/G3E thermal driver

elapsed time: 782m

configs tested: 40
configs skipped: 125

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
arc                               allnoconfig    clang-22
arm                               allnoconfig    clang-22
arm                         assabet_defconfig    clang-22
arm                        keystone_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250930    clang-18
arm64                 randconfig-002-20250930    clang-22
arm64                 randconfig-003-20250930    clang-18
arm64                 randconfig-004-20250930    gcc-8.5.0
csky                              allnoconfig    clang-22
hexagon                           allnoconfig    clang-22
i386        buildonly-randconfig-001-20251001    clang-20
i386        buildonly-randconfig-002-20251001    clang-20
i386        buildonly-randconfig-003-20251001    clang-20
i386        buildonly-randconfig-004-20251001    clang-20
i386        buildonly-randconfig-005-20251001    clang-20
i386        buildonly-randconfig-006-20251001    clang-20
loongarch                         allnoconfig    clang-22
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-22
mips                        vocore2_defconfig    clang-22
nios2                             allnoconfig    gcc-15.1.0
parisc64                         alldefconfig    clang-22
powerpc                      mgcoge_defconfig    clang-22
powerpc                      tqm8xx_defconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                          r7780mp_defconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
x86_64      buildonly-randconfig-001-20251001    clang-20
x86_64      buildonly-randconfig-002-20251001    clang-20
x86_64      buildonly-randconfig-003-20251001    clang-20
x86_64      buildonly-randconfig-004-20251001    clang-20
x86_64      buildonly-randconfig-005-20251001    clang-20
x86_64      buildonly-randconfig-006-20251001    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

