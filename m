Return-Path: <linux-renesas-soc+bounces-6277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3739097C4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 12:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02F501C20C3E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 10:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2048F38DD4;
	Sat, 15 Jun 2024 10:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTRepyn8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF9D3BBE5;
	Sat, 15 Jun 2024 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718448929; cv=none; b=p7jNXFXWXvwSJ9NowXOMnAQ98Ceho+eHiO7+ok/Bm6i5uW5mMb7jbZ/iLCwUtuLiAIrI0X/l0djA7qz1LBUS7WbXFYi2TqWpGYrRl9HUSLKKFBGeXIoNp84wOR2sFcuxzQpTWzJY+Zi8MAvdEK85RPziobE/TUv8WePxyoH/NXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718448929; c=relaxed/simple;
	bh=6sc6UeLkrXtEOeC/FTzXDCN8LG7dWL3ulYP0wIu6vZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qc4o+0WD89QXY7TRCfU0gGt9YN6p0nXJw2w0JmY9QjyH4BljOIFn1lhU/5K33u3BdK5kqa7+p6Irvn+ftzmiHnksPd1PUiwcaJdEZX1PoKC6/vRBIEAJ3uup0cSpQzBIkdF/cvozTbFttv55DDFMr767U3XS8Dl6C/5ZZo926v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTRepyn8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718448928; x=1749984928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6sc6UeLkrXtEOeC/FTzXDCN8LG7dWL3ulYP0wIu6vZ0=;
  b=LTRepyn8BUy48yB5/kXH41PhCe+7pWpwgVAiQDcMa3E50iU8iT5jmtG4
   fSw+UDMRnCd3te2OokX4vDweYh2FdJIYG2I3ZlP3OUvFSNUm2JAAwFToH
   Cc8wBwBo7A5GLLJkB1TdtxBBta6q4eWLsb+jMvNjl1c0Si5c1ON1CJ5mX
   mhKbgCnynyBbiImWldSz8nnPbzgTNfMz1LmNmxKTj4802Bbh53GJAtZoa
   3xj26ZExZQoPNh6WdK4HXiotfEO06gOpF7AbJz4p8MuVHf9mMaKatb9mK
   TTUpYFFDWKMebng8H2ZbVIAfpeT5U2xkKgGr78EY2KP1409tBrosmKfvt
   w==;
X-CSE-ConnectionGUID: YZAdNI9YRQ+9Jgc1/h6psw==
X-CSE-MsgGUID: xb8n5JdQTmCh7YQpj+OQSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19124938"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="19124938"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 03:55:27 -0700
X-CSE-ConnectionGUID: EAYn0QGgQDefQP3fhan7aw==
X-CSE-MsgGUID: vPQ339AjSkif/0HvYowWyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="78234068"
Received: from lkp-server01.sh.intel.com (HELO 0bcb674f05cd) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jun 2024 03:55:24 -0700
Received: from kbuild by 0bcb674f05cd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIR45-00006C-2k;
	Sat, 15 Jun 2024 10:55:21 +0000
Date: Sat, 15 Jun 2024 18:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
Message-ID: <202406151811.yEIZ6203-lkp@intel.com>
References: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>

Hi Geert,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[cannot apply to linus/master v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/drm-panic-Fix-uninitialized-drm_scanout_buffer-set_pixel-crash/20240614-032053
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert%2Brenesas%40glider.be
patch subject: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
config: x86_64-randconfig-003-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151811.yEIZ6203-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151811.yEIZ6203-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151811.yEIZ6203-lkp@intel.com/

All errors (new ones prefixed by >>):

>> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
   depmod: ERROR: Found 2 modules in dependency cycles!
   make[3]: *** [scripts/Makefile.modinst:128: depmod] Error 1 shuffle=844234264
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:1842: modules_install] Error 2 shuffle=844234264
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=844234264
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=844234264
   make: Target 'modules_install' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

