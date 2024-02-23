Return-Path: <linux-renesas-soc+bounces-3130-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4AD8610CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 12:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47E8EB24AAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 11:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A9C63104;
	Fri, 23 Feb 2024 11:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRAe4Tg4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B353367E92
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 11:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708689047; cv=none; b=XjKYds626hLwYlq+21SRYYGlD/FRwP/1iFjdFBeNGkfLsb+EF3CkjZ7DJXT4h4LcZ80mGtqapX2uiwDn9kPUraI/LTdk6sT1Mf6B/A0N5Nku+PhpHIu1rrax7A+ZcK4Nep7XbMMTm/zobG8BqGrSe3X98r426TReM8Wdu5uygBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708689047; c=relaxed/simple;
	bh=9t6i94MxzLFG0t7HGNcV2ggKCtPllM16cBw4+qP2r7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bi9qW0EWQG3T/M1jvlSD6hl9amhvvL/TGuPM2tUP7VXDGhgmu+VSEj09JIovcHKTzu5LoWWFahxZXKfFkx5VvfidXaiz7VPnZr7biZN2gX51GlC8K1JxcXMkkZBOQQGMJXVDBg8NBhYFkM4Mc2fdULKYYlenvoh3UlQ8P+JCLEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRAe4Tg4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708689045; x=1740225045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9t6i94MxzLFG0t7HGNcV2ggKCtPllM16cBw4+qP2r7g=;
  b=hRAe4Tg4sMvLd3eF59jDXJ6Hp5a2sc7Goe34drvP+OgaQjpzGwpTNG2A
   ZRqprkkgGBNY49pLXqOnXeaTy+CR4oDg1mZyABUP5a+uDD18OGp0Yd5HD
   3LPrCLfhwtmZNPojZWsbmXBlrM43eQNm6w5NsWdM/oBRnQ0nbycbeYQxe
   Fyzqz3o4u9NosqdftStbpRTTHMdyYRz9WUekTHmzqfBgkkR4Qei2c2xEb
   lKC9BTFfoZRTg+8vN8UHmKc9YEoxR8LGBO9ZV1apUskF0XdnwRnP+PyeX
   TREFjZQ+b0bTKoOkyxTMoY2qaFFe4Amn7tn8vqBOUlNFyVLXFudJLurv8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20437857"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="20437857"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 03:50:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5843576"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Feb 2024 03:50:44 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdU4f-0007Su-1r;
	Fri, 23 Feb 2024 11:50:41 +0000
Date: Fri, 23 Feb 2024 19:50:15 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-debug 11/20]
 drivers/soc/renesas/r8a77965-mstp.c:609:13: warning: no previous prototype
 for 'r8a77965_disable_mstp_clocks'
Message-ID: <202402231943.LHnCFMGd-lkp@intel.com>
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
commit: b9814c2b81c6a9429c207da98e16691b92a06a72 [11/20] [DEBUG] soc: renesas: r8a77965: MSTP debug handling
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240223/202402231943.LHnCFMGd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402231943.LHnCFMGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402231943.LHnCFMGd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/renesas/r8a77965-mstp.c:609:13: warning: no previous prototype for 'r8a77965_disable_mstp_clocks' [-Wmissing-prototypes]
     609 | void __init r8a77965_disable_mstp_clocks(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/r8a77965_disable_mstp_clocks +609 drivers/soc/renesas/r8a77965-mstp.c

   608	
 > 609	void __init r8a77965_disable_mstp_clocks(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

