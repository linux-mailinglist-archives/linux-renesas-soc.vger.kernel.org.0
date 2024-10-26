Return-Path: <linux-renesas-soc+bounces-10171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 376039B1540
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2024 07:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3F3CB21CCD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Oct 2024 05:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A538143744;
	Sat, 26 Oct 2024 05:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iz6fkwtn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23937217F45
	for <linux-renesas-soc@vger.kernel.org>; Sat, 26 Oct 2024 05:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729922271; cv=none; b=LgJu6AU1n8ZCCY9ErL6IlizQ1zkPW2eEsqpA1we/cLrzzL4/osjqYUfak4rlPyTPOG291hp+dpTLJ4Cd9BzQtiSw7uxHamHVz5mwXJ2qkHMLg6UaH7QJslD1YJHDmNpEHmsGKHl2OTaM+dzRas04BpZe0c3KCl965EaH6mYXT94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729922271; c=relaxed/simple;
	bh=VTBlayLq2WSe8UssuWw6pSU/au7ly2VfrOgVJmj/a6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lKMvKAM4cEiQldvvDRXH0zv3fykZWy7NowEgUHFaEMD7VxRpXoKLkpbpT1MIxTCbWW0+DRKSQuXgFMGAhuCZkLAEMfpxLmJ09Jk82Ky8MenvK2D48FTSEFsvwzFoy3l9akESW/uw2LDv5O693z6OfueWRm9USXAg1cUxq2J8wTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iz6fkwtn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729922269; x=1761458269;
  h=date:from:to:cc:subject:message-id;
  bh=VTBlayLq2WSe8UssuWw6pSU/au7ly2VfrOgVJmj/a6g=;
  b=iz6fkwtn1nmVyxCS4CvFpEqk66/wzz0GJUxhcPECDb/Ps95AXsv4bykG
   A5HWk6qAZgHVUY80SK9nMilGqlNoCQ1gMyhMms+YwBWoAZS07HZr6NrtH
   2S6v2dQZtluxYNy2vjLx6Vsf+lZeC0qw4VvJ7vHsfstsSABhH+2aRmyni
   RnQBSV99PTFeyTC4aaYNdJpqpbogsuT+Abn0GPOYa1BZPIQsqKGEzREon
   8Le7IYLTfjgGgELrpeH8Z9nVc5tlIyhoZs+RmpvHrqnjRffPcmKFC9I4u
   aBF7Eqg/xxQ2UXEQnqPgAqqbUYfMh+ptaAwSYOwTdxo5UTeAWb5mWzlFC
   g==;
X-CSE-ConnectionGUID: jA3/DU1iT4eYQiHPhiMtqg==
X-CSE-MsgGUID: I154tvDxSum5gjSWg+I3SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29710861"
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="29710861"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 22:57:48 -0700
X-CSE-ConnectionGUID: AE97vNn9TRiAE8MRnCESag==
X-CSE-MsgGUID: iSfrM3LrToqVWBovr5J96g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="80705540"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Oct 2024 22:57:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Zo1-000ZKZ-2O;
	Sat, 26 Oct 2024 05:57:45 +0000
Date: Sat, 26 Oct 2024 13:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.13] BUILD SUCCESS
 9ddc07404cbab0aee36b076b627ad9ecb7bb2290
Message-ID: <202410261352.Rf2IZHHo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.13
branch HEAD: 9ddc07404cbab0aee36b076b627ad9ecb7bb2290  arm64: dts: renesas: r9a09g057: Add OPP table

elapsed time: 1172m

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

