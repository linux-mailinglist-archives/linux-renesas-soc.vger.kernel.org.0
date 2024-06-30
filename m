Return-Path: <linux-renesas-soc+bounces-6922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E887D91D1BA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Jun 2024 15:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7106B1F212EE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Jun 2024 13:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F812E419;
	Sun, 30 Jun 2024 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edh/+2CI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CB51DDEB
	for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Jun 2024 13:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719752978; cv=none; b=YWEpgdMkSI08fZK1uAl/ilA7lZXqMXVUBeBxwpMgPKgnvC9C/dJowyNmV76UVw/UqNK+hPOWsSDS2BOrGhJQFTwsEuRDFSKTbCb572dbUenkXq6ohxWCfJMIYVBdNEZbRXa/Jq1h5yF7noepD8wNZw/fV0U9nEYd6Oyy81Z6MHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719752978; c=relaxed/simple;
	bh=BvZBCGu18EBVU+E/0W+Hx4JW2GXDiLdqvZr5qDRPJ/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SF+pTZeURCPj6SQwenl4hU/+OhxffuVLaVuojZRgvatSymBx4777LAloN8OQE37lOSMNI5DA5/bTl0c6fFtHAbzy/w6D57ysM8+BzEoTbNMbv2R+MRogwOLGUczX8FaUpZV4iXJLVWYFL2r9v3FLJlRvQ7cCV+e/CaZ1jkHq8JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edh/+2CI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719752977; x=1751288977;
  h=date:from:to:cc:subject:message-id;
  bh=BvZBCGu18EBVU+E/0W+Hx4JW2GXDiLdqvZr5qDRPJ/I=;
  b=edh/+2CIVeNToNzwqdOwWpiFQDwXaTQFc877Z3cydOIkW75AHoBSP3bI
   qsfDa+aW1bGVZvGotP64wqLqnx3XW+U1wzjL0+WK7wtH7c4nusx09HzLn
   /rNc4eLvhe2TtGo+qR52Y3WN8dJbJ5YJL6knqex5s54rPMBdaoVYhlAv3
   1DpEwwN+I8PKPQo+La9Kbq4cEX1NtLeYAGB0wd+aXzqheRkAM6gqlhvGX
   QiHgSaWZOU9DXmuHJ+M5lNs9O7c+lw5SY7+q3p0SLb3mhAjbdEazN3x1C
   cg2zHCyUFJ8YcRZPUP1pLtHJdy9ugEeSQOqmw15tekRz9iN6mthDKrfQ4
   w==;
X-CSE-ConnectionGUID: zQn+lcibT020fMYU0TvVlQ==
X-CSE-MsgGUID: vhxiGiEyRZWUzfcg37hf7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="17015460"
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="17015460"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2024 06:09:37 -0700
X-CSE-ConnectionGUID: aOuS7hD8Rn6MPB8Ku8x3KQ==
X-CSE-MsgGUID: MNhedbEARIKhHPWbEePo+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="45335632"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Jun 2024 06:09:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNuJB-000LeG-1G;
	Sun, 30 Jun 2024 13:09:33 +0000
Date: Sun, 30 Jun 2024 21:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 fb0024d1d0742b1a1c97cfb05025913daccfd81f
Message-ID: <202406302110.m9x3UcLo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: fb0024d1d0742b1a1c97cfb05025913daccfd81f  pinctrl: renesas: r8a779h0: Remove unneeded separators

elapsed time: 4059m

configs tested: 74
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240630   gcc-13.2.0
arc                   randconfig-002-20240630   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                   randconfig-001-20240630   gcc-13.2.0
arm                   randconfig-002-20240630   gcc-13.2.0
arm                   randconfig-003-20240630   gcc-13.2.0
arm                   randconfig-004-20240630   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240630   gcc-13.2.0
arm64                 randconfig-002-20240630   gcc-13.2.0
arm64                 randconfig-003-20240630   gcc-13.2.0
arm64                 randconfig-004-20240630   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240630   gcc-13.2.0
csky                  randconfig-002-20240630   gcc-13.2.0
hexagon                           allnoconfig   clang-19
i386         buildonly-randconfig-001-20240628   gcc-10
i386         buildonly-randconfig-002-20240628   gcc-10
i386         buildonly-randconfig-003-20240628   gcc-10
i386         buildonly-randconfig-004-20240628   gcc-10
i386         buildonly-randconfig-005-20240628   gcc-10
i386         buildonly-randconfig-006-20240628   gcc-10
i386                  randconfig-001-20240628   gcc-10
i386                  randconfig-002-20240628   gcc-10
i386                  randconfig-003-20240628   gcc-10
i386                  randconfig-004-20240628   gcc-10
i386                  randconfig-005-20240628   gcc-10
i386                  randconfig-006-20240628   gcc-10
i386                  randconfig-011-20240628   gcc-10
i386                  randconfig-012-20240628   gcc-10
i386                  randconfig-013-20240628   gcc-10
i386                  randconfig-014-20240628   gcc-10
i386                  randconfig-015-20240628   gcc-10
i386                  randconfig-016-20240628   gcc-10
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240630   gcc-13.2.0
loongarch             randconfig-002-20240630   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240630   gcc-13.2.0
nios2                 randconfig-002-20240630   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                randconfig-001-20240630   gcc-13.2.0
parisc                randconfig-002-20240630   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240630   gcc-13.2.0
powerpc               randconfig-002-20240630   gcc-13.2.0
powerpc               randconfig-003-20240630   gcc-13.2.0
powerpc64             randconfig-001-20240630   gcc-13.2.0
powerpc64             randconfig-002-20240630   gcc-13.2.0
powerpc64             randconfig-003-20240630   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                 randconfig-001-20240630   gcc-13.2.0
riscv                 randconfig-002-20240630   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
s390                  randconfig-001-20240630   gcc-13.2.0
s390                  randconfig-002-20240630   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                    randconfig-001-20240630   gcc-13.2.0
sh                    randconfig-002-20240630   gcc-13.2.0
sparc64               randconfig-001-20240630   gcc-13.2.0
sparc64               randconfig-002-20240630   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0
um                    randconfig-001-20240630   gcc-13.2.0
um                    randconfig-002-20240630   gcc-13.2.0
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240630   gcc-13.2.0
xtensa                randconfig-002-20240630   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

