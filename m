Return-Path: <linux-renesas-soc+bounces-18587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9576AE1DF0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 16:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 333A93A3DCD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 14:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE382BDC01;
	Fri, 20 Jun 2025 14:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="qAmC/gaW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2491A2BD5B2;
	Fri, 20 Jun 2025 14:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750431404; cv=none; b=facMwWWbYDSN41B0VKukap3UEDK9a2QEqO9KQd2kfyHfeDZyCqY7Vf82lvI70sajGfPK92XUHSXA3zMWqpUM3YXetkNfi2a3QHEVDwqKSl2HaLLHKVLOUfeFuWLsvo03RK8Fg9uPNolhqTOd/opb3PsTUbK8Cs+s7gjztfJXVtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750431404; c=relaxed/simple;
	bh=UkSrktSOg3YT49HTJ0lLuUoG6GbizoE9w6yhT72IHIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQrc4Fe/Et25Rme6vT46P4U9GJxh5zXf8bnrW0hQym+5gD+xq1xWvsZHR9B+lHouS15x0RceyDH/lmAcQRJ8ZUteewW+P+aWckMqglN9p62t0CV0plnTwQihufdKbf8nwiCl0z63chdwDeDC3JQo7QwG5TK3f58UI4d7/hm1Xgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=qAmC/gaW; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O/jZjNo754y8qhJ/PUhLRJEDi9tOJZ9ysoGunWSd/Pg=; b=qAmC/gaW/hDih7Sc0s+DEgDlk3
	/r3ar2kJyp4sZ9xyaM5FYOBtyMMjiTOkPMhW9VzHfEGDEcEeX7Fyazf3yQ8yXkQAa3WyLk5fgRKTK
	Iuw5uEaCJZHgNvgRhCxdh48HXsPF8/7L2eNMsrhugYIZPIOJgGxS/8uBI67rgQUsbt/H2z5UuFUYQ
	gLI56cs17iCLLOTeGkMLesfK7KJVRkDb9FCFmwo3iFQe/qLQVhVjBxdoaSTXYZEaR4ivShNBqudiW
	hSlejcd5R67Ak5sz51LIvq0kLrg5mkwEmXdyQlW1it5qzM6GkFezAvOQakw+IZt27HYKqd6mmixqb
	GMKSycsg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45204)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uSdAG-00015l-0m;
	Fri, 20 Jun 2025 15:56:24 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uSdA0-0000WH-02;
	Fri, 20 Jun 2025 15:56:08 +0100
Date: Fri, 20 Jun 2025 15:56:07 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
	Steve Glendinning <steve.glendinning@shawell.net>,
	UNGLinuxDriver@microchip.com, Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC] net: Throw ASSERT_RTNL into phy_detach
Message-ID: <aFV2h4w3MLtjyfPb@shell.armlinux.org.uk>
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
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Jun 20, 2025 at 04:33:27PM +0200, Kory Maincent wrote:
> phy_detach needs the rtnl lock to be held. It should have been added before
> to avoid this massive change among lots of net drivers but there was no
> clear evidence of such needs at that time. This imply a lock change in
> this API. Add phy_detach_rtnl, phy_diconnect_rtnl, phylink_connect_phy_rtnl
> and phylink_fwnode_phy_connect_rtnl helpers to take the lock before calling
> their respective function.

Please don't increase the number of API functions for phylink for the
long term. I'd prefer all callers of the phylink phy_connect functions
be updated to hold the RTNL, just like phylink_disconnect() requires.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

