Return-Path: <linux-renesas-soc+bounces-33432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 715bCoD3HmpaawAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 17:32:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6276C62FC9B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 17:32:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZPWBXk4q;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35F873065935
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 14:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12216357D10;
	Tue,  2 Jun 2026 14:55:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC641D86FF;
	Tue,  2 Jun 2026 14:55:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412130; cv=none; b=AsTZLS5TFbHn5eayZDlVV3gbZNWRCGjHcjaUf6R4mugGlBerMlBSNFAiGKnlNKT41wDH/dABo7cr0EwRlVa8Swe4gzI2djBpNfoTeMu0ebj/L40fVXS86ot6wMOaGXrpdwQ4I0J5b5GJB9YWIyp5XJX5D17o7B8E33T/B247kB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412130; c=relaxed/simple;
	bh=aYrLTNK42GDseovScdMBc0zkAS2sAbKjhQera2GYFIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnhThbk01P/caQvhN6DiTyJl8/eEYi+ToJgSHFLKJ0ynBoi4pn+2EzjhrZNyedeBfV1TRy3S9cERqPkVuM5ESPE6Ayi6TKBoAFxErCcnXv6uEw1HhdhOOTg/h3mVMIWK9hEfL+hJDyTJ0ipG1A6B0AZusGlo51cAgWKVpl1AWHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPWBXk4q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1DFE1F00893;
	Tue,  2 Jun 2026 14:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780412127;
	bh=ePMcFklObnZc8TQlWfGCoUVGm4BP6zLGkupld60/lXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZPWBXk4qK9z2pmx/TYmaz6zGvnMGCtEHzbLfZiHeJg+iRToDAv+1v7FxH/yBoGlY0
	 Cbu1vVpY6BaPBjxIhLWTW4+RaiZzFhPWbuPcDvbW5d0zr82fev+H2RVfd4m6gOFMzw
	 3duEID+oUODodyhi5+2PyAlIdiyUZM472MRSB+XB0sEsZLdV7rjLwJw9CmHJvFXzYS
	 rxL5ANbVgWWKdk7tOUPEg7QBl90Nz9UO3yUvLGYGoicWuEqRi0tUVpgiEPcguTGHzA
	 S942QzpFQdsyWShxeV3TZghQJUMBavwPONl3x/WO/eVV78bUHd1MwTMeMe7OhieKqc
	 E2vYn4Vz44i/w==
Date: Tue, 2 Jun 2026 09:55:27 -0500
From: Rob Herring <robh@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 01/18] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
Message-ID: <20260602145527.GA211368-robh@kernel.org>
References: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
 <20260525110230.4014435-2-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525110230.4014435-2-john.madieu.xa@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33432-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:perex@perex.cz,m:tiwai@suse.com,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@tuxon.dev,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6276C62FC9B

On Mon, May 25, 2026 at 11:02:13AM +0000, John Madieu wrote:
> Add a standalone device tree binding for the Renesas RZ/G3E (R9A09G047)
> sound controller.
> 
> The RZ/G3E sound IP is based on R-Car Sound but differs in several ways:
> - Uses unprefixed sub-node names (ssi, ssiu, src, dvc, mix, ctu) instead
>   of R-Car's rcar_sound,xxx prefixed names.
> - Supports up to 5 DMA controllers per direction, allowing multiple DMA
>   entries with repeated channel names in SSIU, SRC and DVC sub-nodes.
> - Has 47 clocks including per-SSI ADG clocks (adg-ssi-[0-9]), SCU clocks
>   (scu, scu_x2, scu_supply), SSIF supply clock, AUDMAC peri-peri clock,
>   and ADG clock.
> - Has 14 reset lines including SCU, ADG and AUDMAC peri-peri resets.
> - SSI operates exclusively in BUSIF mode.
> 
> These differences make the RZ/G3E binding incompatible with the existing
> renesas,rsnd.yaml, so it is added as a separate standalone binding with
> its own $ref to dai-common.yaml.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
> 
> v7:
>  - Add per-property descriptions for the DMA specifier lists in the
>    dvc, ssiu and src sub-nodes, explaining that the dma-engine core
>    falls through the repeated entries to find a free channel
>    (Rob Herring).
>  - Add descriptions for the property-less mix-N and ctu-N sub-nodes,
>    explaining they exist only so the driver can enumerate the
>    instances and so DT labels can be attached for the dai/playback/
>    capture phandle routing arrays (Rob Herring).
>  - Add descriptions for the dai playback and capture phandle arrays
>    (Rob Herring).
>  - Drop the dmas / dma-names blanket "true" allowance on the ssi
>    sub-node; the SSI always operates in BUSIF mode (sashiko-bot).
>  - Add "#sound-dai-cells" and "#clock-cells" to the required list
>    (sashiko-bot).
>  - Add DT labels (dvc0, dvc1, src0, src1, ssi3, ssi4) to the example
>    so the playback/capture phandle references resolve and
>    dt_binding_check passes (sashiko-bot).
> 
> v6:
>  - Rename all indexed clock-names and reset-names from the dotted
>    form (ssi.0, src.0, adg.ssi.0, clk_a, clk_b, clk_c, clk_i) to
>    the hyphenated form (ssi-0, src-0, adg-ssi-0, audio-clka,
>    audio-clkb, audio-clkc, audio-clki) so the new binding follows
>    the standard DT naming convention.
>  - Tighten #sound-dai-cells to const: 1.
>  - Drop unused properties: clock-frequency, clkout-lr-asynchronous.
>  - Simplify the ports/endpoint schema (single ports object with
>    port@N children referencing audio-graph-port.yaml), drop the
>    separate top-level dai patternProperties block.
>  - Move additionalProperties: false to the top of each sub-object
>    (dvc, mix, ctu, src, ssiu, ssi).
>  - Reorder example clocks/resets to match the new ordinal-ascending
>    name order.
> 
> v5:
>  - Drop the two-patch rsnd.yaml split approach from v4. Replace
>    with a single self-contained standalone binding that does not
>    touch renesas,rsnd.yaml at all.
>  - Remove select: false, redundant blanket properties
>    (compatible: true, reg: true, etc.) and pointless
>    patternProperties per Krzysztof's review.
>  - Add missing #clock-cells and #sound-dai-cells constraints.
>  - Add hardware description text instead of "Binding for ..."
>    phrasing.
>  - Move G3E-specific DMA comment into the binding itself rather
>    than relying on a shared schema.
>  - Use unprefixed sub-node names (ssi, ssiu, src, dvc, mix, ctu)
>    to reflect the actual RZ/G3E DT binding.
> 
> v4: No changes
> v3: No changes
> v2:
>  - Introduce RZ/G3E sound binding as a standalone schema.
> 
>  .../sound/renesas,r9a09g047-sound.yaml        | 800 ++++++++++++++++++
>  1 file changed, 800 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> new file mode 100644
> index 000000000000..d7fa16554698
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> @@ -0,0 +1,800 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/renesas,r9a09g047-sound.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G3E Sound Controller
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +  - John Madieu <john.madieu.xa@bp.renesas.com>
> +
> +description:
> +  The RZ/G3E (R9A09G047) sound controller is based on R-Car Sound IP
> +  with extended DMA channel support (up to 5 DMACs per direction),
> +  additional clock domains (47 clocks including per-SSI ADG clocks),
> +  and additional reset lines (14 including SCU, ADG and Audio DMAC
> +  peri-peri resets). SSI operates exclusively in BUSIF mode with
> +  2-4 BUSIF channels per SSI.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g047-sound
> +
> +  reg:
> +    maxItems: 5
> +
> +  reg-names:
> +    items:
> +      - const: scu
> +      - const: adg
> +      - const: ssiu
> +      - const: ssi
> +      - const: audmapp
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  clocks:
> +    maxItems: 47
> +
> +  clock-names:
> +    items:
> +      - const: ssi-all
> +      - const: ssi-0
> +      - const: ssi-1
> +      - const: ssi-2
> +      - const: ssi-3
> +      - const: ssi-4
> +      - const: ssi-5
> +      - const: ssi-6
> +      - const: ssi-7
> +      - const: ssi-8
> +      - const: ssi-9
> +      - const: src-0
> +      - const: src-1
> +      - const: src-2
> +      - const: src-3
> +      - const: src-4
> +      - const: src-5
> +      - const: src-6
> +      - const: src-7
> +      - const: src-8
> +      - const: src-9
> +      - const: mix-0
> +      - const: mix-1
> +      - const: ctu-0
> +      - const: ctu-1
> +      - const: dvc-0
> +      - const: dvc-1
> +      - const: audio-clka
> +      - const: audio-clkb
> +      - const: audio-clkc
> +      - const: audio-clki
> +      - const: ssif_supply
> +      - const: scu
> +      - const: scu_x2
> +      - const: scu_supply
> +      - const: adg-ssi-0
> +      - const: adg-ssi-1
> +      - const: adg-ssi-2
> +      - const: adg-ssi-3
> +      - const: adg-ssi-4
> +      - const: adg-ssi-5
> +      - const: adg-ssi-6
> +      - const: adg-ssi-7
> +      - const: adg-ssi-8
> +      - const: adg-ssi-9
> +      - const: audmapp
> +      - const: adg
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 14
> +
> +  reset-names:
> +    items:
> +      - const: ssi-all
> +      - const: ssi-0
> +      - const: ssi-1
> +      - const: ssi-2
> +      - const: ssi-3
> +      - const: ssi-4
> +      - const: ssi-5
> +      - const: ssi-6
> +      - const: ssi-7
> +      - const: ssi-8
> +      - const: ssi-9
> +      - const: scu
> +      - const: adg
> +      - const: audmapp
> +
> +  dvc:
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      "^dvc-[0-1]$":
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          dmas:
> +            maxItems: 5
> +            description:
> +              List of references to DMA specifiers, one per DMA
> +              controller, all for the transmission direction
> +              (DVC is playback-only). The dma-engine core falls
> +              through the list to find a free channel.
> +
> +          dma-names:
> +            maxItems: 5
> +            allOf:

Don't need allOf.

> +              - items:
> +                  enum:
> +                    - tx

const: tx

> +
> +        required:
> +          - dmas
> +          - dma-names
> +
> +  mix:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Per-channel Mixer (MIX) sub-nodes. Each mix-N node has no
> +      properties of its own. It exists so the driver can enumerate
> +      the MIX instances and so that DT labels can be attached to it
> +      for the dai/playback/capture phandle routing arrays.
> +
> +    patternProperties:
> +      "^mix-[0-1]$":
> +        type: object
> +        additionalProperties: false
> +
> +  ctu:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Per-channel Channel Transfer Unit (CTU) sub-nodes. Each ctu-N
> +      node has no properties of its own. It exists so the driver
> +      can enumerate the CTU instances and so that DT labels can be
> +      attached to it for the dai/playback/capture phandle routing arrays.
> +
> +    patternProperties:
> +      "^ctu-[0-7]$":
> +        type: object
> +        additionalProperties: false
> +
> +  src:
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      "^src-[0-9]$":
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +
> +          dmas:
> +            maxItems: 10
> +            description:
> +              Must contain a list of pairs of references to DMA
> +              specifiers, one for transmission and one for reception,
> +              repeated for each DMA controller. The dma-engine core
> +              falls through the list to find a free channel.
> +
> +          dma-names:
> +            maxItems: 10
> +            allOf:

Don't need allOf.

> +              - items:
> +                  enum:
> +                    - tx
> +                    - rx
> +
> +  ssiu:
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      "^ssiu-[0-9]+$":
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          dmas:
> +            maxItems: 10
> +            description:
> +              Must contain a list of pairs of references to DMA
> +              specifiers, one for transmission and one for reception,
> +              repeated for each DMA controller. The dma-engine core
> +              falls through the list to find a free channel.
> +
> +          dma-names:
> +            maxItems: 10
> +            allOf:
> +              - items:
> +                  enum:
> +                    - tx
> +                    - rx
> +
> +        required:
> +          - dmas
> +          - dma-names
> +
> +  ssi:
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      "^ssi-[0-9]$":
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +
> +          shared-pin:
> +            description: Shared clock pin.
> +            $ref: /schemas/types.yaml#/definitions/flag
> +
> +        required:
> +          - interrupts
> +
> +  ports:
> +    $ref: audio-graph-port.yaml#/definitions/port-base

This ref can't possibly be valid both here...

> +    unevaluatedProperties: false
> +    patternProperties:
> +      '^port@[0-9a-f]+$':
> +        $ref: audio-graph-port.yaml#/definitions/port-base

...and here.

> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            maxItems: 1
> +          endpoint:
> +            $ref: audio-graph-port.yaml#/definitions/endpoint-base
> +            unevaluatedProperties: false
> +            properties:
> +              playback:
> +                $ref: /schemas/types.yaml#/definitions/phandle-array

As each entry is a phandle and no arg cells, you need to define that:

items:
  maxItems: 1

> +                description:
> +                  Ordered list of phandles to the in-SoC modules used
> +                  by this DAI in the playback direction. Each phandle
> +                  must reference one of the ssi-N, src-N, ctu-N,
> +                  mix-N or dvc-N sub-nodes of the parent sound
> +                  controller. The list order is the pipeline order
> +                  from CPU to off-SoC endpoint.
> +              capture:
> +                $ref: /schemas/types.yaml#/definitions/phandle-array

Same here.

But aren't these common properties? If so, you shouldn't be defining the 
type again.

> +                description:
> +                  Ordered list of phandles to the in-SoC modules used
> +                  by this DAI in the capture direction. Each phandle
> +                  must reference one of the ssi-N, src-N, ctu-N,
> +                  mix-N or dvc-N sub-nodes of the parent sound
> +                  controller. The list order is the pipeline order
> +                  from off-SoC endpoint to CPU.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#sound-dai-cells"
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    sound@13c00000 {
> +      #sound-dai-cells = <1>;
> +      #clock-cells = <0>;

compatible goes first. Then reg. Then everything else. The order is 
documented.

> +      compatible = "renesas,r9a09g047-sound";
> +      reg = <0x13c00000 0x10000>,
> +            <0x13c20000 0x10000>,
> +            <0x13c30000 0x1000>,
> +            <0x13c31000 0x1f000>,
> +            <0x13c50000 0x10000>;
> +      reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> +      clocks = <&cpg 245>,
> +               <&cpg 385>, <&cpg 386>,
> +               <&cpg 387>, <&cpg 388>,
> +               <&cpg 389>, <&cpg 390>,
> +               <&cpg 391>, <&cpg 392>,
> +               <&cpg 393>, <&cpg 394>,
> +               <&cpg 372>, <&cpg 373>,
> +               <&cpg 374>, <&cpg 375>,
> +               <&cpg 376>, <&cpg 377>,
> +               <&cpg 378>, <&cpg 379>,
> +               <&cpg 380>, <&cpg 381>,
> +               <&cpg 370>, <&cpg 371>,
> +               <&cpg 370>, <&cpg 371>,
> +               <&cpg 368>, <&cpg 369>,
> +               <&cpg 251>, <&cpg 252>,
> +               <&cpg 253>, <&cpg 250>,
> +               <&cpg 384>,
> +               <&cpg 246>, <&cpg 247>,
> +               <&cpg 382>,
> +               <&cpg 352>, <&cpg 353>,
> +               <&cpg 354>, <&cpg 355>,
> +               <&cpg 356>, <&cpg 357>,
> +               <&cpg 358>, <&cpg 359>,
> +               <&cpg 360>, <&cpg 361>,
> +               <&cpg 248>, <&cpg 249>;
> +      clock-names = "ssi-all",
> +                    "ssi-0", "ssi-1",
> +                    "ssi-2", "ssi-3",
> +                    "ssi-4", "ssi-5",
> +                    "ssi-6", "ssi-7",
> +                    "ssi-8", "ssi-9",
> +                    "src-0", "src-1",
> +                    "src-2", "src-3",
> +                    "src-4", "src-5",
> +                    "src-6", "src-7",
> +                    "src-8", "src-9",
> +                    "mix-0", "mix-1",
> +                    "ctu-0", "ctu-1",
> +                    "dvc-0", "dvc-1",
> +                    "audio-clka", "audio-clkb",
> +                    "audio-clkc", "audio-clki",
> +                    "ssif_supply",
> +                    "scu", "scu_x2",
> +                    "scu_supply",
> +                    "adg-ssi-0", "adg-ssi-1",
> +                    "adg-ssi-2", "adg-ssi-3",
> +                    "adg-ssi-4", "adg-ssi-5",
> +                    "adg-ssi-6", "adg-ssi-7",
> +                    "adg-ssi-8", "adg-ssi-9",
> +                    "audmapp", "adg";
> +      power-domains = <&cpg>;
> +      resets = <&cpg 225>,
> +               <&cpg 226>, <&cpg 227>,
> +               <&cpg 228>, <&cpg 229>,
> +               <&cpg 230>, <&cpg 231>,
> +               <&cpg 232>, <&cpg 233>,
> +               <&cpg 234>, <&cpg 235>,
> +               <&cpg 236>, <&cpg 238>, <&cpg 237>;
> +      reset-names = "ssi-all",
> +                    "ssi-0", "ssi-1",
> +                    "ssi-2", "ssi-3",
> +                    "ssi-4", "ssi-5",
> +                    "ssi-6", "ssi-7",
> +                    "ssi-8", "ssi-9",
> +                    "scu", "adg",
> +                    "audmapp";
> +
> +      ctu {
> +        ctu-0 { };
> +        ctu-1 { };
> +        ctu-2 { };
> +        ctu-3 { };
> +        ctu-4 { };
> +        ctu-5 { };
> +        ctu-6 { };
> +        ctu-7 { };
> +      };
> +
> +      dvc {
> +        dvc0: dvc-0 {
> +          dmas = <&dmac0 0x1db3>, <&dmac1 0x1db3>,
> +                 <&dmac2 0x1db3>, <&dmac3 0x1db3>,
> +                 <&dmac4 0x1db3>;
> +          dma-names = "tx", "tx", "tx", "tx", "tx";
> +        };
> +        dvc1: dvc-1 {
> +          dmas = <&dmac0 0x1db4>, <&dmac1 0x1db4>,
> +                 <&dmac2 0x1db4>, <&dmac3 0x1db4>,
> +                 <&dmac4 0x1db4>;
> +          dma-names = "tx", "tx", "tx", "tx", "tx";
> +        };
> +      };
> +
> +      mix {
> +        mix-0 { };
> +        mix-1 { };
> +      };
> +
> +      src {
> +        src0: src-0 {
> +          interrupts = <GIC_SPI 902 IRQ_TYPE_LEVEL_HIGH>;
> +          dmas = <&dmac0 0x1d9f>, <&dmac0 0x1da9>,
> +                 <&dmac1 0x1d9f>, <&dmac1 0x1da9>,
> +                 <&dmac2 0x1d9f>, <&dmac2 0x1da9>,
> +                 <&dmac3 0x1d9f>, <&dmac3 0x1da9>,
> +                 <&dmac4 0x1d9f>, <&dmac4 0x1da9>;
> +          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
> +                      "rx", "tx", "rx", "tx";
> +        };
> +        src1: src-1 {
> +          interrupts = <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>;
> +          dmas = <&dmac0 0x1da0>, <&dmac0 0x1daa>,
> +                 <&dmac1 0x1da0>, <&dmac1 0x1daa>,
> +                 <&dmac2 0x1da0>, <&dmac2 0x1daa>,
> +                 <&dmac3 0x1da0>, <&dmac3 0x1daa>,
> +                 <&dmac4 0x1da0>, <&dmac4 0x1daa>;
> +          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
> +                      "rx", "tx", "rx", "tx";
> +        };
> +        src-2 {
> +          interrupts = <GIC_SPI 904 IRQ_TYPE_LEVEL_HIGH>;
> +          dmas = <&dmac0 0x1da1>, <&dmac0 0x1dab>,
> +                 <&dmac1 0x1da1>, <&dmac1 0x1dab>,
> +                 <&dmac2 0x1da1>, <&dmac2 0x1dab>,
> +                 <&dmac3 0x1da1>, <&dmac3 0x1dab>,
> +                 <&dmac4 0x1da1>, <&dmac4 0x1dab>;
> +          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
> +                      "rx", "tx", "rx", "tx";
> +        };
> +        src-3 {
> +          interrupts = <GIC_SPI 905 IRQ_TYPE_LEVEL_HIGH>;
> +          dmas = <&dmac0 0x1da2>, <&dmac0 0x1dac>,
> +                 <&dmac1 0x1da2>, <&dmac1 0x1dac>,
> +                 <&dmac2 0x1da2>, <&dmac2 0x1dac>,
> +                 <&dmac3 0x1da2>, <&dmac3 0x1dac>,
> +                 <&dmac4 0x1da2>, <&dmac4 0x1dac>;
> +          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
> +                      "rx", "tx", "rx", "tx";
> +        };
> +        src-4 {
> +          interrupts = <GIC_SPI 906 IRQ_TYPE_LEVEL_HIGH>;
> +          dmas = <&dmac0 0x1da3>, <&dmac0 0x1dad>,
> +                 <&dmac1 0x1da3>, <&dmac1 0x1dad>,
> +                 <&dmac2 0x1da3>, <&dmac2 0x1dad>,
> +                 <&dmac3 0x1da3>, <&dmac3 0x1dad>,
> +                 <&dmac4 0x1da3>, <&dmac4 0x1dad>;
> +          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
> +                      "rx", "tx", "rx", "tx";
> +        };
> +        src-5 {
> +          interrupts = <GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>;
> +          dmas = <&dmac0 0x1da4>, <&dmac0 0x1dae>,
> +                 <&dmac1 0x1da4>, <&dmac1 0x1dae>,
> +                 <&dmac2 0x1da4>, <&dmac2 0x1dae>,
> +                 <&dmac3 0x1da4>, <&dmac3 0x1dae>,
> +                 <&dmac4 0x1da4>, <&dmac4 0x1dae>;
> +          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
> +                      "rx", "tx", "rx", "tx";
> +        };
> +        src-6 {
> +          interrupts = <GIC_SPI 908 IRQ_TYPE_LEVEL_HIGH>;
> +          dmas = <&dmac0 0x1da5>, <&dmac0 0x1daf>,
> +                 <&dmac1 0x1da5>, <&dmac1 0x1daf>,
> +                 <&dmac2 0x1da5>, <&dmac2 0x1daf>,
> +                 <&dmac3 0x1da5>, <&dmac3 0x1daf>,
> +                 <&dmac4 0x1da5>, <&dmac4 0x1daf>;
> +          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
> +                      "rx", "tx", "rx", "tx";
> +        };
> +        src-7 {
> +          interrupts = <GIC_SPI 909 IRQ_TYPE_LEVEL_HIGH>;
> +          dmas = <&dmac0 0x1da6>, <&dmac0 0x1db0>,
> +                 <&dmac1 0x1da6>, <&dmac1 0x1db0>,
> +                 <&dmac2 0x1da6>, <&dmac2 0x1db0>,
> +                 <&dmac3 0x1da6>, <&dmac3 0x1db0>,
> +                 <&dmac4 0x1da6>, <&dmac4 0x1db0>;
> +          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
> +                      "rx", "tx", "rx", "tx";
> +        };
> +        src-8 {
> +          interrupts = <GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>;
> +          dmas = <&dmac0 0x1da7>, <&dmac0 0x1db1>,
> +                 <&dmac1 0x1da7>, <&dmac1 0x1db1>,
> +                 <&dmac2 0x1da7>, <&dmac2 0x1db1>,
> +                 <&dmac3 0x1da7>, <&dmac3 0x1db1>,
> +                 <&dmac4 0x1da7>, <&dmac4 0x1db1>;
> +          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
> +                      "rx", "tx", "rx", "tx";
> +        };
> +        src-9 {
> +          interrupts = <GIC_SPI 911 IRQ_TYPE_LEVEL_HIGH>;
> +          dmas = <&dmac0 0x1da8>, <&dmac0 0x1db2>,
> +                 <&dmac1 0x1da8>, <&dmac1 0x1db2>,
> +                 <&dmac2 0x1da8>, <&dmac2 0x1db2>,
> +                 <&dmac3 0x1da8>, <&dmac3 0x1db2>,
> +                 <&dmac4 0x1da8>, <&dmac4 0x1db2>;
> +          dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
> +                      "rx", "tx", "rx", "tx";
> +        };
> +      };
> +
> +      ssi {
> +        ssi-0 {
> +          interrupts = <GIC_SPI 889 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +        ssi-1 {
> +          interrupts = <GIC_SPI 890 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +        ssi-2 {
> +          interrupts = <GIC_SPI 891 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +        ssi3: ssi-3 {
> +          interrupts = <GIC_SPI 892 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +        ssi4: ssi-4 {
> +          interrupts = <GIC_SPI 893 IRQ_TYPE_LEVEL_HIGH>;
> +          shared-pin;
> +        };
> +        ssi-5 {
> +          interrupts = <GIC_SPI 894 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +        ssi-6 {
> +          interrupts = <GIC_SPI 895 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +        ssi-7 {
> +          interrupts = <GIC_SPI 896 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +        ssi-8 {
> +          interrupts = <GIC_SPI 897 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +        ssi-9 {
> +          interrupts = <GIC_SPI 898 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +      };
> +
> +      ssiu {
> +        ssiu-0 {
> +          dmas = <&dmac0 0x1d61>, <&dmac0 0x1d62>,
> +                 <&dmac1 0x1d61>, <&dmac1 0x1d62>,
> +                 <&dmac2 0x1d61>, <&dmac2 0x1d62>,
> +                 <&dmac3 0x1d61>, <&dmac3 0x1d62>,
> +                 <&dmac4 0x1d61>, <&dmac4 0x1d62>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-1 {
> +          dmas = <&dmac0 0x1d63>, <&dmac0 0x1d64>,
> +                 <&dmac1 0x1d63>, <&dmac1 0x1d64>,
> +                 <&dmac2 0x1d63>, <&dmac2 0x1d64>,
> +                 <&dmac3 0x1d63>, <&dmac3 0x1d64>,
> +                 <&dmac4 0x1d63>, <&dmac4 0x1d64>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-2 {
> +          dmas = <&dmac0 0x1d65>, <&dmac0 0x1d66>,
> +                 <&dmac1 0x1d65>, <&dmac1 0x1d66>,
> +                 <&dmac2 0x1d65>, <&dmac2 0x1d66>,
> +                 <&dmac3 0x1d65>, <&dmac3 0x1d66>,
> +                 <&dmac4 0x1d65>, <&dmac4 0x1d66>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-3 {
> +          dmas = <&dmac0 0x1d67>, <&dmac0 0x1d68>,
> +                 <&dmac1 0x1d67>, <&dmac1 0x1d68>,
> +                 <&dmac2 0x1d67>, <&dmac2 0x1d68>,
> +                 <&dmac3 0x1d67>, <&dmac3 0x1d68>,
> +                 <&dmac4 0x1d67>, <&dmac4 0x1d68>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-4 {
> +          dmas = <&dmac0 0x1d69>, <&dmac0 0x1d6a>,
> +                 <&dmac1 0x1d69>, <&dmac1 0x1d6a>,
> +                 <&dmac2 0x1d69>, <&dmac2 0x1d6a>,
> +                 <&dmac3 0x1d69>, <&dmac3 0x1d6a>,
> +                 <&dmac4 0x1d69>, <&dmac4 0x1d6a>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-5 {
> +          dmas = <&dmac0 0x1d6b>, <&dmac0 0x1d6c>,
> +                 <&dmac1 0x1d6b>, <&dmac1 0x1d6c>,
> +                 <&dmac2 0x1d6b>, <&dmac2 0x1d6c>,
> +                 <&dmac3 0x1d6b>, <&dmac3 0x1d6c>,
> +                 <&dmac4 0x1d6b>, <&dmac4 0x1d6c>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-6 {
> +          dmas = <&dmac0 0x1d6d>, <&dmac0 0x1d6e>,
> +                 <&dmac1 0x1d6d>, <&dmac1 0x1d6e>,
> +                 <&dmac2 0x1d6d>, <&dmac2 0x1d6e>,
> +                 <&dmac3 0x1d6d>, <&dmac3 0x1d6e>,
> +                 <&dmac4 0x1d6d>, <&dmac4 0x1d6e>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-7 {
> +          dmas = <&dmac0 0x1d6f>, <&dmac0 0x1d70>,
> +                 <&dmac1 0x1d6f>, <&dmac1 0x1d70>,
> +                 <&dmac2 0x1d6f>, <&dmac2 0x1d70>,
> +                 <&dmac3 0x1d6f>, <&dmac3 0x1d70>,
> +                 <&dmac4 0x1d6f>, <&dmac4 0x1d70>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-8 {
> +          dmas = <&dmac0 0x1d71>, <&dmac0 0x1d72>,
> +                 <&dmac1 0x1d71>, <&dmac1 0x1d72>,
> +                 <&dmac2 0x1d71>, <&dmac2 0x1d72>,
> +                 <&dmac3 0x1d71>, <&dmac3 0x1d72>,
> +                 <&dmac4 0x1d71>, <&dmac4 0x1d72>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-9 {
> +          dmas = <&dmac0 0x1d73>, <&dmac0 0x1d74>,
> +                 <&dmac1 0x1d73>, <&dmac1 0x1d74>,
> +                 <&dmac2 0x1d73>, <&dmac2 0x1d74>,
> +                 <&dmac3 0x1d73>, <&dmac3 0x1d74>,
> +                 <&dmac4 0x1d73>, <&dmac4 0x1d74>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-10 {
> +          dmas = <&dmac0 0x1d75>, <&dmac0 0x1d76>,
> +                 <&dmac1 0x1d75>, <&dmac1 0x1d76>,
> +                 <&dmac2 0x1d75>, <&dmac2 0x1d76>,
> +                 <&dmac3 0x1d75>, <&dmac3 0x1d76>,
> +                 <&dmac4 0x1d75>, <&dmac4 0x1d76>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-11 {
> +          dmas = <&dmac0 0x1d77>, <&dmac0 0x1d78>,
> +                 <&dmac1 0x1d77>, <&dmac1 0x1d78>,
> +                 <&dmac2 0x1d77>, <&dmac2 0x1d78>,
> +                 <&dmac3 0x1d77>, <&dmac3 0x1d78>,
> +                 <&dmac4 0x1d77>, <&dmac4 0x1d78>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-12 {
> +          dmas = <&dmac0 0x1d79>, <&dmac0 0x1d7a>,
> +                 <&dmac1 0x1d79>, <&dmac1 0x1d7a>,
> +                 <&dmac2 0x1d79>, <&dmac2 0x1d7a>,
> +                 <&dmac3 0x1d79>, <&dmac3 0x1d7a>,
> +                 <&dmac4 0x1d79>, <&dmac4 0x1d7a>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-13 {
> +          dmas = <&dmac0 0x1d7b>, <&dmac0 0x1d7c>,
> +                 <&dmac1 0x1d7b>, <&dmac1 0x1d7c>,
> +                 <&dmac2 0x1d7b>, <&dmac2 0x1d7c>,
> +                 <&dmac3 0x1d7b>, <&dmac3 0x1d7c>,
> +                 <&dmac4 0x1d7b>, <&dmac4 0x1d7c>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-14 {
> +          dmas = <&dmac0 0x1d7d>, <&dmac0 0x1d7e>,
> +                 <&dmac1 0x1d7d>, <&dmac1 0x1d7e>,
> +                 <&dmac2 0x1d7d>, <&dmac2 0x1d7e>,
> +                 <&dmac3 0x1d7d>, <&dmac3 0x1d7e>,
> +                 <&dmac4 0x1d7d>, <&dmac4 0x1d7e>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-15 {
> +          dmas = <&dmac0 0x1d7f>, <&dmac0 0x1d80>,
> +                 <&dmac1 0x1d7f>, <&dmac1 0x1d80>,
> +                 <&dmac2 0x1d7f>, <&dmac2 0x1d80>,
> +                 <&dmac3 0x1d7f>, <&dmac3 0x1d80>,
> +                 <&dmac4 0x1d7f>, <&dmac4 0x1d80>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-16 {
> +          dmas = <&dmac0 0x1d81>, <&dmac0 0x1d82>,
> +                 <&dmac1 0x1d81>, <&dmac1 0x1d82>,
> +                 <&dmac2 0x1d81>, <&dmac2 0x1d82>,
> +                 <&dmac3 0x1d81>, <&dmac3 0x1d82>,
> +                 <&dmac4 0x1d81>, <&dmac4 0x1d82>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-17 {
> +          dmas = <&dmac0 0x1d83>, <&dmac0 0x1d84>,
> +                 <&dmac1 0x1d83>, <&dmac1 0x1d84>,
> +                 <&dmac2 0x1d83>, <&dmac2 0x1d84>,
> +                 <&dmac3 0x1d83>, <&dmac3 0x1d84>,
> +                 <&dmac4 0x1d83>, <&dmac4 0x1d84>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-18 {
> +          dmas = <&dmac0 0x1d85>, <&dmac0 0x1d86>,
> +                 <&dmac1 0x1d85>, <&dmac1 0x1d86>,
> +                 <&dmac2 0x1d85>, <&dmac2 0x1d86>,
> +                 <&dmac3 0x1d85>, <&dmac3 0x1d86>,
> +                 <&dmac4 0x1d85>, <&dmac4 0x1d86>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-19 {
> +          dmas = <&dmac0 0x1d87>, <&dmac0 0x1d88>,
> +                 <&dmac1 0x1d87>, <&dmac1 0x1d88>,
> +                 <&dmac2 0x1d87>, <&dmac2 0x1d88>,
> +                 <&dmac3 0x1d87>, <&dmac3 0x1d88>,
> +                 <&dmac4 0x1d87>, <&dmac4 0x1d88>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-20 {
> +          dmas = <&dmac0 0x1d89>, <&dmac0 0x1d8a>,
> +                 <&dmac1 0x1d89>, <&dmac1 0x1d8a>,
> +                 <&dmac2 0x1d89>, <&dmac2 0x1d8a>,
> +                 <&dmac3 0x1d89>, <&dmac3 0x1d8a>,
> +                 <&dmac4 0x1d89>, <&dmac4 0x1d8a>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-21 {
> +          dmas = <&dmac0 0x1d8b>, <&dmac0 0x1d8c>,
> +                 <&dmac1 0x1d8b>, <&dmac1 0x1d8c>,
> +                 <&dmac2 0x1d8b>, <&dmac2 0x1d8c>,
> +                 <&dmac3 0x1d8b>, <&dmac3 0x1d8c>,
> +                 <&dmac4 0x1d8b>, <&dmac4 0x1d8c>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-22 {
> +          dmas = <&dmac0 0x1d8d>, <&dmac0 0x1d8e>,
> +                 <&dmac1 0x1d8d>, <&dmac1 0x1d8e>,
> +                 <&dmac2 0x1d8d>, <&dmac2 0x1d8e>,
> +                 <&dmac3 0x1d8d>, <&dmac3 0x1d8e>,
> +                 <&dmac4 0x1d8d>, <&dmac4 0x1d8e>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-23 {
> +          dmas = <&dmac0 0x1d8f>, <&dmac0 0x1d90>,
> +                 <&dmac1 0x1d8f>, <&dmac1 0x1d90>,
> +                 <&dmac2 0x1d8f>, <&dmac2 0x1d90>,
> +                 <&dmac3 0x1d8f>, <&dmac3 0x1d90>,
> +                 <&dmac4 0x1d8f>, <&dmac4 0x1d90>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-24 {
> +          dmas = <&dmac0 0x1d91>, <&dmac0 0x1d92>,
> +                 <&dmac1 0x1d91>, <&dmac1 0x1d92>,
> +                 <&dmac2 0x1d91>, <&dmac2 0x1d92>,
> +                 <&dmac3 0x1d91>, <&dmac3 0x1d92>,
> +                 <&dmac4 0x1d91>, <&dmac4 0x1d92>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-25 {
> +          dmas = <&dmac0 0x1d93>, <&dmac0 0x1d94>,
> +                 <&dmac1 0x1d93>, <&dmac1 0x1d94>,
> +                 <&dmac2 0x1d93>, <&dmac2 0x1d94>,
> +                 <&dmac3 0x1d93>, <&dmac3 0x1d94>,
> +                 <&dmac4 0x1d93>, <&dmac4 0x1d94>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-26 {
> +          dmas = <&dmac0 0x1d95>, <&dmac0 0x1d96>,
> +                 <&dmac1 0x1d95>, <&dmac1 0x1d96>,
> +                 <&dmac2 0x1d95>, <&dmac2 0x1d96>,
> +                 <&dmac3 0x1d95>, <&dmac3 0x1d96>,
> +                 <&dmac4 0x1d95>, <&dmac4 0x1d96>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +        ssiu-27 {
> +          dmas = <&dmac0 0x1d97>, <&dmac0 0x1d98>,
> +                 <&dmac1 0x1d97>, <&dmac1 0x1d98>,
> +                 <&dmac2 0x1d97>, <&dmac2 0x1d98>,
> +                 <&dmac3 0x1d97>, <&dmac3 0x1d98>,
> +                 <&dmac4 0x1d97>, <&dmac4 0x1d98>;
> +          dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
> +        };
> +      };
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        port@0 {
> +          reg = <0>;
> +          rsnd_endpoint0: endpoint {
> +            remote-endpoint = <&codec_endpoint>;
> +            dai-format = "i2s";
> +            bitclock-master = <&rsnd_endpoint0>;
> +            frame-master = <&rsnd_endpoint0>;
> +            playback = <&ssi3>, <&src1>, <&dvc1>;
> +            capture  = <&ssi4>, <&src0>, <&dvc0>;
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.25.1
> 

