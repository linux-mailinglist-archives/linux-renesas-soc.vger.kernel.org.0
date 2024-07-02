Return-Path: <linux-renesas-soc+bounces-6958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF7791F076
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 09:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D3FE1C20CEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 07:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B99374CB;
	Tue,  2 Jul 2024 07:46:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E40372
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jul 2024 07:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719906401; cv=none; b=gWpi/7T4PLhhcq3KAKzi4wJFlUc4rdTvZxikyfZ+gvyrywyZmyLtMV8xNZNzdbyNzUwdAz5o/t9uuJo4/OvsKGpQuf7NeFCyTGizA/fcproUE6o998F4uodgNuIJBWM3NCBKoXzYxaOrnG2l1DweiFvq+t9YG0Ubao9m1bRrtoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719906401; c=relaxed/simple;
	bh=+/xrmv6H0+D3AArCmigTUjJieWkbQCuVRlaDdwckC/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqtX48E3DE/4F2lKitJlff0CoR95iZggXaTzA3M8tMhPVuMxYCSEFQOSYS1umOrfGkAcjxSxCF40rCA5bp0fAyIVDcVPsL7Zf25MpGSqvP7cq6aQ9g0dyJxKoIztV4M4j/VGw4rLXbdUNdBHH/0rPHqYSpiQ0OeUsG6tsnYlOu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e02b79c6f21so4079777276.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jul 2024 00:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719906398; x=1720511198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6yWAkJpnWMmXa+gW0Oo73fpexw9mPjBDmqCunMnvpg=;
        b=Qe+Fr9dHZb6PdaqbIrfTgxJ9V6wMtGP3df483SacpTcX+MFLjy60IEM3lh6Ek7fQ+l
         KSSxXKL7QFbFPxwTrs4+l2hwxjL1p/DVlQJYsBckk4z0EOWyfooNSNmjbZQYVpxcSgyD
         847DzVJmHLV3mDdoqUF0hSCUOJ4QDeHRV7U4oLaajmOEeJDrMKxpnig0fBIW3IOSb4aF
         Qty4Wc4Od79vmk9aA24PY4K79/Bwto8txRIWD7tW3xZxb+O3vK8RQslaWefv/YMWItMl
         XVBR7t19weBmRhzjQYzIB1hXv5qztGkQoTk7ZWHscumLObUsMtmXSM8krV3a24WoeRlD
         5Vpw==
X-Gm-Message-State: AOJu0YwQRVHzD1/SjpDMprnozUW8ZT941o6GOTb+9YTIQM2AOCjWVkfP
	w+41iWZJOjWMan3vABQ/AO5nAxtyC3GU0s1K2XiEEXAciRFBT+mFT6CSJOgB
X-Google-Smtp-Source: AGHT+IEbJlpxieK4Iqt+clhh/kT5D4pyXtw0uUYZiOGtr/CeAB8ZGQ8CmCQK6jeC+qnQqYrxQY0RDQ==
X-Received: by 2002:a05:690c:668b:b0:64b:6559:5d71 with SMTP id 00721157ae682-64c73418b71mr88306927b3.32.1719906397918;
        Tue, 02 Jul 2024 00:46:37 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9a803893sm16578547b3.67.2024.07.02.00.46.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 00:46:37 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-64789495923so33928037b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jul 2024 00:46:37 -0700 (PDT)
X-Received: by 2002:a81:f003:0:b0:64a:9832:486 with SMTP id
 00721157ae682-64c7123aecemr71988227b3.1.1719906397441; Tue, 02 Jul 2024
 00:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702045535.2000393-1-dirk.behme@de.bosch.com>
In-Reply-To: <20240702045535.2000393-1-dirk.behme@de.bosch.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jul 2024 09:46:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKD8eY6zxXfhiWvcc2Ov91uDA6KdmYONbUU3aptLb6fg@mail.gmail.com>
Message-ID: <CAMuHMdXKD8eY6zxXfhiWvcc2Ov91uDA6KdmYONbUU3aptLb6fg@mail.gmail.com>
Subject: Re: [PATCH] [RFC] i2c: rcar: Clear interrupt registers in probe()
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dirk,

On Tue, Jul 2, 2024 at 6:56=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
> We are getting crash reports where irqhandler crashes because it
> uses priv->msg being NULL. This can happen if an interrupt is issued
> before rcar_i2c_master_xfer() has initialized priv->msg.
>
> The rcar_i2c_probe() function assumes that the I2C hardware is
> uninitialized and connects the interrupt handler via devm_request_irq().
> From this point in time irqhandler can be called. Normally, this is
> just prevented by the I2C hardware being in reset state.
>
> However, there might be cases where rcar_i2c_probe() is called, but
> the I2C hardware is *not* in reset state. E.g. if just the Linux
> operating system was re-started by a supervisor. But the hardware didn't
> get a reset. For cases like this make sure that the I2C hardware
> interrupts are cleared properly before devm_request_irq() is called.
>
> This is inspired by rcar_i2c_init().
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1183,6 +1183,12 @@ static int rcar_i2c_probe(struct platform_device *=
pdev)
>         ret =3D platform_get_irq(pdev, 0);
>         if (ret < 0)
>                 goto out_pm_put;
> +
> +       /* reset master mode */
> +       rcar_i2c_write(priv, ICMIER, 0);
> +       rcar_i2c_write(priv, ICMCR, MDBS);
> +       rcar_i2c_write(priv, ICMSR, 0);

LGTM, but I think you want to do the same for slave mode:

    rcar_i2c_write(priv, ICSIER, 0);
    rcar_i2c_write(priv, ICSCR, SDBS);
    rcar_i2c_write(priv, ICSSR, 0);

> +
>         priv->irq =3D ret;
>         ret =3D devm_request_irq(dev, priv->irq, irqhandler, irqflags, de=
v_name(dev), priv);
>         if (ret < 0) {

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

