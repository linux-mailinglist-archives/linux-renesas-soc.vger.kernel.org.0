Return-Path: <linux-renesas-soc+bounces-13867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B54A4B459
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 20:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50EA7188A2C4
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 19:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902A51EB1A7;
	Sun,  2 Mar 2025 19:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="KQA0P2S0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143D2E630;
	Sun,  2 Mar 2025 19:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740943544; cv=none; b=Vjlg0wSg7lv6K5a0rgQ7V//LGOgFtyEwcplqZRb7pW5azektnB0H6SS5gP3StrEsJ1GXA0SwCkZbX4RxCRi+xvddBWn/mHPsjhnN7//hOltjH61CwK7pSViNZfUMnCBxr/0P2ZJlLb2VkNqbhrK5xH/QE3O0EhHRpguQ3R3kGBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740943544; c=relaxed/simple;
	bh=bcP8aJJxsKa/KWTJKexAOrL1mPPbeI1txF9XNKtQrlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WaIVWGN9LuP1E2SimMhKnMGyVFGyRIXHzmdWUWmOi+P53rOmF0VMgLzft2a+ZpQMjdfNL0VGMMUS6zwrfYss+rEwph1/OaYLTPtjnJaDdkVyRZM34ItGXfZqx5wAZZQU7bqc7x+aHds4ZUSdw5EQQ7+MCfpw59GkxMuU1jlvKCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=KQA0P2S0; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=j0CTaUExgsD2xbAb6YGTebdNGicGrr7+Ayy3shw6hew=; b=KQA0P2S00NDJ/9cRYqEVnarCHj
	UlJKdEJp1pi35Y2CdYsLNRP/vSIDeup2hZPGYtvSinQ0DnMTgJvuAgmiwqJbOvRLvLef9MnyeATAE
	xbLJ4HF6HKz3C1e96wyDx2L3McCeFNjmmNN3bTlW9OpFNG9dXLvzvtzTfT6PqLMKZk7E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1toowK-001aUg-T5; Sun, 02 Mar 2025 20:25:28 +0100
Date: Sun, 2 Mar 2025 20:25:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/3] dt-bindings: net: Document GBETH bindings for
 Renesas RZ/V2H(P) SoC
Message-ID: <c5a75f20-9b61-448e-941b-1106cd06ea04@lunn.ch>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302181808.728734-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: pclk
> +      - const: ptp_ref
> +      - const: tx
> +      - const: rx
> +      - const: tx-180
> +      - const: rx-180

As Russell said in an older thread, tx and tx-180 are effectively the
same clock, but with an inverter added. You should be able to arrange
the clock tree that if you enable tx, it also enables tx-180 as a
parent/sibling relationship.

	       Andrew

