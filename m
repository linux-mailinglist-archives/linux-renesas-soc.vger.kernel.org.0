Return-Path: <linux-renesas-soc+bounces-21156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6866B3F974
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 11:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66E0A48172A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 09:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98822EA492;
	Tue,  2 Sep 2025 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9EC+SXL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A216D26FA46;
	Tue,  2 Sep 2025 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756803668; cv=none; b=r8OQlT7j49mbuznTz3MDhOpEltg+D5iiBsg6AF5JlnfNS8r60/9r+NI0lzQjMHK93mq5edceuxy5RL16FNt9fPJYiyMlNclqdFv+Z5KV+Za26vu/cJ2hL8uRlM5y2Ee/+w5Z2A8w1qNbqTv2jdy6rzBZeJx8+LghJzLRI9APVVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756803668; c=relaxed/simple;
	bh=mN5alaCamYFIsOV5DNqhwizhf2rPGa+oUFPBFZxEPYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpAmAyFPUWBQztjwJuOt0ujI0U8xQXQWubMR2NKfJYM0K98Xt5btEkt80qwDxcI1WIU+gsrvMJFkSgnWTeD6INMOK2U513yn+2F+gsmN/+9zKmX/ONOAxq+kKBDnbZBc920Hniw4+ouEmfjfmTDVo+6dvvHx43GaXvXCWy3D3Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9EC+SXL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B9BC4CEED;
	Tue,  2 Sep 2025 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756803668;
	bh=mN5alaCamYFIsOV5DNqhwizhf2rPGa+oUFPBFZxEPYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9EC+SXLly+Vx+79G57ZJem3FcxzZXJyPpX9DupmeAU5doHELqySn32k5H3OGMJx2
	 qGqCX3b9GHQ8otVWjup3BhFcGsFfqwMjZpIHR8D5WDxmC6NJtZobScVVGnuN38Ggst
	 tpd9w9eJpUyEVaIJvvwnn01I9DzIZ6LysK3vzDUq6wEkVQgE+pXXCXLWKbEQigzmXt
	 cmycjbwyUnnDQNiHBrvB1wRlI9V+zCWL6EViyWV7QmY8bHsTcHZEBS5SzpC2H6Ar+r
	 UeEoTrwjt9igTHLYLNMdNiM00GNms+D4swv38K1yF5952+TiIaU9kNBWSYhkcipmp5
	 1FAVoLcyHaqVA==
Date: Tue, 2 Sep 2025 11:01:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next 2/4] dt-bindings: net: renesas,rzv2h-gbeth:
 Document Renesas RZ/T2H and RZ/N2H SoCs
Message-ID: <20250902-gainful-meerkat-of-prestige-dd4952@kuoka>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Sep 02, 2025 at 01:13:00AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the Ethernet MAC (GMAC) IP present on the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. The GMAC IP on RZ/N2H is
> identical to that found on the RZ/T2H SoC.
> 
> While the RZ/V2H(P), RZ/T2H, and RZ/N2H SoCs all integrate the Synopsys
> DesignWare MAC (version 5.20), the hardware is synthesized with different
> options compared to the RZ/V2H(P):
>   - RZ/T2H requires only 3 clocks instead of 7
>   - RZ/T2H supports 8 RX/TX queue pairs instead of 4
>   - RZ/T2H needs 2 reset controls with reset-names property, vs. a single
>     unnamed reset
>   - RZ/T2H has the split header feature enabled, while it is disabled on
>     RZ/V2H(P)
> 
> To accommodate these differences, introduce a new generic compatible
> string `renesas,rzt2h-gbeth`, used as a fallback for both RZ/T2H and
> RZ/N2H SoCs.
> 
> The DT schema is updated to validate the clocks, resets, reset-names,
> interrupts, and interrupt-names properties accordingly. Also extend
> `snps,dwmac.yaml` with the new `renesas,rzt2h-gbeth` compatible.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/net/renesas,rzv2h-gbeth.yaml     | 177 ++++++++++++++----
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 138 insertions(+), 40 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> index 23e39bcea96b..e01763389164 100644
> --- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> @@ -17,63 +17,112 @@ select:
>            - renesas,r9a09g047-gbeth
>            - renesas,r9a09g056-gbeth
>            - renesas,r9a09g057-gbeth
> +          - renesas,r9a09g077-gbeth
> +          - renesas,r9a09g087-gbeth
>            - renesas,rzv2h-gbeth
>    required:
>      - compatible
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - renesas,r9a09g047-gbeth # RZ/G3E
> -          - renesas,r9a09g056-gbeth # RZ/V2N
> -          - renesas,r9a09g057-gbeth # RZ/V2H(P)
> -      - const: renesas,rzv2h-gbeth
> -      - const: snps,dwmac-5.20
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a09g047-gbeth # RZ/G3E
> +              - renesas,r9a09g056-gbeth # RZ/V2N
> +              - renesas,r9a09g057-gbeth # RZ/V2H(P)
> +          - const: renesas,rzv2h-gbeth
> +          - const: snps,dwmac-5.20
> +
> +      - items:
> +          - enum:
> +              - renesas,r9a09g077-gbeth # RZ/T2H
> +              - renesas,r9a09g087-gbeth # RZ/N2H
> +          - const: renesas,rzt2h-gbeth
> +          - const: snps,dwmac-5.20
>  
>    reg:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: CSR clock
> -      - description: AXI system clock
> -      - description: PTP clock
> -      - description: TX clock
> -      - description: RX clock
> -      - description: TX clock phase-shifted by 180 degrees
> -      - description: RX clock phase-shifted by 180 degrees
> +    oneOf:
> +      - items:
> +          - description: CSR clock
> +          - description: AXI system clock
> +          - description: PTP clock
> +          - description: TX clock
> +          - description: RX clock
> +          - description: TX clock phase-shifted by 180 degrees
> +          - description: RX clock phase-shifted by 180 degrees
> +

Drop blank line

> +      - items:
> +          - description: CSR clock
> +          - description: AXI system clock
> +          - description: TX clock
>  
>    clock-names:
> -    items:
> -      - const: stmmaceth
> -      - const: pclk
> -      - const: ptp_ref
> -      - const: tx
> -      - const: rx
> -      - const: tx-180
> -      - const: rx-180
> -
> -  interrupts:
> -    minItems: 11
> +    oneOf:
> +      - items:
> +          - const: stmmaceth
> +          - const: pclk
> +          - const: ptp_ref
> +          - const: tx
> +          - const: rx
> +          - const: tx-180
> +          - const: rx-180
> +

Drop blank line

> +      - items:
> +          - const: stmmaceth
> +          - const: pclk
> +          - const: tx
> +
>  

Just one blank line

>    interrupt-names:
> -    items:
> -      - const: macirq
> -      - const: eth_wake_irq
> -      - const: eth_lpi
> -      - const: rx-queue-0
> -      - const: rx-queue-1
> -      - const: rx-queue-2
> -      - const: rx-queue-3
> -      - const: tx-queue-0
> -      - const: tx-queue-1
> -      - const: tx-queue-2
> -      - const: tx-queue-3
> +    oneOf:
> +      - items:
> +          - const: macirq
> +          - const: eth_wake_irq
> +          - const: eth_lpi
> +          - const: rx-queue-0
> +          - const: rx-queue-1
> +          - const: rx-queue-2
> +          - const: rx-queue-3
> +          - const: tx-queue-0
> +          - const: tx-queue-1
> +          - const: tx-queue-2
> +          - const: tx-queue-3
> +
> +      - items:
> +          - const: macirq
> +          - const: eth_wake_irq
> +          - const: eth_lpi
> +          - const: rx-queue-0
> +          - const: rx-queue-1
> +          - const: rx-queue-2
> +          - const: rx-queue-3
> +          - const: rx-queue-4
> +          - const: rx-queue-5
> +          - const: rx-queue-6
> +          - const: rx-queue-7
> +          - const: tx-queue-0
> +          - const: tx-queue-1
> +          - const: tx-queue-2
> +          - const: tx-queue-3
> +          - const: tx-queue-4
> +          - const: tx-queue-5
> +          - const: tx-queue-6
> +          - const: tx-queue-7
>  
>    resets:
> -    items:
> -      - description: AXI power-on system reset
> +    oneOf:
> +      - items:
> +          - description: AXI power-on system reset
> +
> +      - items:
> +          - description: GMAC stmmaceth reset

That's the same as before, no?

> +          - description: AHB reset
> +
> +  reset-names: true

Does not look needed.

Best regards,
Krzysztof


