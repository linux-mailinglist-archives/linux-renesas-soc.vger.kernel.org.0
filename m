Return-Path: <linux-renesas-soc+bounces-2143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6442384410E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 14:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EA7B28BB2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 13:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0E780BF5;
	Wed, 31 Jan 2024 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="JtQmV1Z/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0797F80BE9;
	Wed, 31 Jan 2024 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706709206; cv=none; b=KN1mqk2oxeD2zGvnbkEWMBtTOuqARwEtMoEheLK77uoZ261zv3Tn5OZ+PMnPGh/83UiCz8MddZSqfWwAmJxsf52vipfXCO1t9rKkz+dhOkaYjoMEJ4mUwi+HWW49IWLJN6biJdJ45Rq1hCe1wVyMclRn7d6S6nCkVcbxuJxUft4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706709206; c=relaxed/simple;
	bh=OdakpDyQkekX/dsO8xO+R8c5zaOnXAWfbYjW8/0gbAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ua8onvHeCj2+aojs9q4/soSB3zCjmBkBC1Ot4yD98Qm7d6+gE2wMDb6/IeQi3rdoxyxarl3yAq1JVdB6kHTQtijsVk8kGlCfbm1pXBv/pcnpMJNpazCPuH5sakX2BaBxP1CxWqsPWJJ3Lji2UqUMHzQbLqsHIzrmrwbJzmOtID8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=JtQmV1Z/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qcyaXFYC+ivJeWBiO5AvsKPXRmjwKj0eXMoou6vZC8M=; b=JtQmV1Z/FRjfJmPxrI8pyW029C
	NYwbzy+E9g99rrspc1RWRQNVOB6G3r4ZGs1gMhjmSuIMrrrUiYkELTS0Q4g5vQ2iiiumz7ZN41wVv
	gq3PMrRFsiOLGlBhpHYyWHTYRW7VtLfEo6QPhC/7qMNl8+dbdguano5QFQyHho/xe/5E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rVB1Z-006aFh-AA; Wed, 31 Jan 2024 14:53:09 +0100
Date: Wed, 31 Jan 2024 14:53:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Message-ID: <c8602a95-3131-4c15-9ec5-4a5bdcae3ac9@lunn.ch>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
 <20240130-rxc_bugfix-v2-1-5e6c3168e5f0@bootlin.com>
 <78ee61dc-3f1e-4092-b2a3-5831f8caf132@lunn.ch>
 <ZbkBZPm2R9LgYYCI@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbkBZPm2R9LgYYCI@shell.armlinux.org.uk>

On Tue, Jan 30, 2024 at 02:02:12PM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 30, 2024 at 02:55:50PM +0100, Andrew Lunn wrote:
> > > @@ -768,6 +768,7 @@ struct phy_device {
> > >  
> > >  /* Generic phy_device::dev_flags */
> > >  #define PHY_F_NO_IRQ		0x80000000
> > > +#define PHY_F_RXC_ALWAYS_ON	BIT(30)
> > 
> > It is a bit odd mixing 0x numbers and BIT() macros for the same class
> > of thing. I would use 0x40000000, or convert PHY_F_NO_IRQ to BIT(31)
> 
> If I used 0x40000000, there would be review comments suggesting the use
> of BIT(). Can't win!

No, you cannot win, but at least it would be consistent :-)

    Andrew

