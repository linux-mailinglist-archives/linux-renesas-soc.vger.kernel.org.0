Return-Path: <linux-renesas-soc+bounces-20437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED68FB23B55
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 23:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 070051656BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 21:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A88C2D73B8;
	Tue, 12 Aug 2025 21:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqnqN+m5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4342B26E15D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Aug 2025 21:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035707; cv=none; b=TZqvzCxd7U9urfxz+3eSvJ1THDzThKoguXmZIJecLqf9phbxyYr8wSJoF+qjxrgP+jgduudc97h4/QKvljkTSLW6RyhFr3XsxudUhr670EW44CxbuB61fCdlE7DZp1jY0rna1r9VeNsFhRBpHOsy9hoVFxwSW8LPq+jwRpiIR9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035707; c=relaxed/simple;
	bh=VwukpGIVyTGlaSrpRKgDqTyecaN/1GOAiuF5vqBKuu0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=okxYSCwwR3s5n71PGIIgTXLQSlx4/T9hzYceCIFol9sTNB6jEAP/IqnrrCWH+X3cEfAud0qKZoS4vCSFfhpy/b5642kH2+jhaS46MB/z7jER9zlt0AGdqke9wfVFsAMn0Rl76bZ0XyKq1ReXTWiFN7seIkZSYVy08a3dWxTDEUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqnqN+m5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755035706; x=1786571706;
  h=date:from:to:cc:subject:message-id;
  bh=VwukpGIVyTGlaSrpRKgDqTyecaN/1GOAiuF5vqBKuu0=;
  b=kqnqN+m5ZkqLzeccwD+0KunoT7tEerHtj44A8cDoJKLZP8aGbhlnebf3
   vBy1TzcJpl5MX6PF6uYpRvOmsDIl+Bn7wYQGMpSNxgbF/gFA5vMbg52na
   Pq77v29FwoOn5++23++7wo9JQGjTJ+wwJE6/93Dir8iOiBxQxihNbWd8G
   KhUFjpQZMm2xba3uFpFywq8tID44r6TEqW2v6II135C2sbOs8yqcA5zYr
   r5glLrtEt0Kwp7QgkVssx3DJ8dqI93Frul94Ln4eq6zqkUrFShW5z8kIC
   YbzPf+7qDcy02LsDbNMYBUBs1WRPCXWlIC8Og2bpI/2otQflrgYExEM/E
   w==;
X-CSE-ConnectionGUID: trFcSBq4QbipmzfLvJIKLQ==
X-CSE-MsgGUID: F+UdyUwvRk+icXUyFMLOCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57244327"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57244327"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 14:55:04 -0700
X-CSE-ConnectionGUID: tLJ2QN3OSJebdlQka/Vyiw==
X-CSE-MsgGUID: HSsNJEycQRGvj5GHshG8XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="166294902"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 12 Aug 2025 14:55:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulwwX-0009LY-0a;
	Tue, 12 Aug 2025 21:54:16 +0000
Date: Wed, 13 Aug 2025 05:53:06 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.18] BUILD
 SUCCESS abd7c0293816a5fa5766710d2e7b576384fdec4d
Message-ID: <202508130559.9LnYm1Rj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.18
branch HEAD: abd7c0293816a5fa5766710d2e7b576384fdec4d  arm64: defconfig: Enable the RZ/V2H(P) RSPI driver

elapsed time: 818m

configs tested: 6
configs skipped: 123

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20250812    gcc-8.5.0
arm64  randconfig-002-20250812    gcc-8.5.0
arm64  randconfig-003-20250812    gcc-14.3.0
arm64  randconfig-004-20250812    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

