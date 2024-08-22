Return-Path: <linux-renesas-soc+bounces-8023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE5095B689
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1190B26537
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 13:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C321C9ECC;
	Thu, 22 Aug 2024 13:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXmJAaH0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0603139D05;
	Thu, 22 Aug 2024 13:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724333146; cv=none; b=deDMNIr1qvArHi1VKRIuvdgeSIINdemBPj8BTwqPL5RwYAcmGbqQJNdNF1rcku+lI1bYul8VpzgHku31XvqNiCAJ/0g9JyexYzEmu6dZwMuOax/f/IGJw2FAqxldw/nOsbTAJZm3CnXuEbPIXUQvQWPovKzgcAfDrmk7l2C1Mt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724333146; c=relaxed/simple;
	bh=G4MWnl1LTsJIZXk3+Kb2HykN4Id8Tei1TL23UkRqcMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MU0VEX8ldmX6pPjt2gBQamUb4K85AQUTMBcEsYZ5J/ifPMoLCQS2HFGY8SMZcqRl27Q71gdPhYIFRPeok4zccHlxs7jqSSqPWQgau0KjxKdK9pjGpF87gggKHZZ5RNlyNg3PaGjvxIkkSUN7vlCcADp9cwRUH3So7WXgHkOwDWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXmJAaH0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCDCC32782;
	Thu, 22 Aug 2024 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724333146;
	bh=G4MWnl1LTsJIZXk3+Kb2HykN4Id8Tei1TL23UkRqcMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XXmJAaH0/b90nuscjjjO+6BYNF1wjBNpFCIHF/X0h/+kG3d/0gQ2f87QTr0pyiBw6
	 KCaHDz3DdvzQKuRf7x/RlxmxU+aZTujW9THvY1MHY46Qv6UlJfAEYarr+yyq7YJvSH
	 IaxiRgorIEr3ur7qVvTa4MwifgedC47oAJr1eVAR+qpcsLd4t1skoo73nOcEqf309+
	 u7hRlzyuluanDngBe6Xengc/LzfXDlWkSZE+gIfn5rchfu/QEULlL2vVAKzeHlalBe
	 uRmpYjaYV+H3Kx4Sp6UO0Tg4a06bOVRx6UAT+GQYiE/kO7RZS580My+pqFjLaFDCAj
	 zYHmjEnEJTnUA==
Date: Thu, 22 Aug 2024 14:25:39 +0100
From: Simon Horman <horms@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, ulli.kroll@googlemail.com,
	linus.walleij@linaro.org, marcin.s.wojtas@gmail.com,
	linux@armlinux.org.uk, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
	hkallweit1@gmail.com, justinstitt@google.com, kees@kernel.org,
	u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com,
	shannon.nelson@amd.com, linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next 2/9] net: stmmac: platform: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Message-ID: <20240822132539.GQ2164@kernel.org>
References: <20240822084733.1599295-1-frank.li@vivo.com>
 <20240822084733.1599295-3-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822084733.1599295-3-frank.li@vivo.com>

On Thu, Aug 22, 2024 at 02:47:26AM -0600, Yangtao Li wrote:
> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Hi Yangtao Li,

I feel that I am missing something obvious here,
but this patch fails to build when applied to net-next.

clang-18 for an x86_64 allmodconfig W=1 build says:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:625:10: error: incompatible pointer types returning 'struct clk *' from a function with result type 'struct plat_stmmacenet_data *' [-Werror,-Wincompatible-pointer-types]
  625 |                 return plat->pclk;
      |                        ^~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:641:10: error: incompatible pointer types returning 'struct reset_control *' from a function with result type 'struct plat_stmmacenet_data *' [-Werror,-Wincompatible-pointer-types]
  641 |                 return plat->stmmac_rst;
      |                        ^~~~~~~~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:646:10: error: incompatible pointer types returning 'struct reset_control *' from a function with result type 'struct plat_stmmacenet_data *' [-Werror,-Wincompatible-pointer-types]
  646 |                 return plat->stmmac_ahb_rst;
      |                        ^~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:437:8: warning: unused variable 'ret' [-Wunused-variable]
  437 |         void *ret;
      |               ^~~


