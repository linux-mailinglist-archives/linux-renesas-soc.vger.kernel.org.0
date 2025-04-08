Return-Path: <linux-renesas-soc+bounces-15549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A114A7FFEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 13:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43CAE3B34D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 11:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1017C266583;
	Tue,  8 Apr 2025 11:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iE/goMUl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3B6224F6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Apr 2025 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744111184; cv=none; b=GLQbcJRVphiKrZ3dWDcOPCaBiuYeqPRCphgOlH2irz1WgBsUVMvjYN4hpWsRsl6kB1dFTJ3mcXHDxEZJVFQjZJtAyDhr7RL6AuMnjKH4bDhLEcZ+vUOzEVDNhyfLQCsuuCaUGsvY6dXrTb4FbgbcequKqbQ1IB7TpwV4lTUnHEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744111184; c=relaxed/simple;
	bh=O36cDuNvRyvEOLhwvaueVjxhwdD1Bo1j8GGzKz+AgPI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pMqgZr8h1XqFQ2zM9pDaft3b9MaBn/Kpguhg0WeUE1QcbY4z7M6iWxfeyVMUnj+f9uhO9CQl3zgBi7YNfbC9btPw3NZoy3m77tPCr60D2BAGdKzpEwTKWti2Cyne9SuLE9KbrSbfKX8b2t0SAxPu0JMR5dVcYb3qTjLhXKLPZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iE/goMUl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744111182; x=1775647182;
  h=date:from:to:cc:subject:message-id;
  bh=O36cDuNvRyvEOLhwvaueVjxhwdD1Bo1j8GGzKz+AgPI=;
  b=iE/goMUl4zYKArwcK05U5R2ZM7XvFA0eKkhxu1UCuJzZuVSkWVg+ixth
   151hLUBT+fyOX4WxHvpHWutBckqEeNBGhprOxwjB4cPb3igV5PSxnxYzU
   vRjCgTpp62TekS//0Cvj7CiyDcYouPBXGYtWNM+ttPLJIBDTRY3tub4Q6
   EW6idWROhPd7Udji9XcCNXHd1OqcPiAzxb0cAhvY9qtHt2XShpz1cb/eK
   ILCeWEo7O7MFdhMIV0I2JtyF+JeGmRM7psVM9MvNv/s+u/fL2f9lnxxQB
   BWzkE0L2NjRyp+FrXWn/onQ2KNCpTI8VUbMv6bea0YSX4eTk+shJfAPdK
   A==;
X-CSE-ConnectionGUID: nwBmoZWjQS+1+SzHmktCxg==
X-CSE-MsgGUID: dcE/DOKySLunhYEbo+hAYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56906744"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="56906744"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:19:42 -0700
X-CSE-ConnectionGUID: rg3/UYYeRxS8pWqc9Bz4JA==
X-CSE-MsgGUID: 5PH1yp0tTteQ8+Uxz4oiSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="165460944"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Apr 2025 04:19:40 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u26zS-0004pz-12;
	Tue, 08 Apr 2025 11:19:38 +0000
Date: Tue, 08 Apr 2025 19:19:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.16] BUILD SUCCESS
 1a9c17399d2b66af73bf7a2b9cddb916caefe621
Message-ID: <202504081909.RphCkBnt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.16
branch HEAD: 1a9c17399d2b66af73bf7a2b9cddb916caefe621  arm64: dts: renesas: Remove undocumented compatible micron,mt25qu512a

elapsed time: 1465m

configs tested: 6
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-14.2.0
arm64  randconfig-001-20250407    clang-21
arm64  randconfig-002-20250407    gcc-6.5.0
arm64  randconfig-003-20250407    gcc-8.5.0
arm64  randconfig-004-20250407    clang-15

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

