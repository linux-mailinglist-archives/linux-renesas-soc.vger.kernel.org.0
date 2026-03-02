Return-Path: <linux-renesas-soc+bounces-28658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHcBAAnDpWnEFgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 18:04:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ACC1DD789
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 18:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BF1331902B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 16:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B69426D02;
	Mon,  2 Mar 2026 16:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="f0SLSt9W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63110423A64
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 16:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469957; cv=none; b=apmPkuPGynUqfqVcCzjYHN6rT9uLadabief0uUfyi3HLDnzCCCS6SpQF8O8D8plWW/kPwiFrxcAxmBVSaA1y25CAauh0jpEcFvX0F6fPQzrbXKoCE6KrGl8g5vqwVhiBkTtYoLVKtlb4TLQx6H1YfC+iUqgQOGL6H8zLQ+fvMlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469957; c=relaxed/simple;
	bh=IY+pADVyOt4IdaEW2ITv8LOxR11XszCFtF7QuOEJw2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKifYGLoR4oIXw2bZYOMoGMMxngGBOcRoShLEb58UK9LXVKJPf8N2az7hXimWDOUrE3WOgbSw0U0JtTdK3oh0KAxLIolhWR50XSIW7adiFGh1FiX66Xsm+Hn9QWXX7jFv9RV6t6+lt9Mba7tDWb+/BpSaTv7P5RWrsbtCCUWH08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=f0SLSt9W; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=c4v1
	pZVcK3gfnjvX6rdgcZ/Gtv2nmLUn3pkGZ+d3xac=; b=f0SLSt9WWEJrwyK7E+3d
	vRthqUhVGtZ+I8dHZKJxLCaXsMoYHMGFRVFQCuySY2HL2oPcMaM+EMd8zkbfFI//
	utxYoG9ScUAtdHxvz0rH2deoYmaX0XD1FRC9rS7FaLjnmvO2Qyp/TBhdnYr7Lb9W
	FH7IqaqOEbp+M5J7d1kCPnJKHpt4HIax/TjG5JBb0Inu2BNifVPkYAxkpDClEDP5
	Xnvjiiw0j4Ki7Yw+dHJPaFz6PoHMB2Og5NS8IYbjwSW7h9QV/tZZZXukTzKBRmJ0
	oPF9BDIwxkMjhIiqFlKDiJybcTpliFh+Vr15mRJc2RAz9gePGjfD23+yy50cJKHy
	ew==
Received: (qmail 2759963 invoked from network); 2 Mar 2026 17:45:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Mar 2026 17:45:42 +0100
X-UD-Smtp-Session: l3s3148p1@ELdIUQ1MPCVtKXG8
Date: Mon, 2 Mar 2026 17:45:41 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: phucduc.bui@gmail.com
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2] arm: dts: renesas: r8a7740-armadillo800eva: Enable
 SDHI1
Message-ID: <aaW-tf_lagkvPnq4@shikoro>
References: <20260212073819.41304-1-phucduc.bui@gmail.com>
 <20260224074532.60046-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q7wHeybMwUCoAZn8"
Content-Disposition: inline
In-Reply-To: <20260224074532.60046-1-phucduc.bui@gmail.com>
X-Rspamd-Queue-Id: 46ACC1DD789
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28658-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


--Q7wHeybMwUCoAZn8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 02:45:32PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> The Armadillo-800EVA board provides an SD card slot and an AWL13 SDIO
> interface connected to the SDHI1 controller. Routing between these two
> interfaces is controlled by a mechanical DIP switch and a set of
> multiplexers.
>=20
> This patch adds:
>=20
>   - A fixed 3.3V regulator for SDHI1 power, controlled by PORT16 (G2).
>   - SDHI1 pinmux groups for data, control, and card detection.
>   - A gpio-hog for PORT6 (J5) to control the SDHI1/AWLAN multiplexer.
>=20
> PORT176 (N21) is already configured as output-high in this DTS (via
> lcd0-mux-hog), routing the SDSLOT2_ENABLE signal to PORT6. Since the
> hardware includes an external 10k pull-up resistor (R94) on this line,
> PORT6 is configured as an input to allow the physical DIP switch to
> determine the routing without SoC interference.
>=20
> Both configurations have been verified:
>=20
>   - SD card (CON8): detected as mmcblk1, high-speed SDHC.
>   - SDIO (CON14): detected as mmc1, high-speed SDIO.
>=20
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

I don't have any schematics for the Armadillo, but the SDHI parts here
look good to me.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--Q7wHeybMwUCoAZn8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmlvrEACgkQFA3kzBSg
KbZOVw//Q988XkJxW2Ccg/43h+HGuAzMancHAAX+v7PzK81HwYDWWHOaAoFno17h
UwHY5AtByRlkWgXpv5KMgIDmfNYWuT+rhHZJTtlm9m3DNl1NCB77kI13QX2JNQzX
UPN5JjjedVAsuvLwyRur5GAkLJuC7Sd+rnPC2q8rizRMkV+DMcn8UgBpKUHWfPiZ
izZSl6MidBfz1KxWCMvYk4HjGdLM11HtVXcr7MZA9EN3Juf4YjYl3eV0MEkSEjri
dGhN8Etks1wfiwvKcN691R9ciZjRQSEmnX9QLtLMBl2oi8Kqp78hv0KpbdGzEarS
WLwiOks444mpXDTXyyFWSJo3H+fBNcYWwYieSfkowKcuI/4BsR1aJbc7Ik+OVgfJ
356la+xEWGIg78hB0XmQ96FT6UZguseetCVbjU1tAalqcy22pUExAbvzwkTKDlNv
Bonbv1ybva5BAhvj66+u2e+CWZRmORKOx0rC0+HVfB4nO9Q2HJlnG/6dTMCdWxta
cek8GLMA+pmBzhFiUSyMISUhWMGpt3oJ7vTVefysg/I4wJQgovs1MiHG69wfrHiv
T4al8EvRzW7dfQP42z4sW9QKaXqZkHdWqJWX1/QFsrYs/wPyztK1jQn/LOP0ax2M
56tgd9hy6JnFAzK65op6wVaAWM0+r0RVLVljBTQwrNLAUfL3/GM=
=QphJ
-----END PGP SIGNATURE-----

--Q7wHeybMwUCoAZn8--

