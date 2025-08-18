Return-Path: <linux-renesas-soc+bounces-20636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DE9B2AC64
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 17:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 337BB18A7D8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 15:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64E524DD1F;
	Mon, 18 Aug 2025 15:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="hSw5q22E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E381322157F;
	Mon, 18 Aug 2025 15:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755529965; cv=none; b=Be1SVs8+QyTVH8pE53O7mZlKWd2QGCEEN5VC3HwUqVfPrsZFy5iMJZnB2j13fnLREEZgI960sS+MkAg54BPTEVl7m7bVqSi8NxImz/MfNF2LNEEpXD0JEhy1seTkvsC3ybz3+b6YqOMMIiIvrN2uOMQVBwSsN7wez7NvrFAzosE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755529965; c=relaxed/simple;
	bh=dpppRVYb3p9b0pa9UF1vIrJFRi1LBx8rza/g/u2xqgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jx2+Oah09KnKIO0qQtW/VEh3BeBs5xeQcGNaa/pMsUMizQC18eNhGNaZGBLE8UIUiBn4hhGJgGZhWNratW4qLyu+5OYwc5xz8KOgI/gTTKg1BF47Wx9qjcNgzu8+e+8/EbDOh3/zyx50Rpd5vnTjZX9KuvpRUTvF7/hghvZsCZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=hSw5q22E; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=A2uZ6sBwJJhD1qJtIOcJXKXzkTecfvVPk6dVElPUWcM=; b=hSw5q22EVmQNR2VNuyWMV2DitK
	HBd/Ejicstz6N12ahNgvzZPIhz7UFE4C1HFOhrjwy4hqT4EPXcgglQEiHC+t7KxqCnPn2vgFWx1Ea
	xdmTOX9ZsAlcBGGs8YZhnxdp4l5t6WvpdhFX5dVB2asjDZtfX5NJPUyQJfPGVOrnrT88=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uo1X1-0054bw-3r; Mon, 18 Aug 2025 17:12:19 +0200
Date: Mon, 18 Aug 2025 17:12:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@kernel.org
Subject: Re: [PATCH] net: pcs-rzn1-miic: Correct MODCTRL register offset
Message-ID: <d33d201d-7777-4ed6-b50c-7429c54a2533@lunn.ch>
References: <20250818150757.3977908-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818150757.3977908-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Mon, Aug 18, 2025 at 04:07:57PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

Please set the Subject: correctly.
 
> Correct the Mode Control Register (MODCTRL) offset for RZ/N MIIC.
> According to the R-IN Engine and Ethernet Peripherals Manual (Rev.1.30)
> [0], Table 10.1 "Ethernet Accessory Register List", MODCTRL is at offset
> 0x8, not 0x20 as previously defined.

What effect does this have? How would i notice it is broken?

    Andrew

---
pw-bot: cr

