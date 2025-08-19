Return-Path: <linux-renesas-soc+bounces-20713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07484B2C65F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 15:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D44116106D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 13:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55975340DAE;
	Tue, 19 Aug 2025 13:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHvuztMk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5FA3043DB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 13:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755611694; cv=none; b=uwa0QojwiW8zNkzMEw2Rsrxkp82vs1rS6a16asAfBq43tnaxmY7hIcEoQryERomhcKncisHdGsyeHkxOk9Gt9D4m4uAIacFCknrUyeaRknVwviXiKNYHfoGXZk9gTUqqN0IVnXnmVfEd/22xSo3sEHMEDGF1YpLCdtj13sqgw6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755611694; c=relaxed/simple;
	bh=tCiVzuNUp7gEqOILuBT58YBNiADbUw3hLgyfuari8R8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qpqSTx5QoKbJerOwBtmE0WHNQWw3s9scx1oErqAIKJRgkLwbG24ikyMxhVRTAZxgidiYyjpNkzxsW6wwACn5m0hO7BIiNAJxDRQ60STYvwFDJVLd+Zr1YzuQkdPebr/gWzfAwIOh3PAN7cd43mxlm5uBxEvtYiYvihgFFtMM1e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHvuztMk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755611692; x=1787147692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tCiVzuNUp7gEqOILuBT58YBNiADbUw3hLgyfuari8R8=;
  b=AHvuztMkBVy7d849sgVXzbhdkNcnw6HTWzRk3QL4T4V02wGiGPXWbH5/
   HexFveOGYnvV/ruC4ER3dWbFj5zjDTGvtzAdccEFNV3lZOHQUMgGqkq4t
   ZZF2OE2bHyMWpgoqTssmuxRyfrjOn7OYLBXQ89l3pr0rB/kxsOpOhC1Qw
   9FetegE/aXBFqGksVWfWW6H+qtTqblAVKku1f1tXA88CiarGYbh8cFHwL
   89N3z+SMs+8H7JsakEhiSS6q/g6cqomfVjsGNw84epN38sUAFn7ZdgWY4
   Jp+v1b6JQTVtpkdjs2Hr24qAebKOvaKwqzyZCrZIgnHl39u7m9oinKs+u
   Q==;
X-CSE-ConnectionGUID: YZhuOzwBSyqbpz5E9enjsA==
X-CSE-MsgGUID: FczlHGlWSyOXnc0Y3JKTlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69308115"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="69308115"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 06:54:40 -0700
X-CSE-ConnectionGUID: F+IgZ8jzT4G0F2uGvYIwjw==
X-CSE-MsgGUID: DMKoe9ugTv6RaXb8npMOvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="173090245"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Aug 2025 06:54:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoMnL-000Gy7-31;
	Tue, 19 Aug 2025 13:54:35 +0000
Date: Tue, 19 Aug 2025 21:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [geert-renesas-devel:renesas-drivers-for-v6.18 1/1]
 drivers/soc/renesas/rz-sysc.c:113:16: error: cleanup argument not a function
Message-ID: <202508192154.jtZINmab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.18
head:   75601ffaea537c3180f23912ce1d0ed5f716469d
commit: 75601ffaea537c3180f23912ce1d0ed5f716469d [1/1] soc: renesas: rz-sysc: Add syscon/regmap support
config: arm-randconfig-001-20250819 (https://download.01.org/0day-ci/archive/20250819/202508192154.jtZINmab-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508192154.jtZINmab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508192154.jtZINmab-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/soc/renesas/rz-sysc.c: In function 'rz_sysc_probe':
>> drivers/soc/renesas/rz-sysc.c:113:16: error: cleanup argument not a function
     113 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc(sizeof(*regmap_cfg), GFP_KERNEL);
         |                ^~~~~~~~~~~~~
>> drivers/soc/renesas/rz-sysc.c:113:58: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     113 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc(sizeof(*regmap_cfg), GFP_KERNEL);
         |                                                          ^~~~~~~
>> drivers/soc/renesas/rz-sysc.c:113:58: warning: initialization of 'struct regmap_config *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +113 drivers/soc/renesas/rz-sysc.c

   103	
   104	static int rz_sysc_probe(struct platform_device *pdev)
   105	{
   106		const struct rz_sysc_init_data *data;
   107		const struct of_device_id *match;
   108		struct device *dev = &pdev->dev;
   109		struct regmap *regmap;
   110		struct rz_sysc *sysc;
   111		int ret;
   112	
 > 113		struct regmap_config *regmap_cfg __free(kfree) = kzalloc(sizeof(*regmap_cfg), GFP_KERNEL);
   114		if (!regmap_cfg)
   115			return -ENOMEM;
   116	
   117		match = of_match_node(rz_sysc_match, dev->of_node);
   118		if (!match)
   119			return -ENODEV;
   120	
   121		data = match->data;
   122	
   123		sysc = devm_kzalloc(dev, sizeof(*sysc), GFP_KERNEL);
   124		if (!sysc)
   125			return -ENOMEM;
   126	
   127		sysc->base = devm_platform_ioremap_resource(pdev, 0);
   128		if (IS_ERR(sysc->base))
   129			return PTR_ERR(sysc->base);
   130	
   131		sysc->dev = dev;
   132		ret = rz_sysc_soc_init(sysc, match);
   133		if (ret)
   134			return ret;
   135	
   136		regmap_cfg->name = "rz_sysc_regs";
   137		regmap_cfg->reg_bits = 32;
   138		regmap_cfg->reg_stride = 4;
   139		regmap_cfg->val_bits = 32;
   140		regmap_cfg->fast_io = true;
   141		regmap_cfg->max_register = data->max_register;
   142	
   143		regmap = devm_regmap_init_mmio(dev, sysc->base, regmap_cfg);
   144		if (IS_ERR(regmap))
   145			return PTR_ERR(regmap);
   146	
   147		return of_syscon_register_regmap(dev->of_node, regmap);
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

