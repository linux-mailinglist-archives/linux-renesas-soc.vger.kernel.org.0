Return-Path: <linux-renesas-soc+bounces-5992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF97902048
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 13:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9BCDB20C56
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 11:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337F174414;
	Mon, 10 Jun 2024 11:26:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D9AFC01
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 11:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718018798; cv=none; b=Kj4zRb1W90vUHV+EOwe5cy2mBK8K/JWRGjHKvCoV4RXAFH1PYYp/sL4GXy/hS0qhfs0WdO3Ven3cJk8HGWz0UsE00fugASmXv0iBRuilpOktb6c0e8ZJ5NWKMj+4Hm4BAKqchDjnumsIR3zKkoKT3XkiilU/Q+bA1ijHvBc74fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718018798; c=relaxed/simple;
	bh=KDdpBnw8irO3M6ROZ1WWWN8Gv8lHbFDkeAfFhiWD2/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKTBAuvZ4VURA2ckzqUC3rw4rU8hxsxwjfO7mmPMnx6sTD4wvVAfiwkIdIWWZXmWUZWrzDBXpZKweUoCjLMJ3ogC2JkfFGEbzaSP/4hFK3rfa3dOmR7+xMoEkdjDs8prMOD2HWMpO+ZEN+nn3sna37i4xr/QQJSuqUz8rVYegjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-627ea4e0becso45440597b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 04:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718018794; x=1718623594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ac9vzbXIHwz+09h2MdzPEYDaHZXEgpOSgwmdM6bUs4=;
        b=OZP+Hu3bg+SmanHAWmz2vavo8H0BDwyVIUCarKhSjGzd9DhQCjOwVpevJhhcF0pmdp
         OZDFpdPcmaE3D+J5lYyHTyRm4tZlofiGnl1BIDR6TnA0mPs7c5NLxKAQ6do0ldfzGAuI
         /pm1lFjnwhyJCx1hmEFdMkrxsajGs2z6bcaP99Jypr6vlyTdwgW7Pxg276SqAv2et+O0
         bWTp9G99ir9l2VFyoWKZlO5BSc2eSDF735obRnhBTxNketgfVw5waJIfKReZ5td/MlQU
         zufymDwsP0KZeGiqjoU2Q1/Zb9ykYtZBr2GgFp/yHHWndEP7fZxbO4SP46ZDCd7+fBMW
         ypZg==
X-Forwarded-Encrypted: i=1; AJvYcCVRybAyLl4KdH7N3Xw2Gb53AHzFeOX/4cdC01i9Bz3L2Zq8FBejNVO8sONSAjaaPKr8YQnPd3SMUFJaRy+sRLBcqP+tXaGkImWcj845YcRQwTY=
X-Gm-Message-State: AOJu0Yzh7osWdQp4hc8K5F8N9wGQrdCs9pn2FAQ+1+bxwwGfdc3DUdNv
	xVP8p6UUwaUGV2ZDA7FeBytRNwMXoABUlxOse3znjt6oFctiHnAhsqdyUZwu
X-Google-Smtp-Source: AGHT+IHF+zeHRM/EF1h06ppn9yMbf+r2dl1KRHfbZExXDxsC10wa+x4ZxUtw/01+v8yMNWbS9SXJqw==
X-Received: by 2002:a0d:c301:0:b0:62c:c641:f971 with SMTP id 00721157ae682-62cd556e071mr91464277b3.7.1718018794208;
        Mon, 10 Jun 2024 04:26:34 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62d199ffdc6sm1169997b3.76.2024.06.10.04.26.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 04:26:34 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfa4876a5bbso3961469276.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 04:26:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpyKcN+T0Y1U7X7IUkOnAQG07rDEBoNLwUuVS8qB3qoj1qnANzHv4cqSC1vffmR+Sz01U5cODYSpytoGr+RzppHDmA/Wy5wbMoDAuhD5+4/NY=
X-Received: by 2002:a25:ab68:0:b0:df4:db52:c909 with SMTP id
 3f1490d57ef6-dfaf64ebd21mr8460218276.19.1718018793794; Mon, 10 Jun 2024
 04:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240609201622.87166-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240609201622.87166-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jun 2024 13:26:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-UCbiz6bEZmSVHy67PA_z0p7v4U=ROSpva7nZ+YqPsA@mail.gmail.com>
Message-ID: <CAMuHMdW-UCbiz6bEZmSVHy67PA_z0p7v4U=ROSpva7nZ+YqPsA@mail.gmail.com>
Subject: Re: [PATCH] reset: rzg2l-usbphy-ctrl: Move reset_deassert after devm_*()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thanks for your patch!

On Sun, Jun 9, 2024 at 10:16=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Move reset_control_deassert after devm_reset_controller_register() to
> simplify the error path in probe().

Where's the simplification?
Oh, this patch fixes the issue that the reset is not re-asserted in
case devm_reset_controller_register() fails? Please say so.

> While at it, drop the blank line before devm_reset_controller_register().

I'd rather keep that blank line.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/rese=
t-rzg2l-usbphy-ctrl.c
> index 8f6fbd978591..93c65a57686d 100644
> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> @@ -121,20 +121,19 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_=
device *pdev)
>                 return dev_err_probe(dev, PTR_ERR(priv->rstc),
>                                      "failed to get reset\n");
>
> -       error =3D reset_control_deassert(priv->rstc);
> -       if (error)
> -               return error;
> -
>         priv->rcdev.ops =3D &rzg2l_usbphy_ctrl_reset_ops;
>         priv->rcdev.of_reset_n_cells =3D 1;
>         priv->rcdev.nr_resets =3D NUM_PORTS;
>         priv->rcdev.of_node =3D dev->of_node;
>         priv->rcdev.dev =3D dev;
> -
>         error =3D devm_reset_controller_register(dev, &priv->rcdev);

As soon as the reset controller is registered, it could be used by a
reset consumer, right?  Unfortunately all hardware setup is only done
after this registration, so I think the registration should be moved
to the end of the function.

>         if (error)
>                 return error;
>
> +       error =3D reset_control_deassert(priv->rstc);
> +       if (error)
> +               return error;
> +
>         spin_lock_init(&priv->lock);
>         dev_set_drvdata(dev, priv);

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

