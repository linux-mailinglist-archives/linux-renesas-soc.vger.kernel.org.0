Return-Path: <linux-renesas-soc+bounces-3115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2C1860916
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 04:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F6791C2218C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 03:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB56BE66;
	Fri, 23 Feb 2024 03:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdXXafDI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27958BE5D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 03:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708657241; cv=none; b=jZU5s7/pKwfCeWRdlSnFHXvno3h7Qb1VTxo8nFZU3mGamdUtkHMVFLpPu1st8xIIUjs/MUhgLJ/766UtDBio88VHd6jAtKCXTeTCaVAddVwFrSasKpM/XwrMupOzvzF8nwOIRVyDi+Ye1V76rKZAPHLja0cBVwve2TXXzT6Z5Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708657241; c=relaxed/simple;
	bh=tPJJFkFxenLCjhqLf8IkTfXFuty7Xu4xANLPkNtyf64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vjp5MGUw6XNQsR8rS+LRlxwy57gwowONlkOS7XmF+YzBzgvY3JvTI2y+7z+GVkNmgj8LNKE8dt3zw4skqHErDlCFZbxQW9QeOuFXlKIMKQaS2/VjfOdcV2ZATweX34EeUEruz3PlAR2bP3rOAntoOv7Y6LamDRVOADGgGF4MSPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TdXXafDI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708657239; x=1740193239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tPJJFkFxenLCjhqLf8IkTfXFuty7Xu4xANLPkNtyf64=;
  b=TdXXafDIANVUYQ+/UqqxHtlXoq+Qn/G9V/pnzHvRXN4//Dvm122CAvKE
   oO+eANJuN3EpKYvTJMhX+Xha++Fbe1IdWK/1DJXftwhIBxxQXBURbE9EA
   ja4XWQVdZ5/QIkQ36Gbhd5ZCfELReTYxlNbIl90t25F03ZDevdVKuEO+i
   Hrdpuow1VaaR91whVRYqe/ZRhIPWbqkkQEbkn8vmhv4jikSZvf9JJ6YHU
   o9nBBack9j7+5yJ1/IZwgQbZGhO3gzWqsgsBtPNFYGQEeK2LmBTWWMN7A
   wzJm8U2imbcovsJypjfBLtgyt3IEzY8hoJG1/K427h0/V/sAGRuXpaV0l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="14084373"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="14084373"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 19:00:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10353531"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Feb 2024 19:00:37 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdLnf-00070A-1M;
	Fri, 23 Feb 2024 03:00:35 +0000
Date: Fri, 23 Feb 2024 11:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-debug 8/20]
 drivers/soc/renesas/r8a7795-mstp.c:676:13: warning: no previous prototype
 for 'r8a7795_disable_mstp_clocks'
Message-ID: <202402231022.yP0dscH1-lkp@intel.com>
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
commit: d895a6ac533ade0c453d555c60a6965f58adc715 [8/20] [DEBUG] soc: renesas: r8a7795: MSTP debug handling
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240223/202402231022.yP0dscH1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402231022.yP0dscH1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402231022.yP0dscH1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/renesas/r8a7795-mstp.c:676:13: warning: no previous prototype for 'r8a7795_disable_mstp_clocks' [-Wmissing-prototypes]
     676 | void __init r8a7795_disable_mstp_clocks(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/r8a7795_disable_mstp_clocks +676 drivers/soc/renesas/r8a7795-mstp.c

   675	
 > 676	void __init r8a7795_disable_mstp_clocks(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

