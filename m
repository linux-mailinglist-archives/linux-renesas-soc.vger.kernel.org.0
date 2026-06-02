Return-Path: <linux-renesas-soc+bounces-33439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VLmgGOEeH2pegwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 20:20:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7A7631023
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 20:20:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=j4nUa721;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E86F302627E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 18:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23372D2382;
	Tue,  2 Jun 2026 18:20:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A3C31A576
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 18:20:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780424414; cv=none; b=KeD8oG7qh+evFWJiYP1XOT8uz9lgfirt+WNgLB+QF3qbt2C5GM2axxuduEEzw3Ka85RCZkYJKM/CIXGfvZW1iT3pLzU5TmU8z/4ufOl4l9aSjv3z/ubjm9MSf9j/Ohfuq7SlfxB9gG0c7Tl3EhNnlWBBlaKiyFx7BWN5oVneAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780424414; c=relaxed/simple;
	bh=d6b4cyFsfPXTRT9lZba+sdjNjulkiQKqJacuuZy2VXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMchcEcQkH1Gk9SC47idKZUxoIy4F9xuPukLEkPWyVM6zdnIjXadKjmPznBD6lNdg+xhIcDtjCbbO8uaSUybnpJk5lrJWKDW4j5LnWpczT2a6KbpuFaFx6uev6h5eIPebaKrACU59CXmsWLNSZQ7qMBajtkf48aTs5rvvGvsLYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=j4nUa721; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=d6b4
	cyFsfPXTRT9lZba+sdjNjulkiQKqJacuuZy2VXo=; b=j4nUa721i402Iz+139Zy
	2nKCA7T1qxEZY9nUCz8des1ohsefcC62haKl2F5LaskFX0OEWuo6FA7jWBjsMf1y
	th5c65kEQTrL7ZTjstxKBHlTjtAs7LCHa/YPDSfDVA6HDc7uAJx21CmSPa4oBQKg
	jGsPyl53yMOX5qPocIoU0YERL5Mm4FSiHu4wQkxep9nbXFmrRxrJZpPS//9fNP2U
	zNhLNqS5BTl9RGVqm04N+hCvD/Nx9bDNzkfZVKm4FgxB9Q4us2M6ppu10xKDbH6d
	FI3aBdo05noYkUNQwUtJj2AGvm27fYI/WWFXX5L0bxTJ+U4DY1mYnxfEMo1aPfPr
	yA==
Received: (qmail 2987235 invoked from network); 2 Jun 2026 20:20:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 20:20:01 +0200
X-UD-Smtp-Session: l3s3148p1@CKICXElT4tgujnv7
Date: Tue, 2 Jun 2026 20:20:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] arm64: renesas: r8a779g0: add MFIS node
Message-ID: <ah8e0OHtRoUuezVh@shikoro>
References: <20260602153504.302388-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oWn2hnaWJulllCVZ"
Content-Disposition: inline
In-Reply-To: <20260602153504.302388-2-wsa+renesas@sang-engineering.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-33439-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,shikoro:mid,sang-engineering.com:dkim,sang-engineering.com:from_mime,sang-engineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC7A7631023


--oWn2hnaWJulllCVZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 05:32:22PM +0200, Wolfram Sang wrote:
> Describe the MFIS core which is used for various tasks including
> inter-processor communication. Interrupt numbers look irregular but they
> all work as expected on a Renesas R-Car V4H SparrowHawk board.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Damn, messed up the ordering again :( Sorry, seems I did too many things
in parallel today...


--oWn2hnaWJulllCVZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmofHswACgkQFA3kzBSg
KbYRvRAAhezPXHcXAktrYqmgUF0CYeIcTpHsicaLDf//BioNo3RiEgFMef4VdFwo
Fo5Msa6m0UuMkagDyJL7SAYLbQ1yP1p2ubBbWcw6OThBIwRFFuFHhK8TBN0pMioS
xzdwqYeWiHYZ8Jmnrv1AaScDZS+D1UGJkkaR80RvcArLO7ZLYJsqlcx9e/GbaAFJ
cQWAbHGWqIXpJKj4KycmV+9bIzLxIYAAQHeO8HD+zd5SUh+Lo7+TIFWynxhr0qLU
QMdzHkbZbL/IGRGLtV1igaPXdHJ7Xv1h54cucSEzcLAY6hTLKT2iMy/zVy42pqNw
QaKu3KWTFYPBEiHImKaF2okFJGj1W9DRS+lj4OL60j82C16SG3MNM7DmzkIu+vro
MIBJeLeulmEOfMXQ0H2X1RCb5LyFcT7xRIKe5X+49KeKJhKpaKeVu8vD2F8GFTK6
hTOrxVUaK5etnUktoTOHkyi06lJzmIlLhLbL9++fXtz/Z6WLGFPr5uuJ1xwSa0qx
4JGFddRMWJieER8xwbHFYJZ6Y6JS3S7OIoNaf2xUzZubiOBc4cL/Fr+WElvgXlpW
RJlAeQ6cJsyaSbIGUDP4UC4anrBPbPR3AU+tUokNSthsol7BnXoTG3xHyMG77NnZ
ejUTdH76+8vv2pwIijjM+aPvDoB4PoyLxCqgbTIDkJ3nm5X+cRE=
=e6OM
-----END PGP SIGNATURE-----

--oWn2hnaWJulllCVZ--

