Return-Path: <linux-renesas-soc+bounces-22150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8A3B91A67
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 16:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A69D32A51B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 14:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0281E8323;
	Mon, 22 Sep 2025 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="I2G3SdfR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8007733991
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551022; cv=none; b=gqTJnFlG6RujxQnO/Vb3Q+aDoGzVGLZTf5QZLD5Q2McS69W/xoajBh0v1+NWenoX2Z1ryuHu8zihhUMUHoVXQlhzH8wc/pFrodhu3qqVrUlnwhbJxyI3HrD+WHz9rDNpPkgGTswEDjQgJRSjCJyszM4KCSSZMGrUMuOe3+4W8QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551022; c=relaxed/simple;
	bh=YJhroftolpyyHXdNnrVgkuQJol/kFCNmyqTziB6Ormo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+HNVqbR6NEM3GQLrIka3G5+b1jXFSbz6LnqI/vS23fRbeOHczCqlLfXDLPxoDXtjxmufxPH+JFR7mDaHikLuWHDNq117o0DHz/C3Lifiyf/f6IZrW8uAkbcTrRQcQLifQoWoF2Es5F1VGMJj2vSaIL+7bS5HW3yi91Wa8n7i+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=I2G3SdfR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YJhr
	oftolpyyHXdNnrVgkuQJol/kFCNmyqTziB6Ormo=; b=I2G3SdfRIBHHOYxI1+A0
	LGrtADt4g3CoEQhGuNTKTVO21NxC3a/7gdhYWlG0LsoXBNk4pxS0VvsjOzSjiJiJ
	eCmJrTCT9VP7j77H32vN7xKadn7qvntmoPv+fZUUTpqc2kYe5WGdVo5vJYBel0Bm
	OocDDU+N3q1knmhQ8e7MS7+1AcWGFnIscaGDs5hJipF3UNTFQr2WZtSwJAnpqPGT
	f0heakLKfU2fm00WLwlgiuaiaAMSUu+AIMVJCo5tyS0+Xxz/dPx7AazJOEbt0MML
	2fKYlbMLEn7pLyGorTSnvUT+Lc+3z6dkiOWCBgyTpaZnFbe+w+r7k8NZjVkbMWbK
	Pw==
Received: (qmail 760478 invoked from network); 22 Sep 2025 16:23:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Sep 2025 16:23:38 +0200
X-UD-Smtp-Session: l3s3148p1@xSi/kGQ/CKkgAwDPXwQHAL/S9V79e5yL
Date: Mon, 22 Sep 2025 16:23:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
Message-ID: <aNFb6S1WApJl-k45@shikoro>
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
 <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org>
 <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
 <9dbc6022-eb97-49af-bda7-1a7a8069609a@mailbox.org>
 <CAMuHMdWuCyq+jXSasGdrMOSBP-XmDG-wHsBaXUMTGA3mtq_C5Q@mail.gmail.com>
 <aNFVv_n7y-ZmblX-@shikoro>
 <CAMuHMdV7QvQFs_wXYy5B8fyO_TT2-ksHtfRKQXrhe3ouQpJALg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eAoN4ABADDPrhkGz"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV7QvQFs_wXYy5B8fyO_TT2-ksHtfRKQXrhe3ouQpJALg@mail.gmail.com>


--eAoN4ABADDPrhkGz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Can you trigger an issue by removing the polling, and does Marek's
> patch fix it?

IIRC not with I2C, but SHDI needs this as well and there it surely
happened during development a few years ago. I need to work on SDHI soon
anyhow, I will see if I can reproduce it.


--eAoN4ABADDPrhkGz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjRW+kACgkQFA3kzBSg
KbZrKg//euqoUL2fhKnfmNEvryG9/r8fVj9/TiS0wP69RLDYKXGWprKukKA6slVD
wPzmHQDqa84URy3nCoYCxiPwvMXae7ly/zvJ8XCfx77XEEmQXg24fg2IJtpClyIg
szX45QxkPm6k8WvvGkc8mQC7pOM+KAA8z6RrcXtl/SQGfyBhkAvDNUe2SyBoNpDX
z7Hes1wYdeTQeDQJJKZIUZhjQId2eQ8Zrr9Q+34JWLYsDSQcCIHlEHAUP2VJsoPW
FpNXzWZxSFVUDnzVJQ55Q8/wmRcs/qp8vKBnVNEdamd/7fxDyksAfTSaHC/xzj0E
c3D1INAFXYH896XwPzrRYQE7MuLel6dEP4w8huG/n1ja6wQPAFp5RcnclsF+mFze
WOtco05/hbXZoz5BjFvOv2zpSi3YXZbrRAJ1+YNt5oxSiAB7afSI0431iN6komq7
805gNfjvbfkEq0YSMDXiyyjq6+1gQPdZCthxxoRTy7OLtQx6KL52AbXxPDRkJN6r
0B/Vu9vyXePphxw9Dq/aCfbl24MV/sNL9LFWNlZE+CGIX0pB9piZjF/zoyjBDyPO
06BttsKdwl1F2NX/I06ZNCLHop9KCd7F6qRgjJeCN8WZIjr5tYqqxD3YUOLzh+2W
hCtMRJliVJFjDTI7jB41auWvciL1PLJ4WBeQD1d4IlYfrWYXIPs=
=CZXv
-----END PGP SIGNATURE-----

--eAoN4ABADDPrhkGz--

