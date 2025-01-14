Return-Path: <linux-renesas-soc+bounces-12108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 326B1A0FE88
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 03:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64F271888245
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 02:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF9A22FE17;
	Tue, 14 Jan 2025 02:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVPde1WI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5201EB2E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jan 2025 02:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736820673; cv=none; b=IdOCEZ5zPhrxaGo+JJqeVs9mb0xbw53KTNEDbcAaMSjxGEOZ6zmZLRLeD7vhogND5owm0Hy5Gq4BSog47qQMgFRNPcCp0RrqoDdlNxa9maAqLrs8yaPrWW4h0yhQgIShI6d/fXLzK4OHsn7bcQe5lZqAG8KeRBFsu4HK8oq87SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736820673; c=relaxed/simple;
	bh=52sb8P51Jg1KdpwjOxiS7FSaSVAeKLssDuROVZoniBk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RQRTFNliwPOGBNX5f6rqlHxxZp2l4mYjuwZY0GZFmlJUB7No83eFFB5x123jxt4AwKnA+XMBjDcXUmLyJYQoTA3HgH2OUHosWjKUe9pTKogJtmm1RNiBS87kO6mg2CO3ZvARokmn6l/pgpdtcDXqGFeoJrqLxftIgVPxTt4ZH6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVPde1WI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736820672; x=1768356672;
  h=date:from:to:cc:subject:message-id;
  bh=52sb8P51Jg1KdpwjOxiS7FSaSVAeKLssDuROVZoniBk=;
  b=gVPde1WI1H8cQDxnLZVVhDL2iGdiwt1a+r8sQA4iddK2X8aXM4Hdifz9
   ck5KkBARmmbyGP2VEKPPkTtUh4myxnii9bHHBRz+PEUMmXBUCICXcIo94
   q1LuFap5bHgRZw3T22Xvg5LireiH7m0QzHz/E/CeWB8qV+zYA2D8EcRZw
   6x55v9/omZsY+Cl1T2LsFtWp+1/tR14X78AJO9srrc48ggRRAJnijnEzk
   b239whH1VKdEa9Tu/1L2QlV23P6rh6Nt9rz3V/DPbvMz4BOs7axWYz8C6
   l4nWm5aUURDv0DQ811LKfDynKfdQ6FScFgNfNcc82ulVH57bZHVhTEos8
   g==;
X-CSE-ConnectionGUID: hKVuLjMcSLS9wV2GsrCCdw==
X-CSE-MsgGUID: da0MJ/0LQUOBct9C07YVUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36316119"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="36316119"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 18:11:11 -0800
X-CSE-ConnectionGUID: 4Ec+3JXsRtW6jmOa1+TZ1Q==
X-CSE-MsgGUID: 19p2TKo+QImjLpHG/xIe0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="109683114"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Jan 2025 18:11:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXWOa-000NyF-08;
	Tue, 14 Jan 2025 02:11:08 +0000
Date: Tue, 14 Jan 2025 10:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-soc-for-v6.15] BUILD
 SUCCESS c502a992d98e34b9cd74b91c2835b0b46de2e5ff
Message-ID: <202501141000.iyp1buI2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-soc-for-v6.15
branch HEAD: c502a992d98e34b9cd74b91c2835b0b46de2e5ff  ARM: shmobile: rcar-gen2: Remove CMA reservation code

elapsed time: 1007m

configs tested: 8
configs skipped: 117

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm              allnoconfig    clang-17
arm             allyesconfig    gcc-14.2.0
arm           dove_defconfig    gcc-14.2.0
arm  randconfig-001-20250113    gcc-14.2.0
arm  randconfig-002-20250113    gcc-14.2.0
arm  randconfig-003-20250113    gcc-14.2.0
arm  randconfig-004-20250113    clang-20
arm       spear3xx_defconfig    clang-16

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

