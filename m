Return-Path: <linux-renesas-soc+bounces-10540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624CA9CEBAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2024 16:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F40ECB3656B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Nov 2024 15:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6791D5166;
	Fri, 15 Nov 2024 15:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NODpiI57"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02FE1D5161;
	Fri, 15 Nov 2024 15:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731682932; cv=none; b=u9XjBdHbgBtvj279MZzr6Px7a+UGY2l8ZHM9r/nEGsBv+hjV2xcjf/zvUxkWeAsJtSMrz5pLVyuCyOmF2CXm57rT+p92C2tAu8YoWajkLre7D+llufaWdORNT9k5dG6jmbEOOLbw8MC9Et/N8b6+zxk73cdquJdyE7cZXabKMvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731682932; c=relaxed/simple;
	bh=RC7dHsUpzDmhpG2Rds2L44gcmJcCyTz4v8LUuaz9vbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsLxy34n+++myf/7ncAvui9+djgRvU0YtogKN69NgH8JbqhWSPTCCrJWdFuo3zYUtuUhwCZhlBjBUmE0Ho6JgkuiA170W5nYx5LDPrSqL//fWf9S4mKDJlgfYwtc+XHdHUd/T0FvwGP3Kk1za5T696j1YQgbjk0e4E1+551J7sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NODpiI57; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10589C4CECF;
	Fri, 15 Nov 2024 15:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731682932;
	bh=RC7dHsUpzDmhpG2Rds2L44gcmJcCyTz4v8LUuaz9vbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NODpiI57VDFfacvTlhxVqkf8jwPxzY6fiOgg3gq2JZGvdMF9+kkP830N/IR5m2EZ2
	 JjhF3wpmjNF3rKJ+eaDiW8zej6RYSDOI9nq2zOKYlteBJLRhXbv9ttPs73k9G4pE1K
	 +NX4ZvGgfs2U7GRIGYTh7KJcKqch/WyTTklvrxTh3euqNY33pYrTp4ZFvYG2z0AR9o
	 rlOcYKq3rFeMQKr2stq28536T9adoMjR4ecbo3Hmn3iuEvOWCA4Zk6jtTRhcCBCLrI
	 SPRsxungJhdM9ixRljBnRLmKTkO0tDPzyUAYeyF+ZYU/OEu8/Uig0Itf1oHHazPaWq
	 RsELFu6TkoJhw==
Date: Fri, 15 Nov 2024 09:02:10 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] [RFC] dt-bindings: net: micrel: Convert to json-schema
Message-ID: <20241115150210.GA2680735-robh@kernel.org>
References: <943cb31d01d0da3a63911326e24fbf9b328f7206.1731580776.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <943cb31d01d0da3a63911326e24fbf9b328f7206.1731580776.git.geert+renesas@glider.be>

On Thu, Nov 14, 2024 at 11:42:50AM +0100, Geert Uytterhoeven wrote:
> Convert the Micrel PHY Device Tree binding documentation to json-schema.
> 
> Add a simple example.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Notes:
>   1. I specified Ben Dooks as the maintainer, as he wrote the original
>      bindings. Ben, are you OK with that?
>   2. This schema is never applied, as there is no compatible value or
>      select statement. Adding
> 
> 	select:
> 	  properties:
> 	    $nodename:
> 	      pattern: "^ethernet-phy(@[a-f0-9]+)?$"
> 
> 	  required:
> 	    - $nodename
> 
>      and changing
> 
> 	-unevaluatedProperties: false
> 	+additionalProperties: true
> 
>      would fix that, and is mostly harmless, except for possible
>      conflicts with other Ethernet PHYs having more than one clock, or
>      using different clock-names.
>      Documentation/devicetree/bindings/net/qca,ar803x.yaml has the same
>      issue.
>      Is there a proper way to handle this?  Are there other options than
>      mandating specific compatible values for Ethernet PHYs?

The proper way is simply, if you need to describe your phy in DT, it 
needs a compatible string. MDIO phys are not special.

We really need to split ethernet-phy.yaml into common properties and a 
specific schema for the compatibles it contains so that we can change 
'additionalProperties: true'. That's one reason why all these properties 
and typos didn't get flagged.

If you don't want to retro-actively add a compatible, you can also do 
something like this:

select:
  anyOf:
    - required: ['micrel,led-mode']
    - required: ['micrel,rmii-reference-clock-select-25-mhz']
    - required: ['micrel,fiber-mode']
    - required: ['coma-mode-gpios']

That doesn't catch every case nor if you have a typo in the property 
names.

> Thanks for your comments!
> ---
>  .../devicetree/bindings/net/micrel,phy.yaml   | 93 +++++++++++++++++++
>  .../devicetree/bindings/net/micrel.txt        | 57 ------------
>  2 files changed, 93 insertions(+), 57 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/micrel,phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/micrel.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/micrel,phy.yaml b/Documentation/devicetree/bindings/net/micrel,phy.yaml
> new file mode 100644
> index 0000000000000000..609bbd9729efe516
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/micrel,phy.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/micrel,phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Micrel PHY properties
> +
> +maintainers:
> +  - Ben Dooks <ben.dooks@codethink.co.uk>
> +
> +properties:
> +  micrel,led-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1, 2, 3 ]
> +    description: |
> +      LED mode value to set for PHYs with configurable LEDs.
> +
> +      Configure the LED mode with single value. The list of PHYs and the
> +      bits that are currently supported:
> +
> +      KSZ8001: register 0x1e, bits 15..14
> +      KSZ8041: register 0x1e, bits 15..14
> +      KSZ8021: register 0x1f, bits 5..4
> +      KSZ8031: register 0x1f, bits 5..4
> +      KSZ8051: register 0x1f, bits 5..4
> +      KSZ8081: register 0x1f, bits 5..4
> +      KSZ8091: register 0x1f, bits 5..4
> +      LAN8814: register EP5.0, bit 6
> +
> +      See the respective PHY datasheet for the mode values.
> +
> +  micrel,rmii-reference-clock-select-25-mhz:
> +    description: |
> +      RMII Reference Clock Select bit selects 25 MHz mode
> +
> +      Setting the RMII Reference Clock Select bit enables 25 MHz rather
> +      than 50 MHz clock mode.
> +
> +      Note that this option in only needed for certain PHY revisions with a
> +      non-standard, inverted function of this configuration bit.
> +      Specifically, a clock reference ("rmii-ref" below) is always needed to
> +      actually select a mode.
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: rmii-ref
> +    description: |
> +      supported clocks:
> +        - KSZ8021, KSZ8031, KSZ8081, KSZ8091: "rmii-ref": The RMII reference
> +          input clock. Used to determine the XI input clock.

Don't repeat the clock name in the description.

> +
> +  micrel,fiber-mode:
> +    type: boolean
> +    description: |
> +      If present the PHY is configured to operate in fiber mode.
> +
> +      Some PHYs, such as the KSZ8041FTL variant, support fiber mode, enabled
> +      by the FXEN boot strapping pin. It can't be determined from the PHY
> +      registers whether the PHY is in fiber mode, so this boolean device tree
> +      property can be used to describe it.
> +
> +      In fiber mode, auto-negotiation is disabled and the PHY can only work in
> +      100base-fx (full and half duplex) modes.
> +
> +  coma-mode-gpios:
> +    description: |
> +      If present the given gpio will be deasserted when the PHY is probed.
> +
> +      Some PHYs have a COMA mode input pin which puts the PHY into
> +      isolate and power-down mode. On some boards this input is connected
> +      to a GPIO of the SoC.
> +
> +      Supported on the LAN8814.

Another reason to add compatible. You have per device properties.

> +
> +dependencies:
> +  micrel,rmii-reference-clock-select-25-mhz: [ clock-names ]
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    ethernet {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ethernet-phy@1 {
> +            reg = <1>;
> +            micrel,led-mode = <1>;
> +        };
> +    };

