Return-Path: <linux-renesas-soc+bounces-3136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E783861794
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 17:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2652CB273B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 16:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8193683A01;
	Fri, 23 Feb 2024 16:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fy1Y7/gk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFE7126F0B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708704975; cv=none; b=Kf6+Ql5DQtc1GHEmGp1lhR4xdb9neg5doUuxH6YuSH3fZO7hFJ5FK9ZU6Np8UF8rFNigC59CFh/o9W8Nzu8SALmEZ1xFcaEGDBIXEPwda9VBCiy/KsdKsCsBZRCpOwXDIQO15YxAMFpuwxd4puCEhsQWTH02DKvC5F5tnal59sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708704975; c=relaxed/simple;
	bh=xoqWkPUH70QBJ/4t8qZJ0auLkPslWlt1eGWWW+02FzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gJdlj6lotiirei1h1dz+sJBeVLcW7OG0GspZyC9p2/vbQ+H/ikR0KX4CpZKMQfpo0w12L5Lc7f9ChW68Xdg3LX38yifmUUwyTFlaQiLdn97Fj3l4T/0td84F+z+D1AShcaO1FZQ7Q32Wjxn1/9YcWGBoxuHTR1VRn/BkJn1rch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fy1Y7/gk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708704974; x=1740240974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xoqWkPUH70QBJ/4t8qZJ0auLkPslWlt1eGWWW+02FzM=;
  b=fy1Y7/gk/0bofZ0tZh9+ziFhOvVZT4HBeH5UcfsWoZea4RCeke97JtEg
   WN/PSOeXfFnjBy+L4zlciHaSc+njnwLRk3wGx2t9dBQn9SHnLAaDxaKmw
   YxFrPV6ckobq75qJR0M8FOsUDi48A97dNKkW/LhrpvQwkDAilf2avQgUm
   af12giYcyq2J7UeCCJdF8VWCUhBljDftwJLJ6yFQhz2Xqhyo8pToXsSiI
   wEPUjmx/L5ISX9/GIvPufsYL2GojkfjE9kcWG2s2oU/cLA6fDVtI1oM/A
   RejWF8aqDzGU5tU2JjdAZglJ9NaE5KlWeL7aqtepXR8QEtwErkOPVlK6A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2914375"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="2914375"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 08:16:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5894081"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Feb 2024 08:16:12 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdYDZ-0007fC-2O;
	Fri, 23 Feb 2024 16:16:09 +0000
Date: Sat, 24 Feb 2024 00:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-debug 12/20]
 drivers/soc/renesas/r8a77990-mstp.c:545:13: warning: no previous prototype
 for 'r8a77990_disable_mstp_clocks'
Message-ID: <202402240016.3g2DLUvV-lkp@intel.com>
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
commit: 6e0346bf441cacceb7cc839b4f7c892048ee9fd7 [12/20] [DEBUG] soc: renesas: r8a77990: MSTP debug handling
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240224/202402240016.3g2DLUvV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240016.3g2DLUvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240016.3g2DLUvV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/renesas/r8a77990-mstp.c:545:13: warning: no previous prototype for 'r8a77990_disable_mstp_clocks' [-Wmissing-prototypes]
     545 | void __init r8a77990_disable_mstp_clocks(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/r8a77990_disable_mstp_clocks +545 drivers/soc/renesas/r8a77990-mstp.c

   544	
 > 545	void __init r8a77990_disable_mstp_clocks(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

