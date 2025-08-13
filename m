Return-Path: <linux-renesas-soc+bounces-20439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB71B23DAC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 03:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE74B2A0F1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 01:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F308DC2D1;
	Wed, 13 Aug 2025 01:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyRGbxjO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B36F33E1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 01:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755048076; cv=none; b=KOQ04BOuT0F4xvnMvg29dPxQgOvlMN3Ho71+e9e3I8+zwp21fhgQFXLVCKyyae4Gy0NQMZE9PrQGRmuvcH+V8EUQa8qyq127oI9na8+oocQ0k7usBjDCsGrAIJoHoqaIHUSNtt7LoDmsI/Ps6Rf7O/w6XnHzbmG0mgr1S5GvyTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755048076; c=relaxed/simple;
	bh=6wkupNrOYZXeYCUnVRjf31uWKqrOQwnKMWKAQHdfo1s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vDUs0Y+yDGBEMFk9nFwqEF2y6b5vzcZczfJTTPJ2IHnjrPcjIs1NTU5GWgfC7HT/Brb2HCVEvnA/sgn4+GiLEmAe01cn6T7kKIae/51HPoRCEmjwGgNhxMWpeN5mg4p+lPB5/aT1Lff9D9lGGMlfHTLnjPUxPddajV5EcyZUkaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyRGbxjO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755048075; x=1786584075;
  h=date:from:to:cc:subject:message-id;
  bh=6wkupNrOYZXeYCUnVRjf31uWKqrOQwnKMWKAQHdfo1s=;
  b=VyRGbxjOiY4Y9AzrAk2GEjY8oRP/04P935+B1O8R20UCuaAUxJwKlle/
   NZkm+BVmJVYeV3g8XRQHbn2SES/DrZH/31fxOqY5qDun0Cq+688LkCKwH
   eGCktPIH9Z7sJAVsKVvROH6TeNQM6v1cmTbfGgZ1xcfDfKau2tLOBGgg3
   BpXc9OGQ/hOpvpSEsjhrNpQ/PmCjUkOIifuS4nInoVEfQnzIgSzcg6lKO
   QliQ8imbcQGwcE/yEjLYmTmSePMHED3DupcVs4/cq/jLdWLJMTp64Grlt
   d2eOWZ4cN1PQ8IEgN8DF2uMeqRXTZ6BZ6XFzqko4X1e1ttMmIxx5R+x4J
   g==;
X-CSE-ConnectionGUID: U+7mqwprQziaxrAr1ge3qQ==
X-CSE-MsgGUID: SucJBaMFRmqzD6WYHiFi/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56359060"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="56359060"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 18:21:15 -0700
X-CSE-ConnectionGUID: z2GfxrvsQ5yhnNEu2kj9Bw==
X-CSE-MsgGUID: Rpjyn9zzSGKMB0OZS0ndbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="171593645"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Aug 2025 18:21:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um0Ay-0009R2-0D;
	Wed, 13 Aug 2025 01:21:12 +0000
Date: Wed, 13 Aug 2025 09:20:55 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-soc-for-v6.18] BUILD
 SUCCESS ad38ea266b8dc6e15e0d2a14a9d8543345fdba44
Message-ID: <202508130949.nNTA03TJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-soc-for-v6.18
branch HEAD: ad38ea266b8dc6e15e0d2a14a9d8543345fdba44  ARM: shmobile: rcar-gen2: Use SZ_256K definition

elapsed time: 1025m

configs tested: 7
configs skipped: 124

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm             allmodconfig    gcc-15.1.0
arm              allnoconfig    clang-22
arm             allyesconfig    gcc-15.1.0
arm  randconfig-001-20250812    clang-22
arm  randconfig-002-20250812    clang-22
arm  randconfig-003-20250812    gcc-14.3.0
arm  randconfig-004-20250812    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

