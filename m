Return-Path: <linux-renesas-soc+bounces-33851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wM9YF0bxKWq8fwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 01:20:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE19A66D59A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 01:20:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=oKe6LGbz;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82B6430C7802
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 23:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559F03603DA;
	Wed, 10 Jun 2026 23:20:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37B02D73A6;
	Wed, 10 Jun 2026 23:20:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781133635; cv=none; b=ExXygbCR4490zRq63r4EdxfcLZrW/mXmPEnToIsiicrb5jFOGy7WVVWksiUrA7Yf7Ny/kM5v7ZXMqbQ2ONR9KqaFDRyh3TgZNl7OOaiOp47STF7pFXN9IU9dYQquoYyBdqV/geR9RikLofAR/QNBzAG7RiKInb5kyf1pJt3I7ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781133635; c=relaxed/simple;
	bh=1sBfgUpTaMt3+5XDmLI9dhmy6pYrizel4o+tCMTtBq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=In+tBSZeuEZRJwBYEO7oi7oyiykFm1htiV+nQFXOmL5AhaS/jSLK72i7BSJLMDSVniaik2R/MnaHv/agt7nCSlHaTqjvbK0+dlP3186WiovxAR4sibHcScCabVONrLDC6YpnEYNurC1lm16E0OJPnDBywYTTy+p2vzLYu2quMoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oKe6LGbz; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB5691283;
	Thu, 11 Jun 2026 01:20:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781133602;
	bh=1sBfgUpTaMt3+5XDmLI9dhmy6pYrizel4o+tCMTtBq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKe6LGbzyVucGlmDps3xkBk/Oe5+4XfOzgqlk3tkSxfJ5QDNI3rdyRhAZHzJ2IRZO
	 BNrlCg+2fNXqsZb0NlGeYX7pADzmLZbF6ZhO9ettaZrWuGKpVH/+DP4+j3mG0UIYER
	 Jln+gwfc+DtfyUfywxeFhUfV5s/ceu3KisOoy884=
Date: Thu, 11 Jun 2026 02:20:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
Message-ID: <20260610232029.GC1632628@killaraus.ideasonboard.com>
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com>
 <20260515-rcar-du-dsc-v3-2-164157820498@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-rcar-du-dsc-v3-2-164157820498@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33851-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,ideasonboard.com,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:tomi.valkeinen@ideasonboard.com,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE19A66D59A

Hi Tomi and Marek,

Thank you for the patch.

On Fri, May 15, 2026 at 12:09:27PM +0300, Tomi Valkeinen wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s .
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: fix the example]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

With the comments from Conor in v2 addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../bindings/display/bridge/renesas,dsc.yaml       | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> new file mode 100644
> index 000000000000..2918d592732b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car DSC Display Stream Compression
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +
> +description: |
> +  This binding describes the VESA DSC Display Stream Compression encoder
> +  embedded in the Renesas R-Car V4H SoC. The encoder supports all DSC1.1
> +  encoding mechanisms, configurable bits-per-pixel, resolution up to 8k.
> +
> +properties:
> +  compatible:
> +    const: renesas,r8a779g0-dsc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: R-Car DU input port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: R-Car DSI output port
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - power-domains
> +  - resets
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a779g0-sysc.h>
> +
> +    dsc@feb8d000 {
> +        compatible = "renesas,r8a779g0-dsc";
> +        reg = <0xfeb8d000 0x400>;
> +        interrupts = <GIC_SPI 559 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD 2819>;
> +        power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +        resets = <&cpg 2819>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dsc_in_dsi1: endpoint {
> +                    remote-endpoint = <&du_out_dsi1>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                dsc_out_dsi1: endpoint {
> +                    remote-endpoint = <&dsi1_in>;
> +                };
> +            };
> +        };
> +    };
> +...

-- 
Regards,

Laurent Pinchart

