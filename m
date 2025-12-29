Return-Path: <linux-renesas-soc+bounces-26167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2276ECE8559
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 00:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE5C73012BF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Dec 2025 23:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A70262FFC;
	Mon, 29 Dec 2025 23:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHYr9wm0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DD02222A0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Dec 2025 23:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767051000; cv=none; b=GZWtM14i5CVMSVIWffc5/DyiNz99x9RbA9n59v3JiCyRxqSITY4X57yGJjphTv1An1ly+9X8Z/Ux7Y7dQYX03lRoS//L6DlCH1haqJ9RASlxwT2LdFX0dKIg8jXKkopdWuD5I4DqaJ3TblB+fuvEO77Ta7DseqqrhuplOyd6XM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767051000; c=relaxed/simple;
	bh=IRd/m1I1IUgpn8Nhx7b0ssN+rpy3jNPe2S33iSKthgE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SuUk60e3Kq3vVLkAR4SZcK0q2v0CcBO1uSiNy7uPgQpLeLJuT35GO0gWatsxrVK32X7rNZoKOhugjAfjRci5TjR2nFk220yPnVyh/bkyvKbKblEIwLRhHN0uHiOxwRUTa0v4IXXYz4/HWiWhB/J6K7hYl65ykd0QEKVLh8uAkOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHYr9wm0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767050999; x=1798586999;
  h=date:from:to:cc:subject:message-id;
  bh=IRd/m1I1IUgpn8Nhx7b0ssN+rpy3jNPe2S33iSKthgE=;
  b=AHYr9wm06dS9WUuuPEyIHAHuuXnsV0S+8XBN6FtrkGxD6sA1oSAJNJGT
   LjSt/qgMcGyFK9DR0zWFWZxjVrw9pNa6ELX92t5/R04hlku68JpPcmURu
   kFQsYtHtUttDLCvH15JYRabvWeIjbPHh8AMe5plHkqMig0PasvMi3gMUo
   VroMAi9aNZE8Qax7QPd+5aZAFmXPt3TOMTKalYWP3ycBvvDu7+1pEBvWb
   eZ8NaOI7bHFB66ymeQQanVNv4cg14XwLfGGP0Rxu30wjoXZrrTxIs7Ikq
   Lt4wDXZBqev2soLPiEfulUOnAM6u36SotjIDrkV7bZUODMFdfQzC6o/dv
   w==;
X-CSE-ConnectionGUID: eiBoy2RfRCGTDLvqSNikqg==
X-CSE-MsgGUID: Y+EzmArWRAGKZRfPoxfmmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="67655351"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="67655351"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 15:29:58 -0800
X-CSE-ConnectionGUID: OdTtf25pT8C/Cvt6cc1yrQ==
X-CSE-MsgGUID: xFvBzdfIRnyKWeX+EG7NuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="200268771"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Dec 2025 15:29:57 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaMgU-0000000087j-2j4t;
	Mon, 29 Dec 2025 23:29:54 +0000
Date: Tue, 30 Dec 2025 07:29:21 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.20] BUILD
 SUCCESS 722b18a11084c1a2b216672373ebbd223c51d56c
Message-ID: <202512300716.2xIfnVVZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.20
branch HEAD: 722b18a11084c1a2b216672373ebbd223c51d56c  ARM: shmobile: defconfig: Refresh for v6.19-rc1

elapsed time: 724m

configs tested: 14
configs skipped: 156

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                allnoconfig    clang-22
arm               allyesconfig    gcc-15.1.0
arm                  defconfig    clang-22
arm    randconfig-001-20251229    gcc-15.1.0
arm    randconfig-002-20251229    gcc-12.5.0
arm    randconfig-003-20251229    clang-22
arm    randconfig-004-20251229    gcc-15.1.0
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64                defconfig    gcc-15.1.0
arm64  randconfig-001-20251229    clang-22
arm64  randconfig-002-20251229    clang-22
arm64  randconfig-003-20251229    gcc-10.5.0
arm64  randconfig-004-20251229    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

