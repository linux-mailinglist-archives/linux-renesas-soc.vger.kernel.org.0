Return-Path: <linux-renesas-soc+bounces-34086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1jQ9MKFxMWrdjQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 17:54:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247B6917D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 17:54:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h64hWi3F;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7F2E30AE130
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 15:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2545544E021;
	Tue, 16 Jun 2026 15:44:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA133B840B;
	Tue, 16 Jun 2026 15:44:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781624680; cv=none; b=k+t5uQCa+/fh5c3j6JnUcV2+6aARSNwphGXi+7RmWrlj1QOA/5roUraGDqU6QfI1AAj/BExAMEOThkwXto/Y6tzxcf5ju+59bjq2FYUt4Id4KVersmA0iqQA5RrHXMg0uqhqRIC8W5FnJwi8A00GgJvZxKecdlNi4mmxCaXVfWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781624680; c=relaxed/simple;
	bh=44GbppVY9g5cV5Pz9TKezJ5i6TOvCL+U0t/ZkjWZOpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHll0Xnm35YmlYODrUD6MD9oDX8rSV1Ut72Wub3tTEQt51yfeQ5ZBAkvFso+olHNWRBzWRRsowLK5o6bEhHsq9LaS0peNXte0i/VKk4gqL4lEwNkuFnWySx8rzKHHEdq67U+lgx72T57M5kLMhBg+XV1xRjbOctMvpE0NAUTCgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h64hWi3F; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697EA1F000E9;
	Tue, 16 Jun 2026 15:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781624677;
	bh=usxbDjGoESOwF/+qHUomOy5eE2TAacfJqrUyEzlRYYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h64hWi3FuWxHVNtkblwYPl6I6tp+AGgfvd+j/5ZXO6SWUBnYpV8z094z+MhO69GIL
	 xoA4GxeAbR/v8ikAtXbCLTWIDkOQY9thGGMh8Zfc+R0QP4QYU0Q70LwFFRrrDPTk12
	 qpdr3DR7P8ELlTN+AYrQCiOUpM3pQXuE7t/5+kJYXtFHNMxhsWMKFJxe6B8c+9KJlQ
	 0aymLN72GEarKHYgnVTnrtCRKi29Xmwx4Wa7jXY5cAhkv2JFybOmj8Nw0hZb6T02wZ
	 1I7UDIO6YkMfJ3JvcYGuQO3WLncoDXKLtp00/GM3qEEyT54LEs+xDANYbqXNooi/uH
	 IMobvNzQUyuvg==
Date: Tue, 16 Jun 2026 16:44:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3L support
Message-ID: <20260616-velcro-collar-3e764c6851da@spud>
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
 <20260616104459.410743-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K1ZHmlGF1Q7eZ8/m"
Content-Disposition: inline
In-Reply-To: <20260616104459.410743-2-biju.das.jz@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34086-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,microchip.com:email,spud:mid,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6247B6917D7


--K1ZHmlGF1Q7eZ8/m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 11:44:43AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Document Renesas RZ/G3L (r9a08g046) USB PHY controller bindings.
> The RZ/G3L USB PHY block is similar to RZ/G3S but differs in that each
> port has its own OTG controller, whereas RZ/G3S only has one on port 1.
> To reflect this, RZ/G3L uses a regulators sub-node with per-port vbus0
> and vbus1 entries instead of the single regulator-vbus property used
> by other compatible SoCs.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit description.
>  * Added enum instead of const in the compatible section.
>  * Dropped regulator1-vbus and added a regulators group node.
>  * Updated schema check.
> ---
>  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 49 +++++++++++++++++--
>  1 file changed, 46 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy=
-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-c=
trl.yaml
> index c83469a1b379..12da48d069e5 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.y=
aml
> @@ -16,13 +16,17 @@ description:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a08g045-usbphy-ctrl # RZ/G3S
> +              - renesas,r9a08g046-usbphy-ctrl # RZ/G3L

Looks fine, other than the fact that the "- items: - enum:" construct is
the same as just having "- enum".
pw-bot: changes-requested

Fix that problem, and
Acked-by: Conor Dooley <conor.dooley@microchip.com>


Cheers,
Conor.

--K1ZHmlGF1Q7eZ8/m
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajFvYQAKCRB4tDGHoIJi
0qVOAQCx2XZXiGdizSgiFt2qcjdpFeCmQ5qYqVIM9va9BqBsBQEAmCrP8/MY9eNV
wuXhDP6/KDhE06HLXzuUBiN5H68PHAk=
=WVnf
-----END PGP SIGNATURE-----

--K1ZHmlGF1Q7eZ8/m--

