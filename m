Return-Path: <linux-renesas-soc+bounces-8987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C8C97B482
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 22:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B63DDB291F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 20:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4AE13777E;
	Tue, 17 Sep 2024 20:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1KsljVe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7BD14A4D6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Sep 2024 20:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726604197; cv=none; b=Pec/Ejw/J2slKq6cgzGNu3IDcmhKelcySGe0RsrnLNcOedAHvaI64cx3RrOqetxx+t3I5TuOWcq8y5nMGczMnhiVQ73A8R+4XKRKCg9dh9C/Cbfailh7INDgm3Zh3fFpBQugaThAoz9ELQ+XIrCrj5uUBGLOz3GCXBkCSbJlOt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726604197; c=relaxed/simple;
	bh=B8hUEkbOgmUug2h7GV1Sdq0N2xfvKNzLvqDBx37cfSg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VzrVBTMpWCcyo/yYvgu61FwWt5dIM66CMtO3CZ600OMLc+OmL+jkj4oVSbDqMWZhtdW2NjJJ8HbdXdbYktaUIpkQ6Zs/LU4VUx7ntA58G3Qnv8Dy+mMwSJM8CznZCIg3+c66dPcQRQ4BiHCh+PM6I99AmiQKsja9hKJR7TJ0pSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1KsljVe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726604195; x=1758140195;
  h=date:from:to:cc:subject:message-id;
  bh=B8hUEkbOgmUug2h7GV1Sdq0N2xfvKNzLvqDBx37cfSg=;
  b=R1KsljVei7FpDQhTBwRfPjtB+jvVDDWWi+TCrUK2Xu47iQ+O2UDsA3tb
   8kYgDW32uZtKEawl0Zt6Ef9HQPWQ1GzY+1+fCsNFCcwk1VGIWX+Vx13cv
   jMWsvBSAaCTj1EsTairCJIY23Qsaa5dsHS8mxGiBgsej6P7wkQP8dGq0Y
   hQRL6qz/1vRybZjGauo09+SxPQnRGrnkht1voEO6l07jQE+XuKtrSpSaA
   pF/ABf+xumIExEHmLQ61C92admBvymN9r+RzOE0RHdEn+QWh05Loy/uqC
   eRXdU1aE/WSmuVA1DpN2ZXm+5+9ZdgP1rSR5YJ2Enbqoxul6BQkLJnf8l
   A==;
X-CSE-ConnectionGUID: pKpj3hbCT8GdqTwbkSstVQ==
X-CSE-MsgGUID: YQbvyc6ATTCiSpwfkejOOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25021018"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25021018"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 13:16:34 -0700
X-CSE-ConnectionGUID: kpyC0aOkTQK7IeMKEeqIMQ==
X-CSE-MsgGUID: mX5PYCaJRkaVtQZjEAu6zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="68933109"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Sep 2024 13:16:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqech-000BUw-2G;
	Tue, 17 Sep 2024 20:16:31 +0000
Date: Wed, 18 Sep 2024 04:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 f3faa03b1df0ceadd96a121b2b72e7c0fd78fc20
Message-ID: <202409180418.tPJQpzeb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: f3faa03b1df0ceadd96a121b2b72e7c0fd78fc20  Merge tag 'v6.11' into renesas-devel

elapsed time: 1963m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          ixp4xx_defconfig    gcc-14.1.0
arm                        multi_v7_defconfig    gcc-14.1.0
arm                          sp7021_defconfig    gcc-14.1.0
arm                        spear3xx_defconfig    gcc-14.1.0
arm64                            alldefconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240917    clang-18
i386        buildonly-randconfig-002-20240917    gcc-12
i386        buildonly-randconfig-003-20240917    clang-18
i386        buildonly-randconfig-004-20240917    clang-18
i386        buildonly-randconfig-005-20240917    clang-18
i386        buildonly-randconfig-006-20240917    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240917    gcc-12
i386                  randconfig-002-20240917    gcc-12
i386                  randconfig-003-20240917    clang-18
i386                  randconfig-004-20240917    gcc-12
i386                  randconfig-005-20240917    gcc-12
i386                  randconfig-006-20240917    clang-18
i386                  randconfig-011-20240917    gcc-12
i386                  randconfig-012-20240917    clang-18
i386                  randconfig-013-20240917    clang-18
i386                  randconfig-014-20240917    clang-18
i386                  randconfig-015-20240917    gcc-12
i386                  randconfig-016-20240917    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                 decstation_r4k_defconfig    gcc-14.1.0
mips                  maltasmvp_eva_defconfig    gcc-14.1.0
mips                        omega2p_defconfig    gcc-14.1.0
mips                          rm200_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                     akebono_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       eiger_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                     mpc5200_defconfig    gcc-14.1.0
powerpc                     mpc83xx_defconfig    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                           se7206_defconfig    gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                           rhel-8.3-bpf    clang-18
x86_64                           rhel-8.3-bpf    gcc-12
x86_64                         rhel-8.3-kunit    clang-18
x86_64                         rhel-8.3-kunit    gcc-12
x86_64                           rhel-8.3-ltp    clang-18
x86_64                           rhel-8.3-ltp    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

