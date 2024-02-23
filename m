Return-Path: <linux-renesas-soc+bounces-3116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F88860B45
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 08:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CBB0B24F59
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 07:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE510134AD;
	Fri, 23 Feb 2024 07:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuI+LFop"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFBE134A3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708672867; cv=none; b=p6VQ04cLZ9FgJnxI3yRe6A0wyk0K2sKXq29auGoJ5fvStlRkyy8PkdMVQ930qI/hWXajiNeUqqHLQ8pw7R+2HMYmnJNDUG4syld9XfRFW5uy8GDZw+dz8+soCJ8gGX7M71mltD72Ip95sQ9GFntCGpBP5Z3sx+Ekhbxv8vDaTNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708672867; c=relaxed/simple;
	bh=VuPNJqIbNCFRq/AGaoiSqRalja3dkl96ih43Z3gk3pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eTIf53JgEIZy8kXMvdGeGRyCyRbtYe8QSeW6EHOc63JkKWoh/kqBDUcY9tIWjqwtXZUn1oCy9UivxinXXD0AyO7nuZIKKfpZlbvUBGesxCq/dMF1bzF/Cd1Jre7mQd8+J3lBhKcAU8zc/Z6OFLgi4v+5RNMdukO6sEAN9aACsQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuI+LFop; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708672866; x=1740208866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VuPNJqIbNCFRq/AGaoiSqRalja3dkl96ih43Z3gk3pc=;
  b=GuI+LFopjtdyXHLpWHZJCaLiORQH7/VvFBoTiMItucmEUdcm7nN4d9jg
   6JUtCgK292n84bHrWfizFllz3wFMFN+/k/wrYBFq3eay6UB9JjzLB/yzn
   sTMRi6SsuJ8Wn2Yvs/F0mrlq6ejyzW4T1uxenYbd5/IzLTpIygOH1UEWS
   jOx9EqCwELmJPSMtVLMmDZoUgBF2IyI3AzQODmTrrB+nptk3NYyyQsWbH
   ZKAZb/TVuhK0IomDfVWntU7s6R99t6eoC3kpWWBK1YM4TplBp1I+aJUaB
   cWAMyD3lBX3bV0zrTW6+b2hZPpWjRREL+ZGQTyzdiENlfHDkjP95GmxiP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28406062"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="28406062"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 23:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6227507"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Feb 2024 23:21:04 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdPrh-0007Bc-1y;
	Fri, 23 Feb 2024 07:21:01 +0000
Date: Fri, 23 Feb 2024 15:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-debug 10/20]
 drivers/soc/renesas/r8a77961-mstp.c:617:13: warning: no previous prototype
 for 'r8a77961_disable_mstp_clocks'
Message-ID: <202402231525.wFLTl40d-lkp@intel.com>
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
commit: ea517c322a7e736531e654cf307f8f75c21a5ec3 [10/20] [DEBUG] soc: renesas: r8a77961: MSTP debug handling
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240223/202402231525.wFLTl40d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402231525.wFLTl40d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402231525.wFLTl40d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/renesas/r8a77961-mstp.c:617:13: warning: no previous prototype for 'r8a77961_disable_mstp_clocks' [-Wmissing-prototypes]
     617 | void __init r8a77961_disable_mstp_clocks(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/r8a77961_disable_mstp_clocks +617 drivers/soc/renesas/r8a77961-mstp.c

   616	
 > 617	void __init r8a77961_disable_mstp_clocks(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

