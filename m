Return-Path: <linux-renesas-soc+bounces-31106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK/UI0Gh2GnegAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 09:05:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4EA3D3118
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 09:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68E953009E19
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 07:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9063890EE;
	Fri, 10 Apr 2026 07:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJb/g/Vn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601B619E992;
	Fri, 10 Apr 2026 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775804732; cv=none; b=tpBbg4Nhxpdug4nFZ1ryCE/wmIvshndg8IDXiBcSOBIEkF0FAwvGwbDqHi4eRInS3gdEbhRvu5HAGiIKqGy8v4UUiODICLBqOlTAwvdB6yZGLkLHT5bWJoDJlAAUdss60iR6e5UziIsK5jBCb0Wzj/0oEl807x9Rar0i8Xmi7iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775804732; c=relaxed/simple;
	bh=7krT/8m1lPkJ35TOrlHht44ZTscZOCOe0+4cvAGR8/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lg35ZZoIRZj6/rR2sxnmMuiMgG8gvuvGTu8Bn1Gx1IHkSVHU5BOrQCjvtVzY5PRqmmZo6ILIwSSWfRd/rBULUol0rcv2bLx7Zwd4GKEdcZLkDfMe6GdWhxG4c3x1pztBAL4v/dSzXSvUJ60bB+Co7DnOPP0xZHHkpT71xPPMhwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJb/g/Vn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F69FC2BCAF;
	Fri, 10 Apr 2026 07:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775804731;
	bh=7krT/8m1lPkJ35TOrlHht44ZTscZOCOe0+4cvAGR8/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJb/g/VnlWuBrm15Clw41HP3/9i1Wa/Nok37AKKVXqw9Ih5SkoAimuDetBjrLTdz3
	 2FvwwjvtLR6Wu+uiLfaembfHWFObe3k2IXpjnFJ8JeF0OaP2evsekuf+6rKYVNm9gy
	 U7fRhnDEOx+/V44JIN0dUUNykp/5+CUCX7D87KPDHQVya46nR7PuiFXCapJoOx5/r5
	 Ua7C/syGZRcp0J7FgnxaLl6j4AzNI2ANUcCdOrYo/bpk7SY5k9DVsD+q0dzYKSf1kk
	 Mv+5YDcg71XK4hEMlr6+/w8aqajkSGYN4/uhbEJhGPQm1cd51hXq/2hbt+EhbTwZkc
	 VQza9I1uqUTOA==
Date: Fri, 10 Apr 2026 09:05:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/12] ASoC: dt-bindings: renesas,rsnd: Split into
 generic and SoC-specific parts
Message-ID: <20260410-private-natural-chital-fea61b@quoll>
References: <20260409090302.2243305-1-john.madieu.xa@bp.renesas.com>
 <20260409090302.2243305-2-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409090302.2243305-2-john.madieu.xa@bp.renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31106-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D4EA3D3118
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 11:02:50AM +0200, John Madieu wrote:
> The current renesas,rsnd.yaml binding file handles all supported SoCs
> in a single schema, resulting in deeply nested if/else/then constructs
> that become increasingly difficult to maintain. Each new SoC addition
> amplifies this complexity, making reviews harder and diffs noisier than
> they need to be.
> 
> Refactor the binding by extracting the common properties shared across
> all SoCs into a dedicated renesas,rsnd-common.yaml schema, and keeping
> only SoC-specific constraints (required nodes, port counts, clock names,
> etc.) in per-SoC or per-family files that $ref the common part.
> 
> This prepares the ground for upcoming SoCs such as the RZ/G3E, which
> introduces a different set of audio resources compared to existing
> R-Car Gen variants. With the split in place, adding RZ/G3E support
> becomes a self-contained change that neither bloats a monolithic schema
> nor buries new constraints inside ever-deeper conditional blocks.
> 
> No functional change in validation behaviour for existing device trees.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
>  
> v4: No changes
> v3: No changes
> v2:
>  - Split of rsnd.yaml into common and R-Car-specific schemas
> 
>  .../bindings/sound/renesas,rsnd-common.yaml   | 196 +++++++++++
>  .../bindings/sound/renesas,rsnd.yaml          | 319 +++++-------------
>  2 files changed, 274 insertions(+), 241 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,rsnd-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd-common.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd-common.yaml
> new file mode 100644
> index 000000000000..ec6bf644d1a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd-common.yaml
> @@ -0,0 +1,196 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/renesas,rsnd-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car/RZ Sound Common Properties
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +description:
> +  Common property and subnode definitions shared by Renesas R-Car and RZ
> +  sound controller bindings.
> +
> +select: false

Drop

> +
> +properties:
> +  compatible: true

Drop

> +
> +  reg: true
> +
> +  reg-names: true

Drop both. They are pointless if they do not provide any reasonable
information like constraints.

> +
> +  "#sound-dai-cells":
> +    description:
> +      Must be 0 for a single-DAI system and 1 for a multi-DAI system.
> +    enum: [0, 1]

Drop, dai-common brings it.

> +
> +  "#clock-cells":
> +    description:
> +      Must be 0 when the system has audio_clkout and 1 when it has
> +      audio_clkout0/1/2/3.
> +    enum: [0, 1]

Is every device a clock? Anyway, having it here is almost pointless if
every binding has to add it anyway.

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  clock-frequency:
> +    description: Audio clock output frequency for audio_clkout0/1/2/3.
> +
> +  clkout-lr-asynchronous:
> +    description: audio_clkoutn is asynchronous with lr-clock.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  power-domains: true
> +
> +  resets: true
> +
> +  reset-names: true
> +
> +  clocks: true
> +
> +  clock-names: true

All pointless.

Please use existing code as guideline. Which recently added common
bindings have such syntax?


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
> +  rcar_sound,dvc:
> +    description: DVC subnode.
> +    type: object
> +    patternProperties:
> +      "^dvc-[0-1]$":
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          dmas: true
> +          dma-names: true
> +        required:
> +          - dmas
> +          - dma-names
> +    additionalProperties: false
> +
> +  rcar_sound,mix:
> +    description: MIX subnode.
> +    type: object
> +    patternProperties:
> +      "^mix-[0-1]$":
> +        type: object
> +        additionalProperties: false
> +    additionalProperties: false
> +
> +  rcar_sound,ctu:
> +    description: CTU subnode.
> +    type: object
> +    patternProperties:
> +      "^ctu-[0-7]$":
> +        type: object
> +        additionalProperties: false
> +    additionalProperties: false
> +
> +  rcar_sound,src:
> +    description: SRC subnode.
> +    type: object
> +    patternProperties:
> +      "^src-[0-9]$":
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +          dmas: true
> +          dma-names: true
> +    additionalProperties: false
> +
> +  rcar_sound,ssiu:
> +    description: SSIU subnode.
> +    type: object
> +    patternProperties:
> +      "^ssiu-[0-9]+$":
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          dmas: true
> +          dma-names: true
> +        required:
> +          - dmas
> +          - dma-names
> +    additionalProperties: false
> +
> +  rcar_sound,ssi:
> +    description: SSI subnode.
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
> +          pio-transfer:
> +            description: PIO transfer mode.
> +            $ref: /schemas/types.yaml#/definitions/flag
> +          no-busif:
> +            description: BUSIF is not used for the mem-to-SSI via DMA case.
> +            $ref: /schemas/types.yaml#/definitions/flag
> +        required:
> +          - interrupts
> +    additionalProperties: false
> +
> +patternProperties:
> +  'rcar_sound,dai(@[0-9a-f]+)?$':
> +    description: DAI subnode.
> +    type: object
> +    patternProperties:
> +      "^dai([0-9]+)?$":
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
> +    $ref: audio-graph-port.yaml#/definitions/port-base
> +    unevaluatedProperties: false
> +    patternProperties:
> +      '^port(@[0-9a-f]+)?$':
> +        $ref: "#/properties/port"
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index e8a2acb92646..0d989922a5b4 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -9,8 +9,11 @@ title: Renesas R-Car Sound Driver
>  maintainers:
>    - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>  
> -properties:
> +description:
> +  Binding for Renesas R-Car Gen1/Gen2/Gen3/Gen4 and RZ/G1/G2 sound

Drop "Binding for" and describe the hardware instead.

> +  controllers using the standard RSND layout.
>  
> +properties:
>    compatible:
>      oneOf:
>        # for Gen1 SoC
> @@ -67,34 +70,6 @@ properties:
>      minItems: 1
>      maxItems: 5
>  
> -  "#sound-dai-cells":
> -    description: |
> -      it must be 0 if your system is using single DAI
> -      it must be 1 if your system is using multi  DAIs
> -      This is used on simple-audio-card
> -    enum: [0, 1]
> -
> -  "#clock-cells":
> -    description: |
> -      it must be 0 if your system has audio_clkout
> -      it must be 1 if your system has audio_clkout0/1/2/3
> -    enum: [0, 1]
> -
> -  "#address-cells":
> -    const: 1
> -
> -  "#size-cells":
> -    const: 0
> -
> -  clock-frequency:
> -    description: for audio_clkout0/1/2/3
> -
> -  clkout-lr-asynchronous:
> -    description: audio_clkoutn is asynchronizes with lr-clock.
> -    $ref: /schemas/types.yaml#/definitions/flag
> -
> -  power-domains: true
> -
>    resets:
>      minItems: 1
>      maxItems: 11
> @@ -109,181 +84,45 @@ properties:
>      maxItems: 31
>  
>    clock-names:
> -    description: List of necessary clock names.
> -    # details are defined below
> -
> -  # ports is below
> -  port:
> -    $ref: audio-graph-port.yaml#/definitions/port-base
> -    unevaluatedProperties: false
> -    patternProperties:
> -      "^endpoint(@[0-9a-f]+)?":
> -        $ref: audio-graph-port.yaml#/definitions/endpoint-base
> -        properties:
> -          playback:
> -            $ref: /schemas/types.yaml#/definitions/phandle-array
> -          capture:
> -            $ref: /schemas/types.yaml#/definitions/phandle-array
> -        unevaluatedProperties: false
> -
> -  rcar_sound,dvc:
> -    description: DVC subnode.
> -    type: object
> -    patternProperties:
> -      "^dvc-[0-1]$":
> -        type: object
> -        additionalProperties: false
> -
> -        properties:
> -          dmas:
> -            maxItems: 1
> -          dma-names:
> -            const: tx
> -        required:
> -          - dmas
> -          - dma-names
> -    additionalProperties: false
> -
> -  rcar_sound,mix:
> -    description: MIX subnode.
> -    type: object
> -    patternProperties:
> -      "^mix-[0-1]$":
> -        type: object
> -        additionalProperties: false
> -    additionalProperties: false
> -
> -  rcar_sound,ctu:
> -    description: CTU subnode.
> -    type: object
> -    patternProperties:
> -      "^ctu-[0-7]$":
> -        type: object
> -        additionalProperties: false
> -    additionalProperties: false
> -
> -  rcar_sound,src:
> -    description: SRC subnode.
> -    type: object
> -    patternProperties:
> -      "^src-[0-9]$":
> -        type: object
> -        additionalProperties: false
> -
> -        properties:
> -          interrupts:
> -            maxItems: 1
> -          dmas:
> -            maxItems: 2
> -          dma-names:
> -            allOf:
> -              - items:
> -                  enum:
> -                    - tx
> -                    - rx
> -    additionalProperties: false
> -
> -  rcar_sound,ssiu:
> -    description: SSIU subnode.
> -    type: object
> -    patternProperties:
> -      "^ssiu-[0-9]+$":
> -        type: object
> -        additionalProperties: false
> -
> -        properties:
> -          dmas:
> -            maxItems: 2
> -          dma-names:
> -            allOf:
> -              - items:
> -                  enum:
> -                    - tx
> -                    - rx
> -        required:
> -          - dmas
> -          - dma-names
> -    additionalProperties: false
> -
> -  rcar_sound,ssi:
> -    description: SSI subnode.
> -    type: object
> -    patternProperties:
> -      "^ssi-[0-9]$":
> -        type: object
> -        additionalProperties: false
> -
> -        properties:
> -          interrupts:
> -            maxItems: 1
> -          dmas:
> -            minItems: 2
> -            maxItems: 4
> -          dma-names:
> -            allOf:
> -              - items:
> -                  enum:
> -                    - tx
> -                    - rx
> -                    - txu # if no ssiu node
> -                    - rxu # if no ssiu node
> -
> -          shared-pin:
> -            description: shared clock pin
> -            $ref: /schemas/types.yaml#/definitions/flag
> -          pio-transfer:
> -            description: PIO transfer mode
> -            $ref: /schemas/types.yaml#/definitions/flag
> -          no-busif:
> -            description: BUSIF is not used when [mem -> SSI] via DMA case
> -            $ref: /schemas/types.yaml#/definitions/flag
> -        required:
> -          - interrupts
> -    additionalProperties: false
> +    description: List of clock names.
> +    minItems: 1
> +    maxItems: 31
> +
> +  "#sound-dai-cells": true
> +
> +  "#clock-cells": true
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true
> +
> +  clock-frequency: true
> +
> +  clkout-lr-asynchronous: true
> +
> +  power-domains: true
> +
> +  port: true
> +
> +  rcar_sound,dvc: true
> +
> +  rcar_sound,mix: true
> +
> +  rcar_sound,ctu: true
> +
> +  rcar_sound,src: true
> +
> +  rcar_sound,ssiu: true
> +
> +  rcar_sound,ssi: true

What are all these? Why are you adding such blanket properties? This is
not the syntax binding should follow, there are almost no other bindings
using such style. Except pin control maybe and this is not a pinctrl.

You miss here proper constraints for all your properties like clock-cells, sound-dai-cells and so on.

>  
>  patternProperties:
> -  # For DAI base
> -  'rcar_sound,dai(@[0-9a-f]+)?$':
> -    description: DAI subnode.
> -    type: object
> -    patternProperties:
> -      "^dai([0-9]+)?$":
> -        type: object
> -        additionalProperties: false
> -
> -        properties:
> -          playback:
> -            $ref: /schemas/types.yaml#/definitions/phandle-array
> -          capture:
> -            $ref: /schemas/types.yaml#/definitions/phandle-array
> -        anyOf:
> -          - required:
> -              - playback
> -          - required:
> -              - capture
> -    additionalProperties: false
> -
> -  'ports(@[0-9a-f]+)?$':
> -    $ref: audio-graph-port.yaml#/definitions/port-base
> -    unevaluatedProperties: false
> -    patternProperties:
> -      '^port(@[0-9a-f]+)?$':
> -        $ref: "#/properties/port"
> -
> -required:
> -  - compatible
> -  - reg
> -  - reg-names
> -  - clocks
> -  - clock-names
> +  'rcar_sound,dai(@[0-9a-f]+)?$': true
> +  'ports(@[0-9a-f]+)?$': true

Also no. This is pure redundant code. No effect, no benefits.

>  
>  allOf:
> -  - $ref: dai-common.yaml#
> +  - $ref: renesas,rsnd-common.yaml#

Best regards,
Krzysztof


