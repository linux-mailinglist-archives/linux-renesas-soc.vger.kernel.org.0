Return-Path: <linux-renesas-soc+bounces-13518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6AAA40A85
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Feb 2025 18:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C559F188F916
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Feb 2025 17:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151C078F32;
	Sat, 22 Feb 2025 17:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXbXSfLS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546F8EEDE
	for <linux-renesas-soc@vger.kernel.org>; Sat, 22 Feb 2025 17:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740244127; cv=none; b=ZDOL26hekQ9pgoMstVh4yvrFZrJ4LuLyOLlM2X/QykqDp/j8QQIve8YlSjsTbIgXo0v1Rmc/T4dwE2qk4ISrYLodmj8QPTBhmUF9RHYzCOTv9/zuxxoTTj/pBVm/AzTxkbZvWum6Yz/mBcChnLG0iqNJ4LGyc11yu8LaNxwIBsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740244127; c=relaxed/simple;
	bh=As/VuoySTKQ7JDEXlKVHczs368mzbrB1M9rizMUUYL8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EOdMsi7/PcRUQwADvIf47kUq3eGClifl73qHdsFN3nEl5dtMWDjh0yLFjjjPt4SuNEQRbgNOnGtHLntU3W4i97/nExyGsUyfN5CbPy3YUUvUwYfUGQgQcc0ltqY0pwQeTQSGsjwnB3TvmRFaQLEdOkQNFogaWO9NRAXQ/4nsYOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXbXSfLS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740244126; x=1771780126;
  h=date:from:to:cc:subject:message-id;
  bh=As/VuoySTKQ7JDEXlKVHczs368mzbrB1M9rizMUUYL8=;
  b=jXbXSfLSOTuLZow0aMWH7v6n6ep+d4uncgTYfk/KzadNaYlGVZyhMOGm
   0tnWRncU78NvBdw+f7ANYvckugoQgnjmO+m9rBGb284y+88KwS9UUNYo1
   mmcvSYDM7Oid78iO6I+t33lRtThMBe+GSYH5GnsnttA3PgQA3b1I07Yl7
   XN8zSl/QRBftlOUfg+4fFET1ZNO1P3UTu+OVPrsGq2Vbxf7YABB9I5bJw
   olcVaQZir6A4YUkVrcCBBKvAWeJ7VfiFnchUUyWsqtpX3amvKMm0YBrAc
   0w7y+MkhMXw3gzH1nNIVJiZP4kImfePfO9K6Af0woUjtqI0UXqMRtGdet
   w==;
X-CSE-ConnectionGUID: DnS26xfjQCC2RP+Q4K/Ipw==
X-CSE-MsgGUID: /WlAR6VAQba/00a39lxceQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="40893921"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="40893921"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 09:08:45 -0800
X-CSE-ConnectionGUID: T0zOMaR2Qc6PuCDFDqSejg==
X-CSE-MsgGUID: Z6gwzWfCSvmEMvwfE5nqGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="115845054"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Feb 2025 09:08:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlszZ-0006kj-24;
	Sat, 22 Feb 2025 17:08:41 +0000
Date: Sun, 23 Feb 2025 01:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 9ce3d8fd71076719a17928b8e9603139430796e0
Message-ID: <202502230143.TlifYdEM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 9ce3d8fd71076719a17928b8e9603139430796e0  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1454m

configs tested: 62
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                  randconfig-001-20250222    gcc-13.2.0
arc                  randconfig-002-20250222    gcc-13.2.0
arm                  randconfig-001-20250222    gcc-14.2.0
arm                  randconfig-002-20250222    gcc-14.2.0
arm                  randconfig-003-20250222    clang-16
arm                  randconfig-004-20250222    gcc-14.2.0
arm64                randconfig-001-20250222    gcc-14.2.0
arm64                randconfig-002-20250222    clang-21
arm64                randconfig-003-20250222    clang-18
arm64                randconfig-004-20250222    clang-21
csky                 randconfig-001-20250222    gcc-14.2.0
csky                 randconfig-002-20250222    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250222    clang-17
hexagon              randconfig-002-20250222    clang-19
i386       buildonly-randconfig-001-20250222    clang-19
i386       buildonly-randconfig-002-20250222    gcc-12
i386       buildonly-randconfig-003-20250222    gcc-12
i386       buildonly-randconfig-004-20250222    clang-19
i386       buildonly-randconfig-005-20250222    gcc-12
i386       buildonly-randconfig-006-20250222    clang-19
loongarch            randconfig-001-20250222    gcc-14.2.0
loongarch            randconfig-002-20250222    gcc-14.2.0
nios2                randconfig-001-20250222    gcc-14.2.0
nios2                randconfig-002-20250222    gcc-14.2.0
parisc               randconfig-001-20250222    gcc-14.2.0
parisc               randconfig-002-20250222    gcc-14.2.0
powerpc              randconfig-001-20250222    gcc-14.2.0
powerpc              randconfig-002-20250222    gcc-14.2.0
powerpc              randconfig-003-20250222    gcc-14.2.0
powerpc64            randconfig-001-20250222    gcc-14.2.0
powerpc64            randconfig-002-20250222    clang-16
powerpc64            randconfig-003-20250222    clang-18
riscv                randconfig-001-20250222    clang-21
riscv                randconfig-002-20250222    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250222    gcc-14.2.0
s390                 randconfig-002-20250222    clang-15
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250222    gcc-14.2.0
sh                   randconfig-002-20250222    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250222    gcc-14.2.0
sparc                randconfig-002-20250222    gcc-14.2.0
sparc64              randconfig-001-20250222    gcc-14.2.0
sparc64              randconfig-002-20250222    gcc-14.2.0
um                              allmodconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250222    gcc-12
um                   randconfig-002-20250222    gcc-12
x86_64     buildonly-randconfig-001-20250222    clang-19
x86_64     buildonly-randconfig-002-20250222    gcc-12
x86_64     buildonly-randconfig-003-20250222    gcc-12
x86_64     buildonly-randconfig-004-20250222    clang-19
x86_64     buildonly-randconfig-005-20250222    clang-19
x86_64     buildonly-randconfig-006-20250222    gcc-12
xtensa               randconfig-001-20250222    gcc-14.2.0
xtensa               randconfig-002-20250222    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

