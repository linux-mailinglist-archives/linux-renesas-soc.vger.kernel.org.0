Return-Path: <linux-renesas-soc+bounces-10646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C119D45B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2024 03:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFDCB1F2150B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2024 02:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA3323099C;
	Thu, 21 Nov 2024 02:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gayPoN85"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BAB19A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Nov 2024 02:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732155684; cv=none; b=flHBslg+VyYR/cn4un1nznodfICvsISvPfllfYmROhvNj3EHot4gWB8uHr+yC4nRbl5Rk58GGVyNwuXVSRKL1x9CceectPjjO7lp8iQWqwRAYddScK456tiEuN3wT0qfPSvQP+LpM1/USvQcRgmxlhtwqgOsrYRO5xbuBo/4Sn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732155684; c=relaxed/simple;
	bh=P1XYZg8pNOqzyTJU5rha73zb9fvu/9HthHf2LIVNmZw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qhu9pr99wdncsXe/DWlWl6HZ9zvWVwfiAB6g4kcR1qSIhL1GlpMJNAOKzbrOVaGiLMIUpzkTM6hUWamzmbOYus6O3CFLMM9OBxZ8UVz/vyVrJvVt8iik/QI9jz9OES0ITmYJOWOH1/ffVoxfa7IFuD3jmd8dUG8uSx8gglaxS9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gayPoN85; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732155682; x=1763691682;
  h=date:from:to:cc:subject:message-id;
  bh=P1XYZg8pNOqzyTJU5rha73zb9fvu/9HthHf2LIVNmZw=;
  b=gayPoN85ue5KgOSPNf/YbwUB/TPKUT7YN+OsVMuOsiKlBcJfE2jeFJ//
   RNziJT+gvzqE2RpdA8fOMvnk1G2docsFEhreyDzQ0UJLgEj5Iz8w37RXK
   fecdNAGkeYkjzo4SFTw43r9cI2kkoUA0JijeD8GUPeH5P1FOpnKzgwsKt
   QFXd1uoG1eBIJxl9yEOyC8JJpldlyoZMuTNmyw4lTB9G7EsqQ0DThONOi
   OS3nVfx913AQndGdLu8Cu528v+oWwsiWqymTjNoSlv2L2zl+fBBNaHusO
   P6EDrO2ZQGLx+U+cw9emjt7GO64OX6tBoZoHRQ8dtPl+8m7i6xRQmDYMK
   Q==;
X-CSE-ConnectionGUID: Olgb62M8S3GdM+CjgbGuFg==
X-CSE-MsgGUID: MmyrPrs6QD6HzSIemXFhhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32302501"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="32302501"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 18:21:16 -0800
X-CSE-ConnectionGUID: ngq17LhORkaMRgDanCtlAw==
X-CSE-MsgGUID: 4WGliCvBTYWviZ04o0Ms7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="113374545"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2024 18:21:15 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDwoi-0001RJ-3D;
	Thu, 21 Nov 2024 02:21:12 +0000
Date: Thu, 21 Nov 2024 10:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 5cc53997b8bf9f9c3ebbb43aea16c7d3fdd08248
Message-ID: <202411211054.c88khVJO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 5cc53997b8bf9f9c3ebbb43aea16c7d3fdd08248  [LOCAL] riscv: renesas: defconfig: Update rzfive_defconfig

elapsed time: 1449m

configs tested: 91
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.2.0
alpha                  allyesconfig    gcc-14.2.0
arc                    allmodconfig    gcc-13.2.0
arc                     allnoconfig    gcc-13.2.0
arc                    allyesconfig    gcc-13.2.0
arc         randconfig-001-20241121    gcc-13.2.0
arc         randconfig-002-20241121    gcc-13.2.0
arm                    allmodconfig    gcc-14.2.0
arm                     allnoconfig    clang-20
arm                    allyesconfig    gcc-14.2.0
arm         randconfig-001-20241121    clang-20
arm         randconfig-002-20241121    gcc-14.2.0
arm         randconfig-003-20241121    clang-20
arm         randconfig-004-20241121    gcc-14.2.0
arm64                  allmodconfig    clang-20
arm64                   allnoconfig    gcc-14.2.0
arm64       randconfig-001-20241121    clang-20
arm64       randconfig-002-20241121    clang-20
arm64       randconfig-003-20241121    gcc-14.2.0
arm64       randconfig-004-20241121    gcc-14.2.0
csky                    allnoconfig    gcc-14.2.0
csky        randconfig-001-20241121    gcc-14.2.0
csky        randconfig-002-20241121    gcc-14.2.0
hexagon                allmodconfig    clang-20
hexagon                 allnoconfig    clang-20
hexagon                allyesconfig    clang-20
hexagon     randconfig-001-20241121    clang-20
hexagon     randconfig-002-20241121    clang-15
i386                   allmodconfig    gcc-12
i386                    allnoconfig    gcc-12
loongarch              allmodconfig    gcc-14.2.0
loongarch               allnoconfig    gcc-14.2.0
loongarch   randconfig-001-20241121    gcc-14.2.0
loongarch   randconfig-002-20241121    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                    allnoconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze              allnoconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
mips                    allnoconfig    gcc-14.2.0
nios2                   allnoconfig    gcc-14.2.0
nios2       randconfig-001-20241121    gcc-14.2.0
nios2       randconfig-002-20241121    gcc-14.2.0
openrisc                allnoconfig    gcc-14.2.0
openrisc               allyesconfig    gcc-14.2.0
openrisc                  defconfig    gcc-14.2.0
parisc                 allmodconfig    gcc-14.2.0
parisc                  allnoconfig    gcc-14.2.0
parisc                 allyesconfig    gcc-14.2.0
parisc                    defconfig    gcc-14.2.0
parisc      randconfig-001-20241121    gcc-14.2.0
parisc      randconfig-002-20241121    gcc-14.2.0
powerpc                allmodconfig    gcc-14.2.0
powerpc                 allnoconfig    gcc-14.2.0
powerpc                allyesconfig    clang-20
powerpc     randconfig-001-20241121    clang-15
powerpc     randconfig-002-20241121    gcc-14.2.0
powerpc     randconfig-003-20241121    clang-20
powerpc64   randconfig-001-20241121    gcc-14.2.0
powerpc64   randconfig-002-20241121    clang-20
powerpc64   randconfig-003-20241121    clang-20
riscv                   allnoconfig    gcc-14.2.0
riscv                  allyesconfig    clang-20
riscv                     defconfig    clang-20
riscv       randconfig-001-20241121    gcc-14.2.0
riscv       randconfig-002-20241121    gcc-14.2.0
s390                    allnoconfig    clang-20
s390                      defconfig    clang-20
s390        randconfig-001-20241121    gcc-14.2.0
s390        randconfig-002-20241121    clang-20
sh                      allnoconfig    gcc-14.2.0
sh                        defconfig    gcc-14.2.0
sh          randconfig-001-20241121    gcc-14.2.0
sh          randconfig-002-20241121    gcc-14.2.0
sparc64                   defconfig    gcc-14.2.0
sparc64     randconfig-001-20241121    gcc-14.2.0
sparc64     randconfig-002-20241121    gcc-14.2.0
um                     allmodconfig    clang-20
um                      allnoconfig    clang-17
um                     allyesconfig    gcc-12
um                        defconfig    clang-20
um                   i386_defconfig    gcc-12
um          randconfig-001-20241121    gcc-12
um          randconfig-002-20241121    gcc-12
um                 x86_64_defconfig    clang-15
x86_64                  allnoconfig    clang-19
x86_64                    defconfig    gcc-11
x86_64                        kexec    clang-19
x86_64                     rhel-9.4    gcc-12
xtensa                  allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

