Return-Path: <linux-renesas-soc+bounces-11337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 859C89F1E3F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 12:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F46F167D2E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 11:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B2D26AC3;
	Sat, 14 Dec 2024 11:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDfqoYtU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABEF16DEB3
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Dec 2024 11:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734175886; cv=none; b=NQ8Bha4Jj9fM6dhzz1ij4nnrszvqAh8C6dcRygxcfD12BVcoj+YSlQz+JQ0L5hJlqof/Aag+XnG85aKX7Og84LV4fOOHrPD3Vjd6dpzUjbj8NOUOvaz8t4dZpjtuW7mrcJZJV0CsVazYGfXyM0ZunvBjIMsxwKL1JSVFkcfphuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734175886; c=relaxed/simple;
	bh=IEKDn8/AX08BHa7fIThroEbAA5c4hUQE3mzr6zm9Jdw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lrxSDGKlAq5MwC/rLl9CJBwR0KEPPnSOjQCe1oRnCnlNVEo7JWOg9Ft9N8r9g4pnTlJ6BW8fdUUSV1zkQ6hrLdgwJCuLPyqvAAkAjWOq6Km+bx8YqMqkFzhXLk/jotWOM31JNXM3t3X4D7yFwgJApS5i+fLS7aTzHAPRgFBcysU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDfqoYtU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734175884; x=1765711884;
  h=date:from:to:cc:subject:message-id;
  bh=IEKDn8/AX08BHa7fIThroEbAA5c4hUQE3mzr6zm9Jdw=;
  b=JDfqoYtUcpfsvk4nXfkKHEFtLPFqUu/kOhHZqRG7Bi/IwQvTwiFnjNZJ
   Va9yeOWmt3Nsacjjcyoys/kjvkqp1A8a2NGNezKNoAIw6hGmujxrm7FfF
   hzJjsuXv6yBudk+6LxaEzYtvH5VQbqyPovDrdcENTE3elh9R0f2WFEg6Z
   EbMiUL5OipiTDAvBn/Gp/r8+QJrpfifREDWYImsDkiYXIPoLQHP1CJsxd
   yMZkyeLS/tpbU5o5H/Wc63QXEVO+ARuoPycxYKaWt1sRpYpA+Cm7px5DX
   QS1QLaVHYZTUPY9HfjqcTz6lsmPZlrItgCVgxqb8Avt2NQ71TlNgnEPid
   A==;
X-CSE-ConnectionGUID: M0O361Q3QciAfvuY/gmREQ==
X-CSE-MsgGUID: A6DjR4OpRQmdd4vMYsVLVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34769423"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34769423"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 03:31:24 -0800
X-CSE-ConnectionGUID: 5LekYOAfQvW1falO2Ct8jA==
X-CSE-MsgGUID: lhyhasnAQlWCY7133Tq3uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="127583441"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2024 03:31:23 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMQMi-000CsF-1B;
	Sat, 14 Dec 2024 11:31:20 +0000
Date: Sat, 14 Dec 2024 19:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 9ed22c3f97e94186c113e1bcab115a1861c15334
Message-ID: <202412141929.aivB1tJX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 9ed22c3f97e94186c113e1bcab115a1861c15334  Merge branches 'renesas-arm-defconfig-for-v6.14', 'renesas-drivers-for-v6.14' and 'renesas-dts-for-v6.14' into renesas-next

elapsed time: 1446m

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

