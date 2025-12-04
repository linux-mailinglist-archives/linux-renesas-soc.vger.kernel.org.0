Return-Path: <linux-renesas-soc+bounces-25583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8C7CA56F9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 22:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22F78317BEF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 21:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7E83271E1;
	Thu,  4 Dec 2025 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="yIwRMxoV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897F61DE89A;
	Thu,  4 Dec 2025 21:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764882476; cv=none; b=B4u9oOaPI1p6wCuIwCNuhHauDbA4THkDICWWKzQ13GFFLt4VzJPHWxCHdQcTRrrwGh8yenz1fbrLrIqAOwc6xC/vbj23aJhZY0xWE32eUkSMRU0ShMmQqzaso/bPeft3ina3I4vArqa6/zKwy7Jvya3cAr/P6XMBythXNGaJF6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764882476; c=relaxed/simple;
	bh=jRWzTJi/hofgRNNiQ3XLHkfArhMT4VJooPMfOHDPXR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n90r6M4Ggyzjt5qHoNtpfiHVqhWJ/Se1lPqhz0jYfZVjFgsOQA2fR1CAjpxwyFkJfVostQPVs96NNqRfOTLkqaOvhSvWZ0BQ0pcgEPi0Y2AvDe3KYOaOsPiXBnCtrDJaKKNjHbkJCl9AebFu7d8O5EBIn/qnH+Th1HX2KsTXRSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=yIwRMxoV; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=a6ab3C+vcOOOjoE1W4+1V7fEiNZOakz+CjWTZyqtRyM=; b=yIwRMxoVl8q8z4BPLy4NSyjjYp
	FVtz223SYogWWZu0ACkgzz7t7Vh5uJDh9qqMnZxbkryjqjg2g50byddzaR5n7h44+u9d4ErsgkXvF
	6iPjiEmp+/tWuoJqbNoAsYXlMXYcxM8Rt9H04zDSI4Pi9U5Q2eflejogfc0Xr8MSQDXk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vRGY2-00G1Lz-GC; Thu, 04 Dec 2025 22:07:34 +0100
Date: Thu, 4 Dec 2025 22:07:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be,
	biju.das.jz@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux@armlinux.org.uk, magnus.damm@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 0/3]  net: stmmac: add physical port
 identification support
Message-ID: <707fbd5a-5e1b-4034-a1ca-337ec7eca1bd@lunn.ch>
References: <20251204163729.3036329-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204163729.3036329-1-john.madieu.xa@bp.renesas.com>

On Thu, Dec 04, 2025 at 04:37:26PM +0000, John Madieu wrote:
> This series adds physical port identification support to the stmmac driver,
> enabling userspace to query hardware-stable identifiers for network interfaces
> via ndo_get_phys_port_id() and ndo_get_phys_port_name().
> 
> On systems with multiple ethernet controllers sharing the same driver,
> physical port identification provides stable identifiers that persist
> across reboots and are independent of interface enumeration order.
> This is particularly useful for predictable network interface naming
> and for correlating interfaces with physical connectors.
> 
> The implementation follows a two-tier approach:
> 
> 1. Generic stmmac support: Default implementations use the permanent MAC
>    address as port ID and bus_id for port naming. This provides immediate
>    benefit for all stmmac-based platforms.

This information is already available to user space via
sysfs. udev/systemd can use this. How does systemd currently name
these interfaces using its rules?

https://www.freedesktop.org/software/systemd/man/latest/systemd.net-naming-scheme.html

> 2. Glue driver override: Platform drivers can provide custom callbacks
>    for hardware-specific identification schemes. The Renesas GBETH driver
>    implements this to support device tree-based port identification,
>    addressing cases where hardware lacks unique identification registers.

Why is the MAC address not sufficient? What makes Renesas GBETH
special so it needs something different?

	Andrew

