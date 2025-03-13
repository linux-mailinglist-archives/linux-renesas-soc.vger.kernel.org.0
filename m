Return-Path: <linux-renesas-soc+bounces-14324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A4CA5E9AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Mar 2025 03:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BE4A18983E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Mar 2025 02:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C77D7081C;
	Thu, 13 Mar 2025 02:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgCkbNU8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED716FC5;
	Thu, 13 Mar 2025 02:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741832158; cv=none; b=beCq7QCJcR/CYKlBDcMoZ0Od2hRFmvaTaE3nXcKnNSUlU88hGivbOOp2L6KVyhxMncF6St8dQ4SN46Azq+RwPTminVzdAh8DOKD6F7iaHKVvWoK9Aa3JfVJGbyuBcz1XRqbwlzZ1GWEp3XIx/D+VDqnsJycdToLJy6xW28c63dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741832158; c=relaxed/simple;
	bh=96yJDyEP9BeK2cVK+9MUvmIHjdk7wR1LKgFfN3+p/fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZG1xr4cXUcwJaTCDlX8eTb7IQU5VBrFpxaB0AJqWviYqcQrlnLFxEcwsvjoPiyu1MyXhW0ORzi15ftKfT1dkUtBMmV4RnksDYZyu4z+56g2WfBDYjrikyyzOUqhJ0dTTmsjviBUPTGODMrKmNVubaF2v1j3XPtMDevw++s9+hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgCkbNU8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741832156; x=1773368156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=96yJDyEP9BeK2cVK+9MUvmIHjdk7wR1LKgFfN3+p/fM=;
  b=lgCkbNU8xDWZ1tFWchRtnulHPQIWUlxY3OD3fD+cDL96EcvUqAPy3J06
   OKcXSPPYZHiK82sO39PZWI0YpSt8gQbOxNzdUwKC090bt11bqpfe3yVQP
   z2uk81FdQbrXjm3zofGQS9yy9kBoUtt5L1aIRugMJh7kVZxRX5vIja0k4
   3ljTNknrgHnNS3odIlBDBop3MCwbbL3PV8W8h5NxwuYslkLryRV2M6qU/
   PcSkPHDSBt+xZmPLDZbu2nASjCOARKr+rM+ScnFTTbEAieMEQXBq5m9+L
   n0yHYRR+OnEV7+ctDhcjeZXmbefb34kc/ZW1dSJHHh7HT0CqYIZo9ji24
   g==;
X-CSE-ConnectionGUID: pAcCZdqySs2h9+9nXDOk1Q==
X-CSE-MsgGUID: oIJGlP3gSPSNEqux3nj3hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43038850"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="43038850"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 19:15:55 -0700
X-CSE-ConnectionGUID: KHahmpZOTNOqvrR+C7Song==
X-CSE-MsgGUID: H65afRTcQ5CspG2G7V7fvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="125887063"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2025 19:15:31 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsY6V-000936-1q;
	Thu, 13 Mar 2025 02:15:25 +0000
Date: Thu, 13 Mar 2025 10:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
	airlied@gmail.com, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
	tomi.valkeinen@ideasonboard.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes
 with drm_mode_size_dumb()
Message-ID: <202503130956.VyNIuYfU-lkp@intel.com>
References: <20250311155120.442633-19-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311155120.442633-19-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250311]
[also build test ERROR on v6.14-rc6]
[cannot apply to drm-exynos/exynos-drm-next rockchip/for-next tegra/for-next drm-xe/drm-xe-next linus/master v6.14-rc6 v6.14-rc5 v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-dumb-buffers-Sanitize-output-on-errors/20250311-235818
base:   next-20250311
patch link:    https://lore.kernel.org/r/20250311155120.442633-19-tzimmermann%40suse.de
patch subject: [PATCH v4 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
config: powerpc64-randconfig-003-20250313 (https://download.01.org/0day-ci/archive/20250313/202503130956.VyNIuYfU-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130956.VyNIuYfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130956.VyNIuYfU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c: In function 'rzg2l_du_dumb_create':
>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c:80:15: error: implicit declaration of function 'drm_mode_size_dumb'; did you mean 'drm_mode_set_name'? [-Wimplicit-function-declaration]
      80 |         ret = drm_mode_size_dumb(dev, args, 16 * args->bpp / 8, 0);
         |               ^~~~~~~~~~~~~~~~~~
         |               drm_mode_set_name


vim +80 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c

    70	
    71	/* -----------------------------------------------------------------------------
    72	 * Frame buffer
    73	 */
    74	
    75	int rzg2l_du_dumb_create(struct drm_file *file, struct drm_device *dev,
    76				 struct drm_mode_create_dumb *args)
    77	{
    78		int ret;
    79	
  > 80		ret = drm_mode_size_dumb(dev, args, 16 * args->bpp / 8, 0);
    81		if (ret)
    82			return ret;
    83	
    84		return drm_gem_dma_dumb_create_internal(file, dev, args);
    85	}
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

