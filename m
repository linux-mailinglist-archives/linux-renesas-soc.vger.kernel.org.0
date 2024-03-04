Return-Path: <linux-renesas-soc+bounces-3452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0692B870443
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 15:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7441281E86
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 14:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F403FE58;
	Mon,  4 Mar 2024 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ZiR2zah/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547023B29A;
	Mon,  4 Mar 2024 14:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709562889; cv=none; b=KxYXOjRdLUBI/Ot2CMW2HRfTxateGNuiBX7tBoAaOlCtIlGxHFL+A1d+bA/phCHZwscpkeQ5TPYQ+hAyFUMsG03Tus/53JvSN+0Bbztz4s/HgRsgmPmv6VmJtslaQuwhc/hUpzlpOovdz2VpaEVmwlNi+U8SxQEE5WNjaMwNvSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709562889; c=relaxed/simple;
	bh=HMpF7T5iHKhsnzi5IxX4Ma4BVYrw0VHarv3ljpCi1bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxoefSB4z7BrjT4IW7xCKkDh466dPr0cWn2mNosz0kvI10Qduu+brCaTBtKgBUQcxJsDmManYeLF6LiD+ZrjtdpnMX99kQ8HM2GOjDqqMlIFbiFh/yrxw+rmai9KjufpZd5qGLZ3ljBD7GWzl3yi4Fdp8WhkWOw2CB5NV1c0EZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=ZiR2zah/; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=usEEQkzRwci7m0iHtPlNYF6Man+QvuNlFoidwTn2uUE=; b=ZiR2zah/Kcfjj/Rvo3fPm8zTTF
	3bOPX75V9ivKRWvkLIwPZArI143ioWhQ2ybmvAhkfZpIL7BjOPNzohEIH/tXE0lWST2vEsLBw4eWK
	rlB1fDp/yXmglnMvlKrNW+tRxYY9ZDI37nIKMJSg3pEGtxY90auKdfm3ZTS6HJeIPXxbevg+pMaKn
	Z6KV3zQdEttEouPHQcvn6WpxhIhO2ZnjX3z15Qeyi2sLq5ThUSKrpjpuBX0idLQe5oAcMUUlVPyg3
	oSBM4Ydy/xja4rprHo+fB4pE76WvJtGMlhDEXGcERODBtMfJRKVDY/z0nu/F3L4SKvLnV2Mn7IsGB
	GC0AvfbA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51706)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rh9Op-0005mX-1j;
	Mon, 04 Mar 2024 14:34:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rh9Oo-0004Z1-P6; Mon, 04 Mar 2024 14:34:38 +0000
Date: Mon, 4 Mar 2024 14:34:38 +0000
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
	linux-renesas-soc@vger.kernel.org,
	Clark Wang <xiaoning.wang@nxp.com>
Subject: Re: [PATCH net-next v5 6/7] net: phy: qcom: at803x: Avoid
 hibernating if MAC requires RX clock
Message-ID: <ZeXb/m1xpL0XOOZI@shell.armlinux.org.uk>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-6-8dac30230050@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301-rxc_bugfix-v5-6-8dac30230050@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Mar 01, 2024 at 04:35:03PM +0100, Romain Gantois wrote:
> From: Russell King <linux@armlinux.org.uk>
> 
> Stmmac controllers connected to an at803x PHY cannot resume properly after
> suspend when WoL is enabled. This happens because the MAC requires an RX
> clock generated by the PHY to initialize its hardware properly. But the RX
> clock is cut when the PHY suspends and isn't brought up until the MAC
> driver resumes the phylink.
> 
> Prevent the at803x PHY driver from going into suspend if the attached MAC
> driver always requires an RX clock signal.
> 
> Reported-by: Clark Wang <xiaoning.wang@nxp.com>
> Link: https://lore.kernel.org/all/20230202081559.3553637-1-xiaoning.wang@nxp.com/
> Signed-off-by: Russell King <linux@armlinux.org.uk>

Wrong wrong wrong wrong wrong.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

