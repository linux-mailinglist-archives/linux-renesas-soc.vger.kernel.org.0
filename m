Return-Path: <linux-renesas-soc+bounces-13833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 074AFA4A57C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 22:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E8A0189870D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 21:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354ED1DE2BD;
	Fri, 28 Feb 2025 21:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6iZsuTi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC6923F388;
	Fri, 28 Feb 2025 21:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740779972; cv=none; b=avfltcfCz/SDoMK+eXCZ0OIK/3hf/sMuiEw+F+MQQuysoQOlNF8bwUo2QBH2Y4z1z2695hiDTwaVLX3RKUQ8upTnvQmxJMyNHjM1ea6XXwyRybNGYTRwvDl8G8aFB9HZ1cP1lqYXthpaYG5615/SdHxjFP9yDxtYZR6jQfejXCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740779972; c=relaxed/simple;
	bh=1uXrApM/OZ45z97xOh8du0b899K24AGxc0xzc8B5RjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGO6rg06OsogFZCAER+l8NyG0m5xM8vL3Fph1BJfKIsTuqcmcGbdaGZJv9nCDYt0I+P89Cphs8QKvgCi/n98KeIeOnaP4OW9bNPpwJD56S++Gll7GpnXMow529V80/LmeJlC0B2/HP//LtyqFX0JAp5NcyAmBI0/fjhTfIgo7kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6iZsuTi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEF8C4CED6;
	Fri, 28 Feb 2025 21:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740779971;
	bh=1uXrApM/OZ45z97xOh8du0b899K24AGxc0xzc8B5RjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6iZsuTi16cH8sv1FWBFvXaPNGRLY+mbxR3OEGWpPyyxZPjhYyUmFvX5JCbdK4kbd
	 DOKqzY/dfkhuyo5OI3HKGe51rVoCpcEMr8v0SjURaEdFWKd5g5PT960h2INmZxjo3w
	 hSGyumcYC4AexXjwaZIxWxeS0FjsNXU/lbUsHCpx+yEsavtEvyTYpT7IUOa+TEC2EV
	 ykOpoxoUcuz1SonSJVq3fIuj34THF6ZVr//R66Fl37vNfIHOr6aODn9DHU5mal63Gr
	 phPwv01OG3gxHpuNPrQdsyMo3tGKtSpIAOR2qKwRJbc6lHSaP+sEh6kOApmR8Y+sxV
	 eQ6//ZgRcjk7Q==
Date: Fri, 28 Feb 2025 15:59:29 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: memory: Document RZ/G3E support
Message-ID: <20250228215929.GA3763431-robh@kernel.org>
References: <20250228160810.171413-1-biju.das.jz@bp.renesas.com>
 <20250228160810.171413-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228160810.171413-2-biju.das.jz@bp.renesas.com>

On Fri, Feb 28, 2025 at 04:07:55PM +0000, Biju Das wrote:
> Document support for the Expanded Serial Peripheral Interface (xSPI)
> Controller in the Renesas RZ/G3E (R9A09G047) SoC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../memory-controllers/renesas,rz-xspi.yaml   | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/renesas,rz-xspi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rz-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rz-xspi.yaml
> new file mode 100644
> index 000000000000..84875cd28460
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rz-xspi.yaml
> @@ -0,0 +1,137 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/renesas,rz-xspi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Expanded Serial Peripheral Interface (xSPI)
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  Renesas xSPI allows a SPI flash connected to the SoC to be accessed via
> +  the memory-mapping or the manual command mode.
> +
> +  The flash chip itself should be represented by a subnode of the XSPI node.
> +  The flash interface is selected based on the "compatible" property of this
> +  subnode:
> +  -  "jedec,spi-nor";
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r9a09g047-xspi  # RZ/G3E
> +      - const: renesas,rz-xspi         # a generic RZ xSPI device
> +
> +  reg:
> +    items:
> +      - description: xSPI registers
> +      - description: direct mapping area
> +
> +  reg-names:
> +    items:
> +      - const: regs
> +      - const: dirmap
> +
> +  interrupts:
> +    items:
> +      - description: Interrupt pulse signal by factors excluding errors
> +      - description: Interrupt pulse signal by error factors
> +
> +  interrupt-names:
> +    items:
> +      - const: spi_pulse
> +      - const: spi_err_pulse

Drop 'spi'

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

