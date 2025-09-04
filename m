Return-Path: <linux-renesas-soc+bounces-21391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 269CBB44774
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAF85AA2B63
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EDC283FD3;
	Thu,  4 Sep 2025 20:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="CDsue6/i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8219A280312;
	Thu,  4 Sep 2025 20:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757018282; cv=none; b=WXs9X00lDrzlsWxWHzo3YlV0JggJzvwyC2OCXvnslw35W3m3zGI5RUZXdY+tAKC8lPsHVBqtoYYfdqbYdNKbaPz7nmmPFS9giz+5dCeS+Crp8S+AE8Dldwff+c/yPsiHR9SpV0Xm/p7WxcGZGXuNXv0xCeTadZN7ivqcUrBeGRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757018282; c=relaxed/simple;
	bh=k2Cmj5RS/cx2mtdTfL/BKwuR6GJLM2W5ENe8FQhnHac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eks8620xTnksCHeZAGvDm+FtaTup4GV5weCfDIsG1SZRdjOQ7rCDaLIAYYmRGgjDMPoVYZyTsRuFAYeqQt46r3QncyWMA36xtNYZDbTmYEUwBArcuC7h14Ie4HOo8TxX6m1tOgsrbmRwBH6rOnjP9DW9pZY8ChQzeHFIY3KGlnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=CDsue6/i; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KqUENpvt9mYkFneEJeT2qikd7ht5x+gjOqvedAWAgo0=; b=CDsue6/i8cYsqfA99jHozbEYAN
	Cw/PH3uRKMAAjQDnW1lx6scfemy88WRzPcYI5OCtf0+ivIkhTXBt4sCxtIvlFJdqV10VkYHBwn8Pv
	j+2c88FXKuLUyhUwQf9JLzjd+redYzajPjNreRfgbeh6FpCbXyE9y8JBgocZ34v297As=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuGiL-007Glj-8t; Thu, 04 Sep 2025 22:37:49 +0200
Date: Thu, 4 Sep 2025 22:37:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v2 6/9] net: pcs: rzn1-miic: Make switch mode
 mask SoC-specific
Message-ID: <021e970a-f606-4702-9f0e-b4b0576bc5d6@lunn.ch>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904114204.4148520-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904114204.4148520-7-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Thu, Sep 04, 2025 at 12:42:00PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Move the hardcoded switch mode mask definition into the SoC-specific
> miic_of_data structure. This allows each SoC to define its own mask
> value rather than relying on a single fixed constant. For RZ/N1 the
> mask remains GENMASK(4, 0).
> 
> This is in preparation for adding support for RZ/T2H, where the
> switch mode mask is GENMASK(2, 0).

> -#define MIIC_MODCTRL_SW_MODE		GENMASK(4, 0)

>  	miic_reg_writel(miic, MIIC_MODCTRL,
> -			FIELD_PREP(MIIC_MODCTRL_SW_MODE, cfg_mode));
> +			((cfg_mode << __ffs(sw_mode_mask)) & sw_mode_mask));

_ffs() should return 0 for both GENMASK(2,0) and GENMASK(4, 0). So
this __ffs() is pointless.

You might however want to add a comment that this assumption is being
made.

    Andrew

---
pw-bot: cr

