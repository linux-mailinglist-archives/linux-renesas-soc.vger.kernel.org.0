Return-Path: <linux-renesas-soc+bounces-32699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEvuJsMKCGqPWAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 08:12:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E58555A740
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 08:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1902B300693E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 06:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61BA372ED2;
	Sat, 16 May 2026 06:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="cKod9z8A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D0F3630BA
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 May 2026 06:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778911932; cv=none; b=tSCy6aoP0HDYP+kmmjAavx23I/TUToHg7YVq1JfivHYk/3fn8a7qG8bWOTttVxo0kIEavPkewAFn7GM4crG5mXSNa5eCxSwLkrkWZ6OdgsRlUjM+YPwXS3KxZNEvdBRvzTYMJ1VJ7uxf1VmQnsoYMgQ4AmqVL628GIsruZBmHww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778911932; c=relaxed/simple;
	bh=4yYhdbMRVR+CRAUgoSq49OIwIUWB/tSKLi036gr3kHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDqw+MjTWm5KrcK5TBfM/+i6ImldrdkBdpBx7+Sh6FhQiy5FrLAYRItlwP9JkAdp74ym8Seb+Qx8f93PG4LSkUa9El+L29edWIXySDt4G1UJ/bhAiuzjQnsBdtfkELJ6hE0n5ojh+KRKqfktclsWFWt+h0CXG1vSZVP5+GwfV0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=cKod9z8A; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44a74032ff8so317725f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 23:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778911929; x=1779516729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HSemYvAyg7oF7KkWKvgahNXBgqxEPfiGmMTx54Opx8=;
        b=cKod9z8AXyIautmjXjmiORXxfKBzHs+Qx2mB0x3G+6ZRy9wbi7+gG6UTfMzQbBhukj
         cCZVgiIVfLlV676Wb0nuU2gvmD191MatnYdDrTi9s4EEUj8z6dX3I9FEtl78ZoxXQPlQ
         ixbGqTzzNTtTcjqS26wDMWO+NrtgO27g2kd/lNy7bdJMD/z1e4EhZUAWMeGXkwt1OmQW
         nC0cBKKVvdFtqZ328PUw6c/FmsZs07HyyTrOBsnHn4lHN1RwT2tZ/FghZcbHSDeUv+3l
         bZdYx5mmWOiihFRMlERNWfAE/Sr3nkrlTQDeUms+7wjfT29rElJ9ofYLtgrmQSFlhJ51
         SBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778911929; x=1779516729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HSemYvAyg7oF7KkWKvgahNXBgqxEPfiGmMTx54Opx8=;
        b=TMShCZVVmzxpS/MAnnKyjkHqK0IMw4vWD3BK4UObfXi2f7nYJ4T3Ai2qQERPl8eQ9t
         IQL2QHGFPL4dyTu68JHy1TImgnuHPwtCnB8eW1SUyrnnck+XDdmL4kMJULlLjQjDdKFj
         n9YD8kxadLQ9t7mn1evpmdkgVk3NXLIKHQG5CDtLZvbcJUQASmhzFmZCFJQYtohHukAP
         B6OtoY7W6qFGnSdmT7gTmPIGIHfkHYdeBr6jMp2o5zBI7QfjgQo65CNnwZFuxKDNV6uy
         eKNwDZTuE2wKsOGWA7vrouYMC5D3FI3WcPQhCLc4f2gmBsk+0HNaX7v7XTG5d/En+Kui
         rQqA==
X-Forwarded-Encrypted: i=1; AFNElJ8mkm4YLhroIzqQCUfIeOcjIGkSrjFYKhIpW74sF0MvpP+xXVlv2TCPlu17tOfZT1t0SGCCYJM8pmSK/9wtk+BFKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGe4Dy6P+L+l22X5lNG1wYNti9SXQl6HEbsx24KWDuD+HQKBqJ
	Ih9/cYDjiOXRAnxO9/d51BImv00mPeLAc/gLVkP9fFJSGZCwo1Z4fc7q/Pajp1KEoSRHaWQvj1a
	TwUlN8pcu2Q==
X-Gm-Gg: Acq92OGys31sfcu2GQ4r6fN1qzhUkXSf9y8J3lFvPqKwIcbGLGj4lZUCFMR30q+m6E4
	HXD7gRnUfdB2nDOlOAJ/nHc4CgfvHsBf6nG6LMi66X3dBIfAvMnI25Q5kEQoJgDokaR72uRFp5t
	ViJhUZ/ZowDUTv32wLndiSrFn5cS5NOHPNqSVSIopxNvP0tPpOGrbomTCTZoDX/un8vg8r2WHAo
	LIjhNDv4ERK1XQE/n0289ttPnVTJop/vYUV3ceFHx0HJCU0plArgP4lx+lsEaxrzgQgEv74WUWt
	+nAhIcby8JJuPQYB/zjnOxkW8kN8n39GQxW6dsFnl5FhMRTL0txBGWeWyiEx5r27HNGBD2A+6+u
	8If17lNQWkA7PVXpubzrlx4aVa9Ur8KiYUhQTT2ONrM+xT8Q1X3c5Yvdte0F165glPyiNfKXWan
	d5otKLn2RV0Tt4rll4jA6E2SQR9FQsGU0ynUNgu3g=
X-Received: by 2002:a05:6000:1ac7:b0:43f:e272:edff with SMTP id ffacd0b85a97d-45e5c57d308mr9641215f8f.4.1778911928801;
        Fri, 15 May 2026 23:12:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45d9ed2f738sm19944411f8f.16.2026.05.15.23.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 23:12:08 -0700 (PDT)
Date: Sat, 16 May 2026 08:12:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, James Ogletree <jogletre@opensource.cirrus.com>, 
	Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Andy Shevchenko <andy@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Samuel Kayode <samkay014@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] mfd: Use named initializers for arrays of
 i2c_device_data
Message-ID: <aggJiZk8Kp-309q7@monoceros>
References: <20260515095839.4005460-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2sdvcea3fsfmjq6y"
Content-Disposition: inline
In-Reply-To: <20260515095839.4005460-2-u.kleine-koenig@baylibre.com>
X-Rspamd-Queue-Id: 2E58555A740
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32699-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,gmail.com,opensource.cirrus.com,cirrus.com,diasemi.com,samsung.com,linaro.org,iki.fi,kemnade.info,atomide.com,foss.st.com,vger.kernel.org,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_TWELVE(0.00)[31];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


--2sdvcea3fsfmjq6y
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] mfd: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

On Fri, May 15, 2026 at 11:58:39AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
> index 6a7b7a697fb7..fb23d5ed1f26 100644
> --- a/drivers/mfd/tps65910.c
> +++ b/drivers/mfd/tps65910.c
> @@ -518,8 +518,8 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
>  }
> =20
>  static const struct i2c_device_id tps65910_i2c_id[] =3D {
> -       { "tps65910", TPS65910 },
> -       { "tps65911", TPS65911 },
> +       { .name =3D "tps65910", .driver_data =3D TPS65910 },
> +       { .name =3D "tps65911", .driver_data =3D TPS65911 },
>         { }
>  };
> =20

The indention in this hunk uses spaces instead of tabs (both with and
without my patch). I fixed that in my tree, so if it comes to a v2 the
indention will be fixed there.

> [...]
> diff --git a/drivers/mfd/wm8400-core.c b/drivers/mfd/wm8400-core.c
> index 8ecfe878a5ba..1c0ba450ef9b 100644
> --- a/drivers/mfd/wm8400-core.c
> +++ b/drivers/mfd/wm8400-core.c
> @@ -135,7 +135,7 @@ static int wm8400_i2c_probe(struct i2c_client *i2c)
>  }
> =20
>  static const struct i2c_device_id wm8400_i2c_id[] =3D {
> -       { "wm8400" },
> +       { .name =3D "wm8400" },
>         { }
>  };
> =20

ditto.

Best regards
Uwe

--2sdvcea3fsfmjq6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoICrIACgkQj4D7WH0S
/k7niwf+L8OYV1m8gjYa2gWHbcQnsCJgzdFKCpbXliu2T5EWq+pQK9qpV9Z1VizU
c2aUOPFJ5EiekEJu5DCu2EP0hYSk7XVsIzj1X6S2yAUDcUn5KFqmgkRAQsZKxRUN
To4/9O43tr+/WYuyUT/kM1mZFYHw3kubucsATq5rprulQ8SwNsFWG1hADna3KAHe
VE+iBDWGgcWuextWGVmh9DL+KyuYXcHSYZ6jwMkUkzdTGE6XIJeZ4AgCXM5X6wl/
9G5OpBfgo0IXSCrfxQRCx2Rq617B5x7i9u3851/XC/G8l04/lZOsk8vW92H4tVvR
IqdTaRQtvMJ/Itv6B4DadpEPZbkW2g==
=AyjU
-----END PGP SIGNATURE-----

--2sdvcea3fsfmjq6y--

