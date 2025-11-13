Return-Path: <linux-renesas-soc+bounces-24549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F160BC57066
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 11:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06A213BE56B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 10:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8B3336EC8;
	Thu, 13 Nov 2025 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axuy4iW3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A2B33343B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030943; cv=none; b=bqKhz2g/Thnmsq+JbjCM6nWLbql7JJSg4TfJn4GueyP3jwGnkPe7jXukfHDWSz2MAtk+TkRjyHWnrzN1yA7gBMpXeLaFg//TJ9IvGhnkXnPXFPpWzRq5TMXNv2T9gKyjhMWUTqEO+pjKdc5bSBAUlp2k/s6JMNa9O7rcSehXJrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030943; c=relaxed/simple;
	bh=on8Z8Ar/Jq32wVZ2L3QpcWlS6FXUbaMoE9MKXWZH3p4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uTpo3mDhn0lK/NtqsVNDe5CJiS/qhyuXCQhywxQ9gMjP6zWrM6UOC7rOIOdXdsQnTe7fHFzXqQtMuSKfJr9Q6iOmMkbhGr3UjVICdLp+RFAXOOcvZeTIf3lnfguXncZsU+LRyT25X7ivMmauMYSFpvHiatlF5K6hTlhUnnd4vgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axuy4iW3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763030941; x=1794566941;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=on8Z8Ar/Jq32wVZ2L3QpcWlS6FXUbaMoE9MKXWZH3p4=;
  b=axuy4iW3DqCTiCsH1atKsQA4zuxGNe26H60gB/PqWA8OqNmvvMNmlfTo
   XjQXFdu24Xlyq4CsccnJI+Pt1g63Q/PTWoD7nc5BSBsxXnltV6/b1HnJX
   je4sDjdsqQ6nYStwk96tRYWr1rx2qOYx5pJvGBVhuap7MuAcKTTJVQq8h
   N4v11Q/umkD9q8jIRty5qAXWOE17r+5GOXr70N4djksrm1GHUiOfOuC2H
   bp6qrCixu2om+Et/9c5r4y4pXZE2iZ3vydkm6KmE8vOf9Ng7RW2d+9FlR
   Fg5Pux2wMwU7xnoGj7KfnYGjChuU2lZOc586oUGwc1i/XHQNhAtRULK9u
   Q==;
X-CSE-ConnectionGUID: BrY0x5ijTZSQeEj5HwHUfA==
X-CSE-MsgGUID: DqUZcKAxQXGoioQPC+f5cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="90579993"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="90579993"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 02:49:00 -0800
X-CSE-ConnectionGUID: Yzp1EgFzS7GYmdESBSu2/w==
X-CSE-MsgGUID: DgFYA0mPQdqUNpK2LcU1UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189745958"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Nov 2025 02:48:58 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJUsq-0005Bc-1X;
	Thu, 13 Nov 2025 10:48:56 +0000
Date: Thu, 13 Nov 2025 18:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 24/62]
 drivers/gpu/drm/xe/xe_device.c:997:22: error: 'id' undeclared; did you mean
 'fd'?
Message-ID: <202511131819.eF8B67cM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   57dc6a91148b6b50bebe454028ce2488d74422df
commit: 77c2336923d4a7f24d717ae22128e5cb65162650 [24/62] Merge remote-tracking branch 'drm/drm-next' into renesas-drivers
config: arc-randconfig-002-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131819.eF8B67cM-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131819.eF8B67cM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131819.eF8B67cM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_device.c:6:
   drivers/gpu/drm/xe/xe_device.c: In function 'xe_device_shutdown':
>> drivers/gpu/drm/xe/xe_device.c:997:22: error: 'id' undeclared (first use in this function); did you mean 'fd'?
     for_each_gt(gt, xe, id)
                         ^~
   drivers/gpu/drm/xe/xe_device.h:131:8: note: in definition of macro 'for_each_gt'
     for ((id__) = 0; (id__) < (xe__)->info.tile_count * (xe__)->info.max_gt_per_tile; (id__)++) \
           ^~~~
   drivers/gpu/drm/xe/xe_device.c:997:22: note: each undeclared identifier is reported only once for each function it appears in
     for_each_gt(gt, xe, id)
                         ^~
   drivers/gpu/drm/xe/xe_device.h:131:8: note: in definition of macro 'for_each_gt'
     for ((id__) = 0; (id__) < (xe__)->info.tile_count * (xe__)->info.max_gt_per_tile; (id__)++) \
           ^~~~
   In file included from include/linux/kernel.h:36,
                    from include/linux/interrupt.h:6,
                    from include/drm/drm_util.h:35,
                    from drivers/gpu/drm/xe/xe_device.h:9,
                    from drivers/gpu/drm/xe/xe_device.c:6:
>> drivers/gpu/drm/xe/xe_device.c:997:14: error: 'gt' undeclared (first use in this function)
     for_each_gt(gt, xe, id)
                 ^~
   include/linux/util_macros.h:23:38: note: in definition of macro 'for_each_if'
    #define for_each_if(condition) if (!(condition)) {} else
                                         ^~~~~~~~~
   drivers/gpu/drm/xe/xe_device.c:997:2: note: in expansion of macro 'for_each_gt'
     for_each_gt(gt, xe, id)
     ^~~~~~~~~~~


vim +997 drivers/gpu/drm/xe/xe_device.c

dd08ebf6c3525a Matthew Brost     2023-03-30   988  
dd08ebf6c3525a Matthew Brost     2023-03-30   989  void xe_device_shutdown(struct xe_device *xe)
dd08ebf6c3525a Matthew Brost     2023-03-30   990  {
b11a020d914c3b Jouni Högander    2025-10-31   991  	drm_dbg(&xe->drm, "Shutting down device\n");
b11a020d914c3b Jouni Högander    2025-10-31   992  
501d799a47e2b8 Maarten Lankhorst 2024-09-05   993  	xe_display_pm_shutdown(xe);
501d799a47e2b8 Maarten Lankhorst 2024-09-05   994  
501d799a47e2b8 Maarten Lankhorst 2024-09-05   995  	xe_irq_suspend(xe);
501d799a47e2b8 Maarten Lankhorst 2024-09-05   996  
501d799a47e2b8 Maarten Lankhorst 2024-09-05  @997  	for_each_gt(gt, xe, id)
501d799a47e2b8 Maarten Lankhorst 2024-09-05   998  		xe_gt_shutdown(gt);
501d799a47e2b8 Maarten Lankhorst 2024-09-05   999  
501d799a47e2b8 Maarten Lankhorst 2024-09-05  1000  	xe_display_pm_shutdown_late(xe);
b11a020d914c3b Jouni Högander    2025-10-31  1001  
b11a020d914c3b Jouni Högander    2025-10-31  1002  	if (!xe_driver_flr_disabled(xe)) {
501d799a47e2b8 Maarten Lankhorst 2024-09-05  1003  		/* BOOM! */
501d799a47e2b8 Maarten Lankhorst 2024-09-05  1004  		__xe_driver_flr(xe);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  1005  	}
dd08ebf6c3525a Matthew Brost     2023-03-30  1006  }
dd08ebf6c3525a Matthew Brost     2023-03-30  1007  

:::::: The code at line 997 was first introduced by commit
:::::: 501d799a47e2b83b4e41d5306c2266ea5c100a08 drm/xe: Wire up device shutdown handler

:::::: TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
:::::: CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

