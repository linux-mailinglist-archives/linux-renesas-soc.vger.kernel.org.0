Return-Path: <linux-renesas-soc+bounces-12136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CB2A1154A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 00:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 141E93A2F8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 23:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3963A2139DC;
	Tue, 14 Jan 2025 23:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhlXa55j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0B62139B0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jan 2025 23:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736896898; cv=none; b=ZBghoXa23tvBhcK3DSTsCB/RbUyPZAdhNmhIeyi813caOAqjIlInszFnM0DV0PMI7pHTQa7Ga7IMXmLyvamLsw61fVioymogCs7oew95NJnM4OCDEil7Y6ADPooLRbJvWSNJRcTltsDg53o3d4+iSJnJCL+k3Xev7gt08MSxNaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736896898; c=relaxed/simple;
	bh=rwy7mG8ol2mIq6LMw79tlMtl20ZoFAT/d9CoC4dphJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P606afc+BNc49Ck0SnkGlgcAPvD0d1Y+DLq7t4eIh85UMwsgM/YmXc8O+6ZyqPKQSv1QnfVkpo/STSMkoWWKTX9Sy3yUdPOLpH49Uuzk3dX2MvZSrI/xnLVTgMzKagDrfjCWG68p5C0R7p4CHfqJDyx79VJDREbZRP9qVIMaA4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhlXa55j; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736896897; x=1768432897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rwy7mG8ol2mIq6LMw79tlMtl20ZoFAT/d9CoC4dphJ8=;
  b=PhlXa55jFG0Fw/ZzbXSrV2OFgGzRqbtM1FQIVKBQiAkupnvEJgshuK+n
   yKWjF9RUTYMfOBUkcGmEuRS0grdT1tThgohplZoBZ7TJWKtCxrWSego/d
   B2KqGYq3kLIUCXmZP7e4nG83mnTSoFMHPQiidCitsb66Eb8l3kD7p/bVq
   wkEyGvS3+c9uTI61FvIe/+i81CQHpbgnc00MfZcnU4U1U4hSa7fZaiyEC
   BDmm5qeas7oTBQjRM2uldMP0bTDxC0NyfF9eeeh7JrV86TtYFhGl2ZibB
   cX3e9cNC6bMdx37iTxWM6SHwl2k4FIw9W6w7Q5h7lHGmVkOuB6d8iJ6MM
   Q==;
X-CSE-ConnectionGUID: Jyb8eUwuST6no/6tGTVHRQ==
X-CSE-MsgGUID: vCfQ5cmWQ82/VvrzPmVG0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36911440"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="36911440"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 15:21:37 -0800
X-CSE-ConnectionGUID: 1SeHuPQJRdCTonr4clZIVQ==
X-CSE-MsgGUID: vUwXZZNjQnylrSQKS4NZ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104820980"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jan 2025 15:21:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXqE0-000P9j-0z;
	Tue, 14 Jan 2025 23:21:32 +0000
Date: Wed, 15 Jan 2025 07:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 17/54]
 drivers/gpu/drm/bridge/lontium-lt9611.c:1147:15: error: 'struct lt9611' has
 no member named 'audio_pdev'
Message-ID: <202501150734.lfH7WaHA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   d088502a519fb7834bf6e34cb4e531c1e8113bd1
commit: b49bbb5dbe7654f0d7996206f543d91bbed33569 [17/54] Merge remote-tracking branch 'drm/drm-next' into renesas-drivers
config: i386-buildonly-randconfig-002-20250115 (https://download.01.org/0day-ci/archive/20250115/202501150734.lfH7WaHA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501150734.lfH7WaHA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501150734.lfH7WaHA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/lontium-lt9611.c: In function 'lt9611_audio_init':
>> drivers/gpu/drm/bridge/lontium-lt9611.c:1147:15: error: 'struct lt9611' has no member named 'audio_pdev'
    1147 |         lt9611->audio_pdev =
         |               ^~
   drivers/gpu/drm/bridge/lontium-lt9611.c:1152:38: error: 'struct lt9611' has no member named 'audio_pdev'
    1152 |         return PTR_ERR_OR_ZERO(lt9611->audio_pdev);
         |                                      ^~
   drivers/gpu/drm/bridge/lontium-lt9611.c: In function 'lt9611_audio_exit':
   drivers/gpu/drm/bridge/lontium-lt9611.c:1157:19: error: 'struct lt9611' has no member named 'audio_pdev'
    1157 |         if (lt9611->audio_pdev) {
         |                   ^~
   drivers/gpu/drm/bridge/lontium-lt9611.c:1158:50: error: 'struct lt9611' has no member named 'audio_pdev'
    1158 |                 platform_device_unregister(lt9611->audio_pdev);
         |                                                  ^~
   drivers/gpu/drm/bridge/lontium-lt9611.c:1159:23: error: 'struct lt9611' has no member named 'audio_pdev'
    1159 |                 lt9611->audio_pdev = NULL;
         |                       ^~
   drivers/gpu/drm/bridge/lontium-lt9611.c: At top level:
>> drivers/gpu/drm/bridge/lontium-lt9611.c:1155:13: warning: 'lt9611_audio_exit' defined but not used [-Wunused-function]
    1155 | static void lt9611_audio_exit(struct lt9611 *lt9611)
         |             ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/lontium-lt9611.c:1144:12: warning: 'lt9611_audio_init' defined but not used [-Wunused-function]
    1144 | static int lt9611_audio_init(struct device *dev, struct lt9611 *lt9611)
         |            ^~~~~~~~~~~~~~~~~


vim +1147 drivers/gpu/drm/bridge/lontium-lt9611.c

23278bf54afe180 Vinod Koul 2020-07-23  1143  
23278bf54afe180 Vinod Koul 2020-07-23 @1144  static int lt9611_audio_init(struct device *dev, struct lt9611 *lt9611)
23278bf54afe180 Vinod Koul 2020-07-23  1145  {
23278bf54afe180 Vinod Koul 2020-07-23  1146  	codec_data.data = lt9611;
23278bf54afe180 Vinod Koul 2020-07-23 @1147  	lt9611->audio_pdev =
23278bf54afe180 Vinod Koul 2020-07-23  1148  		platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
23278bf54afe180 Vinod Koul 2020-07-23  1149  					      PLATFORM_DEVID_AUTO,
23278bf54afe180 Vinod Koul 2020-07-23  1150  					      &codec_data, sizeof(codec_data));
23278bf54afe180 Vinod Koul 2020-07-23  1151  
23278bf54afe180 Vinod Koul 2020-07-23  1152  	return PTR_ERR_OR_ZERO(lt9611->audio_pdev);
23278bf54afe180 Vinod Koul 2020-07-23  1153  }
23278bf54afe180 Vinod Koul 2020-07-23  1154  
23278bf54afe180 Vinod Koul 2020-07-23 @1155  static void lt9611_audio_exit(struct lt9611 *lt9611)
23278bf54afe180 Vinod Koul 2020-07-23  1156  {
23278bf54afe180 Vinod Koul 2020-07-23  1157  	if (lt9611->audio_pdev) {
23278bf54afe180 Vinod Koul 2020-07-23 @1158  		platform_device_unregister(lt9611->audio_pdev);
23278bf54afe180 Vinod Koul 2020-07-23 @1159  		lt9611->audio_pdev = NULL;
23278bf54afe180 Vinod Koul 2020-07-23  1160  	}
23278bf54afe180 Vinod Koul 2020-07-23  1161  }
23278bf54afe180 Vinod Koul 2020-07-23  1162  

:::::: The code at line 1147 was first introduced by commit
:::::: 23278bf54afe180967069bdc8c0f1c7a365fc63e drm/bridge: Introduce LT9611 DSI to HDMI bridge

:::::: TO: Vinod Koul <vkoul@kernel.org>
:::::: CC: Sam Ravnborg <sam@ravnborg.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

