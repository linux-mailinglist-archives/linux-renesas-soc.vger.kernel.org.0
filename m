Return-Path: <linux-renesas-soc+bounces-7381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E579334E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2024 03:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52AE21C21142
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2024 01:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85253812;
	Wed, 17 Jul 2024 01:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6HD85fo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB23803
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jul 2024 01:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721178754; cv=none; b=Q6FvDmCDPUJnUmwryNstFFwAQxfwFplJi/OaLqoaH/Ul0RM/IkHz2+BzxRb1PKwUVi1mr5GHEW/4TU5aNYUR/XdlrFVvFW/MVj2bw3XTr8UqHLLkM2ijyJvCuQ/7UiMRVGJ8WDZWvmoBajf7Imu391lHKJdaDI4/AilZa36jrzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721178754; c=relaxed/simple;
	bh=skpdYwTMjlCpknJKF99XqcckCZKkYAMVeLOMwZ+jG5M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DjTvqRDszO5ksW4aTEJ32N18JgvT+AcrA/GhYNF5dA/emsbk13d9N05JUsnuVhCGFr0pF/l384y4i0eyvYIeXBdCCNRWmMRp8/rcu7Gk52OlHzFVS6vFq4EXs0g1yxkJn/TRe1gXIb5QJoDHdo44sqBpUVW9EB+hn7MAXyACESw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6HD85fo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721178753; x=1752714753;
  h=date:from:to:cc:subject:message-id;
  bh=skpdYwTMjlCpknJKF99XqcckCZKkYAMVeLOMwZ+jG5M=;
  b=I6HD85fo+9KRpp3Ji+ChXmhv9XLUUdyQ+1DY4JOHxoN2/GFvWXiADAYU
   iAgfLJtFwm0K07zpJRq3jMOM+wgNF0AmRTKSkLH8scEr9uVYdT4wxc7T5
   C/Y2pVGvBIqv1CQO+EKGYvd9IaFDkDBlM7X9j7bC0svgB/yw08X0cP/Qq
   /WZwDbhvDRz/2TZupoqHYM9skem/Zg6fM/dqaFVPNdnkPUJ82SAfOHRse
   HoRx0/NT0Jc6G+hoNpm1nG5RnfqzjV1hyyA0/yA8ZIEHmVOorARWS+6B8
   Y9c+3p25uXeYcFgsNTUt8XC9BVCPA9wr1Yz2UXjytJ+W+aArLG34GcDQd
   g==;
X-CSE-ConnectionGUID: xFGKRkGNSkqewVt610ZG2A==
X-CSE-MsgGUID: wL4f4jVQQuOrDPQAS9WF3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18767641"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="18767641"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 18:12:32 -0700
X-CSE-ConnectionGUID: AinGAieCR8myH/mGpiTkXg==
X-CSE-MsgGUID: BSo9jKWJSEO2MoGUjG4RQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="50145028"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jul 2024 18:12:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTtDY-000fpo-1P;
	Wed, 17 Jul 2024 01:12:28 +0000
Date: Wed, 17 Jul 2024 09:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.12] BUILD SUCCESS
 9a1246fb7fb0bf35bb0bb7f36c8c9a4b724121ce
Message-ID: <202407170948.GWH7x2Xx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.12
branch HEAD: 9a1246fb7fb0bf35bb0bb7f36c8c9a4b724121ce  arm64: dts: renesas: r8a779h0: Add missing iommus properties

elapsed time: 733m

configs tested: 13
configs skipped: 132

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240717   gcc-14.1.0
arm                   randconfig-002-20240717   gcc-14.1.0
arm                   randconfig-003-20240717   gcc-14.1.0
arm                   randconfig-004-20240717   clang-19
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240717   gcc-14.1.0
arm64                 randconfig-002-20240717   clang-19
arm64                 randconfig-003-20240717   clang-16
arm64                 randconfig-004-20240717   clang-19

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

