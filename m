Return-Path: <linux-renesas-soc+bounces-21401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C463B447DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 305015A1B9F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0240288C2A;
	Thu,  4 Sep 2025 20:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="QD4zl1Vp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2832874F3;
	Thu,  4 Sep 2025 20:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757019445; cv=none; b=kYsyPeVKsYTwjOq9raNNANMEEb6miB6zdJVE04Jc7TRfna1x8w2IQhy1GKoEzoaqoFLfg7i++pWrr96Fr3+2CjuA5BMQr81nk8uxDqzGgVH91djg10bTA4DLPBaD+2pzgy375lcckMPeI12Co8TX3z/wjqaHQcnKMmf5N2SYgGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757019445; c=relaxed/simple;
	bh=f8+iL5gQnDX1s4LI1Xnci4IXy1UZaGhmZ08Thk269BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/9btlYxHO+EzksWqCP8xL0H6bDZaz3pXIRMjQyF5c1CJilHW7S5IJnM0PJ1Ad34IsqYzdVm7tADx43ziPlSLQ+Xz/rPMER/gunJdCnYM8CGMIprlVihkOrayYC0spwQ4OVbpT7AruD+Jt5yF90DcZ5UYWBujA7s1J2un+NEMlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=QD4zl1Vp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nPy5DuiAk2Jhf0wGN+ozpIwohwHzDCdHscEPPNtyJIU=; b=QD4zl1VpDTuQ8WYXHBaS0g/eRP
	RJDue2I1xROI6/7V9oCbfkD5MM10oP44w7Hjm5Rfn+LVOsmUzWLZdcOvomlq3Y8Oo3Wr1dJSc7w9e
	N0WtyxzqdF04au5Hx5A/uQAcTLUDoFNlr6Yp+j1mdImLPf/S3WqW0fdCF/PzPjPw/nxk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuH19-007Guh-LR; Thu, 04 Sep 2025 22:57:15 +0200
Date: Thu, 4 Sep 2025 22:57:15 +0200
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
Subject: Re: [PATCH net-next v2 9/9] net: pcs: rzn1-miic: Add RZ/T2H MIIC
 support
Message-ID: <bb17b506-89ea-4a7e-8c15-ed4f35dae5dd@lunn.ch>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904114204.4148520-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904114204.4148520-10-prabhakar.mahadev-lad.rj@bp.renesas.com>

>  /**
>   * struct miic - MII converter structure
>   * @base: base address of the MII converter
> @@ -203,11 +255,24 @@ static inline void miic_unlock_regs(struct miic *miic)
>  	writel(0x0001, miic->base + MIIC_PRCMD);
>  }
>  
> +static inline void miic_lock_regs(struct miic *miic)

Here as well.

	Andrew

