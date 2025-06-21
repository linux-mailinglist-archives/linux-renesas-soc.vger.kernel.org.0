Return-Path: <linux-renesas-soc+bounces-18597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19257AE27D1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jun 2025 09:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B24131899EA7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jun 2025 07:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584FC1C8631;
	Sat, 21 Jun 2025 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="UfFDcif/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD921A5B92;
	Sat, 21 Jun 2025 07:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750492150; cv=none; b=jjSsYi0zYJmy6jDsrAR/3mT1DeN/6wnZFfUyLaVV1GqSD48Q8Mckqx1moUkv0z7DxvwYI2vjN9kGuELlf1Y92+PcGUmCkeZWK031kKxURx+NeClfmwMY1PPeTrXriTcSNLZwuLLaEAIVyFTQn8EB1Or7OD6RAT53dEO6ao7yaFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750492150; c=relaxed/simple;
	bh=riedDhamIxPVl4kiJ6Gpc+XKm7V9/2sxZKIPr7BRD5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3Jgsyv7ehR13tggn4wlKjZpZzux1fX17ihl72P+0oQymizSYmajHX6MgQ1F76ppIgchiM9e+dhIviBmTB3QUcaqm5ZcYJawoitib9Vhm/oL0pR44lTKut5wXTBvK97ZGKKD/gxqNxRvq6f4E6DTGl50lxFht60K/4mHoBs7n2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=UfFDcif/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zYaB1DlldGqizxY5vhtPCShgVb/Bxfuf0aPOV2eFYk8=; b=UfFDcif/rzsbiq+2cUiLy3JXbs
	tRIlg0zDrBjJ3UPyAQjv+IBB6AsBgjgqUolPtYvliFRC6SYFgE/4g5g/BxGaoN4RYVGbTfNrwi4p4
	huusiJdjr4uhxau7X9JpLQam7z1KRlIGdd4oOtKe89q6qBe+HeIXNLTXxHAgn1wY2ugQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uSsy9-00GZFX-V4; Sat, 21 Jun 2025 09:48:57 +0200
Date: Sat, 21 Jun 2025 09:48:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mark Einon <mark.einon@gmail.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	=?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
	Michael Chan <michael.chan@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Jian Shen <shenjian15@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Imre Kaloz <kaloz@openwrt.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Steve Glendinning <steve.glendinning@shawell.net>,
	UNGLinuxDriver@microchip.com, Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC] net: Throw ASSERT_RTNL into phy_detach
Message-ID: <44e36ef6-6ee4-4cc5-87a9-aa6441eb0e16@lunn.ch>
References: <20250620143341.2158655-1-kory.maincent@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620143341.2158655-1-kory.maincent@bootlin.com>

On Fri, Jun 20, 2025 at 04:33:27PM +0200, Kory Maincent wrote:
> phy_detach needs the rtnl lock to be held. It should have been added before
> to avoid this massive change among lots of net drivers but there was no
> clear evidence of such needs at that time. This imply a lock change in
> this API. Add phy_detach_rtnl, phy_diconnect_rtnl, phylink_connect_phy_rtnl
> and phylink_fwnode_phy_connect_rtnl helpers to take the lock before calling
> their respective function.

Did you count how many instances don't need to take the lock, because
it is already held? I'm just wondering if the opposite patch would be
smaller, making phy_detach() take RTNL, and add a new function which
does not.

	Andrew

