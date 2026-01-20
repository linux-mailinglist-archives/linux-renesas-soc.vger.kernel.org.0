Return-Path: <linux-renesas-soc+bounces-27150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHQVLqDub2m+UQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:07:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B424BF6C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 281F550DF9F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 19:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7ACD3A0E84;
	Tue, 20 Jan 2026 19:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gnz6b1xg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2E739E6F7;
	Tue, 20 Jan 2026 19:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938641; cv=none; b=iHZgeMFw45bcGLQGWcpV7VhKEFZRPr+ldyetxk9IwsyFyokZMrGftOnPRFg6wwoCkZp9GmUqm89T0uCLPIQzbgbXYdmL7aEiJcbh3M5RlKQt//v66wfwG4xH+bttLleNRsyORj3IDH9RvUwNzH5jW7IIbYS8x3fUF4pYoZGXZ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938641; c=relaxed/simple;
	bh=bcr7h1HEx/p1F9ZAFbA4WhXTu3jDw99iIyRD5cwF9Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOoUFnF6S9WW6nJrIN0bE0XwLSr9x69t5J95ogU7CSWzAvjAb/C7TA5cWZfVObRxC2Msr316KezBT4wwTP17RU6HLLqqo2QGcEX31LkbnBsmsac/eGfMM4jiW5eYrGwsltexENpkDldIzJZSDLR5OSBv/hu+7VwFtqpDzey9NHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gnz6b1xg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A222C16AAE;
	Tue, 20 Jan 2026 19:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768938641;
	bh=bcr7h1HEx/p1F9ZAFbA4WhXTu3jDw99iIyRD5cwF9Pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gnz6b1xgqfUVbYUnfsNGhKK3UYjDpsxSU4+78z923hsPDOaDDTst5TGQJmy4sCpZp
	 Zyvax1mpVCNfyLPLOVipqOdQnmJM6Bi0bhQJ3TEHaoWqc/3R8F5HT9/V6pnBgqJ0tX
	 xFgiEQ0/rK/XrdZ/DdDVnHZ56f//0fcLHpq51wjQSRp15ci8Z2EWMafyntF31Iutqf
	 XZY26kniZqiI/zYgO9ItP4cyS09lJvtqElLRJbZqhNn9lmGrJ0Klx0b9MEfppotxBW
	 D4rf7V7fALU24cLFVa2caKH9+91OHF/fIhdq1aZPJGEM33GIZxik6/S55R24+ydGim
	 YXyVd/1MW6Vgw==
Date: Tue, 20 Jan 2026 19:50:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas RZ/G3L
 SoC variants
Message-ID: <20260120-disabled-underdone-c86197af27f2@spud>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
 <20260120125232.349708-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fjffJhyK95FsIJNw"
Content-Disposition: inline
In-Reply-To: <20260120125232.349708-4-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-3.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27150-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 36B424BF6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--fjffJhyK95FsIJNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 12:52:14PM +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Document Renesas RZ/G3L (R9A08G046) SoC variants.

I don't get why this is a standalone commit, when you come along in the
next patch and add required items to the list. Think that should be a
single patch.

>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/soc/renesas/renesas.yaml         | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b=
/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> index f4947ac65460..be61a71c7305 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -548,6 +548,15 @@ properties:
>            - const: renesas,r9a08g045s33 # PCIe support
>            - const: renesas,r9a08g045
> =20
> +      - description: RZ/G3L (R9A08G046)
> +        items:
> +          - enum:
> +              - renesas,r9a08g046l26 # Dual Cortex-A55 + Cortex-M33 (14m=
m LFBGA)
> +              - renesas,r9a08g046l28 # Dual Cortex-A55 + Cortex-M33 (17m=
m LFBGA)
> +              - renesas,r9a08g046l46 # Quad Cortex-A55 + Cortex-M33 (14m=
m LFBGA)
> +              - renesas,r9a08g046l48 # Quad Cortex-A55 + Cortex-M33 + GE=
3D/VCP (17mm LFBGA)
> +          - const: renesas,r9a08g046
> +
>        - description: RZ/V2M (R9A09G011)
>          items:
>            - enum:
> --=20
> 2.43.0
>=20

--fjffJhyK95FsIJNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaW/cjAAKCRB4tDGHoIJi
0gYLAP4hgPkfv97vVBE5BiH4s8eSV48OFmKnKrsM62ur7VPf7gD/VXaxcb6FEEV2
onWpxAJfQBKWZwoGXTlWoVO7a3smmg4=
=0iPT
-----END PGP SIGNATURE-----

--fjffJhyK95FsIJNw--

