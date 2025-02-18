Return-Path: <linux-renesas-soc+bounces-13299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1B6A3AA49
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 22:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F54718899A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 20:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351C61DD525;
	Tue, 18 Feb 2025 20:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUH1tFhd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B1A17A2FF;
	Tue, 18 Feb 2025 20:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739911640; cv=none; b=RoHq08cFfzyW+yID57wbcfh5CSEkxNWkQVsn6cTw5gyeF3YZBalDfQsCvRYTs8gKUYRBersKWYo34pCcNaN+iijY3D5dEVxFaV1tMX4ltOkx5ihpqIYA0pUad66zuZvNsn8cl5kr9O+Tac2WGy6k/9pQkqn9ZhrQFKTkVbjGm24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739911640; c=relaxed/simple;
	bh=l6Z3XNwDf68+1+mmEuunNZluGmjWbJVHI2F9sa89zSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qi+BgIJE88yMr0OzW7mhIVLiU2HVm8CiPVi4WHNbELmLPLNpkBx/L9IWXjrQVLy28eDmYRdcTjDWSQg4F+gBgmvRxGWwsPygODWev3d2qHukDSOc764zE1rUbaI9J3J3/hzKChenv3DPrIdCouWv4QbamtsglvZ/XyzRQvL8YsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUH1tFhd; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5209cd689fcso752762e0c.1;
        Tue, 18 Feb 2025 12:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739911637; x=1740516437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SI/qAL4k4t47ETZyHzATGJyH3ag6DzfB9qTnxaqO3U=;
        b=KUH1tFhdtG/Iv9Oi9eL10io8iBpyBxXWeBLr27MWErmWPsA3jt0my3u2i4nDezFhsZ
         x08CPzIz5vqLJI0tuckTaUDJCQDouMZCpgc2qd3KTREUbKtmsN3Xx3+S3kAZf1Pi6gA1
         quhi3p5WLXkwmIoLq92QSVDKBRBzX2PW+l3jj0TkjNQcIhQX5gwK8nPfpqq9SAZ+1Be4
         Nv6/zneyO8zt5rrr0yKNQvx5bRxfrHlcs2FGQ2vD6A887Qsgg8Esaq4vocK2ds4HG4dc
         55PPkPMNOYv6T/G6XGIA5V5Zia7qBAi4OB9nG8+8Mzan6VrQVBfOfgGbgwZ5huOpvw/f
         3aYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739911637; x=1740516437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SI/qAL4k4t47ETZyHzATGJyH3ag6DzfB9qTnxaqO3U=;
        b=eU0O6EZdQh6H3SDMIDBEMJJL28AuO+McA0erI1NzIaTviCSZBP5q62O/dXvPId/e7/
         wjU2FIt/rivKiwxtZhLrcSTzIFM8pZpzHeT806gy2m8i/vumnjXwJhaOx5aYTKZg/PZC
         DOxhqqPuZFGTartLCy+1SCEYaHqCMjYx7AydxO2B7jPxk0QzFibMBfmjPX6HKpocFRAd
         EPaaUrh13gp9B+qqW8VRAwseiIV/4EKlHdU2vOLIzr92AyyhlC5nKk17YoOu7MxUL3jn
         Yv5pdg1BjviOwZT9mufAEdm9YIoppZ6cqF39s9EX0ToBZHMWCu0ehqqc7ceo6y4YxURB
         yFFA==
X-Forwarded-Encrypted: i=1; AJvYcCVP5UqkwRV3J8CRcOp+eBHir2JOKgcLtrn4HEszkA+XOJCfgHP9I8EYrVFgnOm9+/KVUbw++tBSI5TBR4iw2LrtHrA=@vger.kernel.org, AJvYcCVTQZr2UKgktVlFsDZ1WOehaXKF2CfXJx8tQs52HGqIuLkm2ClCJaP3pzYzQ4/yVEP9aDYle0TV3HHNFj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAWA0JxHI7T0Svfr+DWKnul577hdGaaVqtIQCD9pqV5xpGock1
	Btp1UNqQhZg6pa5SWQ8WMe5RbuyPCE0oKRj2BucHNF5lqJT4zht9xUEJxFL3kWdUBVUFe70R+Ib
	uhjoVSE735o2jfyltEx5p+pNX0M4=
X-Gm-Gg: ASbGnct3qIzALP5jH1QpCcHgtqohhuaTLdTsQf5v217DDzaIIFKsIXLraZ5Z4uZo6uq
	tja6AFY9MaL3FKuLZYFehMww56s6Fk4N6wlL8/gDd7VoLxZgWc7XWGjg5jWkCO87tLVotBUy+
X-Google-Smtp-Source: AGHT+IGr/hXKQPLHs8xZx257HrVZ4HRJCyby0JGVdzGMwn2zx7ZPWuOVJtKc/EvWNRNisQGZtQLbjC82K7u2zQFF1us=
X-Received: by 2002:a05:6122:1782:b0:520:60c2:3f1 with SMTP id
 71dfb90a1353d-5209d768735mr7752691e0c.0.1739911636793; Tue, 18 Feb 2025
 12:47:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250215131843.228905-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250215131843.228905-1-claudiu.beznea.uj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Feb 2025 20:46:50 +0000
X-Gm-Features: AWEUYZnU89MPO6QEOp6FoWJo0SwPN8VDjw_ju9zKJaN_mYjJuFK8TdJ8C3O4Sww
Message-ID: <CA+V-a8tHw11_TdnUoO0m=-z2YWsGs742LbH+9Tnq0Bx3DVdFgA@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rz-sysc: Suppress binding attributes
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, 
	john.madieu.xa@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2025 at 1:18=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The matching data for the rz-sysc driver is marked with __initconst, whic=
h
> means it is discarded after initialization. Because of this, attempting t=
o
> unbind/bind the driver through sysfs after system boot can lead to "Unabl=
e
> to handle kernel paging request at virtual address" errors due to accessi=
ng
> freed memory.
>
> Since the System Controller (SYSC) is an essential block for Renesas SoCs=
,
> suppress binding attributes to prevent them being exposed in sysfs,
> avoiding potential issues.
>
> Fixes: 1660e5ea6a3e ("soc: renesas: Add SYSC driver for Renesas RZ family=
")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/soc/renesas/rz-sysc.c | 1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.=
c
> index 1c98da37b7d1..14db508f669f 100644
> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -120,6 +120,7 @@ static int rz_sysc_probe(struct platform_device *pdev=
)
>  static struct platform_driver rz_sysc_driver =3D {
>         .driver =3D {
>                 .name =3D "renesas-rz-sysc",
> +               .suppress_bind_attrs =3D true,
>                 .of_match_table =3D rz_sysc_match
>         },
>         .probe =3D rz_sysc_probe
> --
> 2.43.0
>
>

