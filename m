Return-Path: <linux-renesas-soc+bounces-32629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKvQI+HcBWokcgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 16:32:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E754324E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 16:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F24E2309C349
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2AB401A25;
	Thu, 14 May 2026 14:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pi0aFjD5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056A03FFADB;
	Thu, 14 May 2026 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768878; cv=none; b=SOPFEbLrCDurBQ14k/6dhYzTF/NeV3vbk1mK+Px1qloHwiKfNN56OZvu6UU707ycTTBPQkeel8/So2CrOxtUEXQidNmrnC8pe+zc0nSFTlrt/roAI+t+fRyHNbIXUtCzX2H/MaKJjF22Vuuq9+254Ndo7a1AMFPfKxOfzstFM54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768878; c=relaxed/simple;
	bh=gZmlUXeBXT0+9KGKMDHy1fMk3BD5MO9cdCMzoXzTNgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gswS9j5fPwZtgMXKn9zXwVET9BK5Y9h4SaBRmwoZf/oaTTNOFvfDL+OmM5Y5wFRrWKe2AVA9a2zCIsObi+nsuoSPrCAFdlaeFv75nYDphgFlkW0rvi9epbFdAjc/KKx1NA2He6KWsqoK7QOeKKPD1Iu41/3Rm1wopNGIyQPLWOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pi0aFjD5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0EFC2BCF5;
	Thu, 14 May 2026 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778768877;
	bh=gZmlUXeBXT0+9KGKMDHy1fMk3BD5MO9cdCMzoXzTNgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pi0aFjD5EQ4t2PFKvEZW3acODvJXjul/OzOMjj5pZOl5IHiX19F4jMP4LJyJ6Boxr
	 m1zhVnu7VPrYOn0lIf5Y+9EyGqbIH+t0GVeU6z0d019nVhTOd2d6SGTtsjsTEn5h6O
	 QzTwoSNve/o/fntYX0DBUFdOZkZnVrSkO8PbaAz0N5IuOoFIfV0GFm+1oSKO1h4ULw
	 g/rsvazBffvPkrbyjQCnSvJ8Thanz1z4ud1gehAa4ThP8vCWKfMhpF+7V27r1UEhlU
	 Euk2KktUk3NrovfI0aMfHUxDHb2dSG2Wjw20h9cMlRs2Pdzgy0zdPkELAQWev1ra4v
	 pf0yeyCikw+XQ==
Date: Thu, 14 May 2026 09:27:54 -0500
From: Rob Herring <robh@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/16] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
Message-ID: <20260514142754.GA378860-robh@kernel.org>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
 <20260512182631.3842065-2-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512182631.3842065-2-john.madieu.xa@bp.renesas.com>
X-Rspamd-Queue-Id: 159E754324E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32629-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,n:email]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 06:26:16PM +0000, John Madieu wrote:
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
>  .../sound/renesas,r9a09g047-sound.yaml        | 743 ++++++++++++++++++
>  1 file changed, 743 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> new file mode 100644
> index 000000000000..0b651214bd61
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> @@ -0,0 +1,743 @@
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

blank line

> +    patternProperties:
> +      "^dvc-[0-1]$":
> +        type: object
> +        additionalProperties: false

blank line

> +        properties:
> +          dmas:
> +            maxItems: 5

blank line

> +          dma-names:
> +            maxItems: 5
> +            allOf:

Don't need allOf.

> +              - items:
> +                  enum:
> +                    - tx

Is 5 entries of 'tx' really what you want?

blank line

> +        required:
> +          - dmas
> +          - dma-names
> +
> +  mix:
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      "^mix-[0-1]$":
> +        type: object
> +        additionalProperties: false

There is little point in empty nodes.

> +
> +  ctu:
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      "^ctu-[0-7]$":
> +        type: object
> +        additionalProperties: false
> +
> +  src:
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      "^src-[0-9]$":
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +          dmas:
> +            maxItems: 10
> +          dma-names:
> +            maxItems: 10
> +            allOf:

Don't need allOf.

> +              - items:
> +                  enum:
> +                    - tx
> +                    - rx

10 entries of any combination of tx and rx?

> +
> +  ssiu:
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      "^ssiu-[0-9]+$":
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          dmas:
> +            maxItems: 10
> +          dma-names:
> +            maxItems: 10
> +            allOf:
> +              - items:
> +                  enum:
> +                    - tx
> +                    - rx
> +        required:
> +          - dmas
> +          - dma-names
> +
> +  ssi:
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      "^ssi-[0-9]$":
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +          dmas: true
> +          dma-names: true
> +          shared-pin:
> +            description: Shared clock pin.
> +            $ref: /schemas/types.yaml#/definitions/flag
> +        required:
> +          - interrupts
> +
> +  ports:
> +    $ref: audio-graph-port.yaml#/definitions/port-base
> +    unevaluatedProperties: false
> +    patternProperties:
> +      '^port@[0-9a-f]+$':
> +        $ref: audio-graph-port.yaml#/definitions/port-base
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
> +              capture:
> +                $ref: /schemas/types.yaml#/definitions/phandle-array

This is odd. The graph should really just point to another endpoint 
along with any properties for the connection. These probably belong 
elsewhere. What do these point to? Missing any sort of description or 
constraints. 

Rob

