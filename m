Return-Path: <linux-renesas-soc+bounces-28164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KZ/JXohjWmozQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 01:40:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F0F128B33
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 01:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDA6C3070B2F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 00:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2075F1AC44D;
	Thu, 12 Feb 2026 00:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HevDezfX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6CB1ACEDE;
	Thu, 12 Feb 2026 00:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770856822; cv=none; b=qg57LJtRhYrAFMiIDMzSgvRYNBa1i72gjIpwrljtOhDq1YbmV09FkrGm7ZM41vZabkAQ6nYsaCXOwqtLUpY3oeyVQloa/5PK+Lo4IJMRaKvAdkTcrabinIcklpKJiJ6EHxkg9V3gC+RqLRBlU0Sb1NxUbNCaB3omEHTujFp6mF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770856822; c=relaxed/simple;
	bh=MDWzgfFw7TyY061Mb3f7pm0wyi8jNlCq2p6ouyUKBaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVwPqrrx7L3/dicTgYZsRI58eRKtwfeCOgYimjX9A708/qCFZvlcFNz21p/cSWJYTkaQjSbwejlZVvatCjTVCPUaPWUC1s8naAlJPw/JHxlVjUG3FLVYJhdnrtIrseYugS4MA+olNKr77JWYADe2H3HCh+YvleSZ6A9EHkc9QN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HevDezfX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770856820; x=1802392820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MDWzgfFw7TyY061Mb3f7pm0wyi8jNlCq2p6ouyUKBaA=;
  b=HevDezfXd+e20jv+X6H1Ln7TfYix7x7CEQvG5Sx/D2gnOJFv1PyekkzK
   1Bs5NEzAOYsB79ig7pcJA5NfzQ2aSWuuYkKntbcmwyiLc2lSvszIJhj31
   TV6ONt6r0mmXAzZSOOi2mXmI8T9qM94ThFVQRnlh95Vvv4Bo5pUizhWbE
   YaaFxxMHn2rYo6vxmBCa8CZSSFRYF3QJXa7rkldvltFTdvvz4/TsYQjSa
   eDagryfRxCK7kBNOt9BYOA3cuOjlz1q5sZQLdrlumSL+8Xp6mggDH3jU+
   /K8M/ZNtg4i+RbymWWZnfMImQlkaQS13NDCI2SmwiD+hsw1DuMzfylXKi
   Q==;
X-CSE-ConnectionGUID: 748nTvVAR1+cRtqtsVm06A==
X-CSE-MsgGUID: WjSguYH/TUyZnCVfetYUZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71922483"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="71922483"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 16:40:01 -0800
X-CSE-ConnectionGUID: gIr2L0W9RHeknHwI3wl2Xw==
X-CSE-MsgGUID: bwKkr+2jQG+S5epIeeNdvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="216568951"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Feb 2026 16:39:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqKkM-00000000qWG-3Asv;
	Thu, 12 Feb 2026 00:39:54 +0000
Date: Thu, 12 Feb 2026 08:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Josua Mayer <josua@solid-run.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-phy@lists.infradead.org,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH next] phy: renesas: rcar-gen3-usb2: Drop local
 devm_mux_state_get_optional()
Message-ID: <202602120804.JhBk63IH-lkp@intel.com>
References: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28164-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: D9F0F128B33
X-Rspamd-Action: no action

Hi Geert,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260209]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/phy-renesas-rcar-gen3-usb2-Drop-local-devm_mux_state_get_optional/20260210-185437
base:   next-20260209
patch link:    https://lore.kernel.org/r/67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert%2Brenesas%40glider.be
patch subject: [PATCH next] phy: renesas: rcar-gen3-usb2: Drop local devm_mux_state_get_optional()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260212/202602120804.JhBk63IH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120804.JhBk63IH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120804.JhBk63IH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/renesas/phy-rcar-gen3-usb2.c: In function 'rcar_gen3_phy_usb2_probe':
>> drivers/phy/renesas/phy-rcar-gen3-usb2.c:1029:21: error: implicit declaration of function 'devm_mux_state_get_optional'; did you mean 'devm_regulator_get_optional'? [-Wimplicit-function-declaration]
    1029 |         mux_state = devm_mux_state_get_optional(dev, NULL);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     devm_regulator_get_optional
>> drivers/phy/renesas/phy-rcar-gen3-usb2.c:1029:19: error: assignment to 'struct mux_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1029 |         mux_state = devm_mux_state_get_optional(dev, NULL);
         |                   ^


vim +1029 drivers/phy/renesas/phy-rcar-gen3-usb2.c

8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22   946  
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   947  static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   948  {
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   949  	struct device *dev = &pdev->dev;
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   950  	struct rcar_gen3_chan *channel;
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   951  	struct phy_provider *provider;
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22   952  	struct mux_state *mux_state;
de76809f60cc93 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-05-07   953  	int ret = 0, i, irq;
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   954  
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   955  	if (!dev->of_node) {
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   956  		dev_err(dev, "This driver needs device tree\n");
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   957  		return -EINVAL;
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   958  	}
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   959  
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   960  	channel = devm_kzalloc(dev, sizeof(*channel), GFP_KERNEL);
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   961  	if (!channel)
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   962  		return -ENOMEM;
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   963  
0b5604affbec02 drivers/phy/renesas/phy-rcar-gen3-usb2.c Chunfeng Yun      2020-11-06   964  	channel->base = devm_platform_ioremap_resource(pdev, 0);
801a69c787812f drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-03-03   965  	if (IS_ERR(channel->base))
801a69c787812f drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-03-03   966  		return PTR_ERR(channel->base);
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   967  
549b6b55b00558 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11   968  	channel->dr_mode = rcar_gen3_get_dr_mode(dev->of_node);
73801b90a38ff1 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2018-09-21   969  	if (channel->dr_mode != USB_DR_MODE_UNKNOWN) {
979b519c7a1bff drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2018-09-21   970  		channel->is_otg_channel = true;
8dde0008ffc9e2 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2018-09-21   971  		channel->uses_otg_pins = !of_property_read_bool(dev->of_node,
8dde0008ffc9e2 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2018-09-21   972  							"renesas,no-otg-pins");
2b38543c8db1c7 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29   973  		channel->extcon = devm_extcon_dev_allocate(dev,
2b38543c8db1c7 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29   974  							rcar_gen3_phy_cable);
2b38543c8db1c7 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29   975  		if (IS_ERR(channel->extcon))
2b38543c8db1c7 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29   976  			return PTR_ERR(channel->extcon);
2b38543c8db1c7 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29   977  
2b38543c8db1c7 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29   978  		ret = devm_extcon_dev_register(dev, channel->extcon);
2b38543c8db1c7 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29   979  		if (ret < 0) {
2b38543c8db1c7 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29   980  			dev_err(dev, "Failed to register extcon\n");
2b38543c8db1c7 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29   981  			return ret;
2b38543c8db1c7 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-04-29   982  		}
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   983  	}
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30   984  
942a7a6bf4c6a8 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-11-19   985  	channel->rstc = devm_reset_control_array_get_optional_shared(dev);
942a7a6bf4c6a8 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-11-19   986  	if (IS_ERR(channel->rstc))
942a7a6bf4c6a8 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-11-19   987  		return PTR_ERR(channel->rstc);
942a7a6bf4c6a8 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-11-19   988  
942a7a6bf4c6a8 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-11-19   989  	ret = reset_control_deassert(channel->rstc);
942a7a6bf4c6a8 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-11-19   990  	if (ret)
942a7a6bf4c6a8 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-11-19   991  		return ret;
942a7a6bf4c6a8 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-11-19   992  
942a7a6bf4c6a8 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-11-19   993  	ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert, channel->rstc);
942a7a6bf4c6a8 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-11-19   994  	if (ret)
942a7a6bf4c6a8 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-11-19   995  		return ret;
942a7a6bf4c6a8 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-11-19   996  
441a681b884347 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14   997  	/*
441a681b884347 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14   998  	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
441a681b884347 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14   999  	 * And then, phy-core will manage runtime pm for this device.
441a681b884347 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  1000  	 */
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1001  	ret = devm_pm_runtime_enable(dev);
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1002  	if (ret)
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1003  		return dev_err_probe(dev, ret, "Failed to enable pm_runtime\n");
b0512a6ec0cd6d drivers/phy/renesas/phy-rcar-gen3-usb2.c Biju Das          2021-07-27  1004  
f75806d26318c0 drivers/phy/renesas/phy-rcar-gen3-usb2.c Lad Prabhakar     2025-08-08  1005  	channel->phy_data = of_device_get_match_data(dev);
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1006  	if (!channel->phy_data)
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1007  		return -EINVAL;
5d8042e95fd471 drivers/phy/renesas/phy-rcar-gen3-usb2.c Biju Das          2019-04-10  1008  
4eae16375357a2 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2024-08-22  1009  	platform_set_drvdata(pdev, channel);
4eae16375357a2 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2024-08-22  1010  	channel->dev = dev;
4eae16375357a2 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2024-08-22  1011  
4eae16375357a2 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2024-08-22  1012  	ret = rcar_gen3_phy_usb2_init_bus(channel);
4eae16375357a2 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2024-08-22  1013  	if (ret)
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1014  		return ret;
4eae16375357a2 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2024-08-22  1015  
55a387ebb9219c drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-05-07  1016  	spin_lock_init(&channel->lock);
549b6b55b00558 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  1017  	for (i = 0; i < NUM_OF_PHYS; i++) {
549b6b55b00558 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  1018  		channel->rphys[i].phy = devm_phy_create(dev, NULL,
f75806d26318c0 drivers/phy/renesas/phy-rcar-gen3-usb2.c Lad Prabhakar     2025-08-08  1019  							channel->phy_data->phy_usb2_ops);
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1020  		if (IS_ERR(channel->rphys[i].phy))
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1021  			return dev_err_probe(dev, PTR_ERR(channel->rphys[i].phy),
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1022  					     "Failed to create USB2 PHY\n");
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1023  
549b6b55b00558 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  1024  		channel->rphys[i].ch = channel;
549b6b55b00558 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  1025  		channel->rphys[i].int_enable_bits = rcar_gen3_int_enable[i];
549b6b55b00558 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  1026  		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
549b6b55b00558 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  1027  	}
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  1028  
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22 @1029  	mux_state = devm_mux_state_get_optional(dev, NULL);
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1030  	if (IS_ERR(mux_state))
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1031  		return PTR_ERR(mux_state);
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1032  	if (mux_state) {
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1033  		ret = mux_state_select(mux_state);
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1034  		if (ret)
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1035  			return dev_err_probe(dev, ret, "Failed to select USB mux\n");
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1036  
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1037  		ret = devm_add_action_or_reset(dev, rcar_gen3_phy_mux_state_deselect,
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1038  					       mux_state);
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1039  		if (ret)
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1040  			return dev_err_probe(dev, ret,
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1041  					     "Failed to register USB mux state deselect\n");
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1042  	}
8bb92fd7a04077 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1043  
b6d7dd157763e0 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1044  	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel) {
b6d7dd157763e0 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1045  		ret = rcar_gen3_phy_usb2_vbus_regulator_register(channel);
b6d7dd157763e0 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1046  		if (ret)
b6d7dd157763e0 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1047  			return ret;
b6d7dd157763e0 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1048  	} else {
6dcfd7c300bf35 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-03-03  1049  		channel->vbus = devm_regulator_get_optional(dev, "vbus");
b6d7dd157763e0 drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1050  	}
6dcfd7c300bf35 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-03-03  1051  	if (IS_ERR(channel->vbus)) {
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1052  		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER)
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1053  			return PTR_ERR(channel->vbus);
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1054  
6dcfd7c300bf35 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-03-03  1055  		channel->vbus = NULL;
6dcfd7c300bf35 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-03-03  1056  	}
6dcfd7c300bf35 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-03-03  1057  
de76809f60cc93 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-05-07  1058  	irq = platform_get_irq_optional(pdev, 0);
de76809f60cc93 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-05-07  1059  	if (irq < 0 && irq != -ENXIO) {
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1060  		return irq;
de76809f60cc93 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-05-07  1061  	} else if (irq > 0) {
de76809f60cc93 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-05-07  1062  		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
de76809f60cc93 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-05-07  1063  		ret = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
de76809f60cc93 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-05-07  1064  				       IRQF_SHARED, dev_name(dev), channel);
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1065  		if (ret < 0)
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1066  			return dev_err_probe(dev, ret,
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1067  					     "Failed to request irq (%d)\n",
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1068  					     irq);
de76809f60cc93 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-05-07  1069  	}
de76809f60cc93 drivers/phy/renesas/phy-rcar-gen3-usb2.c Claudiu Beznea    2025-05-07  1070  
549b6b55b00558 drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2019-04-11  1071  	provider = devm_of_phy_provider_register(dev, rcar_gen3_phy_usb2_xlate);
9bb86777fb71ee drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-11-09  1072  	if (IS_ERR(provider)) {
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1073  		return dev_err_probe(dev, PTR_ERR(provider),
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1074  				     "Failed to register PHY provider\n");
979b519c7a1bff drivers/phy/renesas/phy-rcar-gen3-usb2.c Yoshihiro Shimoda 2018-09-21  1075  	} else if (channel->is_otg_channel) {
9bb86777fb71ee drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-11-09  1076  		ret = device_create_file(dev, &dev_attr_role);
9bb86777fb71ee drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-11-09  1077  		if (ret < 0)
230c817a1601af drivers/phy/renesas/phy-rcar-gen3-usb2.c Tommaso Merciai   2025-12-22  1078  			return ret;
9bb86777fb71ee drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2016-11-09  1079  	}
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  1080  
441a681b884347 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2017-03-14  1081  	return 0;
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  1082  }
f3b5a8d9b50d71 drivers/phy/phy-rcar-gen3-usb2.c         Yoshihiro Shimoda 2015-11-30  1083  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

