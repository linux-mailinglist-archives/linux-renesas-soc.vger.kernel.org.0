Return-Path: <linux-renesas-soc+bounces-13908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B46A4C542
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 16:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B79303AD287
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 15:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0F7217F33;
	Mon,  3 Mar 2025 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzhPViFF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D90E21480C;
	Mon,  3 Mar 2025 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741015590; cv=none; b=GSOOxG8ayOGDz/oITM2Kre4u49n4Y1mMO7JX2KQ4bBhb+Qlu4AARI8ys0ookiYWDSLx9JQe9sL4f0KxUmwRQxYc3kJzLY9rZIvTbLKgIBNsdqmK+XTsp7tjtC+x461eeLhV6lByWaMtVXt9v6Oflh9HdMI7WCUNcqK/cZp4oZQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741015590; c=relaxed/simple;
	bh=tSKHCFF8IaMoG9a6QMuIpwZEATYqX+7BXt13ljhiCz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzf8djEUbxuNUgYrwZvgvwETVK9x24pgAXdEucJwE+ykFYt3IwCC7Nf6PTQRPN1OxA8x5JEBkyRlSuG7U9/XM1wNQOfBkT0krA2XONsYM2Pzqw7byW2U1ThNn4BmZ76wydtxfPnf9yELQzrolYIWZEQsqAlJ6GNdbwX8TSanZFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzhPViFF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5962C4CED6;
	Mon,  3 Mar 2025 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741015589;
	bh=tSKHCFF8IaMoG9a6QMuIpwZEATYqX+7BXt13ljhiCz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TzhPViFFyxR6pxvOdP5DZfzpAQDBWdXQb558wC4wzC+2aUe+VDma5aPXmOwrGcaKc
	 IwrYzzcFGuJGYrwhPN+1WB9prS6Uck+toxcJOgJbra8oa9YvInaWRAlY68O3KI331S
	 xO5ztrNkGrJRPHRTjAKTYCwOm2kcm3qa7RXXSa38uNW3eVVQJ+Rps5Bak7189ZYNBV
	 GPmpzeo8NxLD37l004N4plCgtPCtWgLUpjtSm6sq8IfHXWR8WoMEZpkF0IZqcPWgNG
	 74k2g/ZNxcQ9w6xICPAvijg43vuO3348pAVgPmyCety74+mq8wnoT5nQ6l0p1Lhanu
	 DK+i+X7D3Dg7Q==
Date: Mon, 3 Mar 2025 09:26:28 -0600
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
Subject: Re: [PATCH 1/3] dt-bindings: net: dwmac: Increase 'maxItems' for
 'interrupts' and 'interrupt-names'
Message-ID: <20250303152628.GA1873145-robh@kernel.org>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302181808.728734-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Sun, Mar 02, 2025 at 06:18:06PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Increase the `maxItems` value for the `interrupts` and `interrupt-names`
> properties to accommodate the Renesas RZ/V2H(P) SoC, which features the
> `snps,dwmac-5.20` IP with 11 interrupts.
> 
> Also add `additionalItems: true` to allow specifying extra interrupts
> beyond the predefined ones. Update the `interrupt-names` property to
> allow specifying extra `interrupt-names`.
> 
> Also refactor the optional `interrupt-names` property by consolidating
> repeated enums into a single enum list.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 91e75eb3f329..85d499bd49b5 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -110,6 +110,8 @@ properties:
>  
>    interrupts:
>      minItems: 1
> +    maxItems: 11
> +    additionalItems: true

This just increased the number if interrupts for anyone that allowed 4 
interrupts. Rockchip and Intel are 2 though it is not clear if they 
support more than 1. So maybe not a new problem, but you are making it 
worse. Any of the ones in the 'select' in this file are affected as 
well.

>      items:
>        - description: Combined signal for various interrupt events
>        - description: The interrupt to manage the remote wake-up packet detection
> @@ -118,11 +120,11 @@ properties:
>  
>    interrupt-names:
>      minItems: 1
> +    maxItems: 11
> +    additionalItems: true
>      items:
>        - const: macirq
>        - enum: [eth_wake_irq, eth_lpi, sfty]
> -      - enum: [eth_wake_irq, eth_lpi, sfty]
> -      - enum: [eth_wake_irq, eth_lpi, sfty]
>  
>    clocks:
>      minItems: 1
> -- 
> 2.43.0
> 

