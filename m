Return-Path: <linux-renesas-soc+bounces-22574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF54BB3CFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 13:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B751923394
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 11:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F14E28CF52;
	Thu,  2 Oct 2025 11:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TFNtiPjM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5AE256C6C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759405694; cv=none; b=acMLhlkd2lYM6NtOPqsBwxr5oJue0Oe2AVuciJXqnWord4fWJOJyTst6wzrPshwoS5Xaj//g9yMndoAaGqEodUNDMXZ/uYND/7cL5TvdnXEbimb6KgJW3fhzdFlU31K613XDSPT+5AvpbAnPcPgBZlDF7Pe7W2pmO6YmPGJuprc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759405694; c=relaxed/simple;
	bh=KcZ7fO/ft0SK6cFKjwRX8wblqI5oGztv7QgKnz0rrwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSmOIlzsacg239Pud/GjVr/8jcfvfeJGxTFQ516/FMFC/2HmtcwWFLDBFpiJ1OrogVkn3GiEOup9EyKcjtM0D7yVx/EqRRZimzJ5ZJBXUmpKH939mtw+4m71+dTMAa0On5sPnl3P1hfdHcOki4z+5wRee2HsW1ElvLppIRqNSyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TFNtiPjM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zC+U
	6mJsO92AzwDsLcXk1QUDlDtDkImaQjmC9pHJ/2g=; b=TFNtiPjMxMTj4P1TGx2L
	RVoGaA8JF0oeaUCsWZya+s58XqKOzq/+9PciMmEfTYJz4KRG0G6KtDiiGmTu1jEy
	KzGFGx1CXCwP5r2G+dNPDrINNHKzMi+DlXnjLurKhjmtYG6twT0mT3xGH9oZ5yyh
	MXq0wK6cTLDXq+QMFsBjwXs/r1pvTyKjg4AwiEEV65MVJeuWiQ7ujMtMWW2XL+sj
	CJETYyR3H4mOpjjEFOHt8JATqT+WAwVhIIrjpRsADT8ObSPZVi4Xkw2LBF3yVEgx
	PCIgCYFUjKBWCS9twECHm1Y5IT/Pg0TlyryQhjNInQBfdQKuLJgWbGO1cmMw5G8g
	ow==
Received: (qmail 247761 invoked from network); 2 Oct 2025 13:47:58 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Oct 2025 13:47:58 +0200
X-UD-Smtp-Session: l3s3148p1@8sN0jitAYuMujnuL
Date: Thu, 2 Oct 2025 13:47:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: mfd: Add Renesas R2A11302FT PMIC
Message-ID: <aN5mbEcDsh6v7ArJ@shikoro>
References: <20250929083449.14393-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWO4tcgucOEb2=e=uTSua4+CouHe=NY1169zsVT_v1t4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5H42sGPdfAHsViov"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWO4tcgucOEb2=e=uTSua4+CouHe=NY1169zsVT_v1t4Q@mail.gmail.com>


--5H42sGPdfAHsViov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > Maybe Geert wants to be listed as maintainer? He is the only one who
>=20
> Morimoto-san wrote the driver that is part of the R-Car H1 BSP.

Ah, okay, didn't know that. Thanks for the pointer! But even with that,
it doesn't make sense to upstream the driver for these old boards which
work fine without the driver for years, no?

> > ever playes with this device. All is fine with me...
>=20
> Am I? ;-)

According to an old cover-letter, you read out the ID when enabling
MSIOF on Gen2. That made you the expert in my book :) But as said, I can
stay the maintainer, no worries.

Any other comment on the patch?

Happy hacking,

   Wolfram


--5H42sGPdfAHsViov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjeZmkACgkQFA3kzBSg
KbYitg//cNHYrf4n/EyTRGMNVACNc7f+NH2Q926khV1wVd/qvDozaQcidDA6VGzA
gSRF3rzDWXnKaeoX9uf6hfuRgn8p/EzfRYYUWP9SOp+zSNTfbV4sbkG73to5pNF2
A/uEAGFSu0cZHTlq/9u61Q6Dcx6cpkFaD44yktxVfMLF/C2tIFibsyIQnGPte1cp
Z1nAWk5Wfl/QYlpzL5BlCRw4HzvymOvK+m22DemJ9SrujfDh6EVoBzD8n1dRIZO0
5ZL+ViORkicyPlEUs6hugI0GbcUojhH4j70eEsfiIUnxRtlS6rsEtr4mS3vt8Jal
RcUY90FXNrLDKIhCPgMpycSmsFyhbX6rySQpFOpRCcRCpF1HB5X7QjuCh8Ct0el9
rRdPtSN416D2RFzCbmqYKwvMOTxyPESmRyABcggNRkDSv7iLGH5y65L+Xai9d2oK
6QW/cnkHvrnti8dYwu52vyxqwEoBd9ULOSz0AymdO9wI59WVjdtwm/KR+lMfZo+X
TM287/7IfGNLjVPsv1vka2s5RJm5rx88n66gSRheNZUr6cmIIlIYSZkwzmf7T0Zf
U0b33PeN1fRG+KI6OFVLpzX0mL30pOq8ayecIt7NzPZp87t08ve8cYHB3nuyG2zo
pgBJ+s0YsqzBd/7w2Nw+nXIxA3IMhAS/EFdwzqqoH6tarCoNdac=
=tihY
-----END PGP SIGNATURE-----

--5H42sGPdfAHsViov--

