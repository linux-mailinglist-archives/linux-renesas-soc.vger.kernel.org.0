Return-Path: <linux-renesas-soc+bounces-12723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B35A22612
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 23:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37FAD1884448
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 22:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A0B1AB528;
	Wed, 29 Jan 2025 22:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCFWzBeE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF037081B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jan 2025 22:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738188420; cv=none; b=WfDS6SeY7CGHK9CJzJmko3gE18UZj2o5EaqmAue+EUw2ucSzTdBoe5vl4NS1wYDZWlFB8jHXSMV0URr3rFH95Zsmw2wkrx/MUmcCQy3sz18ODbJC+StBZwRiCwdIDzPHhWATVkkxNndFyqI/JXbX2wFK7iZbSZq/shC/bYGW5eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738188420; c=relaxed/simple;
	bh=Xdq9FzOksR2fKanqkM9yw9HcHROQfNmRB2UTBZGLX34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=efOZXvunAVllSHeOWUptx7SAyRriKsk37K8JD3w7AoyXN4yrt42yTOVUDAxKVJaQzH+YtIESr4gAtP0fkCjT853RPfY05FUefySpB0fyX56mRp7tbSSOXhP62RsmQZ9ojeoNe679WKq1M/d6qsbB1qpJMqKU0Nriq9cNwDkgIzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCFWzBeE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738188418; x=1769724418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xdq9FzOksR2fKanqkM9yw9HcHROQfNmRB2UTBZGLX34=;
  b=FCFWzBeE3PnIu0pFGN3l1rexpBwcmfmG/DzfL2W/awc8ScdoDe3QKEdp
   zJG1epZ/Gi5NAL/HEKWM+E42jiW6MGaEfxMMdwgrX9sBttao+40WiRsCm
   RaDkr2sTVD6jQQM8koffjH/IMiAMonDEh/yu61fCNSNxJb1Jfd3X9kQQ7
   YeTrYDd3WQlvGdlbgzWgRTngv1ADv4J/JBwEY8NyTHihaGYTcIP2Uxp50
   w2q4E8qhDlAono5tBUhRXrtvAfnEfSCc3pwNm3cV6dt0kTJ2lDykRHiRh
   Rw+fxCdc8KTnfgvhiBIjC63MU9VmcCcBU5YS7RzotD8FIlsVI4HfeW/gA
   g==;
X-CSE-ConnectionGUID: RISbqJCwSA6Xi4i4cavtNw==
X-CSE-MsgGUID: jmuI96E8SYulxcvKKGAlUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38990936"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="38990936"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 14:06:58 -0800
X-CSE-ConnectionGUID: LHxl3vTxTZ+caJelFDdkvg==
X-CSE-MsgGUID: 3Wos6ucLQeqK2485RVMleQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113167833"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jan 2025 14:06:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdGD0-000jP5-1t;
	Wed, 29 Jan 2025 22:06:54 +0000
Date: Thu, 30 Jan 2025 06:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-devel:renesas-drivers-for-v6.15 4/6]
 drivers/soc/renesas/r9a09g047-sys.c:51:13: error: implicit declaration of
 function 'FIELD_GET'
Message-ID: <202501300600.APok2iDU-lkp@intel.com>
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
commit: 1e5827262bc7f29b3735889919009b744ea8f55d [4/6] soc: renesas: rz-sysc: Add support for RZ/G3E family
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250130/202501300600.APok2iDU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300600.APok2iDU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501300600.APok2iDU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/renesas/r9a09g047-sys.c: In function 'rzg3e_sys_print_id':
>> drivers/soc/renesas/r9a09g047-sys.c:51:13: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      51 |         if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHZ)
         |             ^~~~~~~~~


vim +/FIELD_GET +51 drivers/soc/renesas/r9a09g047-sys.c

    30	
    31	static void rzg3e_sys_print_id(struct device *dev,
    32					void __iomem *sysc_base,
    33					struct soc_device_attribute *soc_dev_attr)
    34	{
    35		bool is_quad_core, npu_enabled;
    36		u32 prr_val, mode_val;
    37	
    38		prr_val = readl(sysc_base + SYS_LSI_PRR);
    39		mode_val = readl(sysc_base + SYS_LSI_MODE);
    40	
    41		/* Check CPU and NPU configuration */
    42		is_quad_core = !(prr_val & SYS_LSI_PRR_CA55_DIS);
    43		npu_enabled = !(prr_val & SYS_LSI_PRR_NPU_DIS);
    44	
    45		dev_info(dev, "Detected Renesas %s Core %s %s Rev %s%s\n",
    46			 is_quad_core ? "Quad" : "Dual", soc_dev_attr->family,
    47			 soc_dev_attr->soc_id, soc_dev_attr->revision,
    48			 npu_enabled ? " with Ethos-U55" : "");
    49	
    50		/* Check CA55 PLL configuration */
  > 51		if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHZ)
    52			dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n");
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

