Return-Path: <linux-renesas-soc+bounces-3143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2D3861DA5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 21:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93EBF1F27238
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 20:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A0113B7A6;
	Fri, 23 Feb 2024 20:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAdmat3l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC025D73E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 20:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708720413; cv=none; b=qxqQwMT/fmM4M7z8fckU+N8gKFLBZNz+RJyeAaEya4mwxDUuV7dYhESnJCE2C39p7pibcnnXZhRXLKugRNLEuecUwS73OOE04KFL/AsVDQpB3mMMT+xpph7wBQaS424dZOOAirBux1fWdetqG9UsDBe+LUQa9zU2PGg0wu3/RVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708720413; c=relaxed/simple;
	bh=kPVu3YYQdq/vN6+KzBPHYxRBikLB+RpzJD2C1dPvbOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MjeyeTqaKfyACKTqg8WzPuxlaxKzwaA+sTixqYoU33fo4o9eLU1FAs0jhwX4+VUTKRkD0a9IxGHTj1NlYMzTBfdRaKMxRQAkTI1dVyBDESLrv4L1hoEat+i5nuBTTDQAWlXaG0+KVymK090gL0q3ChOAjMK6Ey52qbNTfARUJyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAdmat3l; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708720412; x=1740256412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kPVu3YYQdq/vN6+KzBPHYxRBikLB+RpzJD2C1dPvbOw=;
  b=AAdmat3lZ5IwOIXwAxUI4pbd9wX/AzFuMmslV9XwKAVNxno2Ei9lJ0o3
   GXlJt9RvbZgwzHuUasrJoX6/f0rDxZs5xDoxlHDTj9OGSCMICgha6WCKm
   G+GwN23zmT824izRtZwT2DYRFKRuOtrthjocALdRRP8yIem/SXp9ZTSW1
   3IoK0MDqtYR4i5DvI+noFZZMd1b03LOIkbWU1RCFl81x9Nfkynzf2WHzZ
   7u6TCAe27Icgc/9cAYDkalRwREd343LtnUZD8udbds5B3sCsTdOCu6fNj
   uA/7fiNRQsnFGy5w8f1OooX22uTXGepDP91hKYOqxOOh8MCNO0cQIXyZs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3187892"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="3187892"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 12:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6498933"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Feb 2024 12:33:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdcEO-0007sg-2z;
	Fri, 23 Feb 2024 20:33:21 +0000
Date: Sat, 24 Feb 2024 04:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-debug 13/20]
 drivers/soc/renesas/r8a77995-mstp.c:455:13: warning: no previous prototype
 for 'r8a77995_disable_mstp_clocks'
Message-ID: <202402240431.B49MYcST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-debug
head:   5da04202c8b2b842bcf74a93e5232f4133c222fa
commit: f8b1f90a96c685092749fb6698406146b7905050 [13/20] [DEBUG] soc: renesas: r8a77995: MSTP debug handling
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240224/202402240431.B49MYcST-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240431.B49MYcST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240431.B49MYcST-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/renesas/r8a77995-mstp.c:455:13: warning: no previous prototype for 'r8a77995_disable_mstp_clocks' [-Wmissing-prototypes]
     455 | void __init r8a77995_disable_mstp_clocks(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/r8a77995_disable_mstp_clocks +455 drivers/soc/renesas/r8a77995-mstp.c

   454	
 > 455	void __init r8a77995_disable_mstp_clocks(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

