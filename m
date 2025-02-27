Return-Path: <linux-renesas-soc+bounces-13790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0C2A48B9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 23:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D904A188FC86
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 22:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B149A2777F2;
	Thu, 27 Feb 2025 22:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfjTynVC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8644D2777EB;
	Thu, 27 Feb 2025 22:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740695363; cv=none; b=qWv29CBZ7LydYP5MoVeifH/Aj3jgaA82QJlKB35G36xGo62QkJVYXGKLFbPnVUUfqcA0OfMDh0j8pghvedyYOpZ04mZ9UFyUp5/N0UeIJ2o87g9p88QBtLghC6926KiZayFT05QyfKNOlpSwELHRtR2RO13QcnnB2UxaYwVE1IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740695363; c=relaxed/simple;
	bh=f85n7tc+0wiWu3oJu/ES9vHS7UtP8IVdMUZqaI8+ROI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6Rvrz5xKVjufBu+zZpf4Ve1dN/RRl+HDIQ5XdFgClxrpZQFdniFEooXikZUFywkWgCWlxqdMAEiNwi7IX2P1iBuO/XCCqpf9tEOnWqaLoE/dzMT/XnxN8p8EM+bhSuXyYgidYLZY5yvHB38o30rCmvkXQXu+bc3bfgzjUHyAOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfjTynVC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740695358; x=1772231358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f85n7tc+0wiWu3oJu/ES9vHS7UtP8IVdMUZqaI8+ROI=;
  b=MfjTynVC7i36pBiQmf2zzVYWy/T9mfEMdrmTg6j0wdb7MuVjEj5cJ6wF
   s4b8nr3sZuLRfDCG/QpAHRTyp5PbvRzI4s74/kyyCb1LmnZOPq4LFRM4t
   LalBEXxU42j3pDNL3ZfT9Q3b7Q17iuIZwY2wo6U+joL/0DMsxMlypG+38
   xZ7E5pd/UN3QCeCum4F+TJUBMv/JhUUKbhIk2NyGLM59pJBZwfHGYw0rc
   zVwm+SsOStQS7fmnUd8kKE5ofIcwyyvOFiahuvYxCW3HYnT1fLsRU9gfP
   dDDwRAx2HQRaJyUURec0DnPpu0WM6dHavZG8jUTXmkFBZ5+xb2zUAA6yS
   Q==;
X-CSE-ConnectionGUID: g997Rv0pRqezkhOQeTZnoA==
X-CSE-MsgGUID: 3gwR3sQRQhaAnBV3lrY3pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41864931"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="41864931"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 14:29:17 -0800
X-CSE-ConnectionGUID: +N3OgpXOSFCJZp0mQYC0mQ==
X-CSE-MsgGUID: 35+uvpQmRF+NuNMZNKwxzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="117654814"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Feb 2025 14:29:14 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnmNT-000E6g-2Y;
	Thu, 27 Feb 2025 22:29:11 +0000
Date: Fri, 28 Feb 2025 06:28:35 +0800
From: kernel test robot <lkp@intel.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	tomm.merciai@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 17/17] media: rzg2l-cru: Add support for RZ/G3E SoC
Message-ID: <202502280652.KV7uk1gP-lkp@intel.com>
References: <20250226152418.1132337-18-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226152418.1132337-18-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tommaso-Merciai/media-dt-bindings-renesas-rzg2l-csi2-Document-Renesas-RZ-V2H-P-SoC/20250226-233919
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250226152418.1132337-18-tommaso.merciai.xr%40bp.renesas.com
patch subject: [PATCH v3 17/17] media: rzg2l-cru: Add support for RZ/G3E SoC
config: arm-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280652.KV7uk1gP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280652.KV7uk1gP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280652.KV7uk1gP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c: In function 'rzg3e_cru_get_current_slot':
>> drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:677:65: warning: left shift count >= width of type [-Wshift-count-overflow]
     677 |         amnmadrs |= ((dma_addr_t)rzg2l_cru_read(cru, AMnMADRSH) << 32);
         |                                                                 ^~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_runtime.h:11,
                    from drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:16:
>> drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:685:27: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     685 |         dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:685:9: note: in expansion of macro 'dev_err'
     685 |         dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
         |         ^~~~~~~
   drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:685:52: note: format string is defined here
     685 |         dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
         |                                                 ~~~^
         |                                                    |
         |                                                    long long unsigned int
         |                                                 %x


vim +677 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c

   664	
   665	static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
   666	{
   667		dma_addr_t amnmadrs;
   668		unsigned int slot;
   669	
   670		/*
   671		 * When AMnMADRSL is read, AMnMADRSH of the higher-order
   672		 * address also latches the address.
   673		 *
   674		 * AMnMADRSH must be read after AMnMADRSL has been read.
   675		 */
   676		amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
 > 677		amnmadrs |= ((dma_addr_t)rzg2l_cru_read(cru, AMnMADRSH) << 32);
   678	
   679		/* Ensure amnmadrs is within this buffer range */
   680		for (slot = 0; slot < cru->num_buf; slot++)
   681			if (amnmadrs >= cru->buf_addr[slot] &&
   682			    amnmadrs < cru->buf_addr[slot] + cru->format.sizeimage)
   683				return slot;
   684	
 > 685		dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
   686		return -EINVAL;
   687	}
   688	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

