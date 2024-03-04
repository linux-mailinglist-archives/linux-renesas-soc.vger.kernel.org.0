Return-Path: <linux-renesas-soc+bounces-3449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB8D870431
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 15:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DBCBB24FBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 14:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE52B2575B;
	Mon,  4 Mar 2024 14:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="EBP7gGmG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B71DFF9;
	Mon,  4 Mar 2024 14:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709562735; cv=none; b=kh+ALFiJME3HDIFvkwijrlHzzZNk5BiqVOqtwX4KZBMuBOo0GdFvUEGwllimpfq44aSF5SOEThD2viJk96buP+9VgaAAK2UKD56Zdaps4rIMU+wBk6h+B/zBj+HqLWbCIgbIEzPVHa2DdbObWt4x+sb0J7Shvp4GRoy6/NPDXjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709562735; c=relaxed/simple;
	bh=flRE26SKXVysZbKC/7zldL96VG+CMjRlD8KVubaCMYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBtvpv2w+wR7lqE8zyB9IrQCtVHaRe8RDmG9SrxrCitw9r+PugM1G1whXw+VXkHIFdpZSERux/4gZvyyyQfIJ5kcGfHHnTgKXTpJcKtcV7JWf8+XnfTHAs7nuuREBf0oiwbescL7CfMMolMZUBCWv53MVD4OcqdMtc731+mMT6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=EBP7gGmG; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M7nvPMRnGQwn3BnuaJW1dh3Kt5tINbWfh5PnvtUaX28=; b=EBP7gGmGPchdnbyVYA8y6FstvG
	pm60B0NbcPa0hTcDs5pzMkFNhVGLXnQB0jiseeNtAWwu6vNdrkVrGFSR0YVkRi4qrmOPifiRFO0r3
	pQjuOnoEDKe/n8Sag0T9MQ5zl/BBaf/VxzrcQH1odHpjsukYyrlYyXjkCLWnliuYg0+9VRDjSSE81
	dr9sDq4vetMxEgz0rwDh4LyTH7YIUdlPcMj/iqFpudwvG7/mMIPYZU+aOs7QcGrIZqEwLGftZuKUn
	hqRoFseN9u96KCN9m2gKKQMjp+mZPhEnn6cC41/YzF0jL++4xvr3wqnCcI8Nl29BRZxjgFwmbruyf
	BFOip6ow==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53470)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rh9MB-0005l3-1L;
	Mon, 04 Mar 2024 14:31:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rh9M7-0004Yg-F4; Mon, 04 Mar 2024 14:31:51 +0000
Date: Mon, 4 Mar 2024 14:31:51 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/7] net: phylink: add PHY_F_RXC_ALWAYS_ON to
 PHY dev flags
Message-ID: <ZeXbV2hIBs7OcEDK@shell.armlinux.org.uk>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-1-8dac30230050@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301-rxc_bugfix-v5-1-8dac30230050@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Mar 01, 2024 at 04:34:58PM +0100, Romain Gantois wrote:
> From: Russell King <linux@armlinux.org.uk>
> 
> Some MAC controllers (e.g. stmmac) require their connected PHY to
> continuously provide a receive clock signal. This can cause issues in two
> cases:
> 
>   1. The clock signal hasn't been started yet by the time the MAC driver
>      initializes its hardware. This can make the initialization fail, as in
>       the case of the rzn1 GMAC1 driver.
>   2. The clock signal is cut during a power saving event. By the time the
>      MAC is brought back up, the clock signal is still not active since
>      phylink_start hasn't been called yet. This brings us back to case 1.
> 
> If a PHY driver reads this flag, it should ensure that the receive clock
> signal is started as soon as possible, and that it isn't brought down when
> the PHY goes into suspend.
> 
> Signed-off-by: Russell King <linux@armlinux.org.uk>

This is not the sign-off I sent you with my patches. At the very least,
it doesn't acknowledge my employer, and also has the wrong email address
that I use for _all_ my kernel attributations. Therefore, I can
definitively say that that you made this up. Please correct it back to
the sign-off in my patches that you derived this combined work from.

Given that sign-offs have legal purpose, what's more concerning is that
care has not been taken on your side to ensure that your handling of it
is correct, and has taken several postings before this cockup has been
noticed. This is not good.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

