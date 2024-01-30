Return-Path: <linux-renesas-soc+bounces-2028-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA3842692
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 15:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 997C51C2516D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 14:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FADF6D1C8;
	Tue, 30 Jan 2024 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="gwySDtMv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F65F6D1A8;
	Tue, 30 Jan 2024 14:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706623356; cv=none; b=eXUeJrvW2FRVbErsI3FES1GwCxZMSH+t06E7CwJn1ictwcv09DeNsOuA6Dz6aTGFT0iyIz4FlTbrh+qCw6vbrzB6KytB/R/6EK4gUxCbPhSxk9dSyjmAVzIcYolhtXJfhCb69A6s4tjyU7vnbNBf87EQvvx8bbe3GXqKn4LsU7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706623356; c=relaxed/simple;
	bh=Tlhx9lLGri5Vk8TUJgjTZ43H+PbmPnQke0ODX79ZyC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaFWagSja+LbM9hLNUqTLPumMLw1SrfubOW9unJVEJCCFQhsNawNHLdPTUZqK9vmVUPuKzd/vHXMQ1GLz2vm0UeAg531jg1wZgGgmtOwyAi5LJvd+DnodWdKJndhdrpUbkXosz3iNbg5YBrbJD6rChsW8Y5lGM7MUsvI5DAah8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=gwySDtMv; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B+qqCMS/lknoBXhTRlhfXHK7D4gHB5v8JSzkpcRldtE=; b=gwySDtMvJgokkQQEsZ7zsFDcUD
	iMsZL8ktSjeZ/04CwdzjTluKIpxBhO75Chs9HpAEBk1i37cS11wCx98d6zpOsoYF+oBMLQ40BY2w1
	b9dlQ9S4mgx2TWrAAwmyW4U29XhtvOEBX6C8M4zldexpS2Xa7MXUJN1TSpIQ9na58HqeE19ak+8rl
	hiF6kSf4hrL9CFcEbopeT4GyFY+TFyP5qTFZUHCm8HiKLET5qnHbKLBXhI44itJ9w8Oe5/AgcgAwe
	C1htZBHaqVodvNJZ/6/jEh1dblWhOWJU+JD0UQnjJ/7DFrHQbu9nHKh4XVlmeSpq7WmXevl87woHQ
	pTja/jXw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44332)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rUogr-0001ub-0v;
	Tue, 30 Jan 2024 14:02:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rUogm-0005Yl-RT; Tue, 30 Jan 2024 14:02:12 +0000
Date: Tue, 30 Jan 2024 14:02:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
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
Message-ID: <ZbkBZPm2R9LgYYCI@shell.armlinux.org.uk>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
 <20240130-rxc_bugfix-v2-1-5e6c3168e5f0@bootlin.com>
 <78ee61dc-3f1e-4092-b2a3-5831f8caf132@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78ee61dc-3f1e-4092-b2a3-5831f8caf132@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Jan 30, 2024 at 02:55:50PM +0100, Andrew Lunn wrote:
> > @@ -768,6 +768,7 @@ struct phy_device {
> >  
> >  /* Generic phy_device::dev_flags */
> >  #define PHY_F_NO_IRQ		0x80000000
> > +#define PHY_F_RXC_ALWAYS_ON	BIT(30)
> 
> It is a bit odd mixing 0x numbers and BIT() macros for the same class
> of thing. I would use 0x40000000, or convert PHY_F_NO_IRQ to BIT(31)

If I used 0x40000000, there would be review comments suggesting the use
of BIT(). Can't win!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

