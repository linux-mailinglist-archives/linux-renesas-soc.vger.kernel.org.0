Return-Path: <linux-renesas-soc+bounces-24552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47118C573EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 12:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A221D4E4ACF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 11:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BA433F392;
	Thu, 13 Nov 2025 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUhFxRVs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C952DAFB9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 11:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763034129; cv=none; b=o8tbAK7APCKWKQP8BG3RWTQVviySsKZfB2wgI7Twt3Em58D+vlEzdKAI7+G87EUHgynqW6zO8Ao5CTk/U+/o8OWKSQgzgX76Aw488NXZyT48PLll/qrqngTnBVqZNZLttExomHgqz4wJvtTKc+hIa/7F1eBrUqI7gZeRtJBfXds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763034129; c=relaxed/simple;
	bh=Df0vS3ajxr6s+0fDZXYWEtjZjQAMfod3849JL3iEcdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qp2xgldXAjvWLA5Ku8jX7MC/muEZr9oYF3yT8FNFfROExFw/ahTKaK+vDOznNUDbKWPKP9rf3aDDVxLvVYvli4KZR4kXuDnZdm4By/ZlrBPOYhTEK0MHlnHx9YoN7JLtjx/YVgCaGV9pNXv7W1fasIG14U5d9ZJk8eDmgdCRfg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUhFxRVs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763034128; x=1794570128;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Df0vS3ajxr6s+0fDZXYWEtjZjQAMfod3849JL3iEcdI=;
  b=BUhFxRVsqQRoaWQsUpwsUYXfwoEDmTgsAIw1of7su+XzF1LtoFCx8SRk
   nSpZGpH3dSyYwjaiXb+N+P5Cps5FG73DH1noCVxHmgzmrJINUhezYqbXv
   UelPFFzNvTm6Df4a9fpWrMRXaG2rc1zK39JCuIUkwiNMSth/durH5GDTk
   zmuzkgWLiOLMbRgvJyCdI4Eu+8DDCLhdjM/m7ygSUrlxczVqWTRM44pnf
   XBQsEw8M7STckTSphx+eHisTEECaaKG91E6WiKZz0bp82loIWt3A8BjUb
   Bid5PVtMAIfej2cqS5HT/m50CQnwsx30ipCDJfsB5vqrtGHe0ucty77DK
   A==;
X-CSE-ConnectionGUID: 8uEf5jYIRdWpirmt4wPQOw==
X-CSE-MsgGUID: aWrAHbadRJa5TRhQvGYOoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75426211"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="75426211"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 03:42:08 -0800
X-CSE-ConnectionGUID: l//c8kZmQC+JHGGsWPb5qw==
X-CSE-MsgGUID: d9IRvUgtQ6yPrXbHTP/axA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189498227"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2025 03:42:06 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJViF-0005Gl-2q;
	Thu, 13 Nov 2025 11:42:03 +0000
Date: Thu, 13 Nov 2025 19:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 24/62]
 drivers/gpu/drm/xe/xe_device.c:997:22: error: use of undeclared identifier
 'id'
Message-ID: <202511131932.czkz3HtQ-lkp@intel.com>
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
config: arm-randconfig-004-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131932.czkz3HtQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131932.czkz3HtQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131932.czkz3HtQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_device.c:997:22: error: use of undeclared identifier 'id'
     997 |         for_each_gt(gt, xe, id)
         |                             ^~
>> drivers/gpu/drm/xe/xe_device.c:997:22: error: use of undeclared identifier 'id'
     997 |         for_each_gt(gt, xe, id)
         |                             ^~
>> drivers/gpu/drm/xe/xe_device.c:997:22: error: use of undeclared identifier 'id'
     997 |         for_each_gt(gt, xe, id)
         |                             ^~
>> drivers/gpu/drm/xe/xe_device.c:997:14: error: use of undeclared identifier 'gt'
     997 |         for_each_gt(gt, xe, id)
         |                     ^~
>> drivers/gpu/drm/xe/xe_device.c:997:22: error: use of undeclared identifier 'id'
     997 |         for_each_gt(gt, xe, id)
         |                             ^~
   drivers/gpu/drm/xe/xe_device.c:998:18: error: use of undeclared identifier 'gt'
     998 |                 xe_gt_shutdown(gt);
         |                                ^~
   6 errors generated.


vim +/id +997 drivers/gpu/drm/xe/xe_device.c

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

