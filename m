Return-Path: <linux-renesas-soc+bounces-23537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C348C02ED2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 20:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C82DC4FB399
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 18:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4536934B19C;
	Thu, 23 Oct 2025 18:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxb4jn0I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613712D4B4B;
	Thu, 23 Oct 2025 18:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761243963; cv=none; b=tVPaDwcQQggtKsck3vYd+fj3euqSX1QT0uDf0ZKUldn9YEw+vY7bnYEtEeox0Kvhd2hG89karPs4VeqIddfY2rgZ9kPbaaT/UzIEeRL7PA97yx/hbO5hjnEDl19AADuIMTZVYGPMMZoXsq4keCOqn1ht1dQepM07LdbdZGIllKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761243963; c=relaxed/simple;
	bh=VmWSQaHeoONfdSbxzhTJmjZWqW+ju0/7hixcjpMUMJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJY5FP3nL4aIdUTxUnwRVleAsFzK3jJ9FrQ/Nkj6JnLEZwV0dGUQwZYaAHWhD41V9Fh5YjKT006xg1hzPOL3Aum2dokzPpypVXuPUBla8sABJK4oSIxiDD3nDa7OnakF8OuI+nI+druNzcVVH6BXJ98hbyuVuzGmSVHAmQjZ4BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxb4jn0I; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761243962; x=1792779962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VmWSQaHeoONfdSbxzhTJmjZWqW+ju0/7hixcjpMUMJc=;
  b=mxb4jn0IC2+h1928JaPSM+ihkGPAM1F4LdJI5lyVdD02hCF/pddSHAOi
   Y0x1C2stOewFyS6TYgq148n8nI9gZy54D4/JcMMHmFrR1L7RRAs/5zbjx
   zs4bWt4opcCK0YoEq4R0x6qglOo6WRQW9ThVIzStWuECohu4TDPyfTRPC
   QgyK4Kd6oICHG3SrCECjngvVfDYIwyV86xVmhUSpqAvXj0e/ZQYGPuFyC
   k+A9imO4z9zVqlARPgMnon/+5wkMfuK3vdnQo9Q7DNWN3h89r484Hxfga
   adfkGdAN4R5iiC8W5rnK2Or8ZUiqoXf7ll5fiKeHDbOTHK+tSjqSLUpCG
   w==;
X-CSE-ConnectionGUID: fViekVxgTTa+rfI2dVuvug==
X-CSE-MsgGUID: rLrNCsa7TxiPOx/SltB2jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67069877"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="67069877"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:26:01 -0700
X-CSE-ConnectionGUID: aMiW3RXHQJ2Q/epAZE27hw==
X-CSE-MsgGUID: wlE5mxWtRCeKDcArnBgc7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="221422018"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Oct 2025 11:25:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vC00Y-000Dmb-1R;
	Thu, 23 Oct 2025 18:25:54 +0000
Date: Fri, 24 Oct 2025 02:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hien Huynh <hien.huynh.px@renesas.com>,
	Nghia Vo <nghia.vo.zn@renesas.com>,
	Hugo Villeneuve <hugo@hugovil.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Chris Brandt <chris.brandt@renesas.com>
Subject: Re: [PATCH v3 2/2] drm: renesas: rz-du: Set DSI divider based on
 target MIPI device
Message-ID: <202510240111.DvVTqUEp-lkp@intel.com>
References: <20251022235903.1091453-3-chris.brandt@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022235903.1091453-3-chris.brandt@renesas.com>

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on geert-renesas-drivers/renesas-clk sunxi/sunxi/for-next linus/master v6.18-rc2 next-20251023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Brandt/clk-renesas-rzg2l-Remove-DSI-clock-rate-restrictions/20251023-080220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20251022235903.1091453-3-chris.brandt%40renesas.com
patch subject: [PATCH v3 2/2] drm: renesas: rz-du: Set DSI divider based on target MIPI device
config: powerpc-randconfig-002-20251023 (https://download.01.org/0day-ci/archive/20251024/202510240111.DvVTqUEp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240111.DvVTqUEp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240111.DvVTqUEp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:751:31: error: called object type 'void *' is not a function or function pointer
     751 |         rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->format) / dsi->lanes,
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +751 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c

   687	
   688	/* -----------------------------------------------------------------------------
   689	 * Host setting
   690	 */
   691	
   692	static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
   693					      struct mipi_dsi_device *device)
   694	{
   695		struct rzg2l_mipi_dsi *dsi = host_to_rzg2l_mipi_dsi(host);
   696		int ret;
   697	
   698		if (device->lanes > dsi->num_data_lanes) {
   699			dev_err(dsi->dev,
   700				"Number of lines of device (%u) exceeds host (%u)\n",
   701				device->lanes, dsi->num_data_lanes);
   702			return -EINVAL;
   703		}
   704	
   705		switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
   706		case 24:
   707			break;
   708		case 18:
   709			break;
   710		case 16:
   711			if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_16BPP)) {
   712				dev_err(dsi->dev, "Unsupported format 0x%04x\n",
   713					device->format);
   714				return -EINVAL;
   715			}
   716			break;
   717		default:
   718			dev_err(dsi->dev, "Unsupported format 0x%04x\n", device->format);
   719			return -EINVAL;
   720		}
   721	
   722		dsi->lanes = device->lanes;
   723		dsi->format = device->format;
   724		dsi->mode_flags = device->mode_flags;
   725	
   726		dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
   727							  1, 0);
   728		if (IS_ERR(dsi->next_bridge)) {
   729			ret = PTR_ERR(dsi->next_bridge);
   730			dev_err(dsi->dev, "failed to get next bridge: %d\n", ret);
   731			return ret;
   732		}
   733	
   734		drm_bridge_add(&dsi->bridge);
   735	
   736		/*
   737		 * Report required division ratio setting for the MIPI clock dividers.
   738		 * Assume the default clock source is FOUTPOSTDIV (PLL/2) being fed to the DSI-PHY, but also
   739		 * the DSI-PHY must be 16x the MIPI-DSI HS clock.
   740		 *
   741		 * pllclk / 2 = vclk * DSI divider
   742		 * pllclk = vclk * DSI divider * 2
   743		 *
   744		 * hsclk = (vclk * DSI divider * 2) / 16
   745		 *
   746		 * vclk * bpp = hsclk * 8 * num_lanes
   747		 * vclk * bpp = ((vclk * DSI divider * 2) / 16) * 8 * num_lanes
   748		 *   which simplifies to...
   749		 * DSI divider = bpp / num_lanes
   750		 */
 > 751		rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->format) / dsi->lanes,
   752					      PLL5_TARGET_DSI);
   753	
   754		return 0;
   755	}
   756	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

