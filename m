Return-Path: <linux-renesas-soc+bounces-1982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA34842064
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 11:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C6F61F2B93B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 10:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFAC66B49;
	Tue, 30 Jan 2024 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="t/xmO76K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5B366B41;
	Tue, 30 Jan 2024 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706608644; cv=none; b=P4KCo4QSI64I4KBO7Tmj1HSSp0UJ1Lke84KHlvgV8LZl3cI0MiLvJjg1dPzA5OxVZ2CugKR5T31D4ngvdXYr19Rkl+c6DrmtiGUt/X/IGVu8irvTV5Dq7o6/vG06Z1jFpx3G2VlQy276s+pvg1AiVbHL1aQzstCW/Tj6kxFyDrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706608644; c=relaxed/simple;
	bh=XS0iLtI0bjfeC2U4ZRrX+gTU1pqLUL43DipeuEk6Jfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFehKaUfMckHubSe6NvKAmb0A6yTekzkK9EnbCOQXhLXUa8k5zXV5BATfIzaLE/oz1q2kl8o+3Twqr4ta+mxq6yuakQk1KkWg0VsW38ABnInlmbfXlXs7izScKpHiPMSTLxlcJMPD2NHESU/6EibyFlpX9UiUYBtTM0+ej2u5Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=t/xmO76K; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=f+2kg4tF09LZoZ7Uh1DZzhspF8XmiCbLSzOdKc2DM8c=; b=t/xmO76K6M7GEcBjPID/JNsHAW
	AZ1MwcrhIB//H4vms9xKoI0yIW1hDty1JK7FzvbF2bmpEHqB149JTMbhejWx/mc8D8CoHvt+Almd9
	0t1DNdVbmlY/Ly5dlAWanUfq/znrt0z6Y95xK9U66MzG1ygCgkbTvUSvsEeBBwh0bUGmTbkW1STaY
	JJ1koxek9bMCnaOt7Gr9qUQHKKydqclNPxPXCWMr5i3OqciM6lcWM2YBs7AZkMOP72TFsq8V9aH7Q
	8OiIsu46FyYkPblDC8xrfd3hpySDn/ByAKIAwYgrYGLs3YGkrljf1vQKZa93v0tVhMw4EUTxaXdZb
	pl73+ymg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35696)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rUkrc-0001ad-2N;
	Tue, 30 Jan 2024 09:57:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rUkrZ-0005PU-LP; Tue, 30 Jan 2024 09:57:05 +0000
Date: Tue, 30 Jan 2024 09:57:05 +0000
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
Subject: Re: [PATCH net-next v2 1/7] net: phy: add PHY_F_RXC_ALWAYS_ON to PHY
 dev flags
Message-ID: <ZbjH8QJO11ymezZG@shell.armlinux.org.uk>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
 <20240130-rxc_bugfix-v2-1-5e6c3168e5f0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130-rxc_bugfix-v2-1-5e6c3168e5f0@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Jan 30, 2024 at 10:28:36AM +0100, Romain Gantois wrote:
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
> [rgantois: commit log]
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

You seem to have combined two of my patches into this one, which touch
two different bits of code. I'm fine with that, but please adjust the
subject line to match the _majority_ of the code that is being touched,
which is phylink (having the prefix net: phylink:), rather than phylib
(having the prefix net: phy:).

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

