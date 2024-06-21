Return-Path: <linux-renesas-soc+bounces-6598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEA4911FB7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 10:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 311791F22272
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 08:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F416A16FF48;
	Fri, 21 Jun 2024 08:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RDY5xOPO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE4116F907
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 08:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718960202; cv=none; b=QAx96vyH6WFR9gtkY7JhHRXAEkNoC0BXP5BWIoDwI2d2dSHfz+zwviLcUvnXuen+zv7WzAJ1hPm24RPxswGJqEggyfXVIwvKbLTgAbVsVDDLiuhQMLFAWk6PArbGnZYyZQ1etRLCjlFHcGvknpV3iqip/8bQn8EvcXYXzaewGh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718960202; c=relaxed/simple;
	bh=YG9SeBLkFQwOMZTJB4dIAX9TlccwoigRFttvcpwUleQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=co9N8A/hkJytWUL3YzJ+X0ThbZ6B3O4MLMn3KiVrfFF3tz/wh8qCs/9PcjHoGZaZ9J84+fEjyMARHX7UysH2/EW5FuTmGgg984/sjdEJ1Xxklchcf7g+1dEZ2398Ndl0LiC8NOpwXE/4NnDWDR+Yrjjx6sSD7A7Od9YkJCFq45c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RDY5xOPO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YG9S
	eBLkFQwOMZTJB4dIAX9TlccwoigRFttvcpwUleQ=; b=RDY5xOPOcPVtkESBUTte
	12JOepYypaEbc8KB+4RwWSpL5m/m5kJx/YwZ8m6Tw7ki5nYsi1wRgbeOcTMKdyg9
	2rE0472hooxjUs3FwiZKWI8QG44+SusukWkP/sxvvbC11SYKQ30fFpTG+tv8LSVu
	xJcEVZpvhdDTI77r6DjJKY+ulUAjQOUIV+895MOq5VmDptM1isyElfXay7Ka0fz+
	omFkt8MyJ35MW2NUmCCdeojLBdQcOpgOhkDDAnIzA/5QpRhWvAbjW3D7uj5rUEXu
	2FKUQ4buC85sFmieU4Zl0dKbNr3RKi4fgGgQDnttOrWQTFcH1zCmLrEPXAS9ZCMl
	BA==
Received: (qmail 1306464 invoked from network); 21 Jun 2024 10:56:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2024 10:56:38 +0200
X-UD-Smtp-Session: l3s3148p1@R4P5m2IbNMUgAwDPXzjQABqqX1QYyOSW
Date: Fri, 21 Jun 2024 10:56:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Ulf Hansson <ulf.hansson@linaro.org>, Lee Jones <lee@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] mfd: tmio: Remove obsolete .set_clk_div() callback
Message-ID: <kdmt4zx3raw5qgc4qh5hegnnb2uvw3cxe77jt3vuwt2mir4rcj@4lifvk6bgrdd>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718897545.git.geert+renesas@glider.be>
 <e0fa98f138a7b2836128178f8b3a757978517307.1718897545.git.geert+renesas@glider.be>
 <7iq2xtasjbhpef4g5tfycnjdvtgjwxhjyhwgpkrhy3g34lvd6z@l7h5pihpt2cg>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o2btarnxrqglilwg"
Content-Disposition: inline
In-Reply-To: <7iq2xtasjbhpef4g5tfycnjdvtgjwxhjyhwgpkrhy3g34lvd6z@l7h5pihpt2cg>


--o2btarnxrqglilwg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 10:05:44PM GMT, Wolfram Sang wrote:
> On Thu, Jun 20, 2024 at 05:39:45PM GMT, Geert Uytterhoeven wrote:
> > Commit bef64d2908e825c5 ("mmc: remove tmio_mmc driver") removed the last
> > user of the .set_clk_div() callback in the tmio_mmc_data structure.
> >=20
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Also:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--o2btarnxrqglilwg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ1QEUACgkQFA3kzBSg
Kbbf7g/7Bm3quk4zreO6NOwXAjNc47EYE1L45dtsEFyqNiJ1WZVY8sH3gIz2uc5R
tXrHmMi8ts/fTCZUADcmaVwQAHL3nVYEGPkV8XDDL28iKiQ4ty7RgOCDQ+jSigcV
imKzziPSmCnTUc/i0ee7SXWOa/h5SeL7kmTUbFbWHfFD6Ei6SBady6zG9aTrSv2Y
EOQcdFDmQXABpuzxcCQ/kD6Mui9Ys7prgvbhFQFfCoORnxcCCM4KfNs4tg4nb0F/
Rme92Ge/2hEFwVDznvtgzIv0+FBwe1bh5R65A+39meyaAwfWQhrZRIZIZQGmlP+s
ILAtGq+0dT5xjfKhnpdqKkMNKXhPgSSkSEM5X3MUIBhuu6EDn4LwgGO8lv4jdTfQ
oyY6gzibiisoP+zQWIjDHlOqMADgB+txlzKUkeb0r4feanl/8gOgIioIKGCsH42E
ESx2yxb5fyQRinqmbYjQRkdsyxPMQvx1veruOLkDwpOl+rwSL8etYgOw8DBBBDpB
CuOdxXQm5NB4OLvp9ImgliemH3o0KJngRzOPyZUHb8C5bT+owht+whL7G725FuHj
OWMXe0vanDZ+1Td3F+0EUM1c6SSH16rAwlq5xZ4+LesD30n0Mgz25Cux/IX1idlH
0z2NzmYGgPfjn+gQtxQzlmVPMi/CcHW+TGBKF0V4iZNsaMnwxBI=
=7EIE
-----END PGP SIGNATURE-----

--o2btarnxrqglilwg--

