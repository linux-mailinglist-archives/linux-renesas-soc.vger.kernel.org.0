Return-Path: <linux-renesas-soc+bounces-7380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7757693349E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2024 01:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20A741F23B14
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2024 23:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BE51411EB;
	Tue, 16 Jul 2024 23:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuYZ4zVt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8244213DDD0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jul 2024 23:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721173045; cv=none; b=AtfMGK+AycHMVyPI2aRJDfxM/Iw9B3Hx0CGsgJLSe6yDq7hUJA6Kqg6eRbreKW2fWI6JZHXUFXVPOdAiwP2yA96kd3AtYrfGXOOr+RITRTSRhSnDSUB9RFyP2naHKY1I/gyjpuqI7wHbNws1rVZfEIL0hHfM4HT98dlP1mUIumQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721173045; c=relaxed/simple;
	bh=dcpnnFzAvFbvIgk3soPbFwdzymIoxEjwc2BnCmbLdWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jjgHVtN4GZncfMidSlXHOgcVcsYxQEySU80gJELQKqu3COsS9f/STVOs65CUfnz91FwEFqa6sGe9lqGHv+JOA1JHjA80DBswOR1vnOiLmPGKmMj4j878sd5ZzpI+/TjIpxW5BU7u5bCNDplQzNwmD0j/hZDl0sDhkwbPTQa67kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuYZ4zVt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721173043; x=1752709043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dcpnnFzAvFbvIgk3soPbFwdzymIoxEjwc2BnCmbLdWY=;
  b=VuYZ4zVtXIA7IKQPngCT0HD/GZSm72rfyCk0wXQAjF2we3wkWYpa+FiU
   da2/GtwKykJzHNdgkMul1zyP0seIB3BX9DEPqc7JeX+pQOfBU+udx0bWk
   3ciJtFJk/o0SCdtATbnQR+Lv4i9zF/3Za75jVu4iiwFk34bVaUoskro/M
   9X1Bd04EIRIZNlWI2ZfYUCf01PjZjwmwbr5sQSADwxNb3qHM/r+VqXnhR
   Oyr8guHdojglk8B5chv8tERKXF68bMFbIguneMFTIZRqkLJpCd+kyQK8M
   nuA8xIxJKKTeWOzwwdONa4nNQVvG09zWmlNEefFdHJPCTxgV35vtV+krR
   g==;
X-CSE-ConnectionGUID: 4uU6ADaaTKO6cW5bo0tE2A==
X-CSE-MsgGUID: JUZE5LCDTSOTyFy2g+imSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18460896"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="18460896"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 16:37:23 -0700
X-CSE-ConnectionGUID: foTrTlqLQDi2JTAGVsRZZg==
X-CSE-MsgGUID: xMxYaU3+TKiFZ0EqkukmKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="50066499"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jul 2024 16:37:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTrjT-000fm2-2q;
	Tue, 16 Jul 2024 23:37:19 +0000
Date: Wed, 17 Jul 2024 07:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/rcar4-fractional-pll-improvements-v1
 19/28] rcar-gen4-cpg.c:undefined reference to `__aeabi_uldivmod'
Message-ID: <202407170751.LGZlPmUL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar4-fractional-pll-improvements-v1
head:   f5a672b0ed67fa75083e13e5f82832cbe7a55e20
commit: 4557d64e7540f8fe383458738b45f317e2235f7b [19/28] clk: renesas: rcar-gen4: Add support for fractional multiplication
config: arm-randconfig-001-20240717 (https://download.01.org/0day-ci/archive/20240717/202407170751.LGZlPmUL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170751.LGZlPmUL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170751.LGZlPmUL-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/clk/renesas/rcar-gen4-cpg.o: in function `cpg_pll_8_25_clk_set_rate':
>> rcar-gen4-cpg.c:(.text+0x29a): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: drivers/clk/renesas/rcar-gen4-cpg.o: in function `cpg_pll_8_25_clk_determine_rate':
   rcar-gen4-cpg.c:(.text+0x392): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

