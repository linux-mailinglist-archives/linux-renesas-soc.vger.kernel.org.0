Return-Path: <linux-renesas-soc+bounces-12135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00378A11509
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 00:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 896FB7A0219
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 23:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977F02144AE;
	Tue, 14 Jan 2025 23:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/07qiZ7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE3F213245
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jan 2025 23:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736896171; cv=none; b=gzKU1nI0wzvJsIgkIoaG9v1WBjQ4/XAdxcfEG27ZhtRUmHPm/KXk9n+EcQJEuiXF7y5bGP/iOew9DVpn+6uwI+TDGGmGDjJMOvH1xydY0XgsVkvuaXaxP1hFOV2+O/Gxyrk/ciBrMIIE0h4cPVvho/6075H3Bx8L3zRWF1jpGaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736896171; c=relaxed/simple;
	bh=3fWxNw4bt47hR8mNtbe5Y9zatankWU55HKXYPlzgsXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Onvi/BILsCAh0TMkG/g+EZBhhqBXLFtqqwAWuIHNdRg+QnfBgYk0SgdF5PxUdQUKMD4qPhBB0KVAkja26Wc25JRPPMZkTCJW3tOVXiYj/9DX7UwJvy4w0QersYhC7pTFnWANPD6hfQRTJJmPJ1gz+c1pf4h06+sCCfKVL2nhuiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/07qiZ7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736896170; x=1768432170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3fWxNw4bt47hR8mNtbe5Y9zatankWU55HKXYPlzgsXc=;
  b=D/07qiZ7QmrvNG7rauaprn8WciTyhd5NuzIHLl9l2oCuhVWDm/hr0qcm
   ap5T4Ms+SHCBrr1xT+xrAwuf4QVt5Yc4nvfrTG1pArUKwRW+XQSNovRc5
   CuFwN+PnIK0W+KdZa/SSbpl+GeZqDyX7nFkdXHdvjcllWf1F65YRy66Q9
   PRcN9evNyoRiAtHQ/rqKSfy+VBckPjkh/dnck1l72vXVwMlDYFwpO1i70
   UnsKKaVQEoYpqnx0trzdbX8cm0J6hg/8W9xVkseJBUOxgRYTklKCQqpkz
   t/ZqUaEHsIPQQzc3giyhrpjJwkznR0ER/D8cdxN9U6WSTZOwaPuzKS3Jp
   w==;
X-CSE-ConnectionGUID: AQuZ+JCcRvOEJ0XGClKRRg==
X-CSE-MsgGUID: DfVhCW3jSFezZ1gBdmbEyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36909615"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="36909615"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 15:09:29 -0800
X-CSE-ConnectionGUID: OlB+Es/bRNyonvkkJ/dJnw==
X-CSE-MsgGUID: INcJ/NicRj+b6u/hq+5QAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105441537"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2025 15:09:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXq2G-000P9H-2W;
	Tue, 14 Jan 2025 23:09:24 +0000
Date: Wed, 15 Jan 2025 07:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 17/54]
 drivers/gpu/drm/bridge/lontium-lt9611.c:1147:10: error: no member named
 'audio_pdev' in 'struct lt9611'
Message-ID: <202501150653.OSZGL4LT-lkp@intel.com>
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
config: hexagon-randconfig-001-20250115 (https://download.01.org/0day-ci/archive/20250115/202501150653.OSZGL4LT-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501150653.OSZGL4LT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501150653.OSZGL4LT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/lontium-lt9611.c:1147:10: error: no member named 'audio_pdev' in 'struct lt9611'
    1147 |         lt9611->audio_pdev =
         |         ~~~~~~  ^
   drivers/gpu/drm/bridge/lontium-lt9611.c:1152:33: error: no member named 'audio_pdev' in 'struct lt9611'
    1152 |         return PTR_ERR_OR_ZERO(lt9611->audio_pdev);
         |                                ~~~~~~  ^
   drivers/gpu/drm/bridge/lontium-lt9611.c:1157:14: error: no member named 'audio_pdev' in 'struct lt9611'
    1157 |         if (lt9611->audio_pdev) {
         |             ~~~~~~  ^
   drivers/gpu/drm/bridge/lontium-lt9611.c:1158:38: error: no member named 'audio_pdev' in 'struct lt9611'
    1158 |                 platform_device_unregister(lt9611->audio_pdev);
         |                                            ~~~~~~  ^
   drivers/gpu/drm/bridge/lontium-lt9611.c:1159:11: error: no member named 'audio_pdev' in 'struct lt9611'
    1159 |                 lt9611->audio_pdev = NULL;
         |                 ~~~~~~  ^
   5 errors generated.


vim +1147 drivers/gpu/drm/bridge/lontium-lt9611.c

23278bf54afe18 Vinod Koul 2020-07-23  1143  
23278bf54afe18 Vinod Koul 2020-07-23  1144  static int lt9611_audio_init(struct device *dev, struct lt9611 *lt9611)
23278bf54afe18 Vinod Koul 2020-07-23  1145  {
23278bf54afe18 Vinod Koul 2020-07-23  1146  	codec_data.data = lt9611;
23278bf54afe18 Vinod Koul 2020-07-23 @1147  	lt9611->audio_pdev =
23278bf54afe18 Vinod Koul 2020-07-23  1148  		platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
23278bf54afe18 Vinod Koul 2020-07-23  1149  					      PLATFORM_DEVID_AUTO,
23278bf54afe18 Vinod Koul 2020-07-23  1150  					      &codec_data, sizeof(codec_data));
23278bf54afe18 Vinod Koul 2020-07-23  1151  
23278bf54afe18 Vinod Koul 2020-07-23  1152  	return PTR_ERR_OR_ZERO(lt9611->audio_pdev);
23278bf54afe18 Vinod Koul 2020-07-23  1153  }
23278bf54afe18 Vinod Koul 2020-07-23  1154  

:::::: The code at line 1147 was first introduced by commit
:::::: 23278bf54afe180967069bdc8c0f1c7a365fc63e drm/bridge: Introduce LT9611 DSI to HDMI bridge

:::::: TO: Vinod Koul <vkoul@kernel.org>
:::::: CC: Sam Ravnborg <sam@ravnborg.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

