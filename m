Return-Path: <linux-renesas-soc+bounces-24513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 842CAC53F1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 19:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C69884E1165
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 18:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BBE34C81B;
	Wed, 12 Nov 2025 18:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QNrYYnTN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BB7347FEC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 18:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762971962; cv=none; b=EzuVUuGfLNIjOJBCaeZdtWYbj7Uzf2Uf7catQ+cmYUL9MaydUyR5UMx1ULq48+r57vh1Aq79gHWQ+XEmcEibCmkRAy0ClzZXuvNzbHjLd4CO1LKBm9AawB9FnnTv/i5yVdwdtGQlBO7xy4RGx7LcyizB87TqBVyjBihXkABBzC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762971962; c=relaxed/simple;
	bh=tYuOj6XvOOt1wnGqPr9xnVloDTQOoFLVLAZhCLnAkEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d01r2cnJgCu+Ogf559aVit/LrK5SOuzXASxH6c326OBr3iPh8L+HBPYiCbgN7S0SRtOGaRPYt+WQKtYB4hPiQO/9fNWWPZKCj8fjSt3YExSp6XxKyKxRxJKn1NwWVhpcMXWuJGEd6TDy81AoFheiOZsspMUa1MhNlWyv3J78sA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QNrYYnTN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=tYuO
	j6XvOOt1wnGqPr9xnVloDTQOoFLVLAZhCLnAkEs=; b=QNrYYnTN/2NMvuhNT3CX
	KwVw4FQBNwxblZ4zEFxp4qkeTAUhN8ZYZoTZbfy81+UJqtHsv+46Or2bLD1eetBl
	POthH6wm+AuuYX1QeYCztX095Smz2i8nmOwek2dIM0pVYfmNTKsQ4fm9ghLFlEy/
	OCG0eXXKfOJUJs4KHmzWcwbt0iJJwjvuid5MW0Yt/uu7965Y9GyYRMe5EKEspUI1
	iieOznUt/cWJdkNYy/hvBmuVMfxHIG4tG/DNO1jmOeqND5bJBZjPvST+9ir8DJzR
	V1LKmtGpJfV4xcpFru+jjZXCgql9LMjojfs+hp/vjvA+TcRHnpF7+0bxzeaBYkP9
	EA==
Received: (qmail 1598130 invoked from network); 12 Nov 2025 19:25:50 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Nov 2025 19:25:50 +0100
X-UD-Smtp-Session: l3s3148p1@iNPS5GlDE3JtKPOv
Date: Wed, 12 Nov 2025 19:25:49 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: ulf.hansson@linaro.org, p.zabel@pengutronix.de,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 0/3] mmc: renesas_sdhi: Handle resets
Message-ID: <aRTRLW4bCoZMtCaB@shikoro>
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
 <8c654a1f-2513-4afb-b33b-fabbafbbe845@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ehbEPmv1UY7PdI5c"
Content-Disposition: inline
In-Reply-To: <8c654a1f-2513-4afb-b33b-fabbafbbe845@tuxon.dev>


--ehbEPmv1UY7PdI5c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Gentle ping on this series.

I had a look already but want to test this series on R-Car SoCs. Which
tests did you apply?


--ehbEPmv1UY7PdI5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkU0SkACgkQFA3kzBSg
KbbDgg//UjGUMzjNbAC6S9T183uTV/+MBPBzR5AVluhhBmzd0aSOaX37olRdkPzt
Oebz7JVzKpcWh1MaIgBDrWRb92YCLz8Dip+F7dVoqW+iRdl9zQ4jZC7Ogy12gIPe
KrAegneMSVYAx7anoSfFj5JMmUh/YwQrzjOVevXcaVDtQmFvtRb+QIl6p4yJXIGB
ZIxlnvJHw8MX/m/lmlr0wpOyslE7Ms5bnne+Joo5Elt3hdN6CvnvjaF6opDs/GSP
vQFI8YwHH8qZjHE9x+narYlkx8idJd3BGVl0qb4wfN0pyyApUk2qbu/LptpIbPPo
Yb5m69FWqshDz1vIs5u1ZW22LTNV5mrkhIOUi7wytVLnSpGbTgTSKKqI1EZerrXk
F/iroK1JgeWcXafIxKqA6T8GRXaeKrd27kCtV/yhpmK/GqhWPsa56c7iKdSFJm1Y
Q9NYeCLnrhX7OYPIDtMnGUQ79jm+3XeLz3eWjsvBmxhSzxyR2egW8opuFaM8PYIG
THOCtQ/0veRDt27pAGEcWwpMLR3y1SLFbZvtRuqJrT0BTL89Gh2teB2SQcqYKo33
jca6Q3zFvZxnM4H7G8Y6JhsnMuLEAx6FdFTU9pIMYtMoPmxJhBhdnCAchHxMNeae
JgWVVBiPUG9KPbcNQNKjy7l0/mHapI6X5xXySRlnvgzs/QsvNgM=
=42X/
-----END PGP SIGNATURE-----

--ehbEPmv1UY7PdI5c--

