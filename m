Return-Path: <linux-renesas-soc+bounces-31356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLroLqbx4WmKzgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 10:39:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 103A3418C82
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 10:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39126300B60A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 08:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A975839F196;
	Fri, 17 Apr 2026 08:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPVn8Yvf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8443B39BFE2;
	Fri, 17 Apr 2026 08:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776414426; cv=none; b=E46kVvt5WIATKSrUOFz8jz9szPLU2HEjLSt6D6RPhmeRhNZ5Ue0iNaUTRzfgPRZOaXdC60odu+z5l+wTYSQACFWrhOlGp5cFxh4AnYS7McOPv94GY8IHJSqEA4dpTbtLP98biCRcmXYopm2c11F3JBKCDQ3N6digV+De5KH4yKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776414426; c=relaxed/simple;
	bh=DQNXe8BqsPpMC5joo8b3sb/Qu3y+fvMDufSWmXVr+1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWLZpo576vINwmtoA257gHAKKBoTlHyPDpKg9asfOHDjlC1zzZ+77S4RnCkQBtQLTwpTs0ZcrI1dbFCb78N+T3wd5zqFRwaYDw/68jHiKPbd5p5KkAldDilKcDoSuL+QgA5En2M3JhP9t6xajqd2VYg1E+SvUfTH+iPLTE/s32s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPVn8Yvf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95997C19425;
	Fri, 17 Apr 2026 08:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776414426;
	bh=DQNXe8BqsPpMC5joo8b3sb/Qu3y+fvMDufSWmXVr+1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FPVn8YvfjCLjxYZeISK1Mwi47+149cb7Npnb++cUe3o/PwH6GQtRsuC6eOIgmJ0LV
	 9F4qbM8RxYsA6KuCBOVyDPVSoy2d7fmsgMmHfzY+hiSAbtqDjKAC1m4luu44/0lcfm
	 Ua0KHlNTw8qNwHORGYrZqTaERfrtr/BEMgQ8zqB7rNu9hKklLRl4YiLIg7NmrBAsA1
	 vwwLnSEopo9FMeFul06QmSeQgLmdA6Rp7jJ6wssHZOzbEz9djank7kfWX2eiLBAeAo
	 eucIvOoloyP43fDyYskwLyD7QNJ5/paLOi8HMhBT6+Sc2K4PgIVfWE1Q0w1awF1rlr
	 8o2ZI9OvYv67g==
Date: Fri, 17 Apr 2026 10:27:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: John Madieu <john.madieu@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH v5 01/14] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
Message-ID: <20260417-energetic-practical-frigatebird-5b93ad@quoll>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
 <20260415124731.3684773-2-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415124731.3684773-2-john.madieu.xa@bp.renesas.com>
X-Spamd-Result: default: False [5.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31356-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.013];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 103A3418C82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 12:47:18PM +0000, John Madieu wrote:
> Add a standalone device tree binding for the Renesas RZ/G3E (R9A09G047)
> sound controller.
> 
> The RZ/G3E sound IP is based on R-Car Sound but differs in several ways:
> - Uses unprefixed sub-node names (ssi, ssiu, src, dvc, mix, ctu) instead
>   of R-Car's rcar_sound,xxx prefixed names.
> - Supports up to 5 DMA controllers per direction, allowing multiple DMA
>   entries with repeated channel names in SSIU, SRC and DVC sub-nodes.
> - Has 47 clocks including per-SSI ADG clocks (adg.ssi.0-9), SCU clocks
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

DCO/author mismatch.

Did you run checkpatch?

> ---
> 
> Changes:
>  
> v5:
>  - Drop the two-patch rsnd.yaml split approach from v4.
>    Replace with a single self-contained standalone binding that does
>    not touch renesas,rsnd.yaml at all.
>  - Remove select: false, redundant blanket properties (compatible: true,
>    reg: true, etc.) and pointless patternProperties per Krzystof's review
>  - Add missing #clock-cells and #sound-dai-cells constraints
>  - Add hardware description text instead of "Binding for ..." phrasing
>  - Move G3E-specific DMA comment into the binding itself rather than
>    relying on a shared schema
>  - Use unprefixed sub-node names (ssi, ssiu, src, dvc, mix, ctu) to
>    reflect the actual RZ/G3E DT binding
> 
> v4: No changes
> v3: No changes
> v2:
>  - Introduce RZ/G3E sound binding as a standalone schema
> 
>  .../sound/renesas,r9a09g047-sound.yaml        | 770 ++++++++++++++++++
>  1 file changed, 770 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> new file mode 100644
> index 000000000000..b7e5348636bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> @@ -0,0 +1,770 @@
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
> +    enum: [0, 1]

Why is this flexible? That's a defined device meaning you have one XOR more
DAIs. Not "1 and more".

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
> +      - const: ssi.9


Use consistently -

> +      - const: ssi.8
> +      - const: ssi.7
> +      - const: ssi.6
> +      - const: ssi.5
> +      - const: ssi.4
> +      - const: ssi.3
> +      - const: ssi.2
> +      - const: ssi.1
> +      - const: ssi.0
> +      - const: src.9
> +      - const: src.8
> +      - const: src.7
> +      - const: src.6
> +      - const: src.5
> +      - const: src.4
> +      - const: src.3
> +      - const: src.2
> +      - const: src.1
> +      - const: src.0
> +      - const: mix.1
> +      - const: mix.0
> +      - const: ctu.1
> +      - const: ctu.0
> +      - const: dvc.0
> +      - const: dvc.1
> +      - const: clk_a

And here as well

name "clk_a" is half useless, because this cannot be anything else than
clk, thus basically you said "a". What is a?


> +      - const: clk_b
> +      - const: clk_c
> +      - const: clk_i
> +      - const: ssif_supply
> +      - const: scu
> +      - const: scu_x2
> +      - const: scu_supply
> +      - const: adg.ssi.9
> +      - const: adg.ssi.8
> +      - const: adg.ssi.7
> +      - const: adg.ssi.6
> +      - const: adg.ssi.5
> +      - const: adg.ssi.4
> +      - const: adg.ssi.3
> +      - const: adg.ssi.2
> +      - const: adg.ssi.1
> +      - const: adg.ssi.0
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
> +      - const: ssi.9

s/./-/

> +      - const: ssi.8
> +      - const: ssi.7
> +      - const: ssi.6
> +      - const: ssi.5
> +      - const: ssi.4
> +      - const: ssi.3
> +      - const: ssi.2
> +      - const: ssi.1
> +      - const: ssi.0
> +      - const: scu
> +      - const: adg
> +      - const: audmapp
> +
> +  clock-frequency:
> +    description: Audio clock output frequency.

Drop, this is a legacy property, not really allowed for new devices
which are not I2C buses.

> +
> +  clkout-lr-asynchronous:

Missing vendor prefix.

> +    description: audio_clkoutn is asynchronous with lr-clock.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  dvc:

Mixing nodes with and without addressing is discouraged. Why do you have
such mixup?

This node looks empty, so just define dvc-[01] directly. Same for other
cases.

> +    type: object
> +    patternProperties:
> +      "^dvc-[0-1]$":
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          dmas:
> +            maxItems: 5
> +          dma-names:
> +            maxItems: 5
> +            allOf:
> +              - items:
> +                  enum:
> +                    - tx
> +        required:
> +          - dmas
> +          - dma-names
> +    additionalProperties: false
> +
> +  mix:
> +    type: object
> +    patternProperties:
> +      "^mix-[0-1]$":
> +        type: object
> +        additionalProperties: false
> +    additionalProperties: false
> +
> +  ctu:
> +    type: object
> +    patternProperties:
> +      "^ctu-[0-7]$":
> +        type: object
> +        additionalProperties: false
> +    additionalProperties: false
> +
> +  src:
> +    type: object
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
> +              - items:
> +                  enum:
> +                    - tx
> +                    - rx
> +    additionalProperties: false
> +
> +  ssiu:
> +    type: object
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
> +    additionalProperties: false
> +
> +  ssi:
> +    type: object
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
> +    additionalProperties: false
> +
> +  port:
> +    $ref: audio-graph-port.yaml#/definitions/port-base
> +    unevaluatedProperties: false
> +    patternProperties:
> +      "^endpoint(@[0-9a-f]+)?$":
> +        $ref: audio-graph-port.yaml#/definitions/endpoint-base
> +        properties:
> +          playback:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +          capture:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +        unevaluatedProperties: false
> +
> +patternProperties:
> +  '^dai(@[0-9a-f]+)?$':

Why node addressing is optional?

> +    type: object
> +    patternProperties:
> +      "^dai([0-9]+)?$":

You did not verify your DTS, you have warnings here. And I really do not
understand why dai@0 has dai@0 again.


> +        type: object
> +        additionalProperties: false
> +        properties:
> +          playback:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +          capture:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +        anyOf:
> +          - required:
> +              - playback
> +          - required:
> +              - capture
> +    additionalProperties: false
> +
> +  'ports(@[0-9a-f]+)?$':

Why ports even have addferssing?

> +    $ref: audio-graph-port.yaml#/definitions/port-base

So this is port base or ports? How port-base could have one more port as
a child? Open the port-base definition and look there.

> +    unevaluatedProperties: false
> +    patternProperties:
> +      '^port(@[0-9a-f]+)?$':

No, you must define exactly what the ports are.

> +        $ref: "#/properties/port"
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names

Best regards,
Krzysztof


