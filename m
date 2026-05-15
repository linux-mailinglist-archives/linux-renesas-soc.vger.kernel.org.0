Return-Path: <linux-renesas-soc+bounces-32692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFm7N/hdB2pa0QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 19:55:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DC238555B29
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 19:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81F163030FAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 17:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A61E3DB961;
	Fri, 15 May 2026 17:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDIjNocx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8610380FE7;
	Fri, 15 May 2026 17:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778866355; cv=none; b=Ectb8KE3xmrdM7r4iJltqIj8Rv7d6nkkQ2mYj9RIEqUcQlzbKLsltkhCfp1XnjPuoN0p8MrYUsg4QWhoe+iq5j9+fKwIoQQEHFJ4KTXzkmISRFXAijTjXpBpGzvjLrQRxzHAOi/gl7gq4AMCjFXbQmJfBktNodAu6CtwAFRujRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778866355; c=relaxed/simple;
	bh=+DB+r2QuZCt9cRXlZ6SZbjHw/zkrj85jxoOPFc8ej2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqdU/dlklA35BahOfYdey8Tny6kYAHmF4iODMzJa0lDzxpoiEDyigsGvD0bGV0LEwX8sgWkgcr3h/aCyKIT5jlNXPXx2V2wEDjiOX1vrK6Dw8vix9e/zErj3Q36fCmED8pClbZdUkwZXE6OyLHBGQF2zJn8l7LYY3YAOjIB0eBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDIjNocx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1299C2BCB3;
	Fri, 15 May 2026 17:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778866354;
	bh=+DB+r2QuZCt9cRXlZ6SZbjHw/zkrj85jxoOPFc8ej2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDIjNocxi9GT9+5bJC32MLJccue9nzxCG9LlpQB34n1ZAH5ROOOSiGyRx/jriBtrH
	 okdNB/ZwAxpY56i81tlQJXdDHs1I6WSOb/hd7OGB/0w9VksX9JBZDO3rRA1zr96A0k
	 QQ8QkLsudDg/XmkXi7TUfoWmF9mlEAXwu+0qI58V/wxbfZzk7mpjQvLDd5DFUvSVwB
	 jDlZ6RsZXM23jm9Cis6dwl2jMr5Tt5ZdMVgLuFPbycaVGgGVMzFWCjGOP3cHYLsekm
	 GFHCY1TI6PAblaTJ3KWsaYRoRmQZAv+EG9FSqL3UnMLIWCHw77WYitgU6cSbBJbblf
	 70xq+4VeGK+lg==
Date: Fri, 15 May 2026 18:32:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
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
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
Message-ID: <20260515-fraying-trickle-7511a2eeaf44@spud>
References: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
 <20260515-rcar-du-dsc-v2-2-f6b9240a1240@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BKUyMwCcAfsDfsPq"
Content-Disposition: inline
In-Reply-To: <20260515-rcar-du-dsc-v2-2-f6b9240a1240@ideasonboard.com>
X-Rspamd-Queue-Id: DC238555B29
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32692-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[feb8d000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.1:email,devicetree.org:url]
X-Rspamd-Action: no action


--BKUyMwCcAfsDfsPq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 10:56:15AM +0300, Tomi Valkeinen wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>=20
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s .
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: fix the example]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  .../bindings/display/bridge/renesas,dsc.yaml       | 96 ++++++++++++++++=
++++++
>  1 file changed, 96 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsc=
=2Eyaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> new file mode 100644
> index 000000000000..2918d592732b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml

Filename matching the compatible please.

pw-bot: changes-requested

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

Speaking of fixing the example, should this not be "decoder" or
"bridge"?
Not a big deal though.
With the changed filename
Acked-by: Conor Dooley <conor.dooley@microchip.com>


Cheers,
Conor.

> +        compatible =3D "renesas,r8a779g0-dsc";
> +        reg =3D <0xfeb8d000 0x400>;
> +        interrupts =3D <GIC_SPI 559 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&cpg CPG_MOD 2819>;
> +        power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +        resets =3D <&cpg 2819>;
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +                dsc_in_dsi1: endpoint {
> +                    remote-endpoint =3D <&du_out_dsi1>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg =3D <1>;
> +                dsc_out_dsi1: endpoint {
> +                    remote-endpoint =3D <&dsi1_in>;
> +                };
> +            };
> +        };
> +    };
> +...
>=20
> --=20
> 2.43.0
>=20

--BKUyMwCcAfsDfsPq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagdYqwAKCRB4tDGHoIJi
0tgFAQCWZr0VyJbUsmrykeSLd46OUSC5XEhD7J2xXWqd9lUphgEAhFyus39c0hs/
Rg7UtXW22xP/EamsRO2R+icGF9YqcQg=
=1aTv
-----END PGP SIGNATURE-----

--BKUyMwCcAfsDfsPq--

