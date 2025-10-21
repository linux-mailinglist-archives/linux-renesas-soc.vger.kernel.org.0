Return-Path: <linux-renesas-soc+bounces-23346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C54BF442A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 03:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AC5118A6810
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 01:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D11015687D;
	Tue, 21 Oct 2025 01:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oj4OdW2/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B5015D1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 01:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761010503; cv=none; b=tUaU7Tpwcu+S/G/V8ONme3v8XWXwWYD83cYLeEUkqga5grg8h/8mDoldKtZrv0KzzW3xYQfrdMrSlpT1EaclSYm/Stp11JO8lFPRzz9WaIUw6fMUw+gmtBINMV4/eKa/4wmE7ZnuMpdHlgJ6fwgcF9uLRdXx2RAYUhWjtKCIUzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761010503; c=relaxed/simple;
	bh=zcCa3PPu9/jhKYV9BJJfd0NHAwfz9sx2iURZnnhClOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TYPPvOU4/P8xMrh7mHjw/XKfHQETJBQQT+IPiw0pqoxsYxV9dAlvirCPukPFgVCUGgZKeoAjQpYSdyAW16RZ1KcLLDhY+CuAd3ZERy2rLaVRog4DLou/kJpbbws8theSTHf4YEIiacuCHILz1t6ENoqaaum+LGEMd69a9W2iXO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oj4OdW2/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761010501; x=1792546501;
  h=date:from:to:cc:subject:message-id;
  bh=zcCa3PPu9/jhKYV9BJJfd0NHAwfz9sx2iURZnnhClOs=;
  b=Oj4OdW2/Ig4vJ8hSNkkKy0jQ+3cW2vvGtc7VuNqeTEf1JaF3QoopnpiD
   Px7xaX4G3Ht2yykTACiQZ96lNXJtyvNa0aHm4ttt34qJ3TkISsNAmeNdZ
   hXllbOzPUPjRX6MTTja16IWmGT/Vsz5U2RAXzMyl10Psf8d6ZU7BzZxuV
   Gs/mv8FQBi0W1p8xirCHvRPsX1YcQvO/+WniYrAYcYxwnM5huZWU3Q/04
   oa1RVomWPpAbTZBn4bkAfQGiOd/GCsgxchHqKqjMuNMg+5KFueJdGnX3H
   SO2ofitsfR3/MKClqLa0VsqWdRktbxBEEm4KSmfzBPmtYNpSQqaAXMQGc
   Q==;
X-CSE-ConnectionGUID: CL/hG7NwRPWDVR1lA+guAA==
X-CSE-MsgGUID: ZSFYEppaQwSeeggDrZnrIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66996227"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="66996227"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 18:35:00 -0700
X-CSE-ConnectionGUID: 4URtJMB+Rd6v+a+JehOz1g==
X-CSE-MsgGUID: Gl2NzFY9SLu58QMKu82g3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="183318918"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 20 Oct 2025 18:34:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB1H6-000ALl-2B;
	Tue, 21 Oct 2025 01:34:56 +0000
Date: Tue, 21 Oct 2025 09:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.19] BUILD
 SUCCESS a73b6603b42859f82c6d6f863691803bd24fb11c
Message-ID: <202510210924.e7C2Z37u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.19
branch HEAD: a73b6603b42859f82c6d6f863691803bd24fb11c  ARM: shmobile: defconfig: Refresh for v6.18-rc1

elapsed time: 947m

configs tested: 31
configs skipped: 119

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    clang-22
arc                     allnoconfig    clang-22
arm                    allmodconfig    gcc-15.1.0
arm                     allnoconfig    clang-22
arm                    allyesconfig    gcc-15.1.0
arm         randconfig-001-20251020    gcc-14.3.0
arm         randconfig-002-20251020    clang-22
arm         randconfig-003-20251020    clang-22
arm         randconfig-004-20251020    clang-22
arm64                   allnoconfig    clang-22
arm64                   allnoconfig    gcc-15.1.0
arm64       randconfig-001-20251020    clang-22
arm64       randconfig-002-20251020    gcc-12.5.0
arm64       randconfig-003-20251020    gcc-8.5.0
arm64       randconfig-004-20251020    gcc-10.5.0
csky                    allnoconfig    clang-22
hexagon                 allnoconfig    clang-22
loongarch               allnoconfig    clang-22
m68k                    allnoconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-15.1.0
openrisc                allnoconfig    clang-22
parisc                  allnoconfig    clang-22
powerpc                 allnoconfig    clang-22
riscv                   allnoconfig    clang-22
s390                    allnoconfig    clang-22
sh                      allnoconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
um                      allnoconfig    clang-22
xtensa                  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

