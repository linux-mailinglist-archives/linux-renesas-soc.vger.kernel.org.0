Return-Path: <linux-renesas-soc+bounces-21601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46284B4A332
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 09:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0AE93A54DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 07:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4518E30596E;
	Tue,  9 Sep 2025 07:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PyuPtYAw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115831F63CD;
	Tue,  9 Sep 2025 07:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757402084; cv=none; b=Jb/yYGwtqB/oNIQ18LTgvjYepBcLFdLmRhhgk+rB5HLDhM4bbEyfYY2juNsvgcFtppePELW4VXCehaiO6A6mx30DNcPb7b8m7bsik1JT/Rl88UzAr6AUtphSNWRtHWbpkL3k1dW80tQwCRT+vo5WhtWeK3GRexHFpiIY9XoraAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757402084; c=relaxed/simple;
	bh=9eG5fnaSGiqXsw4eiPV/yIEg2n0/EzNdL6QuKQ4J0G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1pwnwpWSTTsWC7rpYMcaxRkLsYBMZZZiKzUi6csczrlkM5FaBH8tA6vXtZvnPR4nWp6ltRE09M2tp7xYAkefVTpVWJOuUcLqd3LPObswFtbIXtOzZewkBqG7K31fGUkve5tjJz0RcVPgjsUYJIYf6OWnYqURxrqeB1No2GOqvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PyuPtYAw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0328C4CEF4;
	Tue,  9 Sep 2025 07:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757402083;
	bh=9eG5fnaSGiqXsw4eiPV/yIEg2n0/EzNdL6QuKQ4J0G4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PyuPtYAwzhNuKU4CSjN/l5NrjK4jQlq9+Gd6w3rSIGppeuJ0CPZX6VeWqDtHL4h65
	 RPH4fFhyVl7Dh0ieAdIQZbCjO5GMIckLfwxIZrzUVa9RdVZB3IOQkZFrdEbMdvmobG
	 GZOgJb3ByAtgslNt9n6hMSayDcghNkFv9NbfbDyA1ePzq4ZqnsZ4dqiGdQ1tpArVy8
	 PfdTXAuLyA6+jiPGJG6XjNEmrkQpwBiBILIhyYjhVhaTgRTWiUKGI9AJ/H7NbjLHB9
	 MdhAX5tTLBe9r/FHQBAHLTl6KgqZH1IZTlhwM4hgonvAzGZDXtuuK+sBNZjRXi3hiD
	 VS+HP22zctCDA==
Date: Tue, 9 Sep 2025 09:14:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: net: renesas,rzv2h-gbeth:
 Document Renesas RZ/T2H and RZ/N2H SoCs
Message-ID: <20250909-charming-tuscan-mouse-abc1e0@kuoka>
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250908105901.3198975-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908105901.3198975-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Mon, Sep 08, 2025 at 11:58:59AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add device tree binding support for the Gigabit Ethernet MAC (GMAC) IP
> on Renesas RZ/T2H and RZ/N2H SoCs. While these SoCs use the same
> Synopsys DesignWare MAC version 5.20 as RZ/V2H, they are synthesized
> with different hardware configurations.
> 
> Add new compatible strings "renesas,r9a09g077-gbeth" for RZ/T2H and
> "renesas,r9a09g087-gbeth" for RZ/N2H, with the latter using RZ/T2H as
> fallback since they share identical GMAC IP.
> 
> Update the schema to handle hardware differences between SoC variants.
> RZ/T2H requires only 3 clocks compared to 7 on RZ/V2H, supports 8 RX/TX
> queue pairs instead of 4, and needs 2 reset controls with reset-names
> property versus a single unnamed reset. RZ/T2H also has the split header
> feature enabled which is disabled on RZ/V2H.
> 
> Add support for an optional pcs-handle property to connect the GMAC to
> the MIIC PCS converter on RZ/T2H. Use conditional schema validation to
> enforce the correct clock, reset, and interrupt configurations per SoC
> variant.
> 
> Extend the base snps,dwmac.yaml schema to accommodate the increased
> interrupt count, supporting up to 19 interrupts and extending the
> rx-queue and tx-queue interrupt name patterns to cover queues 0-7.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


