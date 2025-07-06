Return-Path: <linux-renesas-soc+bounces-19282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9B8AFA44C
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Jul 2025 12:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6E3517DF7A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Jul 2025 10:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048051F4706;
	Sun,  6 Jul 2025 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="iU5ZzXcN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887E01E2614;
	Sun,  6 Jul 2025 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751796404; cv=none; b=IntoBrJINQUxwYCk+BGOlfsEYOqUYql0N1vyp/TcyQvPQTz6yv7/olBQek2dIL+ZHilScs4vDMfagRNa5bJ5VGEnuIdfHiro+Pxxwst7JQIccqCGt0D/qdyRVuTEgCTo+N1s9a+Z9NOE/BFZR/iLmVmSlTUCeMz7Ju5zWioNxt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751796404; c=relaxed/simple;
	bh=MveTvm3RII1ANo0ktu6TZtfY7muEUaXzdRlO3voTPW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsLC4xVCJ/jj7A0qPHoW4E11xiylMSyb8Jx6Z4nX65OCAJHgtIKZbu+yqcN6ENlSQkrXA22QWZq1mg98hkALToz4SVJPpQDQXklkvFIMfnM4s17C+lD0wmgevHTxoRglsoJg9oKtjNUHIXzN3i8dhSGCefdfJPBHUetYObh7x5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=iU5ZzXcN; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IWfeIfuL/kwNF8nAD5QuTvp840QjR9/bbiTVVW0dfhk=; b=iU5ZzXcNVcNXf4OCCNIVweOmSz
	hiHERGwNfjqeYzsY1DNxe+aGznYucGnwzjIDO1pnnaDrV70QF49/IGm+Qf9gzrCSwsrC5QxyIkSK9
	WIAezClT4H61s8UjuL9hOpXEUu4TfEWLY3PyQWm+GqneNTlpm/QrkD+3DfYDouJA5Wi1nahWcvgMD
	uLNwbwyT98O/RlkjerGR5DK6Jw9YY3FunMqfpKvzRIajDfqE75N2a7q0LmOq9Aahft7hZjzl2Pxd5
	0wNWmFmQvEZS9C1+pFFsDYWouTGOaIOu3p9EmrJg2TxGb4GMs8WxCfSJ8SAZXKJW7TPBTHBDc9hp2
	hupzmhwg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47384)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uYMGR-0003xa-2A;
	Sun, 06 Jul 2025 11:06:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uYMGL-0007ya-32;
	Sun, 06 Jul 2025 11:06:21 +0100
Date: Sun, 6 Jul 2025 11:06:21 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Message-ID: <aGpKncEeZTifSlA2@shell.armlinux.org.uk>
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
 <aGl9e9Exvq1fVI0s@shell.armlinux.org.uk>
 <TYCPR01MB11332BCE03B3533784711A5BF864DA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY3PR01MB113460004F6A57B3AAD77E86E864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113460004F6A57B3AAD77E86E864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Jul 06, 2025 at 08:45:14AM +0000, Biju Das wrote:
> Hi Russell King,
> 
> FYI, The above testing is done with rootFS mounted on SD card.
> 
> But when I mount rootFS on NFS, after wakeup, I am not able to contact the NFS server.
> 
> The below patch makes it to work[1].
> Not sure, why the original code is failing if the rootFS is mounted on NFS?

It would be good to understand exactly what is going on there.

As stmmac sets mac_managed_pm to true, which is propagated to phylib,
this means the mdiobus suspend/resume will be no-ops, as the MAC driver
needs to do everything necessar to resume the PHY.

Is your PHY losing power over suspend/resume?

Maybe phylink_prepare_resume() needs to call phy_init_hw() as well,
like mdio_bus_phy_resume() does?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

