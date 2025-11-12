Return-Path: <linux-renesas-soc+bounces-24514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF573C53F3B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 19:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 126E63B5125
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 18:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860EB2BEC5E;
	Wed, 12 Nov 2025 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gJlsX3vr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DBF34B1AE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 18:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762972087; cv=none; b=LixS89eX0dQ4ABKRCEpPbG9k8dCNZYfYlmDkzEZJkGV+eL/+NCw1I8cArhNkCB82+9GIU3HqhY73ICciZ0heCpe2zWWwZtvffXEC1qUpHp2b4gDDZ8o2fHhzQLz+iYbZuqED7bZ8ZgwzBEYodV2O3zIhEoHlehFq0/KfA3E6SIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762972087; c=relaxed/simple;
	bh=QApjoMI+8ByELox6Jbpc/gdGu9NKN2+G9kU7+u7Amew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAa5e3XGHUBUYT2DA1qB2rxpwR7w6GqL8IaAh8PQ50bnTzZrj5/yfhh8UugjUY0mFWaWt7O+jSXB8pYGUZZU+G6fwHLQi4BroLWB6F5RqZwYzKO3kRFzmxme5vLv0dkYXbUhXNh2vaFvhMYDdYwzxwRr0F5XAzXt1fE1jmBf9FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gJlsX3vr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Qqvw
	ADMeQOU0/kC8oioJpTVGdMfqaZId8Kp7HJeg/tI=; b=gJlsX3vr0JekrvgpOult
	titedxzMYjNll3mJgok1OzGyl90E3cBglPqCr+KZNvW3t5YtjtXG8N/Eb39O/jdT
	bIuOxNeDobe9M+Q8asqZpf4JCwYaZwHVce02w3NgGfD5hZ/oNOy0/Mc06Oml3oMJ
	OJKB3xqPt+wOXnE5ggeNQ97ibTyQ/x6SF9jdLx3jZ4dyL2y41p8Luh0ARIktFJl8
	oiLo6AgrdJShcMt4Zs4rgJsR4eNdY1Y18PWex0zkxlhQDp1ytdKH7IN67ZbLMRos
	04kXyzXyslGDfB/jgRXzN8TP42ouhqZanwgYogYSJN6uD6fx0fGwg7/gARN0C8DH
	bg==
Received: (qmail 1598894 invoked from network); 12 Nov 2025 19:28:03 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Nov 2025 19:28:03 +0100
X-UD-Smtp-Session: l3s3148p1@0Ci97GlDTy1tKPOv
Date: Wed, 12 Nov 2025 19:28:02 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, ulf.hansson@linaro.org,
	p.zabel@pengutronix.de, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 2/3] mmc: renesas_sdhi: Switch to
 SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() and pm_ptr()
Message-ID: <aRTRshYq2MznnCYc@shikoro>
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
 <20251008042526.3312597-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXUqsU6MKh8WSO4EmrxCfUg8FZkrJKb7OH-KwMY4+iC4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HL9AJta6crLX28DN"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXUqsU6MKh8WSO4EmrxCfUg8FZkrJKb7OH-KwMY4+iC4Q@mail.gmail.com>


--HL9AJta6crLX28DN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > -#ifdef CONFIG_PM
> >  int tmio_mmc_host_runtime_suspend(struct device *dev);
> >  int tmio_mmc_host_runtime_resume(struct device *dev);
> > -#endif
>=20
> This change is indeed needed, because RUNTIME_PM_OPS() now
> references these two functions unconditionally...
>=20
> >
> >  static inline u16 sd_ctrl_read16(struct tmio_mmc_host *host, int addr)
> >  {
> > diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_m=
mc_core.c
> > index 775e0d9353d5..8be642f737c7 100644
> > --- a/drivers/mmc/host/tmio_mmc_core.c
> > +++ b/drivers/mmc/host/tmio_mmc_core.c
> > @@ -1286,7 +1286,6 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *h=
ost)
> >  }
> >  EXPORT_SYMBOL_GPL(tmio_mmc_host_remove);
> >
> > -#ifdef CONFIG_PM
> >  static int tmio_mmc_clk_enable(struct tmio_mmc_host *host)
> >  {
> >         if (!host->clk_enable)
> > @@ -1331,7 +1330,6 @@ int tmio_mmc_host_runtime_resume(struct device *d=
ev)
> >         return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(tmio_mmc_host_runtime_resume);
> > -#endif
>=20
> ... however, no actual code referencing them is emitted in the
> CONFIG_PM=3Dn case, as renesas_sdhi_internal_dmac_dev_pm_ops is not used
> due to the use of pm_ptr().  Hence the changes to this file are needed.
> (verified with m68k allmodconfig/allyesconfig builds)

Since you confirmed all this, did you forget a Rev-by? Or do you
actually describe an issue which I am overlooking?

Happy hacking,

   Wolfram

--HL9AJta6crLX28DN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkU0bIACgkQFA3kzBSg
KbYr2Q//aGc29Ggixatnz96WuqMKwRcn8axP50B9nX7nf1stI0AoNxeK86dMamE4
B1rb413S3Cn1hFZXdBjZ0r4C03vSjFkkcQkszASmA9HqKoLDpZFz72sYmR9lqYdG
eR29vKWxhJIzZXcK8qJk9ayyVqKtzb6kuR2wCcEEsRk9e5wrfe8/5pCBwBMkWuO6
+5BvMUINXiOPqJ3s6sfXPLwTYgyPsp+d8FWCVxzPQ4BKbIUab0wW9PrVxxkmpqWd
XTmtrmSkdJzR5kmzgKTkJiXVvl8gjJ0kZTPJAw0PRcLCFozqX6jSMW/wlkk/5yaE
8HPf5KzPuSArl6vCdd15S6kTO/EjDd1HFqdjGfP+lvn/Hajset29zz18qD8l9Bro
j87sVunj0umaBziEBmOvm8F5rkfsK6Wwwvxew399Is9xiDbPpt00MShFXHp0x4EU
UVaxfa7oyz7spjkWAIDm11cwLN5zaatjQ/fbiuGKDrSQS9jwnpFa++61x3BJWV4U
Ii2d/clCh2/pltn+VEEZXDF/01tQ5o5jrLG8YOw7fHSBHmrZK4N57VjcU0axF8Mj
vZSd6FAADKVaD0Pa4eXGBMKxSNzsl+Nbj5ZLSeH4EKObcCTWmw7zebhr8i6rLjLH
vWpmGPt2tsTVf4ps29N5tvDxtJ5DdqEsqzmfTGljc/4mBxN8l90=
=w0i0
-----END PGP SIGNATURE-----

--HL9AJta6crLX28DN--

