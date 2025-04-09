Return-Path: <linux-renesas-soc+bounces-15674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA40A82766
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 16:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E44A1BC26B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 14:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C80266565;
	Wed,  9 Apr 2025 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAyBg0tT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFFB265CAC
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208048; cv=none; b=Kmj62ToDinT69HvnYkxtiMsd+266ZaaFBJRyv2ySX+GCldPDODXy3lWV6QrNivGo97DMnAeHqq+A68QiAQraTOTdaxwvTfKE9X01YmHjnfCtQydPRhPtOnAUWVjIiLsu2zZzYINxQkGp+owJM7T1Kotpew3yB9JY+DDWVCdT+4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208048; c=relaxed/simple;
	bh=XmoRUVNO0Pr3JStcWqMmLVlXcNoHBGqnBbMUI2s+oaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kF5zwLXyHGOGeN09JYwn0vf2ZQoIxchuhwg28XkIiHo6ggZkmbb8lIDncZrGWztmJd5O+FI22SU66HpBZCj/MdT+c2jkvJSTFrsDuEg0+ZeSUyEmTi6Cvu/OeJQm2PMNt6A7PW4tipnYg3DN2SXUBHDGAPkh7cDFdg6Y/3BDgTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAyBg0tT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744208046; x=1775744046;
  h=date:from:to:cc:subject:message-id;
  bh=XmoRUVNO0Pr3JStcWqMmLVlXcNoHBGqnBbMUI2s+oaQ=;
  b=VAyBg0tTxGlhsqVwHVi0LsMeLlvMZuiveeZ/Hv3HCTTGfyWE8pQhPtzB
   aVqpviT/dieIw4/ZDtxya+I2x5KykiyED3eVwjIwT8oswiO0ufxa+9Bv1
   /PyLa1SsiSUNdZTHFcjCaxv+2fj+1QzOJsLxVppQOSpyDIvmzZI+VepC2
   ZugrS6pkQOQp1wBuVWteDq1IkKjTnMPohrr+SgYDx/fR48bMhwJR/YAD4
   R5CKlwfggyHGEcX8c1flj3Vq8t9CJunpRlqqcu2+rp/SDAKr7cjTdlk/2
   rQ1rLYO0snSEjwNwYWYb6iIEBOv2MWptHUbpvQzwpM1AboHzzQNBE515v
   w==;
X-CSE-ConnectionGUID: +dicYG21TOic/Gp9fHaGig==
X-CSE-MsgGUID: Kkk/pOnyQDGqTtzaTLgDPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45698555"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45698555"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 07:14:05 -0700
X-CSE-ConnectionGUID: XFgZLHX9RbWSFaItl/UEWQ==
X-CSE-MsgGUID: dKhSAVN+RGW4IL9O+X1cVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="128335844"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Apr 2025 07:14:05 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2WBm-0008wh-0i;
	Wed, 09 Apr 2025 14:14:02 +0000
Date: Wed, 09 Apr 2025 22:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.16] BUILD SUCCESS
 b6f2c6bd4e9ea47afa2b66c0c64c296a1fbf4489
Message-ID: <202504092239.n1iKrjGS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.16
branch HEAD: b6f2c6bd4e9ea47afa2b66c0c64c296a1fbf4489  clk: renesas: r9a09g057: Add clock and reset entries for GE3D

elapsed time: 1479m

configs tested: 85
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250408    gcc-14.2.0
arc                   randconfig-002-20250408    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250408    clang-21
arm                   randconfig-002-20250408    gcc-10.5.0
arm                   randconfig-003-20250408    clang-17
arm                   randconfig-004-20250408    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                 randconfig-001-20250408    clang-21
arm64                 randconfig-002-20250408    gcc-9.5.0
arm64                 randconfig-003-20250408    gcc-9.5.0
arm64                 randconfig-004-20250408    clang-20
csky                  randconfig-001-20250408    gcc-14.2.0
csky                  randconfig-002-20250408    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250408    clang-21
hexagon               randconfig-002-20250408    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250408    clang-20
i386        buildonly-randconfig-002-20250408    clang-20
i386        buildonly-randconfig-003-20250408    gcc-12
i386        buildonly-randconfig-004-20250408    gcc-12
i386        buildonly-randconfig-005-20250408    gcc-12
i386        buildonly-randconfig-006-20250408    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250408    gcc-14.2.0
loongarch             randconfig-002-20250408    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
nios2                 randconfig-001-20250408    gcc-13.3.0
nios2                 randconfig-002-20250408    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250408    gcc-6.5.0
parisc                randconfig-002-20250408    gcc-8.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250408    gcc-5.5.0
powerpc               randconfig-002-20250408    gcc-9.3.0
powerpc               randconfig-003-20250408    gcc-5.5.0
powerpc64             randconfig-001-20250408    clang-21
powerpc64             randconfig-002-20250408    gcc-5.5.0
powerpc64             randconfig-003-20250408    gcc-7.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250408    gcc-9.3.0
riscv                 randconfig-002-20250408    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250408    gcc-8.5.0
s390                  randconfig-002-20250408    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250408    gcc-13.3.0
sh                    randconfig-002-20250408    gcc-13.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250408    gcc-10.3.0
sparc                 randconfig-002-20250408    gcc-6.5.0
sparc64               randconfig-001-20250408    gcc-6.5.0
sparc64               randconfig-002-20250408    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250408    clang-21
um                    randconfig-002-20250408    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250408    clang-20
x86_64      buildonly-randconfig-002-20250408    clang-20
x86_64      buildonly-randconfig-003-20250408    clang-20
x86_64      buildonly-randconfig-004-20250408    gcc-12
x86_64      buildonly-randconfig-005-20250408    clang-20
x86_64      buildonly-randconfig-006-20250408    clang-20
x86_64                              defconfig    gcc-11
xtensa                randconfig-001-20250408    gcc-6.5.0
xtensa                randconfig-002-20250408    gcc-6.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

