Return-Path: <linux-renesas-soc+bounces-18601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8928AE27E6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jun 2025 10:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74F8B189C2E9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jun 2025 08:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AEE1A23B6;
	Sat, 21 Jun 2025 08:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="hXhQ/77i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8351459F6;
	Sat, 21 Jun 2025 08:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750492916; cv=none; b=nPvksLUxxgvGn0xo2Byi7SrvH0CBtAFQmRu0X2aLpkctOu/y9knxZP6WurTOYbvmRXurph+vU8W+CRx3UmZomKg1FcsTnQweC3h5Ase1wze1truu5aV2inKgQfYxpcaEiqNWOsxlkN8iokS+IbjXGPRidrpeYt9ZZCcSZcLvu6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750492916; c=relaxed/simple;
	bh=O7kwbBlgpkTAY+8xG44BORrnfHtrt65qBceqCJuFong=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdyeiPhZSCC7NUDvXeRVMDOcKeI8/lGOHcACa72WZIRbq/bq8vx110j+lxmqikvZ4njg0zdyQk47JINiNArEwI/81MFTSFJLA6ihL6SQNEuTW+wisfYDSbJqp06JYR7gXJcZh+snNj/U2wFBLbntyPbpXAt/IL8isW7LUWEMyQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=hXhQ/77i; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=m1bFZYsCLNp2mN1YOVPVqOstkZgIwKgoP+6BvR6MCpc=; b=hXhQ/77im1dtpQfBmy42Bu0qSg
	OW8fQfF5qmq9MN/sEbCv31W3mJm5DZBzpflkNqn/qMdQjwHfFE9/DRJfN3MSWwGOp/uSZBGguiUZF
	RCxE+RFNiQE5xaMYE6OquNYCZQzs6wVIqdJ1HBuSNQV8++DQNEeYw/yVDnosmTqbTBlA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uStAZ-00GZJI-Jx; Sat, 21 Jun 2025 10:01:47 +0200
Date: Sat, 21 Jun 2025 10:01:47 +0200
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
Message-ID: <5c32afad-5e25-4a35-8bdd-b78949c117ce@lunn.ch>
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

> +/**
> + * phy_disconnect_rtnl - disable interrupts, stop state machine, and detach a PHY
> + *		    device
> + * @phydev: target phy_device struct
> + *
> + * This is a wrapper around phy_disconnect that takes the rtnl semaphore.
> + */

Developers are likely to get this wrong, because generally they don't
need to bother with RTNL, the core does it. Could you add some
guidance here when this should be used, and when not.

	Andrew

