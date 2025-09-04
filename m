Return-Path: <linux-renesas-soc+bounces-21399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFEDB447CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 602F25A37C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F2828851F;
	Thu,  4 Sep 2025 20:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="zolpVgXI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3F5277035;
	Thu,  4 Sep 2025 20:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757019354; cv=none; b=jGN2bbuJCLse7TgllNvn2OBVddLkOd5dmxCtNon1+RvfycdvQTZ473FjESPwvfqI7zxo4T1VGEZ+dHZPGk6jbyVbJi5+3Gtywgg+xb8PJwVr/Lm5Gx/w1oTnOs8W199wI/9JnNg3QdX/KjSflO71u7Ep43mFw6zpprKddXmUsXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757019354; c=relaxed/simple;
	bh=lOieOaxJl/HJ6EZFMGwfqQSswUxr+WjnasHapA8ngN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBh8m1OWrjTYd7qYsDtD07SDgAMGDaVgelbKNpa+ljRdszNAWIqlO7M1Pssa6d4vPCeJCcJ3u/PcCWj3LS4RAIWmfLiOhOElcYJmJ6ltnPr+pvQxRso+qA/kcGe1iMFLEIFTb8WAhkkv/kBFWl80fy6l52gygBZfXYAoO5VJ+5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=zolpVgXI; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ICwp4WEpf+oje9C4vXRf3yiDN+RkViycSqnmJpw1338=; b=zolpVgXIc9rGkw3MzPrMLI8sBs
	bbt2dCAz58ipYDX+/TOV6lQHt/X/j8Gj3Ac06PsyUJMtXK0kkrzh1PZg5pt5iGKGVqJCeFzLB5zhR
	z9WkSeYjlYmIBtWIJkIBn0Rj5gpVbU93qVAv40k5Of3Pnd5wazSZbHKhowTCYtfzI/rA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuGzd-007Gtc-TD; Thu, 04 Sep 2025 22:55:41 +0200
Date: Thu, 4 Sep 2025 22:55:41 +0200
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
Subject: Re: [PATCH net-next v2 8/9] net: pcs: rzn1-miic: Add per-SoC control
 for MIIC register unlock/lock
Message-ID: <fc103af7-0558-46bf-a668-d4d815ae704e@lunn.ch>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904114204.4148520-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904114204.4148520-9-prabhakar.mahadev-lad.rj@bp.renesas.com>

> -static void miic_reg_writel(struct miic *miic, int offset, u32 value)
> +static inline void miic_unlock_regs(struct miic *miic)
> +{

Please don't use inline in C files. The compiler should decide.

       Andrew

