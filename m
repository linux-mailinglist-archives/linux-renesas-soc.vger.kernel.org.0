Return-Path: <linux-renesas-soc+bounces-14312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A46C3A5DDC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 14:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DFE03BB4CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 13:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1047B2459CC;
	Wed, 12 Mar 2025 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecI2m8LU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C550E2405FD;
	Wed, 12 Mar 2025 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741785384; cv=none; b=Y19TpH8eOvNqFy+2Qn2bUYeA1doi4XQGX1APUpP+Q7e+FAufCtbTXSzUNJhy/VawgwrcZBUFpii8DABUGhYI1AReUolHyNPVwqL+rnDnzeYTEP3lJul4jobKOCSfUqHjEp8CEMfBBnX1pSqUyZqSM4jynupuBiH/bPRTkAkLu5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741785384; c=relaxed/simple;
	bh=MhxEnjdAm4dk8eMX5PMe1gYm0TCJYLy21bFBF2bTcK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYTwzIsFx6qhGdirouprNLO5q2aNWbPynZrBto5InPVO2lDpBNjoKlWqy3+ON9Xi8NNrlf05IzahMtJ2MpHVoYpcgqwXFNPWZigIeMpOo48SG3s20it/gK1uHS8rOJdpnb75eQNISZEyGLLQYeuWxV/gWtSzQWsaHykUyEKyW+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecI2m8LU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FF2C4CEE3;
	Wed, 12 Mar 2025 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741785384;
	bh=MhxEnjdAm4dk8eMX5PMe1gYm0TCJYLy21bFBF2bTcK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ecI2m8LUtOeISoz79LApWF1n7b7x2jrl/Y8tbGEWJn//ZD9Bi8KZLLv0rO5OPQ3b6
	 G/4/bLYRahlhrOKlmsyMF7/s1oCwOPGf12/esHve1H0hNE5WxvqWv57gFVn/YtFOjY
	 HPt4r020u/e1vCoZnZdG0ZebBnsAj+wswPiTeVVL52NUCinFPpcK8Q2VaqCx919A2Y
	 HX9AOpoeF9EIjU8Ivn1n+JRwcFm//c/IvHU7N0j9+ENEx4NU1v8xxUzqaChDtjWBJo
	 bLHJT0HN4R4qTr8Hr8pB/OtRtHwEmgiH/L0EBmOmnkSlUdJ2zlASHEg7qfP0w8rgiM
	 BsdmUimU4RRMQ==
Date: Wed, 12 Mar 2025 08:16:23 -0500
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
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: net: dwmac: Increase
 'maxItems' for 'interrupts' and 'interrupt-names'
Message-ID: <20250312131623.GA489176-robh@kernel.org>
References: <20250311221730.40720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250311221730.40720-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311221730.40720-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Mar 11, 2025 at 10:17:28PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Increase the `maxItems` value for the `interrupts` and `interrupt-names`
> properties to 11 to support additional per-channel Tx/Rx completion
> interrupts on the Renesas RZ/V2H(P) SoC, which features the
> `snps,dwmac-5.20` IP.
> 
> Refactor the `interrupt-names` property by replacing repeated `enum`
> entries with a `oneOf` list. Add support for per-channel receive and
> transmit completion interrupts using regex patterns.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Note, for adding constraints to vendor bindings patch [0] has been sent
> out seprately.
> 
> [0] https://lore.kernel.org/all/20250309003301.1152228-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> v2->v3
> - Dropped adding `additionalItems`
> - Moved interrupts description into interrupt-names
> - Replaced enum with a oneOf and added Rx/Tx regex patterns
> 
> v1->v2
> - No change
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 24 ++++++++++++-------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 78b3030dc56d..bacec6e6514b 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -114,19 +114,25 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    items:
> -      - description: Combined signal for various interrupt events
> -      - description: The interrupt to manage the remote wake-up packet detection
> -      - description: The interrupt that occurs when Rx exits the LPI state
> -      - description: The interrupt that occurs when HW safety error triggered
> +    maxItems: 11
>  
>    interrupt-names:
>      minItems: 1
> +    maxItems: 26

Oops! I assume you meant 11. With that fixed:

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

>      items:
> -      - const: macirq
> -      - enum: [eth_wake_irq, eth_lpi, sfty]
> -      - enum: [eth_wake_irq, eth_lpi, sfty]
> -      - enum: [eth_wake_irq, eth_lpi, sfty]
> +      oneOf:
> +        - description: Combined signal for various interrupt events
> +          const: macirq
> +        - description: The interrupt to manage the remote wake-up packet detection
> +          const: eth_wake_irq
> +        - description: The interrupt that occurs when Rx exits the LPI state
> +          const: eth_lpi
> +        - description: The interrupt that occurs when HW safety error triggered
> +          const: sfty
> +        - description: Per channel receive completion interrupt
> +          pattern: '^rx-queue-[0-3]$'
> +        - description: Per channel transmit completion interrupt
> +          pattern: '^tx-queue-[0-3]$'
>  
>    clocks:
>      minItems: 1
> -- 
> 2.43.0
> 

