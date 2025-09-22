Return-Path: <linux-renesas-soc+bounces-22146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B192B9188A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 15:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0135F2A02E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 13:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB8E30E0CB;
	Mon, 22 Sep 2025 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dfxDyNSA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E3226FDB6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758549457; cv=none; b=dXFI2C7H9CUvs0GlwHf4bqfoRfUimh244q6w6KWpIWuhy+tEO2R6d3RWEmgJ8Nf4GAtQA1e6kdWt/b6zEL1/XKcNrzruWAurCggsI4w3FgjuQgXSPj6jeEMXvewJgguO0sxrXYhYpc1TDC82NymbLEaTWbChRpTnwHADMRkI9rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758549457; c=relaxed/simple;
	bh=X05MIqk5wSS97VARVzKSo1KHwZE+xkkGZtY5mLxE2jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovGpPZuG3qgWrZrysSReGb+hB2DpAsuMr/Dn6vRspIloRrl9S7yMe6OQFmvaZdX1Cs5/4EPd4NIiKK/SWxU7Qq04qtLcWYuyWdQ3fM7O+yOhTgVVThXn/JHg2Gi6QLmexUE3Rz8LNkYz1nGm81IDqTyvW9PZUTZVHw5QwIa3ETI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dfxDyNSA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=X05M
	Iqk5wSS97VARVzKSo1KHwZE+xkkGZtY5mLxE2jM=; b=dfxDyNSARQzXHNRjXS21
	tzsp4jXhR7LT/JwUxsF9i2/boB2jZeJgVhTbqYrmJ8G2oLeA7MuBBK1lY9illUa7
	Dm4Qs4LFSNQav77pEHZABHj/HKiYoo8qjTpkpJ1DwL/l8EUt8hLJUNpmnL3LkPKi
	lsF2WZF3g26JRo4/J2kLl/tarDqZxOO7lrLxLmV/zQ6tMvEb+w9juN32Zaf1PpcV
	8R3KsTKEjS7E1tZ7bPKaK9pK5VhpXtfopGpqyAEmgJNGwPraChrrilRR/z30TbDI
	eB+HbDTjbV3/xGtGzBslWmlTHNwVqoqiMFHjn2BEFjjhmEr4TMyMosn4H6iNrFI5
	TQ==
Received: (qmail 751732 invoked from network); 22 Sep 2025 15:57:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Sep 2025 15:57:24 +0200
X-UD-Smtp-Session: l3s3148p1@oEv4MmQ/sOsgAwDPXwQHAL/S9V79e5yL
Date: Mon, 22 Sep 2025 15:57:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
Message-ID: <aNFVv_n7y-ZmblX-@shikoro>
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
 <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org>
 <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
 <9dbc6022-eb97-49af-bda7-1a7a8069609a@mailbox.org>
 <CAMuHMdWuCyq+jXSasGdrMOSBP-XmDG-wHsBaXUMTGA3mtq_C5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UJ+sjLqzSsl89P3f"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWuCyq+jXSasGdrMOSBP-XmDG-wHsBaXUMTGA3mtq_C5Q@mail.gmail.com>


--UJ+sjLqzSsl89P3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So e.g. MSIOF has synchronized resets, while I2C has not, although
> both are connected to the peripheral AXI bus...

Is this why we need 'read_poll_timeout_atomic' in 'rcar_i2c_do_reset()'
then? I have never received a reason besides "HW engineers said so".
This is pre-Gen4, though.


--UJ+sjLqzSsl89P3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjRVbsACgkQFA3kzBSg
KbZB+BAAlp1BwI4XZauhAfZusWDw91IQAHy0jo5Nmam2+u5xbTbzzFNgNmKnw7cD
SbkNrH+pkm7liRZru5GknO40oFIEJwzbYDNcL3uq2G1pcg0QTODsJzUcNYl4yflv
/whbS8ta7GfygOmOetxBa+wemSnOBIOb8PXQRq0HC26fJ1Q8U5nkP64HQ5v76ZYF
wkU/VyQOkpbAZTFifgNSf6F8h05685WUlKoB5rlTj7iMjCsk+sNKCAxZRYdTBX+E
hBIhnGpFdMU47NBhbVXadUleUq4hY04saEdkSSqAg1mlvKAICT1SwZXLaQtIixex
wWHxlHW7dbvU5GU5Z56edsobYr42VNC1U+F+13gGy1qBfFY6gFsGKsdnEmrqIAdn
kMZ3eRgS/nb5q0EotRzoKFLP8K6y1WZdHfsGqLumBmASpNWce16C3sE6apo958TM
yYYt7O0vxPke7+qszgbfWYgUn2NMyA7srT0gwqGd64J2D9IMNP9dLp1oxc+5MjHb
PLK7FxCcYbhuFDlD+aoG1iufrwo8t2q973dqg9RgXnddjcPg6nY8EZPtGY1VQaSU
s8Hhc2whAJSmMN5JGnrTeh3FZxr1yCLsfovseH3EQX3sK88bY0mDw9x00m/+yBJG
dvAIb6WUooa25kV1B6xudF4mf4MHn+np4KHuFe2/A1+oRmrKNuI=
=DuiL
-----END PGP SIGNATURE-----

--UJ+sjLqzSsl89P3f--

