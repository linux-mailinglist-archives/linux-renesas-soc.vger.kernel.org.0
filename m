Return-Path: <linux-renesas-soc+bounces-2027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DAE842686
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 14:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAB2F1C21A8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 13:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613536DD00;
	Tue, 30 Jan 2024 13:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pgWkzaov"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06896D1C0;
	Tue, 30 Jan 2024 13:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706622969; cv=none; b=pj/1M4Zobn7Owh5A+NRxHg40CST/70VOK+YfSSWKTKhj7v2gBalSRxHvmNuipjzwzRsb64Ou/EpT090krPfQVacYVSNhLad8UKDCrP7JAgNu49c/24JtHVJNriKva8ERIdW9ZtVK/HwEB1+dFdhQ2k7CGZnSdK6kR7G/Rj0UOfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706622969; c=relaxed/simple;
	bh=1IsLRCEus1azKhA+gLs/EF4LCkvHtMuRM88rfdHeFas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rszO7wB5f18v93FH/yV2gFavB3X7pQkInwHNAeOLGx+bswm8PAVdm1fHjMLBvVo5TUcJK0pxr51DdEULxT7tSlJdXXxehvDZaEbRQQvq1UFJdIfkCJ9bZwlOMzNbq73qIhS0uCsWUO1X4lDx3IdDaqUW+RVjRc1OBWMs/soVmaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=pgWkzaov; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OEe1feX53x+s5jS3TIU6fDjEFStHRGrbATqAoJoDKRc=; b=pgWkzaovQNKZbtoHeFm9hFW5OU
	g1piZamR3bW3EUtQd//2RaJrwbv59af+yEG3mGAvMkLoxopRUId+MPgAYTdyCRv7ikAbuAEHStSAg
	aJ/SHG6nQlTSf1GBXrtBeXHteCkkws4r7Bx8s+kq0tGKKtFWnpjuYM0/Ku0NLlo3tk/o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rUoac-006Ur0-SX; Tue, 30 Jan 2024 14:55:50 +0100
Date: Tue, 30 Jan 2024 14:55:50 +0100
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
Subject: Re: [PATCH net-next v2 1/7] net: phy: add PHY_F_RXC_ALWAYS_ON to PHY
 dev flags
Message-ID: <78ee61dc-3f1e-4092-b2a3-5831f8caf132@lunn.ch>
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

> @@ -768,6 +768,7 @@ struct phy_device {
>  
>  /* Generic phy_device::dev_flags */
>  #define PHY_F_NO_IRQ		0x80000000
> +#define PHY_F_RXC_ALWAYS_ON	BIT(30)

It is a bit odd mixing 0x numbers and BIT() macros for the same class
of thing. I would use 0x40000000, or convert PHY_F_NO_IRQ to BIT(31)
  
	Andrew

