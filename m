Return-Path: <linux-renesas-soc+bounces-10456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 959859C49C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 00:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F704B27F72
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 23:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4925F156883;
	Mon, 11 Nov 2024 23:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfYZ8/fr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D48915887C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 23:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731368105; cv=none; b=K8Dn1pJ7NdK+BhiegO3beZXV6V6LKP/KsKD8RMy7yAfoy5Bt2LaY/LPLbORzDxENYMU3teQoBTwVeStY07PPem/hiH+kgFYOwwXgyCocI4FvaC8Wf6dgqwE08oX7SL/glj09U/RW7sN9YXNI3Ux6VNYJx3XaA20EEgWxvoQyHho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731368105; c=relaxed/simple;
	bh=LpvUK3l13sQg9jIXQ0qICf6jj+oj0KOwVT9SATDT/Ao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V+fefRpUlY7SZhLAXciJ+VtYluGYDerE1GzYAAoUcVTD/TJFKt2FKQ/Ul2XU4jN3fEWHzAsF05mLE8DrnoZnaaDziTjQJclI94XA6zRnvtN3wQZbrCS1AYpFehK+bNLJD4c/uScO4+Uh++tDZFEeJewaf2ukz/3PdWEESoBsV6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfYZ8/fr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731368103; x=1762904103;
  h=date:from:to:cc:subject:message-id;
  bh=LpvUK3l13sQg9jIXQ0qICf6jj+oj0KOwVT9SATDT/Ao=;
  b=TfYZ8/fr9g/LX/aXjEW5dJ6RBeeBfxApIfcefFnlBxwIikz8nGWFxcT9
   62z3vLnZ3gKe8dipPm5vQ7Or5FwKWytCWFo6AwKkuv9TFchKgpW/5awCR
   vJRfIhiPKdNea3VsklBzLxbqjm9zuO4yt293YArAJDP7Tb9k1GZ3gIH3x
   hTaGnRoipYdDfCCsKQVy/bsIJvnUA1xsH4fj5ay7cDgP2sCrigJYxN0QR
   QPabJiwFODOIFXeHDlmSMI6nQVS63RDfUF3R0o0A+0aajEB8eIYfedK3g
   CGqO8OlChsxWu4ewLL3G+EHawNoD5pqcdJVckQXzX51hZdzSvwxsG2wbi
   g==;
X-CSE-ConnectionGUID: Xkr0CL3xRw+LKt8ooWyd/w==
X-CSE-MsgGUID: HmStQJ+yTAWknJRxfm9zZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31063606"
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; 
   d="scan'208";a="31063606"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 15:35:02 -0800
X-CSE-ConnectionGUID: 7bzvL+mFTYaNSEArHqwvYA==
X-CSE-MsgGUID: 96oY3kSSSOqjJGyq5pvbBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; 
   d="scan'208";a="87064902"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Nov 2024 15:35:02 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAdvv-0000GF-1d;
	Mon, 11 Nov 2024 23:34:59 +0000
Date: Tue, 12 Nov 2024 07:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 19db22ddf56f0a2c3593f072225c8f9b4a0cb26d
Message-ID: <202411120731.szFZv9mx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 19db22ddf56f0a2c3593f072225c8f9b4a0cb26d  Merge branch 'renesas-next' into renesas-devel

elapsed time: 722m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241112    clang-19
i386        buildonly-randconfig-002-20241112    gcc-12
i386        buildonly-randconfig-003-20241112    gcc-12
i386        buildonly-randconfig-004-20241112    clang-19
i386        buildonly-randconfig-005-20241112    gcc-12
i386        buildonly-randconfig-006-20241112    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241112    clang-19
i386                  randconfig-002-20241112    clang-19
i386                  randconfig-003-20241112    clang-19
i386                  randconfig-004-20241112    gcc-12
i386                  randconfig-005-20241112    gcc-12
i386                  randconfig-006-20241112    gcc-12
i386                  randconfig-011-20241112    clang-19
i386                  randconfig-012-20241112    clang-19
i386                  randconfig-013-20241112    clang-19
i386                  randconfig-014-20241112    clang-19
i386                  randconfig-015-20241112    clang-19
i386                  randconfig-016-20241112    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

