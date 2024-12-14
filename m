Return-Path: <linux-renesas-soc+bounces-11343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F024F9F1E59
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 12:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22CB7166D83
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 11:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D16A18D622;
	Sat, 14 Dec 2024 11:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wb2+/2U8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD87170A13
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Dec 2024 11:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734176926; cv=none; b=nqRvsvba+EJRESxGFrDi4cIT19NY8yT1rSV9gNUADlaX5jDAZfemiQzD38UY8r6cYXNLSc7Bqeh6jyhehEN+ye8ifnTLEo2oc40lHuO8mun9tCX5p81rgIRsLfR62RCALLY3b8MwUc76naegbdIqpAEDuy5n1fSoJgVv81akG1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734176926; c=relaxed/simple;
	bh=TZ59OkkpSi3i/C7eSBN2egvL1hk8FX2qTO3Q2Uizey8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ia+vXtCwfC+Y1b5/TYOcIjwkoXrrIsoae8acrd5isQ5IOaeiPgasqWW2cF7GA6A4JiSQKW7pX61eG98p7rIBPXxNSsix4FvE9yXoaH63757l8sRZqgoCtU2tNBgwoZI309XfrNj26PlB231mXCH5zPqXLyXr/X9bjrNk4NQguXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wb2+/2U8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734176924; x=1765712924;
  h=date:from:to:cc:subject:message-id;
  bh=TZ59OkkpSi3i/C7eSBN2egvL1hk8FX2qTO3Q2Uizey8=;
  b=Wb2+/2U8f6ci3DAl1bXYvaeH3t7y+WTpw0bYoipBZg1+YCDQ9uDkfhH9
   /6efRGNQhPiH12CM8tMP8N9fggisoU3HEQYxwH8c9LDl4r5ulyCYfy4FL
   BiJ+erIjHBigumN1gCcZi18YFjy799gdckBNnTbkYhlfo3bWbYRNutpAO
   SiyrT3i8PiaiBbqdnHux/n1p8UyhUhFhdku1bOg3zeymuFAyCCqCO29UB
   qZdDij8mw3JMUibVHtS3uVMQLX1qupL6nFln/p1vkxlEkDAInLPbuq7tD
   MNQDdskfAg345o0i6+HzvTNnthurB+5zprJDSYzm+BcCzMDYVFGbjLEhj
   w==;
X-CSE-ConnectionGUID: lvlISCAKRtO0Fs1lQkMfSw==
X-CSE-MsgGUID: shqPso4KT2KJIGkEHK4PhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34856108"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34856108"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 03:48:43 -0800
X-CSE-ConnectionGUID: 27TZuultR/ea2DPCTW6TIg==
X-CSE-MsgGUID: nyLZpakGSTmNANAq1aa+jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97202794"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Dec 2024 03:48:42 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMQdU-000Ct1-0B;
	Sat, 14 Dec 2024 11:48:40 +0000
Date: Sat, 14 Dec 2024 19:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-r9a09g047-dt-binding-defs]
 BUILD SUCCESS 25458fdd39a18a5ce00c36f38992da54bb7453f3
Message-ID: <202412141920.UQnVX34B-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-r9a09g047-dt-binding-defs
branch HEAD: 25458fdd39a18a5ce00c36f38992da54bb7453f3  dt-bindings: clock: renesas: Document RZ/G3E SoC CPG

elapsed time: 1463m

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

