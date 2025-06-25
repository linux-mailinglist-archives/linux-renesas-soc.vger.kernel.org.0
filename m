Return-Path: <linux-renesas-soc+bounces-18755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EBAAE8F29
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 22:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72EC016D985
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 20:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349C120B81B;
	Wed, 25 Jun 2025 20:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDeAAmM7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9321FE47B;
	Wed, 25 Jun 2025 20:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882031; cv=none; b=sl3qaTJ0Ay7QAjwrJM36y1Tf9JAp+A2pSLBmOUQRDbG/XnNP/Tx2yaQtJ3EBin5Q/llkMRSAAstBFEiyGh+CYWsevU9oUH6qP/xqf+4veItNXp4VGNBdeKB0IZ3oF03THmj1C2zn988+3nAXpnP6BpbmtZ6og9iV1h32c6clplo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882031; c=relaxed/simple;
	bh=3nMq3/Hym2/YQbY6AJkgEG17d/VOkEQF9DjdSEWeZyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHJTRObpXX/2Xl5+udzxKzDkcuXVMup/XBGWsk0STehTyyaRQR9zgwjX/x9CSB4X35WZCjdbh/x8t9lxWsg8lqYF2hGslcmBllLFeOgOGWcxBT1B3OGS9w3C7/X+Y6czfsB0uq9M+v/nC3Ddt+mLwg0XSkqQKJ8ahI0a80bNz+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDeAAmM7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FB3C4CEEA;
	Wed, 25 Jun 2025 20:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750882030;
	bh=3nMq3/Hym2/YQbY6AJkgEG17d/VOkEQF9DjdSEWeZyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bDeAAmM7YFLQOvDlRTxPOgr1KPTZLElt9jK0PkSZQcrL/JcgOkvDGOgmFCWlQohoB
	 xeC0L04ed8DvBzsaIY42FMQ8ETnfxfT7XFdTIa9haZi38NXpY/3FX93suJLMxN+0Qs
	 xnFuGuSmocj2UgqJmyRDi2McdVmr4sQVIp78a+I/zwn06bC7zvlwzNDq1ObNHVOECA
	 SlYQQGVTUYd78mbJUeKLQeiTA1E9TO77uwibbWPok7rgmHiu1ECjaDFx8De8VqRNGp
	 5CCGH+hHSho6h1H09zuHAry0LZm0r+HCoAo5mRKS/bXBWifAlxNjMIg71MgDQ8gyNr
	 KGKsKD47YH9pg==
Date: Wed, 25 Jun 2025 15:07:09 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <20250625200709.GA2125481-robh@kernel.org>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611093934.4208-4-wsa+renesas@sang-engineering.com>

On Wed, Jun 11, 2025 at 11:39:27AM +0200, Wolfram Sang wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Available in RZ/G3S and G3E SoCs. The G3S has 17 interrupts, the G3E 16
> with the "HDR exit" interrupt missing. This interrupt is put to the end
> of the list, so we can handle the difference using "minItems" instead of
> defining a separate interrupt list per SoC.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Tommaso also did a version with two interrupt lists and using 'oneOf'. I
> prefer this version but maybe the other one is preferred upstream?
> 
>  .../devicetree/bindings/i3c/renesas,i3c.yaml  | 186 ++++++++++++++++++
>  1 file changed, 186 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> new file mode 100644
> index 000000000000..e6e6c57bb56c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> @@ -0,0 +1,186 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas I3C Bus Interface
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a08g045-i3c # RZ/G3S
> +          - renesas,r9a09g047-i3c # RZ/G3E
> +      - const: renesas,i3c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Non-recoverable internal error interrupt
> +      - description: Normal transfer error interrupt
> +      - description: Normal transfer abort interrupt
> +      - description: Normal response status buffer full interrupt
> +      - description: Normal command buffer empty interrupt
> +      - description: Normal IBI status buffer full interrupt
> +      - description: Normal Rx data buffer full interrupt
> +      - description: Normal Tx data buffer empty interrupt
> +      - description: Normal receive status buffer full interrupt
> +      - description: START condition detection interrupt
> +      - description: STOP condition detection interrupt
> +      - description: Transmit end interrupt
> +      - description: NACK detection interrupt
> +      - description: Arbitration lost interrupt
> +      - description: Timeout detection interrupt
> +      - description: Wake-up condition detection interrupt
> +      - description: HDR Exit Pattern detection interrupt
> +    minItems: 16
> +
> +  interrupt-names:
> +    items:
> +      - const: ierr
> +      - const: terr
> +      - const: abort
> +      - const: resp
> +      - const: cmd
> +      - const: ibi
> +      - const: rx
> +      - const: tx
> +      - const: rcv
> +      - const: st
> +      - const: sp
> +      - const: tend
> +      - const: nack
> +      - const: al
> +      - const: tmo
> +      - const: wu
> +      - const: exit
> +    minItems: 16
> +
> +  clocks:
> +    oneOf:
> +      - items:
> +          - description: APB bus clock
> +          - description: transfer clock
> +      - items:
> +          - description: APB bus clock
> +          - description: SFRs clock
> +          - description: transfer clock

It's a new binding, why don't you put SFRs clock last and simplify the 
schema?

> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: pclk
> +          - const: tclk
> +      - items:
> +          - const: pclk
> +          - const: pclkrw
> +          - const: tclk

