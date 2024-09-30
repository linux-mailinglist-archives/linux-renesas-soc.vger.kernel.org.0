Return-Path: <linux-renesas-soc+bounces-9194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D96498A75E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83FBF2836A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 14:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47359190692;
	Mon, 30 Sep 2024 14:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="igTPfVp5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00F7191F85
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Sep 2024 14:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707044; cv=none; b=r+ikSn3noxe3e9cI+HJFw6RGvxWspLRnVodosa2XqteXmqXZen+qofNjhS31qZKYEposkGUNK74Rdmbx/5mnP52AElT7UtwZfZYteSBIhD1OQFq14J9mrNpreu2OM0Xjt2s3xRoA+6JlrXk6NGVzeLDU+6lysrkrr72m0RfxagM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707044; c=relaxed/simple;
	bh=AnlyzTiNs+aGRIyZqJQiVjzw/6jEntJOZ/hZst273aY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YC2GVYdFzlEJf+NI3wooXKiZabyeSBNZLxJP1Z+OlIbcCeGQ51O5g29EV4pkgYwVBfNzFNIIn2M50kns5intxZucelxWKb2RRKowMehe1W2MAQEjFTGsnksWb6XbwBSlYWy8qmNX80jWhRpVvStxOwmVvYmPF2Bn+PPy9pWNidA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=igTPfVp5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=D6Yp
	ugZQT8wxo4OSt9rxdy5dXI80Qzx7/TWlFhYK5NI=; b=igTPfVp5pAjz/cDtjbyJ
	Po4UKOjvt1Ms8MTgVFiZU1KY+k89pqN/ycxSo+HXulZU5h47PAeU5VndJykJpn/3
	TMBCo0/ESUOWwhuak8Si7HuSI49oGkAs0zPuBYOQcTNRlL/IayR9SG9rV2pdneEJ
	k6TkNi/oqs5SXKbjBvHVHdlGpas8s3m2CVLAHgL5P8O80tAoNRY04jgk0PcotEYH
	HPDpXM6QgQy4PPXusl4JrrWAUTPg2eywQPOl0muuLCeLo2u4toLzArEk6Vp4NahU
	fwQEGaAUWMhveLpoBpzq1cvZBUFTYFVIKBRStyXS7m4EXta0DVBAg6at4hzhH3+S
	FA==
Received: (qmail 2217038 invoked from network); 30 Sep 2024 16:37:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Sep 2024 16:37:17 +0200
X-UD-Smtp-Session: l3s3148p1@MRszJFcjSoQujnsJ
Date: Mon, 30 Sep 2024 16:37:16 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH] mmc: sh_mmcif: correctly report success when obtaining
 DMA channels
Message-ID: <Zvq3nCIz0Rv0I4El@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
References: <20240928094454.3592-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdX6tv-Z2ZisYg3ridB5M28+vnGzEyC9CReeUWRUQJPA1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2KszUysdaZ8IUNiX"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX6tv-Z2ZisYg3ridB5M28+vnGzEyC9CReeUWRUQJPA1g@mail.gmail.com>


--2KszUysdaZ8IUNiX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -       dev_dbg(dev, "%s: got channel TX %p RX %p\n", __func__, host->c=
han_tx,
> > -               host->chan_rx);
>=20
> This was not a real success indicator, which could indeed confuse
> people, but an obfuscated NULL-pointer still prints as NULL, right?

Well...

>=20
> >         if (!host->chan_tx || !host->chan_rx ||
> >             sh_mmcif_dma_slave_config(host, host->chan_tx, DMA_MEM_TO_D=
EV) ||
> >             sh_mmcif_dma_slave_config(host, host->chan_rx, DMA_DEV_TO_M=
EM))
> >                 goto error;
> >
> > +       dev_dbg(dev, "%s: got channel TX %p RX %p\n", __func__, host->c=
han_tx,
> > +               host->chan_rx);
>=20
> This means we no longer see a debug message in case only one DMA
> channel could be requested, thus requiring manual addition of more code
> to find out what was really wrong?

=2E.. you can simply enable basic DMA debugging to find this out. I don't
see value in adding a separate debug printout in the driver.


--2KszUysdaZ8IUNiX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb6t5gACgkQFA3kzBSg
KbZpzQ/+Pb92Cs32hvwM+2+5wza02LPD0BKrDGyJiKTnBlLpLMGT1eWQhmSsAoci
/63skssYbjE2dR+iJs2Zl4aTeF1Ve7uXowBQS4PDz1ChdOSKmNlI7E+PFCUzVTAY
R0dfhiVUSF2kdm5sZGOX+DrzgfyoQMmw5D5VBnZ1U825g2XAHEV+E9J6xLqB5qto
N7HmpCFQW9MLxEuto+SeD3gxBc9XWUVgXOWS9XmtogQM+uB+lANP5woJy1bX13wP
6upv4jYKjnUQiED1GJnQP74AH+/SVlLVveDVf0EYuaGYrxWXGWnNt2wVS0nWbCs9
KkI52vE7mBc9/5KKr+D7iMh1/c0qiS/0z88f26c1QkivMPulHCXg9p5p5JCfLx9O
Ks9iv+/kZ4pDhxKaqgNnmNAnKUCct2ROBtC7qTx0oEI7aYECh99Sp56STxS4cByW
jgrKvlLzIQQ0IurcpzjYaiNVMrp0lFWiSuyTCnQV8MbkpgIlxqyqpTJMha7rJdWT
bGCUTPMxJk3EGus3grj18Tgwud0VGAbtmsDXmsJs0Yy/r9JnlhMyoJTBRgya+7Eg
KnrYsNPClpnRF7ayR4cUh2tDfZnD+BAQ0aC8ipwt5Km9RGOp5KazZeb9WtfCZVcs
DLQ2fnPY1NXtbSRJzhuVCDGPY1wHrkmTS6R8ZWMcnWdtiJsUEGQ=
=NkiM
-----END PGP SIGNATURE-----

--2KszUysdaZ8IUNiX--

