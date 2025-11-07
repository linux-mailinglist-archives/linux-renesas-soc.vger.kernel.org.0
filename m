Return-Path: <linux-renesas-soc+bounces-24323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0103C3FE48
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 13:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C69D1890F0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 12:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162BA2D063A;
	Fri,  7 Nov 2025 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="NUgdNTea"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FDF2417F0;
	Fri,  7 Nov 2025 12:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762518554; cv=none; b=f671yYKnfrsSK3QAkkXKmur6495D5dcFYWTSNr7342T8RSiykeZ4QfKKYcpuPxFwMMCzIXKQq0rFz1GesShUYM3QL8bkeU+u4ssWZ153fFsFi2v8tsNmmGjVxMPdAnunUI3gHruR9l8DSiUH+fBn815Zi17/7us0fmxpe0MV4XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762518554; c=relaxed/simple;
	bh=18N4H57Jk1epoG9Sh676fcKQoOXWTEOLpm928Dvv4gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNFOfKq/zTBVW4Y1fT//edV6nfe0LkGjalBVm16YOd29mRgkQ/gDU9qdyZRwXGFc0zDqVZ3bhflNGDEUHO1lg3CqUSHgzlPvAfeob9xtEWqOlSaSW4hxm1ED5+GzWnvQl09QgqALHbybXkH7a5cSGJVBCyKjKd/5jVc1G8WnP24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=NUgdNTea; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OS9TgP69ehGD5yxqH90DzusdYBQmnfuojUpTp9rV3No=; b=NUgdNTeaodv4jwVg4hVhaAiaHQ
	vlcyccwtXQVEGVb21aWZWqpiKW3/7l9PPgBGkM6aAqkzybjLgMMZ2nW7khhRqweETKL2hD9dNdtD8
	HsYpzbiMHPaxd5emfuuYtbXuOmDYdc+es62/fvVyBqB4iO57dnNWhFFpG80OFd1ylsbIlYL554j/5
	+COzmUHBw+ZWi5EOlmJVtRt1fYRcJzQva7JAeXh2OWysg5weLO8zfByMpFLoyhccDjWUTnhgn+X5b
	m74wrGtuig7jl6mtZSVdengTJgV0klMvP+0bHPlr7efd/2y+SkewwXMfc0Lp1e6/8fH06v++H46qe
	8KixF+fg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55958)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vHLaJ-000000006Ti-3yNM;
	Fri, 07 Nov 2025 12:28:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vHLaF-000000007Zu-06g1;
	Fri, 07 Nov 2025 12:28:51 +0000
Date: Fri, 7 Nov 2025 12:28:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
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
Subject: Re: [PATCH net-next] net: phy: mscc: Add support for PHY LEDs on
 VSC8541
Message-ID: <aQ3mAhaZQa8_99Ah@shell.armlinux.org.uk>
References: <20251106200309.1096131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ee6a79ae-4857-44e4-b8e9-29cdd80d828f@lunn.ch>
 <CA+V-a8vFEHr+3yR7=JAki3YDe==dAUv3m4PrD-nWhVg8hXgJcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vFEHr+3yR7=JAki3YDe==dAUv3m4PrD-nWhVg8hXgJcQ@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Nov 07, 2025 at 10:34:32AM +0000, Lad, Prabhakar wrote:
> On Thu, Nov 6, 2025 at 8:45 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > > +static int vsc85xx_led_cntl_set_lock_unlock(struct phy_device *phydev,
> > > +                                         u8 led_num,
> > > +                                         u8 mode, bool lock)
> > >  {
> > >       int rc;
> > >       u16 reg_val;
> > >
> > > -     mutex_lock(&phydev->lock);
> > > +     if (lock)
> > > +             mutex_lock(&phydev->lock);
> > >       reg_val = phy_read(phydev, MSCC_PHY_LED_MODE_SEL);
> > >       reg_val &= ~LED_MODE_SEL_MASK(led_num);
> > >       reg_val |= LED_MODE_SEL(led_num, (u16)mode);
> > >       rc = phy_write(phydev, MSCC_PHY_LED_MODE_SEL, reg_val);
> > > -     mutex_unlock(&phydev->lock);
> > > +     if (lock)
> > > +             mutex_unlock(&phydev->lock);

If you used the provided helpers rather than open-coding a read-modify-
write, then you wouldn't even need this lock. Please use phy_modify().

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

