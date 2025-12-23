Return-Path: <linux-renesas-soc+bounces-26090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1EBCDABF8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 23:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3158E300ACDD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 22:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B833288C20;
	Tue, 23 Dec 2025 22:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZCfYEY4X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D814145B3E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 22:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766528381; cv=none; b=ujlCjIj64F5mIv6TG0GOj7NbrGINaYIRyRMk+oxvI8J1iSqia3hNLDHIAry7RaweQzg+nc4E7AW2rFWwL6TGSJWcknRHLxO9AqrsmVdGG7jz2oEJlKx9rljsE7VSJ15jIjYMfDmnmp1TxXx36utG7ZfW99zE7eUezoBf0huh+/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766528381; c=relaxed/simple;
	bh=63SJXvrFtJtqQd1vfgT3C/sxtvR06C2fLxMtAM2cJPM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ldwt+5jHPiAd4ifN6pZS8+6DJaLBiJT2jfk8PB++2jcaPOizBsSaJD7qjB4LHcj9FhYy1JQxFhsELEK6B/Shw50OE/RdmqKej35m9Gyoh9Nd9VK8sa0hRrHYdou8oK6IeLNZ/fBUjSHz9RMuNU8VfFGj8YEYYncmuI+lQ/BOv/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZCfYEY4X; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766528378; x=1798064378;
  h=date:from:to:cc:subject:message-id;
  bh=63SJXvrFtJtqQd1vfgT3C/sxtvR06C2fLxMtAM2cJPM=;
  b=ZCfYEY4XrMPJffEAJGXnv4HnstvFwA28wgThlwlyleVEGbhNQwoGbbPT
   sBKbeYtliOQ9vxe/OswSj30jIc7b2h1X9vXViZcRgi7bPBC8xpD4Zy7bL
   D+/ngvvFATWRhOtP/zn4z76PlLXP6pqm23ke/8EcYf03G2pKNQxJpdx2U
   Z2BiKaLKR1DIbmfx1IJRmwHsmdwf/0ndh6ourfdnUkRI8TsmQem+R3CXt
   nB2RWlNTXsUUVr1alwym6yK/FJSt8gFlXSLdYkfJZDxP881ReKeydE6kW
   0oAxnyLkgExz0VQsr/thsdggIgfsIK8jcQirjHb9yvZXlpzkJv7nojtGs
   Q==;
X-CSE-ConnectionGUID: Aht6+FjjSguymxDVZ0QoIQ==
X-CSE-MsgGUID: b0BMMsUNTvexzKkWERMsUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79494343"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79494343"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 14:19:37 -0800
X-CSE-ConnectionGUID: 4ca4uQd0QS+xiHEGN0wl+Q==
X-CSE-MsgGUID: ysFWjS5tQ9m3HuACruJ2eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="199538113"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 23 Dec 2025 14:19:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYAj9-000000002Qj-2iUU;
	Tue, 23 Dec 2025 22:19:35 +0000
Date: Wed, 24 Dec 2025 06:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.20] BUILD SUCCESS
 666e5eabd623586d0efa333a863122661c7668c6
Message-ID: <202512240611.HtErVGm3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.20
branch HEAD: 666e5eabd623586d0efa333a863122661c7668c6  arm64: dts: renesas: r9a09g087: Add ICU support

elapsed time: 731m

configs tested: 8
configs skipped: 155

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                allnoconfig    clang-22
arm               allyesconfig    gcc-15.1.0
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20251224    gcc-8.5.0
arm64  randconfig-002-20251224    gcc-14.3.0
arm64  randconfig-003-20251224    clang-17
arm64  randconfig-004-20251224    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

