Return-Path: <linux-renesas-soc+bounces-491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ED98006A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 10:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F64F2814FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 09:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E9579F5;
	Fri,  1 Dec 2023 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXNoQo5p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D2A10A;
	Fri,  1 Dec 2023 01:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701422113; x=1732958113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=seK9BB9W5x1wulNi9afBuKyCtNetftImiKASE0PZgVo=;
  b=WXNoQo5pUr6WYf40nNiY1Rf7gdAIghcvUtuqeEeiZcqYmPlQzFVMBJCO
   j5fcoOhciO7pUdUk7nJ3d6Ajrfw63VvPG0fb967YCNQP4QMn0K+VztPpP
   dSK8/UXtEyG2w1ONrXHeiiahTBinCyXPTZaP27F6ztqpWQ8ESqUaPJsYL
   0bhlq6aq2MWWSDKKz2jy75Hyh2magucbLpghsGHK8wcGj06tk5lSy5Hcr
   3FVLbv0oDHX3vkcFfiWoeR04WxJ7znhBj0w2yM4ns1qA674gPym8O2VZ/
   g0JsUSKnM3q/l5LqALKBc5mZEafYMQxICdK5E4Qi9G6npmvO663nk30XG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="6745407"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="6745407"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 01:15:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="719435631"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="719435631"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 01 Dec 2023 01:15:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8zc3-0003Ni-1a;
	Fri, 01 Dec 2023 09:15:07 +0000
Date: Fri, 1 Dec 2023 17:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: Haoran Liu <liuhaoran14@163.com>, geert+renesas@glider.be
Cc: oe-kbuild-all@lists.linux.dev, magnus.damm@gmail.com,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Haoran Liu <liuhaoran14@163.com>
Subject: Re: [PATCH] [soc/renesas] renesas-soc: Add error handling in
 renesas_soc_init
Message-ID: <202312011703.teVKAipZ-lkp@intel.com>
References: <20231129143431.34459-1-liuhaoran14@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129143431.34459-1-liuhaoran14@163.com>

Hi Haoran,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-devel/next]
[also build test ERROR on linus/master v6.7-rc3 next-20231201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haoran-Liu/renesas-soc-Add-error-handling-in-renesas_soc_init/20231129-225113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20231129143431.34459-1-liuhaoran14%40163.com
patch subject: [PATCH] [soc/renesas] renesas-soc: Add error handling in renesas_soc_init
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231201/202312011703.teVKAipZ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231201/202312011703.teVKAipZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312011703.teVKAipZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/sys_soc.h:9,
                    from drivers/soc/renesas/renesas-soc.c:13:
   drivers/soc/renesas/renesas-soc.c: In function 'renesas_soc_init':
>> drivers/soc/renesas/renesas-soc.c:492:25: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     492 |                 dev_err(dev, "Failed to read model property: %d\n", ret);
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/soc/renesas/renesas-soc.c:492:17: note: in expansion of macro 'dev_err'
     492 |                 dev_err(dev, "Failed to read model property: %d\n", ret);
         |                 ^~~~~~~
   drivers/soc/renesas/renesas-soc.c:492:25: note: each undeclared identifier is reported only once for each function it appears in
     492 |                 dev_err(dev, "Failed to read model property: %d\n", ret);
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/soc/renesas/renesas-soc.c:492:17: note: in expansion of macro 'dev_err'
     492 |                 dev_err(dev, "Failed to read model property: %d\n", ret);
         |                 ^~~~~~~


vim +492 drivers/soc/renesas/renesas-soc.c

   447	
   448	static int __init renesas_soc_init(void)
   449	{
   450		struct soc_device_attribute *soc_dev_attr;
   451		unsigned int product, eshi = 0, eslo;
   452		const struct renesas_family *family;
   453		const struct of_device_id *match;
   454		const struct renesas_soc *soc;
   455		const struct renesas_id *id;
   456		void __iomem *chipid = NULL;
   457		const char *rev_prefix = "";
   458		struct soc_device *soc_dev;
   459		struct device_node *np;
   460		const char *soc_id;
   461		int ret;
   462	
   463		match = of_match_node(renesas_socs, of_root);
   464		if (!match)
   465			return -ENODEV;
   466	
   467		soc_id = strchr(match->compatible, ',') + 1;
   468		soc = match->data;
   469		family = soc->family;
   470	
   471		np = of_find_matching_node_and_match(NULL, renesas_ids, &match);
   472		if (np) {
   473			id = match->data;
   474			chipid = of_iomap(np, 0);
   475			of_node_put(np);
   476		} else if (soc->id && family->reg) {
   477			/* Try hardcoded CCCR/PRR fallback */
   478			id = &id_prr;
   479			chipid = ioremap(family->reg, 4);
   480		}
   481	
   482		soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
   483		if (!soc_dev_attr) {
   484			if (chipid)
   485				iounmap(chipid);
   486			return -ENOMEM;
   487		}
   488	
   489		np = of_find_node_by_path("/");
   490		ret = of_property_read_string(np, "model", &soc_dev_attr->machine);
   491		if (ret) {
 > 492			dev_err(dev, "Failed to read model property: %d\n", ret);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

