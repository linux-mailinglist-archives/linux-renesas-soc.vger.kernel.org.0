Return-Path: <linux-renesas-soc+bounces-24860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 508EAC710A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 21:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E27EB34D04A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 20:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F049334C1A;
	Wed, 19 Nov 2025 20:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8IhV5Yz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A95301492;
	Wed, 19 Nov 2025 20:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763584482; cv=none; b=FtVck68Di/B0U20d7CjwgIgrPFasOkV9m0k9wagshtZxMeFjc5KR5eNbS8RGhP594yPjwsi3ahXpdIkA9QYKdwkqGA1FF4P4k0GqLwmUgweVAoUwrqNv4qcKd91ZLZCQUaLq4JXvylvUVdCVBX15033AQpVlnPuZSyICFPxIdGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763584482; c=relaxed/simple;
	bh=qewXocdKo9cLRXB0u7E4iV5rncB/pe/qAOBWdTkGlpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwhF1ORVG7X2XdivT0HRj3ZOaRcs0TY409pS0ZrKTsacEJrcFwT0EDVj+7MqZv245QR7CWMapK/rk2zRI56jJ+lqq4fa+R6urgPTH1qL17YsY5r0in9LPaydX3cCPzl7V3C4Iu04L2+j3dZaeZ7ny5XD5isepl2ZRObz8XUQYEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8IhV5Yz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763584481; x=1795120481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qewXocdKo9cLRXB0u7E4iV5rncB/pe/qAOBWdTkGlpM=;
  b=V8IhV5Yz3TAgQjv/8wB8ep17gegepkRiASEsXc82AhQIKZybcJKLg+Zz
   HaEbZBcyR9m9RL0pfxlwCOke569Bour6Gywoi/lMPZexBfMBzuMrVjhhW
   0LhDJ/xepUnJR/eS/RzhIFXqWgLDf/MHRlu5z5xZ2Fb7DLKacEEBnUrJZ
   XZ/mWcFeSC38MItDApLX4fAO1V9GLnpk6+GbGED+vlwacQQtkIRptb3B5
   62dDl/4PT7nXy+Jz1snYnzvxfPBCWuUcYzuYpOVm44sKwVZg0JMVe2Fxu
   FO42kHw9AV5D/ifYnAKkmuicXqhZCzj/4xbWVoeBWmy8WdktAv8VPzNz7
   Q==;
X-CSE-ConnectionGUID: pWJz0z4BSZyB/hMaVsALxw==
X-CSE-MsgGUID: t0LCxDDlSCeYpKzuVm/uAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65798444"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="65798444"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 12:34:41 -0800
X-CSE-ConnectionGUID: CN8Juv0BSfO7B4DVJs2Nww==
X-CSE-MsgGUID: 243fnx0sSK+yPpa3iYBPZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="195273752"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2025 12:34:37 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLosr-0003IB-36;
	Wed, 19 Nov 2025 20:34:33 +0000
Date: Thu, 20 Nov 2025 04:34:33 +0800
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
Subject: Re: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Message-ID: <202511200435.SrjxVc9k-lkp@intel.com>
References: <20251119022744.1599235-2-chris.brandt@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119022744.1599235-2-chris.brandt@renesas.com>

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dd30a345f284e0d9b1755e3538f8257cf4deb79f]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Brandt/clk-renesas-rzg2l-Remove-DSI-clock-rate-restrictions/20251119-103032
base:   dd30a345f284e0d9b1755e3538f8257cf4deb79f
patch link:    https://lore.kernel.org/r/20251119022744.1599235-2-chris.brandt%40renesas.com
patch subject: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
config: loongarch-randconfig-001-20251119 (https://download.01.org/0day-ci/archive/20251120/202511200435.SrjxVc9k-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200435.SrjxVc9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200435.SrjxVc9k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pmdomain/renesas/rcar-gen4-sysc.c:9:
>> include/linux/clk/renesas.h:44:52: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
      44 | static inline void rzg2l_cpg_dsi_div_set_divider(u8, int target) { }
         |                                                    ^
   1 warning generated.


vim +44 include/linux/clk/renesas.h

    40	
    41	#ifdef CONFIG_CLK_RZG2L
    42	void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target);
    43	#else
  > 44	static inline void rzg2l_cpg_dsi_div_set_divider(u8, int target) { }
    45	#endif
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

