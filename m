Return-Path: <linux-renesas-soc+bounces-32832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NEvKnSODGpCjAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 18:23:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C3758236E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 18:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC97F313440F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522D5403EA4;
	Tue, 19 May 2026 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Vn1fM7JQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E971403E9F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 16:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207023; cv=none; b=dGHrgmocNHhDzom4lZwSROIaKqtSP4uhrN35IucY1aDfXp2gqbOVoDWamfC+t7OCWl8wfG0pFXf+E9Z4Ab84/b0Tfeab5UdaDPKkf0Ec57eTr2zFRWx1vi4gnDGT+IUV3/Yd4eWN6ZsD0jBSU/U0jOU3CB3eaFBIOic30dHKbTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207023; c=relaxed/simple;
	bh=QGO6ZfiMPGpYkEusH+CHryM/I/sLxw3HcvG4ZbuMl74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKYuPTKcJvmPGTI9m5jhSTdeep5yQVr/PI7R5sQJha85z9smqo7UL0aqUIQ3p8ZXPM/VANBZObqMdwTIIzVxPvXdMHi1EK4gzXG7G4CTFA0q8v1YXnu6gLJVqGiuTw2M9JIT/gfqeky3hLVw11FkYgtiBSazZdvoSk8E/4ZVJZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Vn1fM7JQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QGO6
	ZfiMPGpYkEusH+CHryM/I/sLxw3HcvG4ZbuMl74=; b=Vn1fM7JQr++kWoOcMfVS
	oxCJhc7vv/Pl11yvB+3hizdloWg6BbC6jmFhRbjP7wlMNJc+AYdMr6p045uoKAXr
	hi3FiMQoQJmQBQlLDqz6qJzyzYe6CWDPqC4ME8WY4bH7HNGJqBb1dri4FxHtDtXf
	hNlMn1CIQ0osWJznqyXVAkbp5P0FayqIUFSwgbK6IMi0LE98UZHl18MNF8KbKWch
	z3o5TL96hWt+39YCfNtdAA3Rt3GnW0bDgFNOzWO67Rmc2f3GDRTQETNjn3pZbh6+
	WtDMuFuRWByS+nS6nG5B37xFXGIu/URQxJX+lMmAHsdrPRalQIX54Ela6sdluAYV
	ZA==
Received: (qmail 333791 invoked from network); 19 May 2026 18:10:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2026 18:10:19 +0200
X-UD-Smtp-Session: l3s3148p1@tR5a6i1S0sgujnsJ
Date: Tue, 19 May 2026 18:10:18 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 3/3] mmc: renesas_sdhi: Add OF entry for RZ/G2E SoC
Message-ID: <agyLav6BH0lH9r-N@shikoro>
References: <20260519135342.623943-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260519135342.623943-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8sYd3AWRBuzJ0+3+"
Content-Disposition: inline
In-Reply-To: <20260519135342.623943-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-32832-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sang-engineering.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 29C3758236E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--8sYd3AWRBuzJ0+3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 02:53:42PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The RZ/G2E (R8A774C0) SoC was previously handled via the generic
> "renesas,rcar-gen3-sdhi" fallback compatible string. However, because
> the SDHI IP on RZ/G2E is identical with the R-Car E3 (R8A77990), it
> requires the specific quirks and configuration defined in
> `of_r8a77990_compatible` rather than the generic Gen3 data.
>=20
> Add the explicit "renesas,sdhi-r8a774c0" match entry to map it correctly.
> Note that the DT binding file renesas,sdhi.yaml does not need an update
> as the entry for this SoC is already present.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--8sYd3AWRBuzJ0+3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoMi2oACgkQFA3kzBSg
KbYYhA//a7MGSZCp2TerD0EW8fpXP71MjPoHPJrQCXxxTYZ6cMR20e/VZQKDaMlO
sXLNvoPRaul4d4NjEdcN7AAOisledH1jpOcK9F/tda3FmSPJDwtaeRkXvYr1e5uI
rIDCiEA0NCQ4H4K8d70Xe/BDIB4jH+ba+gmSVnYHErFX/zT8kasjGTkyPT2W09Gs
5Gn1jRE/t/u9EpAcNYQE7yTpAB4SU3CLyGfmqbAI4x0i0sEYe85RZs5CrFWJf9W0
H0/lWD3DfDqtM5L+O40dDac/sUsKzLdt8cX8ztNmSlRJ/QkwFWr+C8VmhdQU477Y
o8VtY60MLN8CvlUZ4JDqjS2XMyz7xI4g23GEzhmNPGcPANfEVmOT2s/w6ypnqUan
hkCYBfog7vNGLQT5r877J1+4IlcvGuJ+P2CG+4GFxOUqjWk6wqov69XxSSDuZISa
CS2HjWOBaA6KBnZ4R1kEXNMajzzVr495r27UBxjOO9v8LGKCSjE/Ea/A1urkKyVf
7xEF5//XKQCpxubYM2mt6z8E6Y45B0FKjhwlQibhvyfBMzyEwx45ASc+hSWzx0Sn
OvMxeXHeXZ7lrGDxLeSX5mFPZEidNBEBN2HWf+kJX2K3PKrkwPsVRU3bkFjOCasU
NSYUyTAGZVnDwUZapVEqZZzJGY8cgVTf8/2N9ET9M4QFeQxz2UQ=
=xjf2
-----END PGP SIGNATURE-----

--8sYd3AWRBuzJ0+3+--

