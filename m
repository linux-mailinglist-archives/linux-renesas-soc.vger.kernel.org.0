Return-Path: <linux-renesas-soc+bounces-31107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MPQMEGk2GnegAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 09:18:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2143D340C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 09:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDED030075DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 07:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821F339A046;
	Fri, 10 Apr 2026 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+eixPzJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB4C399019;
	Fri, 10 Apr 2026 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775805005; cv=none; b=RM74veFByT4zxleBhTS7roxF5Cq1BCzpMkZxqgqsl0mG3ixGCvGpXRCtGVm7kE4JeJlTYip89DKixLdEpQ5iL359hy0/hmHOHw572ZliKlRNb8zvKkJf4KsiVzY4anMKoHiV+ryY3/bJFDOHUAZwnnXsn2qy89HoS9vk+f82S0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775805005; c=relaxed/simple;
	bh=qLP65L0cflAPX9Ywlyrx7cT+UQ48gO4rUmC+rQVrzWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBnbipfFuC5Y9UssRIv0vM73kUpeGCoIFT/6vfW9KX5voF6v0aSSHQPI/dmfdRpBSz/qm8/oPK6YaUqYJFsYqj60Wb9G70tV8V61MNf/3TtycQ/N5JgTtOYmvdBWQ/Y1amMzC4tiuWK8om3tIJLfUPR6jsLttdUITZcyx7MBWnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+eixPzJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79E7C19421;
	Fri, 10 Apr 2026 07:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775805005;
	bh=qLP65L0cflAPX9Ywlyrx7cT+UQ48gO4rUmC+rQVrzWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+eixPzJlwmZtyDvlGzvURkqEV5owFgLObm2BNezgFlMcXMc1v8nvwCGjurndFcax
	 NoXvjNPlzQA9Kd7cITNy9r4fhlguqgohPK0Qv0sGpQ4sgpw+RMuOqZUBth2tAbbrJ8
	 6D7d2LS3LZhtz9rfk4X//ibJtg2XXDvC0jsFH5031Pw1Orqlumm5n+KHi5VivsSAPU
	 w1U7nHWiEeQyUItA8DHxCZ6yRN9q0bHRTdUm7umEKk7yYB/98OJgKnJTvfzMrNRoXi
	 TeRgluqMgEKuDC1mm8s3DsdVCUGDQ6ZF1mDkwHjc0zABuIADzfFCpWA5l/S8sLhVrh
	 g7imeAJHOGGtw==
Date: Fri, 10 Apr 2026 09:10:02 +0200
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
Subject: Re: [PATCH v4 02/12] ASoC: dt-bindings: Add RZ/G3E (R9A09G047) sound
 binding
Message-ID: <20260410-astute-celadon-dugong-ee367b@quoll>
References: <20260409090302.2243305-1-john.madieu.xa@bp.renesas.com>
 <20260409090302.2243305-3-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409090302.2243305-3-john.madieu.xa@bp.renesas.com>
X-Spamd-Result: default: False [5.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31107-lists,linux-renesas-soc=lfdr.de];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.306];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A2143D340C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 11:02:51AM +0200, John Madieu wrote:
> The RZ/G3E shares the same audio IP as the R-Car variants but differs
> in several aspects: it supports up to 5 DMA controllers per audio
> channel, requires additional clocks (47 total including per-SSI ADG
> clocks, SCU domain clocks and SSIF supply) and additional reset lines
> (14 total including SCU, ADG and Audio DMAC peri-peri resets).
> 
> Add a dedicated devicetree binding for the RZ/G3E sound controller.
> The binding references the common renesas,rsnd-common.yaml schema for
> shared property and subnode definitions.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
>  
> v4: No changes
> v3: No changes
> v2:
>  - Introduce RZ/G3E sound binding as a standalone schema
> 
>  .../sound/renesas,r9a09g047-sound.yaml        | 371 ++++++++++++++++++
>  1 file changed, 371 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> new file mode 100644
> index 000000000000..1dfe9bab3382
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> @@ -0,0 +1,371 @@
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
> +  The RZ/G3E (R9A09G047) integrates an R-Car compatible sound controller
> +  with extended DMA channel support (up to 5 DMACs per direction), additional
> +  clock domains, and additional reset lines compared to the R-Car Gen2/Gen3
> +  variants.
> +
> +allOf:
> +  - $ref: renesas,rsnd-common.yaml#
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
> +  clocks:
> +    maxItems: 47
> +
> +  clock-names:
> +    items:
> +      - const: ssi-all
> +      - const: ssi.9
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

Missing clock-cells.

Mising dai-cells.

Why your binding is so flexible? You have a fixed (as in afixed) ABI, no?

> +  resets:
> +    maxItems: 14
> +
> +  reset-names:
> +    items:
> +      - const: ssi-all
> +      - const: ssi.9
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
> +  rcar_sound,dvc:

All new properties must follow standard rules. I understand it will
create duplication, but really that's a mistake of 2014 of adding fake
vendor prefix rcar_sound.

So nodes do not have prefixes.

> +    description: DVC subnode.

Pretty redundant comment. Can a node called "dvc" be anything else than
a "DVC subnode"?

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
> +  rcar_sound,ssiu:
> +    description: SSIU subnode.
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


...

your example is also incomplete. Your common binding said you have many
other nodes.

Are you sure you created a common binding, not some collection of
unrelated stuff?

> +        rcar_sound,dai {
> +            dai0 {
> +                playback = <&ssi3>, <&src1>, <&dvc1>;
> +                capture = <&ssi4>, <&src0>, <&dvc0>;
> +            };
> +        };
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            rsnd_port0: port@0 {
> +                reg = <0>;
> +                rsnd_endpoint0: endpoint {
> +                    remote-endpoint = <&codec_endpoint>;
> +                    dai-format = "i2s";
> +                    bitclock-master = <&rsnd_endpoint0>;
> +                    frame-master = <&rsnd_endpoint0>;
> +                    playback = <&ssi3>, <&src1>, <&dvc1>;
> +                    capture = <&ssi4>, <&src0>, <&dvc0>;
> +                };
> +            };
> +        };
> +    };
> +
> +    codec {

Drop, not part of the binding.

> +        port {
> +            codec_endpoint: endpoint {
> +                remote-endpoint = <&rsnd_endpoint0>;
> +            };
> +        };
> +    };
> -- 
> 2.25.1
> 

