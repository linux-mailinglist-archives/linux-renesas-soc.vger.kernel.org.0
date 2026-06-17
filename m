Return-Path: <linux-renesas-soc+bounces-34159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k9ACInCSMmos2QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:26:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F10C6699B16
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:26:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=UyKTZ9sp;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F07A30022B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9563F166E;
	Wed, 17 Jun 2026 12:21:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054503B4EAA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 12:21:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698879; cv=none; b=WjAykrApJF6pvWEUjr/zegmsiBATRe8DpognZzclO082FvTVTR9DthZSiNJ5Gh9tlQWVX8TmsKHI/DyR3nNbU5tQAayQYGzpm4FY4oPKh0GF/Bv5oQ8dysHdPYx6R7lDKXlJSQKSMcE8EpemV+LjjZ6+c6Go4JRSRypD3Uf5UnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698879; c=relaxed/simple;
	bh=DOJzyoPjoIQaGjtQIJ7B/hL9ICdOm7hNrKaUaI6NCxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVed7nDuhOI0yIM1bT3kOgoZpPU0QuGHQ+yClsH/iawXb1nrTKzw6NAubstSCWFs/k8FJ7iCqlEfuSUJyseZWiNZ9zxyiPyOCNtovE3+FMWtPqnSYX6cIg1oIeiecNxP3d7RZFryetSkgKVOPoMUec6bkJUsWaunZLT7mPNlZgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UyKTZ9sp; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DOJz
	yoPjoIQaGjtQIJ7B/hL9ICdOm7hNrKaUaI6NCxg=; b=UyKTZ9spYwsQ70NQ3dvG
	wXAB9Nuu8IrmGqTQUrrtqGM8+rhX/su93ICBm5vMbikME5i/5pdrkWcRn92i2IlW
	MleZePv/SrOO7O0j8FKubWJUd8ksn1CqBfXxORyuGhi9SeAMf8+phQ1vzXmSyaYn
	2OD4ZpekWF2JGTYCgKY0TUM1nPGjkRIdZdn2DgkXG8L0YYEPO6azgKgTanmh1ycb
	QZPVZwGtxWvq7cXH2hzWjk3FDVVr7Aiypeu/azOqcDqgT0ZZR2UegewZoLboCze5
	7gO5HyLmRAkk1XoPo2VwCqAy3MukGfEWrxhCntP+UKHRTsyN89IVWNsxwlux4Qy+
	GQ==
Received: (qmail 160825 invoked from network); 17 Jun 2026 14:21:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 14:21:16 +0200
X-UD-Smtp-Session: l3s3148p1@i4qXGHJUYNYujnvI
Date: Wed, 17 Jun 2026 14:21:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju <biju.das.au@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v17 04/17] mmc: renesas_sdhi: Fix whitespace alignment in
 struct renesas_sdhi_of_data
Message-ID: <ajKRO0lgr_99tr34@shikoro>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-5-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pspjYZpyJz02snC2"
Content-Disposition: inline
In-Reply-To: <20260603065731.93243-5-biju.das.jz@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DMARC_NA(0.00)[sang-engineering.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34159-lists,linux-renesas-soc=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,shikoro:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F10C6699B16


--pspjYZpyJz02snC2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 07:57:04AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Remove extra spaces in the renesas_sdhi_of_data struct definition,
> replacing the tab/space mix used to align tmio_ocr_mask with a single
> space, consistent with kernel coding style.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Should be merged with next patch IMO.


--pspjYZpyJz02snC2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoykTsACgkQFA3kzBSg
KbaZ0w/9F9QqAQJru8OWzn1OfQ314+h84S5pgYQiU7ffhCBndR2593/jFQoENz+p
ipE5tlQrakubjQs0hO4sEZyXfD8LFOCQPXii/KSklhSwROH7lMhcHRGfXc4eu5f3
pyTL7ZSWkN7wG6DaD01XdDARAkV3gSs7LCIhhaeoR64k3NoJaoKtHy0yyGkcZ/Wh
IHasdaqzfIaG4ZQxr+HIupwaF5n6Pa+Qcf9jRPoKKjoKA4o7jNEhw/r/8sMzTllS
eyX2RV+t+QjkLeCPco/XM3vX1cjxUkrSOtkGp8sfYLE7W893JvOYQS6KRf0Zhujj
zn7q4k3apW2sw8AM6SM77Org9P29teLCro0TP+T+RGgZ/sCrP6vEYEarEwcObLUr
jqLr8wGamk5V9r42z2qwz2Z4fNX74pQm+bX1gvxOmljgoQ83HzZ/9W4eCbRzivH0
ZTwFK7/UeSBwfDLu3jyPg09L2YKPJ2zCctaMzpxR+LStOk+dgvkI+pWq81q546iM
x/XgiXHDf4N7el3bduft0KMPCiqHCEW9y8GL9BFuskMJujL9d5MTpyxDWHtmIyHb
oE+5gb/Db0+n+qjwXKS+iugAtZHnYWxSSCBWz9wsykiwsZhIpGgSFeNzVTQ0XUuH
+c+vDneLCnwF5RM8JuKSWjdRzELjQaaJR0ZqIOyBzHyCHhHDCHQ=
=LQ7H
-----END PGP SIGNATURE-----

--pspjYZpyJz02snC2--

