Return-Path: <linux-renesas-soc+bounces-14150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA59A56D4B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 17:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87EAF3A34AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 16:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB63A227B88;
	Fri,  7 Mar 2025 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHZ4+qcH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5C0226D19
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Mar 2025 16:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364068; cv=none; b=uQFZsrOg1kLkmUAyIrHydNWKtwrVsdLOBuPlu0yUTsBU2wwZmezeFlz64lBJFhBFX2nh34MGfvilTJFsaEJ98Kyor78ZKM6kwCxlYPdotcP6K7Tq8BuDc1PNFckEj5KVpHA4xFHyGmRlqb/DCls25OAVANU+4XYssVrHc/aqL14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364068; c=relaxed/simple;
	bh=MPaPitoOo8BMqBlEqjjVw9p3C7qxOk+TCdzzMlU8uPE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PS2M3xeHiE0UkyAzcwtjE/04TybPric0eq+Xcm+3lj3d3uzRdjWkbWyfHlD4ZYIK4shUafrfOB8DAeagb9GJyDY5VEw5sxwhNUuOXJEM05lme1MBfvlZr2zHBsnXNNfjFPpv33zxBN2Cc3aQqLnu5OQ2hrrOyoGz5iWtt36x9qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHZ4+qcH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741364067; x=1772900067;
  h=date:from:to:cc:subject:message-id;
  bh=MPaPitoOo8BMqBlEqjjVw9p3C7qxOk+TCdzzMlU8uPE=;
  b=WHZ4+qcHz2a76VYKapzeUq6nnIs0oK36b/h0HQhLJuxyxgOxvryDj2PD
   pjy8FAh7Bp3JPQkinumR62QdwKITEyo5OiXHUgOaPhvij3NwGBIH96YTi
   eqAhIQa8Cvg47GMv8rXHD3N3j1cS+uu5gr2NdDJhHWXV9qUcqpAYzQsng
   DmQBFh3X8V040+/gT4zRIFio/ggx8N+r/QZ38lEYjNDleiDrpreF23rNm
   nuOqcbVvdxeUrPWmy5NOBJW6PGOZ1y3dLZE5iINlUzPJLGbJRvFjvj4Mu
   /msM2NMQqRAZw3ZoQaK3vt8b47iB9nCeIKM5Nd4tBmUb603D8JkoALVxK
   w==;
X-CSE-ConnectionGUID: eofT/x00TVSETU9VV7B+uw==
X-CSE-MsgGUID: 3vKUxhvNRQ+kBeVcQwV4yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53402452"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="53402452"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 08:14:27 -0800
X-CSE-ConnectionGUID: Iya826KuSJKSiDL6FurdwQ==
X-CSE-MsgGUID: n5pPwWR7QBe1ZbMS8cthvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="150154278"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Mar 2025 08:14:27 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqaL9-0000jB-29;
	Fri, 07 Mar 2025 16:14:23 +0000
Date: Sat, 08 Mar 2025 00:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 1756f54e0750ed48c7266c24b044065e7d0f9ffb
Message-ID: <202503080000.qCMxplzo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 1756f54e0750ed48c7266c24b044065e7d0f9ffb  Merge branch 'renesas-dts-for-v6.15' into renesas-next

elapsed time: 1454m

configs tested: 57
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20250307    gcc-13.2.0
arc                  randconfig-002-20250307    gcc-13.2.0
arm                  randconfig-001-20250307    clang-21
arm                  randconfig-002-20250307    gcc-14.2.0
arm                  randconfig-003-20250307    clang-19
arm                  randconfig-004-20250307    clang-21
arm64                randconfig-001-20250307    gcc-14.2.0
arm64                randconfig-002-20250307    clang-15
arm64                randconfig-003-20250307    gcc-14.2.0
arm64                randconfig-004-20250307    clang-15
csky                 randconfig-001-20250307    gcc-14.2.0
csky                 randconfig-002-20250307    gcc-14.2.0
hexagon              randconfig-001-20250307    clang-21
hexagon              randconfig-002-20250307    clang-21
i386       buildonly-randconfig-001-20250307    clang-19
i386       buildonly-randconfig-002-20250307    clang-19
i386       buildonly-randconfig-003-20250307    gcc-11
i386       buildonly-randconfig-004-20250307    clang-19
i386       buildonly-randconfig-005-20250307    gcc-12
i386       buildonly-randconfig-006-20250307    clang-19
loongarch            randconfig-001-20250307    gcc-14.2.0
loongarch            randconfig-002-20250307    gcc-14.2.0
nios2                randconfig-001-20250307    gcc-14.2.0
nios2                randconfig-002-20250307    gcc-14.2.0
parisc               randconfig-001-20250307    gcc-14.2.0
parisc               randconfig-002-20250307    gcc-14.2.0
powerpc              randconfig-001-20250307    gcc-14.2.0
powerpc              randconfig-002-20250307    clang-21
powerpc              randconfig-003-20250307    clang-19
powerpc64            randconfig-001-20250307    clang-21
powerpc64            randconfig-002-20250307    gcc-14.2.0
powerpc64            randconfig-003-20250307    gcc-14.2.0
riscv                randconfig-001-20250307    gcc-14.2.0
riscv                randconfig-002-20250307    clang-19
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250307    gcc-14.2.0
s390                 randconfig-002-20250307    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250307    gcc-14.2.0
sh                   randconfig-002-20250307    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250307    gcc-14.2.0
sparc                randconfig-002-20250307    gcc-14.2.0
sparc64              randconfig-001-20250307    gcc-14.2.0
sparc64              randconfig-002-20250307    gcc-14.2.0
um                   randconfig-001-20250307    clang-17
um                   randconfig-002-20250307    clang-21
x86_64     buildonly-randconfig-001-20250307    clang-19
x86_64     buildonly-randconfig-002-20250307    gcc-12
x86_64     buildonly-randconfig-003-20250307    clang-19
x86_64     buildonly-randconfig-004-20250307    clang-19
x86_64     buildonly-randconfig-005-20250307    clang-19
x86_64     buildonly-randconfig-006-20250307    gcc-12
xtensa               randconfig-001-20250307    gcc-14.2.0
xtensa               randconfig-002-20250307    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

