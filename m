Return-Path: <linux-renesas-soc+bounces-3443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2998702F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 14:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6C2528BEF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 13:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446C73E487;
	Mon,  4 Mar 2024 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="uAZM/pFY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB8F3E476;
	Mon,  4 Mar 2024 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559611; cv=none; b=EdFCQBeoJ1WbcfAOuSjRtOLxqMFgOPonQEYswLXuA2sE5nVpok9oZfKS83BX6imN1gFxEmUT3nifLZk/EzEd2r7Kcvmrnvl+bwkaQywfXEFw3YBnWzNNyU6x3DseoWqWD7iTddWYl7oEEHxb7pZA4VXDMHbHFPSvsLqrJ1+u9mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559611; c=relaxed/simple;
	bh=YcWoIA2quvZzPdf1rDtO5pmxDHe7d8t9k4p3OsK8Aqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ib3wfJ1B2Kppt2qnjMgCKuyno00JJc1QYu3s5Z+L7tB8DDBtVS76XdAPjtjj0VJVOh+230xDQdYO2kKvi7+uhfrhOJTHqTgupeSY5/PIe6vyfJJxjMMBNEpYKXNndK+NYnxQ7ym3S+DX2WQQHGGtqLn9Xs+MYmppe7h34UTjAv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=uAZM/pFY; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NfVSZ7fD7A6nvwirdPGvD3RgMz1Yef7wa2vWaX9NVhY=; b=uAZM/pFYUi9v5Xd7KuH0DaAESl
	PGQAEAq/9s+GMn4cEfKQEeA+LN1lLogPJBNzYw9bgj4UdtqufAmQ7tk1ZsqeGnMENNSSBfJuTMbeZ
	6b1F1lAFQX0bGEwv7sjH5AmgiI0ZwZG596RgbA6850pvcAmCEkCbNgCLVdIXs76xKTto=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rh8YE-009KK0-VZ; Mon, 04 Mar 2024 14:40:18 +0100
Date: Mon, 4 Mar 2024 14:40:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>,
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
Subject: Re: [PATCH net-next v5 2/7] net: phylink: add rxc_always_on flag to
 phylink_pcs
Message-ID: <0bdf98ac-de32-4f81-99c9-5981950883f8@lunn.ch>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-2-8dac30230050@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301-rxc_bugfix-v5-2-8dac30230050@bootlin.com>

On Fri, Mar 01, 2024 at 04:34:59PM +0100, Romain Gantois wrote:
> Some MAC drivers (e.g. stmmac) require a continuous receive clock signal to
> be generated by a PCS that is handled by a standalone PCS driver.
> 
> Such a PCS driver does not have access to a PHY device, thus cannot check
> the PHY_F_RXC_ALWAYS_ON flag. They cannot check max_requires_rxc in the
> phylink config either, since it is a private member. Therefore, a new flag
> is needed to signal to the PCS that it should keep the RX clock signal up
> at all times.
> 
> Suggested-by: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

