Return-Path: <linux-renesas-soc+bounces-27907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K1WC9OJg2lWpAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:02:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB589EB546
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABCA230027E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 18:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F044421EFC;
	Wed,  4 Feb 2026 18:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQIsBGKt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBBB347FC4;
	Wed,  4 Feb 2026 18:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228176; cv=none; b=uiZ5NVO3Y8KxOEjiavdJeoMbURJ0fxEsHaycQyp4H/Kr+YUfxly8M53AaeoY4vKnS3qo1Wm2ZaIQ3OttwFldg/57LdX7xhCBzwM+d/2g1f76zy3cJs6ctmazbK/huicUt+DLxdnjzzis4YYIMA+ttXEZxLnzji+JKd9FmOhD6KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228176; c=relaxed/simple;
	bh=3N2pfqe6xfBpAYPrLrGmvw9vXHxNXCeXRm1pU6jDsYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERhh2CtRdFYLhj2M+f67heVhMNXNP5B5QO9zx26zTFo9qkqGUJg85ApZsfU04ZkmgxQIqYENzDSnp2hwo+FxxDxEw3M4+L6PbYTjAzpLjOh2uKOjPLcpBzLscYd4TjhsFHaUoiww2MF8yfLKwBESj+KJ1MUg2q4CeQRIrW0X/zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQIsBGKt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42C7C4CEF7;
	Wed,  4 Feb 2026 18:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228175;
	bh=3N2pfqe6xfBpAYPrLrGmvw9vXHxNXCeXRm1pU6jDsYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tQIsBGKto7TQrqyNPa5NWwOnPJ9paNFGAfzT+thVHpVSCZWGtzY40Z30pJu2epKuP
	 QDESHuaqyy3lKdFcE7kDBRMriN6GLfNUdBQNSLgWn9NXv3KBZtqFNuxHn7HEbQaBrN
	 /yRsucN74pLDGBQ4aA6xiKd6WgqvHauaOak7sfABf9ettze4FeSDDbJI1g9LNLH50Q
	 Fg/Pyuwt6au4IlvmM/Fg1uYqjssLSa7rj2znkRw/bVouj2aF5BP6Oenc1kr1OIpq6j
	 LVFiXGVNkJEue09i4R2rPjUoatPAO7KrDDFe3y6D/FBgGufAcnJHAfjrPLcD/p4756
	 AjNJDwNUItttA==
Date: Wed, 4 Feb 2026 18:02:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: renesas,rzv2h-gbeth: Document
 Renesas RZ/G3L RMII{tx,rx} clocks
Message-ID: <20260204-audience-eastcoast-9e0cf9b96fd2@spud>
References: <20260203104541.264759-1-biju.das.jz@bp.renesas.com>
 <20260204-unroasted-obscurity-c3f5cde43036@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ISdvBRMaNgKt6hvc"
Content-Disposition: inline
In-Reply-To: <20260204-unroasted-obscurity-c3f5cde43036@spud>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27907-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: BB589EB546
X-Rspamd-Action: no action


--ISdvBRMaNgKt6hvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 06:01:33PM +0000, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> pw-bot: not-applicable

Aw shit, this is a netdev patch.
If I have screwed up the state, hopefully someone can fix it?


--ISdvBRMaNgKt6hvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOJygAKCRB4tDGHoIJi
0grtAQCOvnwLubO6yowEvhZtOatIEny5u61uLmDDBtlIhdQpdQD/c5cctVoUs1Fy
nC3ll7qgufQlIAtC+HZIA6ADQaiKOw4=
=trjy
-----END PGP SIGNATURE-----

--ISdvBRMaNgKt6hvc--

