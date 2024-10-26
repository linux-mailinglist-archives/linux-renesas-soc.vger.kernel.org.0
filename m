Return-Path: <linux-renesas-soc+bounces-10172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BC19B1541
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2024 07:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F0AD283488
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2024 05:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F43143744;
	Sat, 26 Oct 2024 05:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mTO+erpe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D84217F45
	for <linux-renesas-soc@vger.kernel.org>; Sat, 26 Oct 2024 05:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729922331; cv=none; b=ExnrQSjsCjWkVCCh00Ab8i/KJ2S1jo4aDarMk43dn/KolXerUPIx7Wg8t6NegfXeL5c5nKUl3G25ItNiDYV/sMAE9JgW22vcjppUwNVjaekNZy929kTivfTr512WJ7prWBzgvYxNvVtlPNoV1vu+wTwMQsY1ROMZY7U5xE4hrdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729922331; c=relaxed/simple;
	bh=ayf5MDg/wMHDdpupjCtZL6WwOcikWs5Lw21aABoT+Bo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FQpbBBY9DvJ57/zdOP4nta2ZKkyCMMmfIGfeq6TcHuDEio/kexdrAwIiT4j2m3yR2y5sBJiF/bk8irFfNmztQ6ZB81jQRrZ5Rq+3sDefhNzmcGoFBXPDe8zibrgTqSGJn8dy9HsR41UuGnJg/0DagCW3G5+YJKeEqFt31TlSeis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mTO+erpe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729922329; x=1761458329;
  h=date:from:to:cc:subject:message-id;
  bh=ayf5MDg/wMHDdpupjCtZL6WwOcikWs5Lw21aABoT+Bo=;
  b=mTO+erpeOMnWqo55LiUvZMY+U8kpzQFst+8/cZZsOK5Vd4R1uwxGlGYL
   WkNLy1BRc4FfL/1ZGup9iix4DXVJCeGpfAfnXaSk93myp3sVBJYi/AxME
   5Q2EB8MJMpeWx0nRK7aBIhs+GAif95E+c9B2vuwBeUx8bi3kUH2P3RsWM
   Pbw0cpYB/1tDdXmrWatSt3q71T3BjhK+qL97QUIwxywpWbjcwfRaxq3m1
   l7ePLgUPXG5v+cHkwEwbDe42JQVH8TAYZn1l/69DtnqDrMLOgujzEVSPr
   sBhAd1lyHLWorZiKU4Gu7/HHiYd7G8J2tgAo6MOTt6irQQkjH5Edlw+6Y
   Q==;
X-CSE-ConnectionGUID: 5DgLrFDmSFOh3VAZeujmFg==
X-CSE-MsgGUID: Zt64/vIGSE2DQV9LwLa2dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29458418"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29458418"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 22:58:49 -0700
X-CSE-ConnectionGUID: cYsNTWuGRfaIS5ZVuj5GsA==
X-CSE-MsgGUID: B0Y0a2dqQVmdpcbII7dJcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="80758407"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Oct 2024 22:58:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Zoz-000ZKi-2U;
	Sat, 26 Oct 2024 05:58:45 +0000
Date: Sat, 26 Oct 2024 13:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 efac6dcf6ddb10b92369f3392aa86f4e9a924857
Message-ID: <202410261320.XvNLKPGr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: efac6dcf6ddb10b92369f3392aa86f4e9a924857  Merge branch 'renesas-dts-for-v6.13' into renesas-next

elapsed time: 1175m

configs tested: 51
configs skipped: 69

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allnoconfig    gcc-14.1.0
alpha       allyesconfig    clang-20
arc         allmodconfig    clang-20
arc          allnoconfig    gcc-14.1.0
arc         allyesconfig    clang-20
arm         allmodconfig    clang-20
arm          allnoconfig    gcc-14.1.0
arm         allyesconfig    clang-20
arm64       allmodconfig    clang-20
arm64        allnoconfig    gcc-14.1.0
csky         allnoconfig    gcc-14.1.0
hexagon     allmodconfig    clang-20
hexagon      allnoconfig    gcc-14.1.0
hexagon     allyesconfig    clang-20
i386        allmodconfig    clang-19
i386         allnoconfig    clang-19
i386        allyesconfig    clang-19
i386           defconfig    clang-19
loongarch   allmodconfig    gcc-14.1.0
loongarch    allnoconfig    gcc-14.1.0
m68k        allmodconfig    gcc-14.1.0
m68k         allnoconfig    gcc-14.1.0
m68k        allyesconfig    gcc-14.1.0
microblaze  allmodconfig    gcc-14.1.0
microblaze   allnoconfig    gcc-14.1.0
microblaze  allyesconfig    gcc-14.1.0
mips         allnoconfig    gcc-14.1.0
nios2        allnoconfig    gcc-14.1.0
openrisc     allnoconfig    clang-20
openrisc    allyesconfig    gcc-14.1.0
parisc      allmodconfig    gcc-14.1.0
parisc       allnoconfig    clang-20
parisc      allyesconfig    gcc-14.1.0
powerpc     allmodconfig    gcc-14.1.0
powerpc      allnoconfig    clang-20
powerpc     allyesconfig    gcc-14.1.0
riscv       allmodconfig    gcc-14.1.0
riscv        allnoconfig    clang-20
riscv        allnoconfig    gcc-14.1.0
riscv       allyesconfig    gcc-14.1.0
s390         allnoconfig    clang-20
sh           allnoconfig    gcc-14.1.0
um          allmodconfig    clang-20
um           allnoconfig    clang-20
um          allyesconfig    clang-20
x86_64       allnoconfig    clang-19
x86_64      allyesconfig    clang-19
x86_64         defconfig    clang-19
x86_64             kexec    gcc-12
x86_64          rhel-8.3    gcc-12
xtensa       allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

