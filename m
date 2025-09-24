Return-Path: <linux-renesas-soc+bounces-22343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B30F1B9B9A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 21:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 720302E5919
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 19:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA814258CF2;
	Wed, 24 Sep 2025 19:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9cPG0dM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C0625484D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 19:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758741047; cv=none; b=A3bBCtTlirh3au9JdDLZt8fvmY5odZ2T+peuI7oRmKZKMZaJwOHdv+y0vO2BdeYtZv+5ipKro1/+60NrCdbuxcVKXAyJD9FuzZLmAMWdwwuTgA3Ic0yqmdpSnQgha5Ym7Yude+cA9bX4Cpk5aSBcn5GO7CKaAsV1lq5HO5zuI2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758741047; c=relaxed/simple;
	bh=EG8x2jtizeJG3yiW42c2IdRC9fQ9/O2UIX7L2gZFaC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FX1y6MpOnHWGldWqpWvD4C6c+kBhzMptXVn4yFPkesoOmJPKVihiVugABMUR9JZOLvQAqWgwXQkJAVh8hWMPhNodYSQ3oNDx1E08OTmzO3IqDVK8DQeNSlNENj+tOC75gLuv+C0qEVKNxkHJYH3my6p1yaXBUjCVbGGf2KE9jzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9cPG0dM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758741046; x=1790277046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EG8x2jtizeJG3yiW42c2IdRC9fQ9/O2UIX7L2gZFaC0=;
  b=R9cPG0dMN4AZ1/hzfGnCuWXHyMq7OHO6u+azM/4uqWdXtq4havELCBcs
   DZRZw1BvH7ktkuc3vi2hfGVHwOEEpMNr9Jrq30yxcc8gcmH0MSH4fuB/t
   MGGYUceroFlswlFhcp/U/5Xp/4cciTqGOvi7YPJJhVn2Adr4T6VM4Mutf
   /W5vUmeWAyxD4ktVJd5zlKZGyX5VgPBgLKw11DkRsaDR27EGuerN8+Byr
   O3XSMc7GMwCDzDYXdOH0lDpSwUJva69PjNHsnjnoj+G+VVWgLPd9rsTkU
   LhLtLKzyXsRudRgTUAsrwb6oKWeKLA+vfUMKf0k/JJDQN7fU1syJHD3zH
   w==;
X-CSE-ConnectionGUID: 3pJ2WpcATC+2gwfGW6Ug5w==
X-CSE-MsgGUID: cpaAIeRqQ0yY5rv3k30P6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64691007"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="64691007"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 12:10:46 -0700
X-CSE-ConnectionGUID: tTzMU4ERT2OiRhRmFfQFvw==
X-CSE-MsgGUID: 6M9s9B2dQ6+OqQ4iPDW7lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="176242884"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Sep 2025 12:10:42 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Usx-0004SD-2i;
	Wed, 24 Sep 2025 19:10:39 +0000
Date: Thu, 25 Sep 2025 03:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 04/10] drm/rcar-du: dsi: Clean up VCLKSET register
 macros
Message-ID: <202509250233.QOpzRcHv-lkp@intel.com>
References: <20250924003003.91039-5-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924003003.91039-5-marek.vasut+renesas@mailbox.org>

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-tip/drm-tip next-20250924]
[cannot apply to linus/master v6.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/drm-rcar-du-dsi-Fix-missing-parameter-in-RXSETR_-EN-macros/20250924-083415
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250924003003.91039-5-marek.vasut%2Brenesas%40mailbox.org
patch subject: [PATCH v2 04/10] drm/rcar-du: dsi: Clean up VCLKSET register macros
config: arc-randconfig-002-20250924 (https://download.01.org/0day-ci/archive/20250925/202509250233.QOpzRcHv-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509250233.QOpzRcHv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509250233.QOpzRcHv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c:29:
   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c: In function 'rcar_mipi_dsi_startup':
>> drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h:256:41: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     256 | #define VCLKSET_BPP_24                  FIELD_PREP(VCLKSET_BPP_MASK, 3)
         |                                         ^~~~~~~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c:629:28: note: in expansion of macro 'VCLKSET_BPP_24'
     629 |                 vclkset |= VCLKSET_BPP_24;
         |                            ^~~~~~~~~~~~~~


vim +/FIELD_PREP +256 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h

   246	
   247	#define VCLKSET				0x100c
   248	#define VCLKSET_CKEN			(1 << 16)
   249	#define VCLKSET_COLOR_YCC		(1 << 8) /* 0:RGB 1:YCbCr */
   250	#define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
   251	#define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
   252	#define VCLKSET_BPP_MASK		(3 << 2)
   253	#define VCLKSET_BPP_16			FIELD_PREP(VCLKSET_BPP_MASK, 0)
   254	#define VCLKSET_BPP_18			FIELD_PREP(VCLKSET_BPP_MASK, 1)
   255	#define VCLKSET_BPP_18L			FIELD_PREP(VCLKSET_BPP_MASK, 2)
 > 256	#define VCLKSET_BPP_24			FIELD_PREP(VCLKSET_BPP_MASK, 3)
   257	#define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

