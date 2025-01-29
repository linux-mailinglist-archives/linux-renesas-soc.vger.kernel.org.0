Return-Path: <linux-renesas-soc+bounces-12724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C89EA226C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 00:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D19AA1884820
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 23:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E585919D898;
	Wed, 29 Jan 2025 23:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hc11y6UO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE971B21BA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jan 2025 23:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738192746; cv=none; b=TT8HtGObGoAxb0jT+u9W6gu86iJzjHYZZOQKwoEN7QNCQIroxnBJV5FucgLM2PO2xdu7sWB4Xcg0GMGMhk8lOopV6Ve24uk/0KrkP/MXkFfXx6aav38rCQNkEciS7bDeyKJimDk/nFbj14aGJ7kO9KdCnlJMhjQFFI53dY9noX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738192746; c=relaxed/simple;
	bh=vkTjJS9yjbJ0Xs2ZiFGjnCw/BxptfF8iGqF5LPu0Lks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ieueT980iAnzs6zIqCtEit1erzv8vwIrfyOtKtdBRendGnvXv/f3yhV9V0gbYw/gLgym7vJAZOKw+eTTRTmySk5FCuGFTd+lbxwkhksgNQsOGOPFJ2BRiUxnHsmWdccHWzSkebX7qAFiZEplG+kNI48eZJlKFflD30SdI9mbBYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hc11y6UO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738192745; x=1769728745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vkTjJS9yjbJ0Xs2ZiFGjnCw/BxptfF8iGqF5LPu0Lks=;
  b=hc11y6UOqAVhoHF0ycp8Wu1v1/g4fs+lq5mSxYMiuX2iEqcph/8fwW+i
   Gu6Gyjm/TXb5OjusdYLCipr3s5tsP7roKBcwVLi7REWDTg/1VP9RglJQ3
   FtXjtB0fuYQoXww7SWHK0RqUjWhjcgPZ4AOWIIyCy5xrnuZZ+qQaADWC+
   O45nUOCKeqpT5G5GvCg8aCtmsJbM0R4UQVSje43qsvwDXZLaay4t6hi6Q
   fcPOca+FE09+RdaYRenInLTN03U2gxPpSQo/uuLltlJ0SqN//OnCP2Ei1
   FomZxBFFSa2jOET7+tbfwwAkz9CT/eSlIxEhLz8uSNnIMf8w7cHkhct9Q
   A==;
X-CSE-ConnectionGUID: tMyMHkPfSKak4XwnLO0rqA==
X-CSE-MsgGUID: QjwnpHx/RJaVQ2tIfkfUmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="56155299"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="56155299"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 15:19:05 -0800
X-CSE-ConnectionGUID: c9cQRHjEQWmgQGnJhQZ8OA==
X-CSE-MsgGUID: iArrZvLYRuan3XyAdOAG2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109027729"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Jan 2025 15:19:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdHKm-000jS7-2t;
	Wed, 29 Jan 2025 23:19:00 +0000
Date: Thu, 30 Jan 2025 07:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-devel:renesas-drivers-for-v6.15 6/6]
 drivers/soc/renesas/r9a09g057-sys.c:51:13: error: implicit declaration of
 function 'FIELD_GET'
Message-ID: <202501300701.ujawOImj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.15
head:   106b182b2d7f05703d27e37cbcf23a6fb652872f
commit: 106b182b2d7f05703d27e37cbcf23a6fb652872f [6/6] soc: renesas: rzv2h: Add a callback to print SoC-specific extra features
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250130/202501300701.ujawOImj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300701.ujawOImj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501300701.ujawOImj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/renesas/r9a09g057-sys.c: In function 'rzv2h_sys_print_id':
>> drivers/soc/renesas/r9a09g057-sys.c:51:13: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      51 |         if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHZ)
         |             ^~~~~~~~~


vim +/FIELD_GET +51 drivers/soc/renesas/r9a09g057-sys.c

    30	
    31	static void rzv2h_sys_print_id(struct device *dev,
    32					void __iomem *sysc_base,
    33					struct soc_device_attribute *soc_dev_attr)
    34	{
    35		bool gpu_enabled, isp_enabled;
    36		u32 prr_val, mode_val;
    37	
    38		prr_val = readl(sysc_base + SYS_LSI_PRR);
    39		mode_val = readl(sysc_base + SYS_LSI_MODE);
    40	
    41		/* Check GPU and ISP configuration */
    42		gpu_enabled = !(prr_val & SYS_LSI_PRR_GPU_DIS);
    43		isp_enabled = !(prr_val & SYS_LSI_PRR_ISP_DIS);
    44	
    45		dev_info(dev, "Detected Renesas %s %s Rev %s%s%s\n",
    46			 soc_dev_attr->family, soc_dev_attr->soc_id, soc_dev_attr->revision,
    47			 gpu_enabled ? " with GE3D (Mali-G31)" : "",
    48			 isp_enabled ? " with ISP (Mali-C55)" : "");
    49	
    50		/* Check CA55 PLL configuration */
  > 51		if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHZ)
    52			dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n");
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

