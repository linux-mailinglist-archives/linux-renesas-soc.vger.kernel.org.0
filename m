Return-Path: <linux-renesas-soc+bounces-22637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA15BB841B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Oct 2025 00:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48F991B2076F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Oct 2025 22:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1026253B66;
	Fri,  3 Oct 2025 22:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1HBXxhT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA321D88A4;
	Fri,  3 Oct 2025 22:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759528995; cv=none; b=LGC7iEwKvk/e4tYefKG0bH5fCdFxYJ/bLXNJE23TFKKz5YWNrwxN4uJdnXuEpemTuctJpVkz4gCBY7M8j+8CYvZL3/0uMZU6SqWJi9HWMXrlWtQws23uFDlpHhOT+mb2B11xCMSujilA9ifh62Y5l/EZr+VLE7uY9dTvvyTpPWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759528995; c=relaxed/simple;
	bh=tiZd0YVKMoIgIkvCj6smKf68m23tUbllN6CAmNTCRKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r30DRvOMre0OqSvq6NtMj/5Xk8OCzCQWu6OoL1hrRApnJOnFCuWQTVwmIuhcJ08v0JiOglxcp66NFw3TZTYLlHYPTokhEIrSHCcifUqUPWnmHdSvHbDOxD2R/D75I/R9EG3bnFtFZVachuVK+Wr3RHGeI/LRUtDmkTxNkUK+Mf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1HBXxhT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759528992; x=1791064992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tiZd0YVKMoIgIkvCj6smKf68m23tUbllN6CAmNTCRKw=;
  b=R1HBXxhTxG32z6r85sHvvnObzg1fRuCuJ/F7U9qKjyyFcteo1sfCNsnR
   6845b7bYjnjTKZCdJaPBMIOstv+frTPgMCjie9QMnPS9MEXslaxP80jmb
   aUfLfXmOwtLNv3v1wryWlX59yL+GgjdzeMVBwXVgJgfHmja+sWtDe46eJ
   bShb7Uddii1Vcsg/sbEhtFuhMgxVUdgORalVtoKmfsDjDY/arZHWdOOS5
   PxrULPrSFF1SYtenqGCpJw4f71o7dIkfXQELeMVKnE8liqhD8n29nNhmW
   i9M7IjDRg7RZyXV1KOBXgekVQ3gG15RLXNfz6vxCtWmn3w18zm8vAqehg
   w==;
X-CSE-ConnectionGUID: 4+W4GcijQJmhrnUFLUttAg==
X-CSE-MsgGUID: kjyS87c5Qc+QZ3ogCALPhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61981554"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="61981554"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 15:03:12 -0700
X-CSE-ConnectionGUID: 9UPln/QgSkGMRv7Sli7+yA==
X-CSE-MsgGUID: xQ49hB05RM+OckHC1jHv+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="178674832"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Oct 2025 15:03:04 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4nri-0004vn-1B;
	Fri, 03 Oct 2025 22:03:02 +0000
Date: Sat, 4 Oct 2025 06:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v9 6/6] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Message-ID: <202510040513.VEXSy8SM-lkp@intel.com>
References: <20251002161728.186024-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002161728.186024-7-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-drivers/renesas-clk]
[also build test ERROR on clk/clk-next robh/for-next linus/master v6.17 next-20251003]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/clk-renesas-rzv2h-cpg-Add-instance-field-to-struct-pll/20251003-002026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
patch link:    https://lore.kernel.org/r/20251002161728.186024-7-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH v9 6/6] drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
config: s390-randconfig-r131-20251003 (https://download.01.org/0day-ci/archive/20251004/202510040513.VEXSy8SM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510040513.VEXSy8SM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510040513.VEXSy8SM-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_del_clk_provider':
>> drivers/clk/renesas/rzv2h-cpg.c:1625: undefined reference to `of_clk_del_provider'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_ddiv_determine_rate':
>> drivers/clk/renesas/rzv2h-cpg.c:842: undefined reference to `divider_determine_rate'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_plldsi_div_determine_rate':
>> drivers/clk/renesas/rzv2h-cpg.c:497: undefined reference to `clk_hw_get_parent'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_ddiv_recalc_rate':
>> drivers/clk/renesas/rzv2h-cpg.c:833: undefined reference to `divider_recalc_rate'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_plldsi_div_set_rate':
   drivers/clk/renesas/rzv2h-cpg.c:531: undefined reference to `clk_hw_get_parent'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_parent_clk_mux_to_index':
>> drivers/clk/renesas/rzv2h-cpg.c:1209: undefined reference to `clk_mux_val_to_index'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_ddiv_set_rate':
>> drivers/clk/renesas/rzv2h-cpg.c:868: undefined reference to `divider_get_val'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_pll_clk_register':
>> drivers/clk/renesas/rzv2h-cpg.c:806: undefined reference to `__clk_get_name'
>> s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.c:817: undefined reference to `devm_clk_hw_register'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_register_mod_clk':
   drivers/clk/renesas/rzv2h-cpg.c:1332: undefined reference to `__clk_get_name'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.c:1346: undefined reference to `devm_clk_hw_register'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_probe':
>> drivers/clk/renesas/rzv2h-cpg.c:1686: undefined reference to `of_clk_add_provider'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_plldsi_div_clk_register':
   drivers/clk/renesas/rzv2h-cpg.c:592: undefined reference to `__clk_get_name'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.c:602: undefined reference to `devm_clk_hw_register'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_mux_clk_register':
>> drivers/clk/renesas/rzv2h-cpg.c:959: undefined reference to `__devm_clk_hw_register_mux'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_ddiv_clk_register':
   drivers/clk/renesas/rzv2h-cpg.c:916: undefined reference to `__clk_get_name'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.c:945: undefined reference to `devm_clk_hw_register'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_fixed_mod_status_clk_register':
   drivers/clk/renesas/rzv2h-cpg.c:999: undefined reference to `__clk_get_name'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.c:1022: undefined reference to `devm_clk_hw_register'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_register_core_clk':
   drivers/clk/renesas/rzv2h-cpg.c:1098: undefined reference to `__clk_get_name'
>> s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.c:1099: undefined reference to `devm_clk_hw_register_fixed_factor'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_del_clk_provider':
>> drivers/clk/renesas/rzv2h-cpg.c:1625: undefined reference to `of_clk_del_provider'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_register_core_clk':
>> drivers/clk/renesas/rzv2h-cpg.c:1115: undefined reference to `clk_fixed_factor_ops'
   s390-linux-ld: drivers/clk/renesas/rzv2h-cpg.o: in function `rzv2h_cpg_ddiv_clk_register':
>> drivers/clk/renesas/rzv2h-cpg.c:927: undefined reference to `clk_divider_ops'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CLK_RZV2H
   Depends on [n]: COMMON_CLK [=n] && CLK_RENESAS [=n]
   Selected by [y]:
   - DRM_RZG2L_USE_MIPI_DSI [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=y] && (DRM_RZG2L_DU [=n] || COMPILE_TEST [=y])


vim +1625 drivers/clk/renesas/rzv2h-cpg.c

dd22e56217495e Lad Prabhakar 2024-07-29  1622  
dd22e56217495e Lad Prabhakar 2024-07-29  1623  static void rzv2h_cpg_del_clk_provider(void *data)
dd22e56217495e Lad Prabhakar 2024-07-29  1624  {
dd22e56217495e Lad Prabhakar 2024-07-29 @1625  	of_clk_del_provider(data);
dd22e56217495e Lad Prabhakar 2024-07-29  1626  }
dd22e56217495e Lad Prabhakar 2024-07-29  1627  
dd22e56217495e Lad Prabhakar 2024-07-29  1628  static int __init rzv2h_cpg_probe(struct platform_device *pdev)
dd22e56217495e Lad Prabhakar 2024-07-29  1629  {
dd22e56217495e Lad Prabhakar 2024-07-29  1630  	struct device *dev = &pdev->dev;
dd22e56217495e Lad Prabhakar 2024-07-29  1631  	struct device_node *np = dev->of_node;
dd22e56217495e Lad Prabhakar 2024-07-29  1632  	const struct rzv2h_cpg_info *info;
dd22e56217495e Lad Prabhakar 2024-07-29  1633  	struct rzv2h_cpg_priv *priv;
dd22e56217495e Lad Prabhakar 2024-07-29  1634  	unsigned int nclks, i;
dd22e56217495e Lad Prabhakar 2024-07-29  1635  	struct clk **clks;
dd22e56217495e Lad Prabhakar 2024-07-29  1636  	int error;
dd22e56217495e Lad Prabhakar 2024-07-29  1637  
dd22e56217495e Lad Prabhakar 2024-07-29  1638  	info = of_device_get_match_data(dev);
dd22e56217495e Lad Prabhakar 2024-07-29  1639  
dd22e56217495e Lad Prabhakar 2024-07-29  1640  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
dd22e56217495e Lad Prabhakar 2024-07-29  1641  	if (!priv)
dd22e56217495e Lad Prabhakar 2024-07-29  1642  		return -ENOMEM;
dd22e56217495e Lad Prabhakar 2024-07-29  1643  
bc4d25fdfadfa8 Lad Prabhakar 2024-08-28  1644  	spin_lock_init(&priv->rmw_lock);
bc4d25fdfadfa8 Lad Prabhakar 2024-08-28  1645  
dd22e56217495e Lad Prabhakar 2024-07-29  1646  	priv->dev = dev;
dd22e56217495e Lad Prabhakar 2024-07-29  1647  
dd22e56217495e Lad Prabhakar 2024-07-29  1648  	priv->base = devm_platform_ioremap_resource(pdev, 0);
dd22e56217495e Lad Prabhakar 2024-07-29  1649  	if (IS_ERR(priv->base))
dd22e56217495e Lad Prabhakar 2024-07-29  1650  		return PTR_ERR(priv->base);
dd22e56217495e Lad Prabhakar 2024-07-29  1651  
dd22e56217495e Lad Prabhakar 2024-07-29  1652  	nclks = info->num_total_core_clks + info->num_hw_mod_clks;
dd22e56217495e Lad Prabhakar 2024-07-29  1653  	clks = devm_kmalloc_array(dev, nclks, sizeof(*clks), GFP_KERNEL);
dd22e56217495e Lad Prabhakar 2024-07-29  1654  	if (!clks)
dd22e56217495e Lad Prabhakar 2024-07-29  1655  		return -ENOMEM;
dd22e56217495e Lad Prabhakar 2024-07-29  1656  
9b6e63a777ea5f Biju Das      2024-12-13  1657  	priv->mstop_count = devm_kcalloc(dev, info->num_mstop_bits,
9b6e63a777ea5f Biju Das      2024-12-13  1658  					 sizeof(*priv->mstop_count), GFP_KERNEL);
9b6e63a777ea5f Biju Das      2024-12-13  1659  	if (!priv->mstop_count)
9b6e63a777ea5f Biju Das      2024-12-13  1660  		return -ENOMEM;
9b6e63a777ea5f Biju Das      2024-12-13  1661  
69ac2acd209a15 Biju Das      2025-02-22  1662  	/* Adjust for CPG_BUS_m_MSTOP starting from m = 1 */
69ac2acd209a15 Biju Das      2025-02-22  1663  	priv->mstop_count -= 16;
69ac2acd209a15 Biju Das      2025-02-22  1664  
338b505d564c1e Raag Jadav    2025-06-10  1665  	priv->resets = devm_kmemdup_array(dev, info->resets, info->num_resets,
338b505d564c1e Raag Jadav    2025-06-10  1666  					  sizeof(*info->resets), GFP_KERNEL);
dd22e56217495e Lad Prabhakar 2024-07-29  1667  	if (!priv->resets)
dd22e56217495e Lad Prabhakar 2024-07-29  1668  		return -ENOMEM;
dd22e56217495e Lad Prabhakar 2024-07-29  1669  
dd22e56217495e Lad Prabhakar 2024-07-29  1670  	dev_set_drvdata(dev, priv);
dd22e56217495e Lad Prabhakar 2024-07-29  1671  	priv->clks = clks;
dd22e56217495e Lad Prabhakar 2024-07-29  1672  	priv->num_core_clks = info->num_total_core_clks;
dd22e56217495e Lad Prabhakar 2024-07-29  1673  	priv->num_mod_clks = info->num_hw_mod_clks;
dd22e56217495e Lad Prabhakar 2024-07-29  1674  	priv->last_dt_core_clk = info->last_dt_core_clk;
dd22e56217495e Lad Prabhakar 2024-07-29  1675  	priv->num_resets = info->num_resets;
dd22e56217495e Lad Prabhakar 2024-07-29  1676  
dd22e56217495e Lad Prabhakar 2024-07-29  1677  	for (i = 0; i < nclks; i++)
dd22e56217495e Lad Prabhakar 2024-07-29  1678  		clks[i] = ERR_PTR(-ENOENT);
dd22e56217495e Lad Prabhakar 2024-07-29  1679  
dd22e56217495e Lad Prabhakar 2024-07-29  1680  	for (i = 0; i < info->num_core_clks; i++)
dd22e56217495e Lad Prabhakar 2024-07-29  1681  		rzv2h_cpg_register_core_clk(&info->core_clks[i], priv);
dd22e56217495e Lad Prabhakar 2024-07-29  1682  
dd22e56217495e Lad Prabhakar 2024-07-29  1683  	for (i = 0; i < info->num_mod_clks; i++)
dd22e56217495e Lad Prabhakar 2024-07-29  1684  		rzv2h_cpg_register_mod_clk(&info->mod_clks[i], priv);
dd22e56217495e Lad Prabhakar 2024-07-29  1685  
dd22e56217495e Lad Prabhakar 2024-07-29 @1686  	error = of_clk_add_provider(np, rzv2h_cpg_clk_src_twocell_get, priv);
dd22e56217495e Lad Prabhakar 2024-07-29  1687  	if (error)
dd22e56217495e Lad Prabhakar 2024-07-29  1688  		return error;
dd22e56217495e Lad Prabhakar 2024-07-29  1689  
dd22e56217495e Lad Prabhakar 2024-07-29  1690  	error = devm_add_action_or_reset(dev, rzv2h_cpg_del_clk_provider, np);
dd22e56217495e Lad Prabhakar 2024-07-29  1691  	if (error)
dd22e56217495e Lad Prabhakar 2024-07-29  1692  		return error;
dd22e56217495e Lad Prabhakar 2024-07-29  1693  
dd22e56217495e Lad Prabhakar 2024-07-29  1694  	error = rzv2h_cpg_add_pm_domains(priv);
dd22e56217495e Lad Prabhakar 2024-07-29  1695  	if (error)
dd22e56217495e Lad Prabhakar 2024-07-29  1696  		return error;
dd22e56217495e Lad Prabhakar 2024-07-29  1697  
dd22e56217495e Lad Prabhakar 2024-07-29  1698  	error = rzv2h_cpg_reset_controller_register(priv);
dd22e56217495e Lad Prabhakar 2024-07-29  1699  	if (error)
dd22e56217495e Lad Prabhakar 2024-07-29  1700  		return error;
dd22e56217495e Lad Prabhakar 2024-07-29  1701  
dd22e56217495e Lad Prabhakar 2024-07-29  1702  	return 0;
dd22e56217495e Lad Prabhakar 2024-07-29  1703  }
dd22e56217495e Lad Prabhakar 2024-07-29  1704  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

