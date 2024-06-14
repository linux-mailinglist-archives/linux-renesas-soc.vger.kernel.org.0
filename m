Return-Path: <linux-renesas-soc+bounces-6258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A4D908EBE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 17:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82FCA28493E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 15:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05010158872;
	Fri, 14 Jun 2024 15:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0LPFsazq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE5C49649
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 15:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718378949; cv=none; b=X/oL1k7qj1DA5QnBx9U7k2dUWNK8Tb7f3uuY9lzbtxtMaJkzJxjy0GzvBXyrlnzJf6tZcD5xSotNfA5dfrB+f2qF35juopMlq/xfwseXeF9nULHcSIK/TRjIHDh+tks37M/TFV3Tx4w8MwYIyTFGm1mrGCTLMvcV4y1sgw3B0MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718378949; c=relaxed/simple;
	bh=W7xqvtkjrlaNLm6rezIdpjNzE+PEbSbsG6OQ3LfzjAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Chf0/hYpG4SqaVSqKm72DsvdlxyJmieZ6T4ZKW06FiO+5dubulcHB+Ox0UiTJ1eWDlLLaUYU7nTvSimu4ES0x8rbNhdJdmdHUAr/u3JBIMzTy6oKfVNPyXdfhIRNlxS0JNRVV6JqAAUp293Cc/DH7hZYuv/3yV5T+q27cWCSfzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0LPFsazq; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6f1da33826so350638366b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 08:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718378946; x=1718983746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W7xqvtkjrlaNLm6rezIdpjNzE+PEbSbsG6OQ3LfzjAU=;
        b=0LPFsazqMc6YIxo2kxzmeGNwmVarbkqzwIplW5X4ktWuncZp3IGFM0AOycQJA7tjdP
         VVofC1+GO+sD6tmPXWgr2qRQZ/EFnP2WTpVkWF73FAryivXZ9L0DgL5HOouz4UwwMdQZ
         JzYvFeiMZQuqpw0DjUh0bjCem/usnXEO06pMJthGw78Rz2XG/d4uHg5yJ1tR9H6UYAIm
         Hyzw9WnMBi7lTxTED9JglOrHuyhiLP7ix7cpBJUfCR4FdKqmKg4v7eOtte+kM4CgMlhd
         162diToZNcBVMTVdeYNCKW0j37uDcmf3dc3t/3Hd0o5zts/FHTGe9pr7XRfW2Zxp92ru
         yOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718378946; x=1718983746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7xqvtkjrlaNLm6rezIdpjNzE+PEbSbsG6OQ3LfzjAU=;
        b=emgOwXnKps87axGTfNJ/5XdLf0i6Qj0RobwpLzUsnyfgHBE+GAFWwXo5WXxf4FngRV
         1gDmpd13GdpP3NVP7DHl53WX6stCsazMoJE2IGU665UAkN++2XdYqPA2bEjBlTodlpLt
         jZUJpb41jabNAGAhYf1Qekbfjy9XXHinCqPqUnQoaiNnMPBL0hwAqawUxyT35QrOAUgG
         TOMUgsKkq8bKWduo7ByHf5XC1JSDmaNSepVOaBXGoOwWq1t4Pyk41slEBVZ1nxQ9T5UH
         aG6n3CJBPsX3Dqv/BSXTlcoj0CUTOqTKt/OT4/hBkOSWtMOwzMfUMb6ndRQxODm6zjhU
         60MA==
X-Forwarded-Encrypted: i=1; AJvYcCXEx2uXYMasX5uR4ApysQ6NBR3mwLJKLX2xvbp3K0yORgP4X/4J+FrAlzrUDV4ax8uY2yv9xpqxttMO42KqpxeK/LJUHKCvYF0pNcycmYMb8Go=
X-Gm-Message-State: AOJu0YwbR1LxJlFTM3QcDcHU2fyLXe39rLCJhO3wqtPOacT+noJAWfgT
	AvYjyig2EI6s9V9HJDw55qx2OmY6sLJgln684V/E8wBiDMeY8YW+5jpRbyLxLKo=
X-Google-Smtp-Source: AGHT+IHumnKfuc8btdzYl6ReT8HQtlCURJ+kUqGR5cGc/UmojP2LFCJeSU//utdtDxudcuCR+s2Dug==
X-Received: by 2002:a17:906:34d1:b0:a6f:5466:5f09 with SMTP id a640c23a62f3a-a6f60d5f0e2mr267926766b.33.1718378945720;
        Fri, 14 Jun 2024 08:29:05 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ed379esm198001766b.139.2024.06.14.08.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 08:29:05 -0700 (PDT)
Date: Fri, 14 Jun 2024 17:29:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-pwm@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] pwm: Fix namespace error
Message-ID: <ld5tegce2dpiehqg2offdyrazew2l2vkq3unm3fe3l74lyufg4@vnebm7soytym>
References: <20240614151233.398463-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pxckk4fmjjpjdey3"
Content-Disposition: inline
In-Reply-To: <20240614151233.398463-1-biju.das.jz@bp.renesas.com>


--pxckk4fmjjpjdey3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 04:12:33PM +0100, Biju Das wrote:
> Fix namespace error due to typo by replacing USB_STORAGE->PWM.
>=20
> Fixes: aeb9cedc87a2 ("pwm: Make use of a symbol namespace for the core")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

I found that issue locally, too, but obviously failed to squash
this change into the commit. How embarrassing.

Thanks for catching,
Uwe

--pxckk4fmjjpjdey3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZsYbwACgkQj4D7WH0S
/k4srQgAp/ge4UKlLE0Ccn5fSPO613HlIOFqel5oveWklg1vhPUxupYkvbBh9Phu
LRRqaTGC2m1FfbruIZVP1CPT0Beh+wZZkJe/yNiqjKq3K1aULstUo5VCjYMLqdGG
an3x1YtBFgMD4oXEPZZqf+oL7lqFOXZFjCdT7BLNm7TY4KPeSLyGCHdbabS690Hi
Fpc3gvqvke2/5H4chbxT96LqjlMr3x4+rZWrut+qnbqiqKLXjRwRbaS9WK09gg6J
C1u6McOoXvxF49MTmxb6KAGY6f4OOF3S0wpmjBOTpch/7Eh37aujIjB1RBgRXAUu
7Id00PV6PdCP0HWM+Kkdup/RCZBUKg==
=7cFi
-----END PGP SIGNATURE-----

--pxckk4fmjjpjdey3--

