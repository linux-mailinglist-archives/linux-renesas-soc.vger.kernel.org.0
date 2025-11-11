Return-Path: <linux-renesas-soc+bounces-24435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 102EAC4B3F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 03:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA22E189134E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 02:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D6C3491E1;
	Tue, 11 Nov 2025 02:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="5S6erjir"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1D6347FC0;
	Tue, 11 Nov 2025 02:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762829425; cv=none; b=tV0+9y9kLeg1RV7xEt1KkwzXXzKW8Tqf65yp8Iq6QBYmY+d6R1Xv3nfr0qG2FTcDNH7nMRQBXs2y8RrPzFqTUcKUitBymAiNHtwHddujIArrDNJSCj5MDm+/uisISCaviAdWJaCvp8RJXgHfkSXYdHS6O61oIRnnUFQ0ReWadwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762829425; c=relaxed/simple;
	bh=Ehkextsnb3H1bI4S73h04f+Wm9Tj3KpfitAGNJx3ZzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGA1aw2UbarelRfL0SqAnyoTigcsF0r2sGBKc6zZv+VALuEDyu7xhb0bdPVmcsuRStztqGQcjoBJUWo3WAPO81Y//kcWZ8xyfL4NoPdur67IgMApHo1G1yu3ukssho/cd5uK1ix4frH15TDoKpkuPvf+1NQbjHFFMKAIRtoTYyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=5S6erjir; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EwS1vYGPntoB14ZBNepjn6wd0Qs2O/QKzmssltxVrc4=; b=5S6erjirSqsiHal63K5sq2xzv/
	m/zJ5YJL77xPIVaNB1mENr7DhEUFA651SzaVNff4vdOv9rzZFvh+x3gZ1wol9kL/KJYHkyx71RX1N
	IeoQgyy9W3a/W2JKaLIA4+uNHvxl7OIEWdb6d2FGBxh/M6ayOMLdzT//HJ4luLpo6yVg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIeSR-00DaBn-5m; Tue, 11 Nov 2025 03:50:11 +0100
Date: Tue, 11 Nov 2025 03:50:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v2 2/3] net: phy: mscc: Consolidate probe
 functions into a common helper
Message-ID: <ec28d950-f7ef-4708-88aa-58c2b9b0b92a@lunn.ch>
References: <20251107201232.282152-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251107201232.282152-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107201232.282152-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

diff(1) has not made this easy...

> +static int vsc85xx_probe_common(struct phy_device *phydev,
> +				const struct vsc85xx_probe_config *cfg,
> +				const u32 *default_led_mode)
> +	int ret;

> +	/* Check rate magic if needed (only for non-package PHYs) */
> +	if (cfg->check_rate_magic) {
> +		ret = vsc85xx_edge_rate_magic_get(phydev);
> +		if (ret < 0)
> +			return ret;
> +	}
>  
>  	vsc8531 = devm_kzalloc(&phydev->mdio.dev, sizeof(*vsc8531), GFP_KERNEL);
>  	if (!vsc8531)
> 		return -ENOMEM;

> +	/* Store rate magic if it was checked */
> +	if (cfg->check_rate_magic)
> +		vsc8531->rate_magic = ret;


I think we end up with something like the above?

I would move the vsc85xx_edge_rate_magic_get() after kzalloc() just to
keep it all together.

    Andrew

---
pw-bot: cr


