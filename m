Return-Path: <linux-renesas-soc+bounces-22983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05563BD7234
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 05:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AF931898570
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 03:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71BC236454;
	Tue, 14 Oct 2025 03:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0JRHf34"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A84D4C6E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 03:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760411199; cv=none; b=tFbUZwOvEsg+8yFfjgxJ9aEYlhAAdwfIntdyNwxCp5jCBu6OFY9HVt970kEIZLNJAQYMnR5T2FoFtwzR411imaNxRSK8jGjq2TRUlHmGxQwXjBWNeaG4A1g+lqQRaHLy5oMSdIugllcFChD/xrUs7He2ZWLGgXBk6TJklLvUN0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760411199; c=relaxed/simple;
	bh=t7Xy69RKfRpbl3n2swVnt0wSeLmQmi3ZECqpves5G1c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iu5diEV1p8QOM1dyQDm4W4buYP8x9PmIf20a50PDMX02ci5zaNe/gijIPE7BNDrBrjBKLHHdQkRryMbWMQ+DAGWXbH9vXAEaBK6aypRcnD0fknppshj8dtp8e9l5Gr9fF2IYoTCP6NPRKpHshazRjF8LkycBPcMq46mmGSX7fOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0JRHf34; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760411197; x=1791947197;
  h=date:from:to:cc:subject:message-id;
  bh=t7Xy69RKfRpbl3n2swVnt0wSeLmQmi3ZECqpves5G1c=;
  b=h0JRHf3480s8OTTYPXPh6DCNpTevNg4B09ZknwcVFbnbRTMxCY+q3x06
   bkbOt3XEaL4Zx6soQVSJG3WolP0Sm8vTHUCQgttgEUhmxmz9+Y42Y9nyn
   G7IBkjWm1c1xnrynP6JYyjVomA9TuaUnjP450Z/EYPfue0wZUely3HHKk
   AMj94kU9nVy6sab4Ot+UQ5Mn8kRbLQYha3SWo28rquD6wJrUUjnXa1R3a
   8pK09EOh4/2dEf0bhRavgi48wIqIO2e7/oCD2SvwJ/cbRQUkIpmP6lJ/g
   p8+Xm2IjWUr1qcunDAatjqAZHVghZtsBYAegTx4RqP9BTvzUwFWG+zTQC
   w==;
X-CSE-ConnectionGUID: YR+jv1BjQ6+ruv/kq8HEzQ==
X-CSE-MsgGUID: zWhEWJT3RR+VE07HxVloDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72832210"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="72832210"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 20:06:37 -0700
X-CSE-ConnectionGUID: LWtRH27TRDm8HpmGfN+rmg==
X-CSE-MsgGUID: Ad9P0essQyaFVSvLamidaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="186015431"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 13 Oct 2025 20:06:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8VLr-0002HT-2f;
	Tue, 14 Oct 2025 03:05:59 +0000
Date: Tue, 14 Oct 2025 10:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 6194bbf43aeb0f08bee0fc719f1a75adccd4658c
Message-ID: <202510141016.m2Iia99n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 6194bbf43aeb0f08bee0fc719f1a75adccd4658c  Merge branches 'renesas-arm-defconfig-for-v6.19' and 'renesas-dts-for-v6.19' into renesas-next

elapsed time: 781m

configs tested: 13
configs skipped: 118

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-15.1.0
arm                allnoconfig    clang-22
arm               allyesconfig    gcc-15.1.0
arm    randconfig-001-20251014    gcc-15.1.0
arm    randconfig-002-20251014    gcc-13.4.0
arm    randconfig-003-20251014    clang-16
arm    randconfig-004-20251014    gcc-8.5.0
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20251014    gcc-9.5.0
arm64  randconfig-002-20251014    gcc-10.5.0
arm64  randconfig-003-20251014    gcc-14.3.0
arm64  randconfig-004-20251014    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

