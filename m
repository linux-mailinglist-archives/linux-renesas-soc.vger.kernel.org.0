Return-Path: <linux-renesas-soc+bounces-8360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC18960873
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 13:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF18BB22002
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D66D19FA86;
	Tue, 27 Aug 2024 11:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="XXBB7A6z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C856619EED8;
	Tue, 27 Aug 2024 11:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724757682; cv=none; b=BqDG3ZKZTv9wyKWvG3plRG/R/9rHUrPF0a0jVVhmGalbMpqoWMF+JmhU/8Kqub71hN4TfGEhVZnFh5u2578iVV9w52fADwxe7v2GTSol/y1XuDnbu5pNroUApiMo9OPoru8474JTxxCNE84AG4ZW3c4UdvfmfPX05yqw9btCEBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724757682; c=relaxed/simple;
	bh=jWPWjj/QHeIOYfp+cU6ccjLZvWK9LQKjVbvraTonCe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruyNWVgRu+vxNOcFs/9B9sRPRj/DLr3VNpy2MT3UjIa/eVC3gObFFAWJick0kksT4AhpiX3cHUDIv9LgvCqKLaD8CDrmPG94+9av4Tmmytrq8AvgZoA750Fn8kjXVItVW80AAdum3f4nu55q2+Aum4xVuCLu4Eg6jGqmb8VXRz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=XXBB7A6z; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yDxLqgwteaSZePjmW3+flmjAobg0eTLuPPhZim1kmZA=; b=XXBB7A6zsvYdQLmrtTL5cjKH4+
	o7nFXQ+RcxH/TYawgNqYmAmFxT+yQf9lgKHF+p2IqljkPII8baGMoM0fq8L3C/ktR50tAqmAPlYAB
	Nl5kSLd8yHbacHqh81V0Tm6FkhjmpDnup6plOzzLu0u8Jk6bad5FgHOC8vUOnK0FETXuTrfAd1ehf
	a+I1tCTCMF7wUgW12HbaIM7Dlp0KLBNgpJFw/DnuoRo0/9rxbD4SWNBaP+rLqrfwnG5+EODc6kwR9
	Umoyf3Vv+EI/Ndl74PXdrdJhhFIXcWSzjFfJizANa+NHugoqUJAcwomOKz/Z9ewOzseO7WH6n4p4m
	b/wyneqQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58266)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1siuFn-0006rq-1T;
	Tue, 27 Aug 2024 12:20:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1siuFg-0003OM-1i;
	Tue, 27 Aug 2024 12:20:44 +0100
Date: Tue, 27 Aug 2024 12:20:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yangtao Li <frank.li@vivo.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, ulli.kroll@googlemail.com,
	linus.walleij@linaro.org, marcin.s.wojtas@gmail.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com, hkallweit1@gmail.com,
	u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com,
	justinstitt@google.com, sd@queasysnail.net, horms@kernel.org,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [net-next v3 1/9] net: stmmac: dwmac-intel-plat: Convert to
 devm_clk_get_enabled()
Message-ID: <Zs22jHBb1ztHbXDq@shell.armlinux.org.uk>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-2-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827095712.2672820-2-frank.li@vivo.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Aug 27, 2024 at 03:57:04AM -0600, Yangtao Li wrote:
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> -	if (ret) {
> -		clk_disable_unprepare(dwmac->tx_clk);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	return 0;

Please head off the next "cleanup" patch that someone has to review,
which will be to convert this to:

	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);

When doing cleanups, don't _create_ new opportunities for cleanups.
Always try to write the best replacement code. This reduces the
burden on reviewers - and we need the burden on reviewers to be
minimised because there's relatively few of them compared to the
number of people generating patches.

-- 
*** please note that I probably will only be occasionally responsive
*** for an unknown period of time due to recent eye surgery making
*** reading quite difficult.

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

