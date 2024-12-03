Return-Path: <linux-renesas-soc+bounces-10872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 509429E2F49
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 23:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 171FF2813DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 22:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEB7204F7A;
	Tue,  3 Dec 2024 22:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ouhaC3mE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D4A20A5F6;
	Tue,  3 Dec 2024 22:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733266319; cv=none; b=j+Vv/1D4/NR/1uVuM+fEqdYcRxOg0fZuuksQiwxqNuCxWsvmkWnBPNbZb0osih46usAHscw8bdo0XpTvXZy60KNcvUuyYBcjgwd8f4l3Bs+RDOgRNjCwVU5nNfGkopvwxusvy04apq13X4QT+70h76P3izvF1lKECM/7jHtQc7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733266319; c=relaxed/simple;
	bh=sBe6uk5yYjB2IRt5CMiVOj+qwIU4vaGJSAnksnDHwXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLqj3oFJwN/BxjqJdlJctdPDrmh4ixvhhwzNIwI245dlh8SO8AQ6k//fT6FimqwjuBb6TJbh6GTB+e13TgsRbxy/KaKm/TOAmyJoOOX6cvzXHaGUuh/e1zCXu/A8Xn7vc5l049F6flIs7FBcKTlnd0Lw7iRviY+YgFV3Mw6D8jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=ouhaC3mE; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ev3Gbr2iE7d7yRsjXCDKDt4BiErZHh1rq7r5xXLsOgc=; b=ouhaC3mEmmVnsgoqr1kGRqtT4e
	RxjNpZOgYo5PRxkFEbylTvREBHW2p/vyr6+SDar0jeiItm0xD2EWzykH1inWdkjbpEdQXXylJmbOF
	64hx4F6i10iqkb/TInLRse87rqesdyTbhPe1x84P5xtgGsYtjAXy2cQSppRvINcyne0eoyuLfs6mH
	p2QGPiwtDlVK5BpMEWlZtxUIRaypcv3Ta0iPBAO5t82+TWfUtbjxxkz172KGWTIt3FU56/PgBO7k2
	oUArlTqCFoI1X3e5dE1X8U6WF7ZPei7yhGnOX9rH1udmEwGF6Md48RXPzsUXm44pSgjYxxzfWpBeC
	VvXbRI1g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36222)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tIbkD-0002aL-0o;
	Tue, 03 Dec 2024 22:51:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tIbk9-0004vo-1v;
	Tue, 03 Dec 2024 22:51:45 +0000
Date: Tue, 3 Dec 2024 22:51:45 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Kurt Kanzenbach <kurt@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chris Snook <chris.snook@gmail.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Richard Cochran <richardcochran@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:RENESAS ETHERNET SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCHv4 net-next] net: modernize ioremap in probe
Message-ID: <Z0-LgWETqKZe2uyV@shell.armlinux.org.uk>
References: <20241203222750.153272-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203222750.153272-1-rosenp@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Dec 03, 2024 at 02:27:50PM -0800, Rosen Penev wrote:
> resource aquisition and ioremap can be performed in one step.
...
> diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> index 571631a30320..af9291574931 100644
> --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> @@ -7425,21 +7425,16 @@ static int mvpp2_init(struct platform_device *pdev, struct mvpp2 *priv)
>  static int mvpp2_get_sram(struct platform_device *pdev,
>  			  struct mvpp2 *priv)
>  {
> -	struct resource *res;
>  	void __iomem *base;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> -	if (!res) {
> +	base = devm_platform_ioremap_resource(pdev, 2);
> +	if (IS_ERR(base)) {
>  		if (has_acpi_companion(&pdev->dev))
>  			dev_warn(&pdev->dev, "ACPI is too old, Flow control not supported\n");
>  		else
>  			dev_warn(&pdev->dev, "DT is too old, Flow control not supported\n");
> -		return 0;
> -	}
> -
> -	base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(base))
>  		return PTR_ERR(base);
> +	}

This is not equivalent. This means if ioremap() fails inside
devm_platform_ioremap_resource(), we end up printing a message that
blames the firmware, which is wrong.

It also changes a "resource missing, proceed anyway" situation into
a failure situation.

Please drop this change, "cleaning" this up is introducing bugs.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

