Return-Path: <linux-renesas-soc+bounces-16777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3CCAAF1AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 05:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C1E94E581F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 03:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0714C1EDA16;
	Thu,  8 May 2025 03:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJdkWgD7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3DC1E32BE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 03:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746674965; cv=none; b=gBB2Zdxj8OHsFj1WPZpgG83XVl10ptR4Ly0p2xaZID7iha/nZfSGhlsS4He9fuFNtce+smCoGb9qOu0m05RcfmutabA349xsbGlgExnFPP4Q4KEo23uHoFsrbKXXzYCyD/0MhUFR7BaPh8P3eqtDP4OpP4IBmHphrHOJ6iVHKzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746674965; c=relaxed/simple;
	bh=Rqroz8MRiVm5kZO6eb+59RASxwa4MbsjsjXzgfV3eAI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gUbYvBP1CkG9fKIH3dzgj50+mv/MfswwZ5zQ2oGFPnV+jyVZwc8ioWXTuvs2VAOFk4TFUobYsNeIaxHgHhOegwE/BhaXnlv4854AyAwhPuK27tJUU1aFZqgdQpmQ1ziCDUMD4Jjc8bflFrw3QmkmUVh7zqsFkmAMM1zdfQljkc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJdkWgD7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746674964; x=1778210964;
  h=date:from:to:cc:subject:message-id;
  bh=Rqroz8MRiVm5kZO6eb+59RASxwa4MbsjsjXzgfV3eAI=;
  b=dJdkWgD7G2apU18lnMGTho/InPbd2EYZ/Vo4zrvxtCeKudFU6pl9zURU
   ZbWRBtQVOOb9xvxDeR9/xb8kl9sjDZLKrHQE2Dw/S7ONHYX+BYFurP4/J
   HK6YKnJTrhth1cNy+ZMKjqiDim6SQ7gC2oGdW8KxmwBJggE58YVL370ak
   vezs4phoBW1L3ssBamNIwB2GeN4bXjq/DO2McLOfQp1B2FbYB/FelI/xm
   87NjuTJM0E530/ty1N/e2semisFZluPMQH9fqKDXJ5ufvahsRCEVLYBUh
   whe+ZH42h+rDX0jT9l5ssjejgux3PVpXEJin+vrlpfYQeNoalSBvYvBtx
   w==;
X-CSE-ConnectionGUID: iEHgi+RkTmeimqINDo8s/A==
X-CSE-MsgGUID: D33EZ4koT7qfSWR34LrLyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59427302"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59427302"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 20:29:24 -0700
X-CSE-ConnectionGUID: VJ8x+tBBTZqYnFzMRy+acQ==
X-CSE-MsgGUID: whmVbyfHQ1+Q4P1vZ9ztcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="141113883"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 May 2025 20:29:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCrwm-0009jS-35;
	Thu, 08 May 2025 03:29:20 +0000
Date: Thu, 08 May 2025 11:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.16] BUILD
 SUCCESS 3903b4701bc03d7d805c3df378a7fc2ff72cbef5
Message-ID: <202505081115.iN4oqTVK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.16
branch HEAD: 3903b4701bc03d7d805c3df378a7fc2ff72cbef5  soc: renesas: rz-sysc: Add SoC identification for RZ/V2N SoC

elapsed time: 3876m

configs tested: 21
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha       allnoconfig    gcc-14.2.0
arc         allnoconfig    gcc-14.2.0
arm         allnoconfig    clang-21
arm64       allnoconfig    gcc-14.2.0
csky        allnoconfig    gcc-14.2.0
hexagon     allnoconfig    clang-21
loongarch   allnoconfig    gcc-14.2.0
m68k        allnoconfig    gcc-14.2.0
microblaze  allnoconfig    gcc-14.2.0
mips        allnoconfig    gcc-14.2.0
nios2       allnoconfig    gcc-14.2.0
openrisc    allnoconfig    gcc-14.2.0
parisc      allnoconfig    gcc-14.2.0
powerpc     allnoconfig    gcc-14.2.0
riscv       allnoconfig    gcc-14.2.0
s390        allnoconfig    clang-21
sh          allnoconfig    gcc-14.2.0
sparc       allnoconfig    gcc-14.2.0
um          allnoconfig    clang-21
x86_64      allnoconfig    clang-20
xtensa      allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

